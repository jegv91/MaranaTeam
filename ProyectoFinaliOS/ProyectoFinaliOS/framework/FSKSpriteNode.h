//
//  FSKSpriteNode.h
//  ProyectoFinaliOS
//
//  Created by Lay Gonzalez Romero on 24/11/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Perception.h"

@interface FSKSpriteNode : SKSpriteNode

@property (nonatomic) NSString *state;
@property (nonatomic, strong) NSArray* generalStates;

@property (nonatomic, strong) NSMutableDictionary *attributes;

@property (nonatomic) double x;
@property (nonatomic) double y;
@property (nonatomic) double z;
@property (nonatomic) double width;
@property (nonatomic) double height;
@property (nonatomic) BOOL isSceneNode;

@property (nonatomic) BOOL shouldInvert;


- (SKSpriteNode *)initWithName:(NSString *)name IsSceneNode:(BOOL)isSceneNode StateNames:(NSArray *)statesNames Frames:(NSArray *)frames Sizes:(NSArray *)sizes;

- (void)setThreeDPositionX:(double)x Y:(double)y Z:(double)z;
- (double)spriteDistance;
- (BOOL)isInGeneralState:(NSString *)generalState;
- (void)setPerception:(Perception *)perception;

@end
