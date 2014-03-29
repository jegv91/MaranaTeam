//
//  FSKSpriteNode.m
//  ProyectoFinaliOS
//
//  Created by Lay Gonzalez Romero on 24/11/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import "FSKSpriteNode.h"
#import "Utils.h"
#import "Level.h"
#import "CSize.h"
#import "Constantes.h"

@interface FSKSpriteNode ()

@property (strong, nonatomic) NSMutableDictionary *spritesStates;
@property (strong, nonatomic) NSDictionary *spritesSizes;
@property (strong, nonatomic) NSDictionary *spritesDistances;

@end

@implementation FSKSpriteNode

- (SKSpriteNode *)initWithName:(NSString *)name IsSceneNode:(BOOL)isSceneNode StateNames:(NSArray *)statesNames Frames:(NSArray *)frames Sizes:(NSArray *)sizes
{
	self = [super init];
	self.name = name;
	self.isSceneNode = isSceneNode;
	self.attributes = [[NSMutableDictionary alloc] init];
	self.spritesStates = [[NSMutableDictionary alloc] init];
	self.spritesDistances = [NSMutableDictionary dictionary];
	
	
	NSMutableDictionary *sizesDict = [NSMutableDictionary dictionary];
	NSMutableDictionary *distancesDict = [NSMutableDictionary dictionary];
	for(int i = 0; i < statesNames.count; i++)
	{
		NSString *stateName = [statesNames objectAtIndex:i];
		[sizesDict setObject:[sizes objectAtIndex:i] forKey:stateName];
	}
	
	self.spritesSizes = sizesDict;
	self.spritesDistances = distancesDict;
	for(int i = 0; i < statesNames.count; i++)
	{
		NSString *stateName = [statesNames objectAtIndex:i];
		NSString *fullName = [NSString stringWithFormat:@"%@%@", name, stateName];
		NSArray *textures = [Utils APALoadFramesFromAtlas:fullName Extension:@"png" NumberOfFrames:((NSNumber *)[frames objectAtIndex:i]).intValue];
		[self.spritesStates setObject:textures forKey:stateName];
		SKTexture *firstTexture = [textures firstObject];
		double textureHeight = firstTexture.size.height;
		double objectHeight = ((CSize *)[self.spritesSizes objectForKey:stateName]).height;
		double distance = (objectHeight / textureHeight) - 1;
		[self.spritesDistances setValue:[NSNumber numberWithDouble:distance] forKey:stateName];
	}
	return self;
}
- (void)setThreeDPositionX:(double)x Y:(double)y Z:(double)z
{
	_x = x;
	_y = y;
	_z = z;
	[self setZPosition:-z];
	[self updatePerceptionBecauseOfChange];
}

- (double)spriteDistance
{
	return ((NSNumber *)[self.spritesDistances objectForKey:self.state]).doubleValue;
}

- (void)setState:(NSString *)state
{
	_state = state;
	
	CSize *size = [self.spritesSizes objectForKey:state];
	_width = size.width;
	_height = size.height;
	
	[self updatePerceptionBecauseOfChange];
	
	SKAction *animation = [SKAction animateWithTextures:[self.spritesStates objectForKey:state] timePerFrame:.1f];
	[self runAction:[SKAction repeatActionForever:animation]];
}


- (BOOL)isInGeneralState:(NSNumber *)generalState
{
	for (NSNumber *n in [self.generalStates objectAtIndex:generalState.intValue])
	{
		if(n.intValue == generalState.intValue) return YES;
	}
	return NO;
}

- (void)setX:(double)x
{
	_x = x;
	[self updatePerceptionBecauseOfChange];
}

- (void)setY:(double)y
{
	_y = y;
	[self updatePerceptionBecauseOfChange];
}

- (void)setZ:(double)z
{
	_z = z;
	[self setZPosition:-z];
	[self updatePerceptionBecauseOfChange];
}


- (void)setPerception:(Perception *)perception
{
	double scene_height = self.scene.size.height;
	double scene_width = self.scene.size.width;
	
	double paddingX =  (scene_width/2);
	double paddingY =  (scene_height/2);
	
	int x = scene_width * perception.xRatio + paddingX;
	int y = scene_height * perception.yRatio + paddingY; // perception.y / centimeters_per_pixel + paddingY;
	int height = scene_height * perception.heightRatio;// perception.height / centimeters_per_pixel;
	int width = scene_width * perception.widthRatio;// perception.width / centimeters_per_pixel;
	if(self.xScale == -1){width *= -1;}
	self.position = CGPointMake(x, y);
	self.size = CGSizeMake(width, height);
}

- (void)updatePerceptionBecauseOfChange
{
	if(self.scene)
	{
		Level *l = (Level *)self.scene;
		[self setPerception:[l.camera perceptionOf:self]];
	}
	
}

@end
