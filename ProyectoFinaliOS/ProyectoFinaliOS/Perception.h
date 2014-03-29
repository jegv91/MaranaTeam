//
//  Perception.h
//  ProyectoFinaliOS
//
//  Created by Lay Gonzalez Romero on 22/11/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Perception : NSObject

@property (nonatomic) double xRatio;
@property (nonatomic) double yRatio;

@property (nonatomic) double heightRatio;
@property (nonatomic) double widthRatio;

- (Perception *)initWithXRatio:(double)xRatio YRatio:(double)yRatio HeightRatio:(double)heightRatio WidthRatio:(double)widthRatio;


@end