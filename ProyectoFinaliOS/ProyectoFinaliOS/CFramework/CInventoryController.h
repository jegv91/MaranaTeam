//
//  CInventoryController.h
//  ProyectoFinaliOS
//
//  Created by Lay Gonzalez Romero on 21/11/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "InventoryItem.h"

@interface CInventoryController : NSObject

@property (strong, nonatomic) SKSpriteNode *inventory;

- (void)addItem:(InventoryItem *)item;
- (void)decreaseItemWithName:(NSString *)name;

- (CInventoryController *)init;

@end
