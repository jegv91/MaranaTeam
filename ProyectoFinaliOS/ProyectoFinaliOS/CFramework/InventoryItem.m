//
//  InventoryItem.m
//  ProyectoFinaliOS
//
//  Created by Lay Gonzalez Romero on 21/11/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import "InventoryItem.h"
#import "Constantes.h"

@interface InventoryItem ()

@property(strong, nonatomic) SKSpriteNode *item;

@end

@implementation InventoryItem

- (InventoryItem *)initWithItem:(SKSpriteNode *)item Name:(NSString *)name Quantity:(NSInteger)quantity Enumerable:(BOOL)enumerable
{
	self = [super init];
	
	self.item = item;
	self.name = name;
	self.quantity = quantity;
	self.enumerable = enumerable;
	
	self.composedItem = [SKSpriteNode spriteNodeWithColor:[UIColor whiteColor] size:CGSizeMake(70, 70)];
	[self.composedItem addChild:self.item];
	self.item.position = CGPointMake(0, 0);
	self.item.size = CGSizeMake(item_size, item_size);
	self.item.anchorPoint = CGPointZero;
	self.composedItem.anchorPoint = CGPointZero;
	
	if(self.enumerable)
	{
		SKSpriteNode * box = [[SKSpriteNode alloc] initWithColor:[UIColor redColor] size:CGSizeMake(30, 20)];
		self.quantityLabel = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
		
		self.quantityLabel.text = [NSString stringWithFormat:@"%d", (int)quantity];
		self.quantityLabel.name = @"quantity label";
		self.quantityLabel.fontSize = 20;
		self.quantityLabel.position = CGPointMake(-1, -6);
		self.quantityLabel.fontColor = [UIColor greenColor];
		
		[box addChild:self.quantityLabel];
		box.position = CGPointMake(60, 60);
		
		[self.composedItem addChild:box];
	}
	return self;
}

@end
