//
//  Camera.h
//  ProyectoFinaliOS
//
//  Created by Lay Gonzalez Romero on 22/11/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "Perception.h"
#import "FSKSpriteNode.h"

@interface Camera : NSObject

@property (nonatomic) double x;
@property (nonatomic) double y;
@property (nonatomic) double z;


@property (nonatomic, strong) SKScene *scene;

- (Camera *)init;
- (void)setPositionWithX:(double)x Y:(double)y Z:(double)z;

- (Perception *)perceptionOf:(FSKSpriteNode *)node;

@end
