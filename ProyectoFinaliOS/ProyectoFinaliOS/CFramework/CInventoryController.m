//
//  CInventoryController.m
//  ProyectoFinaliOS
//
//  Created by Lay Gonzalez Romero on 21/11/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import "CInventoryController.h"
#import "Constantes.h"

@interface CInventoryController ()

@property (strong, nonatomic) NSMutableArray *items;

@end

@implementation CInventoryController

- (CInventoryController *)init
{
	self = [super init];
	self.inventory = [SKSpriteNode spriteNodeWithImageNamed:@"inventory_background.jpg"];
	self.inventory.name = @"Inventory";
	self.items = [[NSMutableArray alloc]init];
	self.inventory.size = CGSizeMake(ipad_2_width, inventory_height);
	self.inventory.anchorPoint = CGPointZero;
	return self;
}

- (void)addItem:(InventoryItem *)item
{
	if(item.enumerable)
	{
		BOOL found = NO;
		
		for (InventoryItem *i in self.items)
		{
			if([i.name isEqualToString:item.name])
			{
				found = YES;
				i.quantity ++;
				i.quantityLabel.text = [NSString stringWithFormat:@"%d", i.quantity];
				break;
			}
		}
		if(!found)
		{
			[self.items addObject:item];
			[self.inventory addChild:item.composedItem];
		}
	}
	else
	{
		[self.items addObject:item];
		[self.inventory addChild:item.composedItem];
	}
	[self reload];
}

- (void)decreaseItemWithName:(NSString *)name
{
	for(int i = 0; i < self.items.count; i++)
	{
		InventoryItem *item = [self.items objectAtIndex:i];

		if([item.name isEqualToString:name])
		{
			if(item.enumerable)
			{
				item.quantity--;
				if(item.quantity == 0)
				{
					[self.items removeObjectAtIndex:i];
				}
				
			}else
			{
				[self.items removeObjectAtIndex:i];
			}
		}
	}
	
	[self reload];
}

- (void)reload
{
	for(int i = 0; i < self.items.count; i++)
	{
		InventoryItem *item = [self.items objectAtIndex:i];
		item.composedItem.position = CGPointMake(separation_between_items + (item_size + separation_between_items) * i , 10);
	}
}



@end
