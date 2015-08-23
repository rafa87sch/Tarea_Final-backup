//
//  Doctor.h
//  Tarea_Final
//
//  Created by Rafael Soto on 16/8/15.
//  Copyright (c) 2015 Rafael Soto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIkit.h>
@interface Doctor : NSObject
@property(nonatomic,strong)NSString* name;
@property(nonatomic,strong)NSString* mail;
@property(nonatomic,strong)NSString* objectId;
@property(nonatomic,strong)NSString* numInscrip;
@property(nonatomic,strong)NSString* especialidad;
@property(nonatomic,strong)NSString* univEgresado;
@property(nonatomic,strong)UIImage* doctorFoto;

@end
