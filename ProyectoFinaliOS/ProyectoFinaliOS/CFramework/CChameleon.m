//
//  CChameleon.m
//  ProyectoFinaliOS
//
//  Created by Lay Gonzalez Romero on 21/11/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import "CChameleon.h"
#import "Utils.h"
#import "CSize.h"

#define WALKING_SIZE [[CSize alloc] initWithWidth:2.24 Height:4]
#define LOOKING_SIZE [[CSize alloc] initWithWidth:2.24 Height:4]
#define TURNING_SIZE [[CSize alloc] initWithWidth:2.24 Height:4]


@interface CChameleon ()

@end

@implementation CChameleon


- (CChameleon *)init
{
	self = [super initWithName: @"Chameleon"
					IsSceneNode: NO
					StateNames: @[@"Walking", @"Looking", @"Turning"]
						Frames: @[@16, @1, @12]
						 Sizes: @[WALKING_SIZE, LOOKING_SIZE, TURNING_SIZE]];
    self.anchorPoint = CGPointMake(.5, 0);
	self.shouldInvert = YES;
	self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.size];
	return self;
}

- (void)setDirection:(double)xDirection
{
	if(self.shouldInvert)
	{
		self.xScale = xDirection < 0 ? -1 : 1;
	}
}

@end