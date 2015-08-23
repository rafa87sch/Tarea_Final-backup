//
//  doctorViewController.m
//  Tarea_Final
//
//  Created by Rafael Soto on 19/8/15.
//  Copyright (c) 2015 Rafael Soto. All rights reserved.
//

#import "doctorViewController.h"

@interface doctorViewController ()

@end

@implementation doctorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //cargar datos
    self.labCorreo.text = self.doc.mail;
    self.labEspecialidad.text = self.doc.especialidad;
    self.labNombre.text =self.doc.name;
    self.labnumInscripcion.text = self.doc.numInscrip;
    self.labUniversidad.text = self.doc.univEgresado;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)b_enviarCorreo:(id)sender {
    self.mailer = [[MFMailComposeViewController alloc] init];
    self.mailer.mailComposeDelegate = self;
    
    [self.mailer setSubject:@"My Fabolous Subject"];
    
    NSArray *toRecipients = [NSArray arrayWithObjects:self.doc.mail, nil];
    [self.mailer setToRecipients:toRecipients];
    
    /* You might want to uncomment the following, if you
     * have images to attach */
    // UIImage *myImage = [UIImage imageNamed:@"myfabolousimage.png"];
    // NSData *imageData = UIImagePNGRepresentation(myImage);
    // [self.mailer addAttachmentData:imageData
    //              mimeType:@"image/png" fileName:@"myfabolousimage.png"];
    
    NSString *emailBody = @"";
    [self.mailer setMessageBody:emailBody isHTML:NO];
    
    [self presentViewController:self.mailer animated:YES completion:nil];
    
}

-(void)mailComposeController:
(MFMailComposeViewController *)controller
         didFinishWithResult:(MFMailComposeResult)result
                       error:(NSError *)error {
    if (error) {
        
    } else {
        [self.mailer dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
