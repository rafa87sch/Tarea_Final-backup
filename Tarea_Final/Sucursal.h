//
//  Sucursal.h
//  Tarea_Final
//
//  Created by Rafael Soto on 16/8/15.
//  Copyright (c) 2015 Rafael Soto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIkit.h>
@interface Sucursal : NSObject
@property(nonatomic,strong)NSString* name;
@property(nonatomic,strong)NSString* ubicacion;
@property(nonatomic)int telefono;
@property(nonatomic,strong)UIImage* sucursalFoto;
@end
