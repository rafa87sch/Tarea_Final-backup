//
//  newUserViewController.h
//  Tarea_Final
//
//  Created by Rafael Soto on 12/8/15.
//  Copyright (c) 2015 Rafael Soto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface newUserViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtNombreCompleto;
@property (weak, nonatomic) IBOutlet UITextField *txtNCedula;
@property (weak, nonatomic) IBOutlet UITextField *txtCorreo;
@property (weak, nonatomic) IBOutlet UITextField *txtEmpresa;
@property (weak, nonatomic) IBOutlet UITextField *txtSangre;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property(nonatomic,strong) NSString* sexo;
- (IBAction)bSegment:(id)sender;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@end
