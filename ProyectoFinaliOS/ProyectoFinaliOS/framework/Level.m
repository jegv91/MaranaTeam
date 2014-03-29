//
//  Level.m
//  iOS Avance 5
//
//  Created by Lay Gonzalez Romero on 19/11/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import "Level.h"
#import "FSKSpriteNode.h"
#import "GeneralState.h"
#import "Touch.h"
#import "NonNodeTouch.h"

@interface Level()
@property (nonatomic) BOOL transitioning;
@end

@implementation Level

-(id)initWithSize:(CGSize)size
		   Matrix:(Matrix *)matrix
		   Camera:(Camera *)camera
{
	
	if (self = [super initWithSize:size])
	{
		self.matrix = matrix;
		[self.matrix setDelegate:self];
		self.camera = camera;
		self.transitioning = NO;
    }
	
	return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	if(self.transitioning) return;
	UserAction *action = Nil;
	
	for (UITouch *touch in touches)
	{
		NSArray *nodes = [self nodesAtPoint:[touch locationInNode:self]];
		if(nodes.count == 0)continue;
		if([self allNodesAreSceneNode:nodes])
		{
			FSKSpriteNode *secondPlaneNode = [self getSecondPlaneNode:nodes];
			if(secondPlaneNode == NULL)continue;
			action = [[NonNodeTouch alloc]initWithTouchPosition: [touch locationInNode:secondPlaneNode] TouchedNode:secondPlaneNode];
			NSArray *transitions = [self.matrix getPossibleTransitionsForLevel:self UserActionDescription:action];
			
			Transition* firstTransition = (Transition *) [transitions firstObject];
			[firstTransition excecute:self Action:action];
		}else
		{
			for(SKNode *touched in nodes)
			{
				action = [[Touch alloc] initWithTouchedElementsName:touched.name Element:touched];
				
				NSArray *transitions = [self.matrix getPossibleTransitionsForLevel:self UserActionDescription:action];
				
				Transition* firstTransition = (Transition *) [transitions firstObject];
				[firstTransition excecute:self Action:action];
				//self.transitioning = YES;
			}
		}
	}
}

- (FSKSpriteNode *)getSecondPlaneNode:(NSArray *)nodes
{
	for(FSKSpriteNode *node in nodes)
	{
		if(![node.name isEqualToString:@"Level1PresentP2"]) return node;
	}
	return NULL;
}

- (BOOL)allNodesAreSceneNode:(NSArray *)nodes
{
	for(FSKSpriteNode *node in nodes)
	{
		if(!node.isSceneNode) return NO;
	}
	return YES;
}

-(void)didEndTransition:(Transition *)transition
{
	self.transitioning = NO;
}

-(void)update:(CFTimeInterval)currentTime
{
}

@end