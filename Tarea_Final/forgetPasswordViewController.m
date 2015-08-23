//
//  forgetPasswordViewController.m
//  Tarea_Final
//
//  Created by Rafael Soto on 12/8/15.
//  Copyright (c) 2015 Rafael Soto. All rights reserved.
//

#import "forgetPasswordViewController.h"
#import <Parse/Parse.h>
@interface forgetPasswordViewController ()

@end

@implementation forgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ocultaTeclado:)];
    [tapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:tapGesture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (IBAction)bRecup:(id)sender {
    [PFUser requestPasswordResetForEmailInBackground:self.txtMai.text];
    [self.navigationController popViewControllerAnimated:YES];

}

-(void)ocultaTeclado:(UITapGestureRecognizer *)sender{
    //Aquí hay que declarar todos los UITextField de nuestra escena
    [self.txtMai resignFirstResponder];
    
}
@end
