//
//  NonNodeTouch.m
//  ProyectoFinaliOS
//
//  Created by Lay Gonzalez Romero on 27/02/14.
//  Copyright (c) 2014 Lay Gonzalez Romero. All rights reserved.
//

#import "NonNodeTouch.h"
#import "Constantes.h"

@implementation NonNodeTouch

- (NonNodeTouch *)initWithTouchPosition:(CGPoint)position TouchedNode:(FSKSpriteNode *)touchedNode
{
	self = [super init];
	self.x = position.x * touchedNode.width / ipad_2_width;
	self.y = position.y * touchedNode.height / ipad_2_height;
	self.z = touchedNode.z;
	self.touchedNode = touchedNode;
	
	return self;
}

- (BOOL)equivalentTo:(UserAction *)otherUserAction
{
	return
		[otherUserAction isKindOfClass:[NonNodeTouch class]];
}

@end
