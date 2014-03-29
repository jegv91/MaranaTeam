//
//  CLevel.m
//  ProyectoFinaliOS
//
//  Created by Lay Gonzalez Romero on 21/11/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import "CLevel.h"
#import "CInventory.h"
#import "Constantes.h"

@interface CLevel ()
@end

@implementation CLevel

-(id)initWithSize:(CGSize)size
		   Matrix:(Matrix *)matrix
		   Camera:(Camera *)camera
	   Controller:(UIViewController *)controller
{
	if (self = [super initWithSize:size Matrix:matrix Camera:camera])
	{
		self.inventoryController = [[CInventoryController alloc] init];
		[self.inventoryController.inventory setZPosition:100000];
		[self addChild:self.inventoryController.inventory];
		self.controller = controller;
    }
	return self;
}

@end
