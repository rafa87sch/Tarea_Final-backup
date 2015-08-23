//
//  doctorTableViewController.h
//  Tarea_Final
//
//  Created by Rafael Soto on 12/8/15.
//  Copyright (c) 2015 Rafael Soto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Doctor.h"
@interface doctorTableViewController : UITableViewController
@property (nonatomic,strong) NSMutableArray *empresarray;
@property(nonatomic,strong) Doctor *doc;
@property (nonatomic, strong) UIImage *imagenTest;
@end
