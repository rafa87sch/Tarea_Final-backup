//
//  doctorTableViewController.m
//  Tarea_Final
//
//  Created by Rafael Soto on 12/8/15.
//  Copyright (c) 2015 Rafael Soto. All rights reserved.
//

#import "doctorTableViewController.h"
#import "Doctor.h"
#import "doctorTableViewCell.h"
#import <Parse/Parse.h>
#import "doctorViewController.h"
#import <UIKit/UIkit.h>
static int NUMBER_SECTION =1;
static NSString * CELL_ID = @"doctorTableViewCell";

@interface doctorTableViewController ()

@end

@implementation doctorTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialize];
    [self cargarDatos];
    //the Custom cell
    UINib *nib = [UINib nibWithNibName:CELL_ID bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:CELL_ID];
    //[self performSelector:@selector(retrieveFromParse)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) initialize{
    self.empresarray = [NSMutableArray new];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return NUMBER_SECTION;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.empresarray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 97;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    doctorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
    Doctor* object = [self.empresarray objectAtIndex:indexPath.row];
    cell.txtDoctor.text = object.name;
  //  PFFile *image = object.doctorFoto;
   //NSLog(@"%@", object.doctorFoto);
   // PFFile *image = [[UIImage alloc] initWithData:object.doctorFoto];
//cell.fotoDoctor = [[UIImageView alloc] initWithImage:image];
    return cell;
}

-(void)cargarDatos{
 PFQuery *query = [PFQuery queryWithClassName:@"Doctor"];
    [query selectKeys:@[@"Nombre",@"Ninscripcion",@"Especialidad",@"Uniegresado",@"mail",@"Foto"]];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(objects){
            for(PFObject* current in objects){
                Doctor* theBuss = [Doctor new];
                NSString* name = [current valueForKey:@"Nombre"];
                NSString* numInscrip = [current valueForKey:@"Ninscripcion"];
                NSString* espDoctor = [current valueForKey:@"Especialidad"];
                NSString *mail = [current valueForKey:@"mail"];
                NSString *uniEgresado = [current valueForKey:@"Uniegresado"];
                NSString* objectId =[current valueForKey:@"objectId"];
                
                UIImage * foto =[current valueForKey:@"Foto"];
                
              
                theBuss.name = name;
                theBuss.mail = mail;
                theBuss.objectId = objectId;
                theBuss.numInscrip =numInscrip;
                theBuss.especialidad = espDoctor;
                theBuss.univEgresado = uniEgresado;
                theBuss.doctorFoto = foto;
                
            
               
                [self.empresarray addObject:theBuss];
                
            }
            [self.tableView reloadData];
            
        }else{
            NSLog(@"Error: %@", error);
        }
    }];

}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Doctor* selectedObject = [self.empresarray objectAtIndex:indexPath.row];
    
    doctorViewController* detailView =[self.storyboard instantiateViewControllerWithIdentifier:@"doctorViewController"];
    detailView.doc = selectedObject;
    
    [self.navigationController pushViewController:detailView animated:YES];
}

@end
