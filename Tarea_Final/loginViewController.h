//
//  loginViewController.h
//  Tarea_Final
//
//  Created by Rafael Soto on 12/8/15.
//  Copyright (c) 2015 Rafael Soto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface loginViewController : UIViewController

- (IBAction)bNuevoUsuarios:(id)sender;
- (IBAction)bOlvidoPasword:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtcorreo;
@property (weak, nonatomic) IBOutlet UITextField *txtpass;
- (IBAction)bIngresar:(id)sender;

@end
