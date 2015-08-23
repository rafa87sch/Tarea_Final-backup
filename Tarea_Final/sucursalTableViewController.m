//
//  sucursalTableViewController.m
//  Tarea_Final
//
//  Created by Rafael Soto on 12/8/15.
//  Copyright (c) 2015 Rafael Soto. All rights reserved.
//

#import "sucursalTableViewController.h"
#import "Sucursal.h"
#import "sucursalTableViewCell.h"
#import <Parse/Parse.h>
static int NUMBER_SECTION =1;
static NSString * CELL_ID = @"sucursalTableViewCell";
@interface sucursalTableViewController ()

@end

@implementation sucursalTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialize];
    [self cargarDatos];
    //the Custom cell
    UINib *nib = [UINib nibWithNibName:CELL_ID bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:CELL_ID];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) initialize{
    self.sucuarray = [NSMutableArray new];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return NUMBER_SECTION;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sucuarray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 98;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    sucursalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
    Sucursal* object = [self.sucuarray objectAtIndex:indexPath.row];
    cell.txtnsucursal.text = object.name;
    cell.txtubicacion.text = object.ubicacion;
    cell.txttelefono.text =  [NSString stringWithFormat:@"%d",object.telefono];
    
    return cell;
}

-(void)cargarDatos{
    PFQuery *query = [PFQuery queryWithClassName:@"Sucursal"];
    [query selectKeys:@[@"Nombre",@"Ubicacion",@"telefono"]];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(objects){
            for(PFObject* current in objects){
                Sucursal* theBuss = [Sucursal new];
                NSString* name = [current valueForKey:@"Nombre"];
                NSString* ubicacion = [current valueForKey:@"Ubicacion"];
                NSString* telefono = [current valueForKey:@"telefono"];
                NSLog(@" telefono%@",telefono);
                theBuss.name = name;
                theBuss.ubicacion = ubicacion;
                theBuss.telefono = [telefono intValue];
                
                
                
                [self.sucuarray addObject:theBuss];
                
            }
            [self.tableView reloadData];
            
        }else{
            NSLog(@"Error: %@", error);
        }
    }];
    
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Sucursal* selectedObject = [self.sucuarray objectAtIndex:indexPath.row];
    self.telefonoCall= selectedObject.telefono;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Do you want to call this number?"
                                                    message:@"More info..."
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"LLamar", nil];
    [alert show];
    
   
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex == 0)
    {
        NSLog(@"cancel");
    }
    if (buttonIndex == 1)
    {
        NSLog(@"aceptar");
        NSString *telefonoLlamada=[NSString stringWithFormat:@"%d",self.telefonoCall];
        
        NSString *phoneNumber = [@"telprompt://" stringByAppendingString:telefonoLlamada];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
    }
}


@end
