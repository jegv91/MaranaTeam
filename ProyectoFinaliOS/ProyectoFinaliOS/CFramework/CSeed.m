//
//  CSeed.m
//  ProyectoFinaliOS
//
//  Created by Joel on 3/29/14.
//  Copyright (c) 2014 Lay Gonzalez Romero. All rights reserved.
//

#import "CSeed.h"
#import "CSize.h"

#define HIDDEN_SIZE [[CSize alloc] initWithWidth:0 Height:0]
#define NORMAL_SIZE [[CSize alloc] initWithWidth:2.24 Height:4]

@implementation CSeed

//Initializes CSeed Object
- (CSeed *)init
{
    //initialize game object
	self = [super initWithName: @"Seed"
                   IsSceneNode: NO
					StateNames: @[@"Hidden", @"Normal"]
						Frames: @[@1, @1]
						 Sizes: @[HIDDEN_SIZE, NORMAL_SIZE]];
    self.anchorPoint = CGPointMake(.5, 0);
	self.shouldInvert = YES;
	self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.size];

	return self;
}

@end
