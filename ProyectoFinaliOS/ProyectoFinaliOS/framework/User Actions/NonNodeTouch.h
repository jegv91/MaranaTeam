//
//  NonNodeTouch.h
//  ProyectoFinaliOS
//
//  Created by Lay Gonzalez Romero on 27/02/14.
//  Copyright (c) 2014 Lay Gonzalez Romero. All rights reserved.
//

#import "UserAction.h"
#import "FSKSpriteNode.h"

@interface NonNodeTouch : UserAction

@property (nonatomic) float x;
@property (nonatomic) float y;
@property (nonatomic) float z;

@property (strong, nonatomic) FSKSpriteNode *touchedNode;

- (NonNodeTouch *)initWithTouchPosition:(CGPoint)position TouchedNode:(FSKSpriteNode *)touchedNode;

@end