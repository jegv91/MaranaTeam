//
//  Size.m
//  ProyectoFinaliOS
//
//  Created by Lay Gonzalez Romero on 21/11/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import "CSize.h"

@implementation CSize
- (CSize *)initWithWidth:(double)width Height:(double)height
{
	self = [super init];
	self.width = width;
	self.height = height;
	
	return self;
}
@end
