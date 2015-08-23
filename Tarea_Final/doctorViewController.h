//
//  doctorViewController.h
//  Tarea_Final
//
//  Created by Rafael Soto on 19/8/15.
//  Copyright (c) 2015 Rafael Soto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Doctor.h"
#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
@interface doctorViewController : UIViewController<MFMailComposeViewControllerDelegate>

@property (strong, nonatomic)
MFMailComposeViewController *mailer;
- (IBAction)b_enviarCorreo:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *labCorreo;
@property (weak, nonatomic) IBOutlet UILabel *labnumInscripcion;
@property (weak, nonatomic) IBOutlet UILabel *labUniversidad;
@property (weak, nonatomic) IBOutlet UILabel *labEspecialidad;
@property (weak, nonatomic) IBOutlet UILabel *labNombre;
@property (weak, nonatomic) IBOutlet UIImageView *imagFoto;
@property(nonatomic,strong) Doctor *doc;
@end
