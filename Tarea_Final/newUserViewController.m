//
//  newUserViewController.m
//  Tarea_Final
//
//  Created by Rafael Soto on 12/8/15.
//  Copyright (c) 2015 Rafael Soto. All rights reserved.
//

#import "newUserViewController.h"
#import <Parse/Parse.h>

@interface newUserViewController ()

@end

@implementation newUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialize];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ocultaTeclado:)];
    [tapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:tapGesture];
    
    //add button
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(doRegistration)];
    //le asignamos el boton al navigation buton
    self.navigationItem.rightBarButtonItem = addButton;
}

-(void) initialize{
    self.sexo = @"Hombre";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)ocultaTeclado:(UITapGestureRecognizer *)sender{
    //Aquí hay que declarar todos los UITextField de nuestra escena
    [self.txtPassword resignFirstResponder];
    [self.txtCorreo resignFirstResponder];
    [self.txtEmpresa resignFirstResponder];
     [self.txtNCedula resignFirstResponder];
     [self.txtNombreCompleto resignFirstResponder];
     [self.txtSangre resignFirstResponder];
}


- (IBAction)bSegment:(id)sender {
    if (self.segmentedControl.selectedSegmentIndex ==0) {
        self.sexo = @"Hombre";
    }else{
         self.sexo = @"Mujer";
    }
}

//FUNCION PARA VALIDAR ESPACIOS EN BLANCO
-(BOOL)validateWhiteSpaces:(NSString*)textToEvaluate{
    NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmed = [textToEvaluate stringByTrimmingCharactersInSet:whitespace];
    if ([trimmed length] == 0) {
        // Text was empty or only whitespace.
        return NO;
    }
    else{
        return YES;
    }
}


-(BOOL)validateAllSpacesInWhiteInTextFields{
    BOOL nameValidation = [self validateWhiteSpaces:self.txtNombreCompleto.text];
    BOOL emailValidation = [self validateWhiteSpaces:self.txtCorreo.text];
    BOOL empresaValidation = [self validateWhiteSpaces:self.txtEmpresa.text];
    BOOL cedulaValidation = [self validateWhiteSpaces:self.txtNCedula.text];
    BOOL passwordValidation = [self validateWhiteSpaces:self.txtPassword.text];
    BOOL sangreValidation = [self validateWhiteSpaces:self.txtSangre.text];
    if (nameValidation && emailValidation && empresaValidation && cedulaValidation && passwordValidation && sangreValidation ) {
        return YES;
    }
    else{
        return NO;
    }
}

-(void)doRegistration{
   BOOL textFieldDontHaveSpacesInWhite = [self validateAllSpacesInWhiteInTextFields];
    if (textFieldDontHaveSpacesInWhite) {
        //        LISTO PARA TRABAJAR CON PARSE
        [self registerWithParse];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ERROR" message:@"Debe de llenar todo los campos y los password deber ser iguales" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil, nil]
        ;
        [alert show];
    }
}

-(void)registerWithParse{
    PFUser *user = [PFUser user];
    user.username = self.txtCorreo.text;
    user.password = self.txtPassword.text;
    user.email = self.txtCorreo.text;
    user[@"Name"] = self.txtNombreCompleto.text;
    user[@"Sangre"] = self.txtSangre.text;
    user[@"Cedula"] = self.txtNCedula.text;
    user[@"Empresa"] = self.txtEmpresa.text;
    user[@"Sexo"] = self.sexo; 
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
             [self.navigationController popViewControllerAnimated:YES];
            
        } else {
            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Check that you mail exist" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil, nil];
            [errorAlertView show];
            
        }
    }];
    
}

@end
