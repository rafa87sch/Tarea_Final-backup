//
//  doctorTableViewCell.h
//  Tarea_Final
//
//  Created by Rafael Soto on 12/8/15.
//  Copyright (c) 2015 Rafael Soto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface doctorTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *txtDoctor;
@property (weak, nonatomic) IBOutlet UIImageView *fotoDoctor;

@end
