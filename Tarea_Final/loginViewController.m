//
//  loginViewController.m
//  Tarea_Final
//
//  Created by Rafael Soto on 12/8/15.
//  Copyright (c) 2015 Rafael Soto. All rights reserved.
//

#import "loginViewController.h"
#import "forgetPasswordViewController.h"
#import "newUserViewController.h"
#import <Parse/Parse.h>
#import "tabBarViewController.h"
@interface loginViewController ()

@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ocultaTeclado:)];
    [tapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:tapGesture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)bNuevoUsuarios:(id)sender {
     [self limpiar];
    newUserViewController *View2 = [self.storyboard instantiateViewControllerWithIdentifier:@"newUserViewController"];
    [self.navigationController pushViewController:View2 animated:YES];
}

- (IBAction)bOlvidoPasword:(id)sender {
     [self limpiar];
    forgetPasswordViewController *View1 = [self.storyboard instantiateViewControllerWithIdentifier:@"forgetPasswordViewController"];
    [self.navigationController pushViewController:View1 animated:YES];
}

-(void)limpiar{
    self.txtcorreo.text = @"";
    self.txtpass.text = @"";
}

-(void)ocultaTeclado:(UITapGestureRecognizer *)sender{
    //Aquí hay que declarar todos los UITextField de nuestra escena
    [self.txtpass resignFirstResponder];
    [self.txtcorreo resignFirstResponder];
    
}

- (IBAction)bIngresar:(id)sender {
    [PFUser logInWithUsernameInBackground:self.txtcorreo.text password:self.txtpass.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            [self limpiar];
                                            if(![[user objectForKey:@"emailVerified"]boolValue]==TRUE){
                                                UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Verificar su correo" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil, nil];
                                                [errorAlertView show];

                                            }else{
                                                tabBarViewController *newView = [self.storyboard instantiateViewControllerWithIdentifier:@"tabBarViewController"];
                                                [self.navigationController pushViewController:newView animated:YES];
                                            }
                                          
                                            
                                        } else {
                                            
                                            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Usuario o contraseña incorrecta" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil, nil];
                                            [errorAlertView show];
                                            
                                            // The login failed. Check error to see why.
                                        }
                                    }];

}


@end
