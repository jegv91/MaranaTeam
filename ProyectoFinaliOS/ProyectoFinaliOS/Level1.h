//
//  Level1.h
//  ProyectoFinaliOS
//
//  Created by Lay Gonzalez Romero on 21/11/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import "CLevel.h"

@interface Level1 : CLevel

- (Level1 *) initWithSize:(CGSize)size Controller:(UIViewController *)controller;

+ (InventoryItem *)createKeyItem;

- (void)cameraIntro;
@end
