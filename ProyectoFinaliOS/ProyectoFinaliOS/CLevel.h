//
//  CLevel.h
//  ProyectoFinaliOS
//
//  Created by Lay Gonzalez Romero on 21/11/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import "Level.h"
#import "CInventoryController.h"
#import "Camera.h"

@interface CLevel : Level

@property (strong, nonatomic) CInventoryController *inventoryController;
@property (strong, nonatomic) UIViewController *controller;

-(id)initWithSize:(CGSize) size
		   Matrix:(Matrix *)matrix
		   Camera:(Camera *)camera
	   Controller:(UIViewController *)controller;

@end
