//
//  InventoryItem.h
//  ProyectoFinaliOS
//
//  Created by Lay Gonzalez Romero on 21/11/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface InventoryItem : NSObject

@property (strong, nonatomic) SKSpriteNode *composedItem;

@property (strong, nonatomic) NSString *name;
@property (nonatomic) NSInteger quantity;
@property (nonatomic) BOOL enumerable;
@property (strong, nonatomic) SKLabelNode *quantityLabel;

- (InventoryItem *)initWithItem:(SKSpriteNode *)item Name:(NSString *)name Quantity:(NSInteger)quantity Enumerable:(BOOL)enumerable;

@end
