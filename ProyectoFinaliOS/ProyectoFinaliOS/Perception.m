//
//  Perception.m
//  ProyectoFinaliOS
//
//  Created by Lay Gonzalez Romero on 22/11/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import "Perception.h"

@implementation Perception

- (Perception *)initWithXRatio:(double)xRatio YRatio:(double)yRatio HeightRatio:(double)heightRatio WidthRatio:(double)widthRatio;
{
	self = [super init];
	self.xRatio = xRatio;
	self.yRatio = yRatio;
	self.heightRatio = heightRatio;
	self.widthRatio = widthRatio;
	
	return self;
}

@end