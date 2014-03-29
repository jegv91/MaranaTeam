//
//  Size.h
//  ProyectoFinaliOS
//
//  Created by Lay Gonzalez Romero on 21/11/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSize : NSObject
@property (nonatomic) double width;
@property (nonatomic) double height;

- (CSize *)initWithWidth:(double)width Height:(double)height;
@end
