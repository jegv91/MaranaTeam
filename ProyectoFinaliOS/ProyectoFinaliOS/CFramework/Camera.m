//
//  Camera.m
//  ProyectoFinaliOS
//
//  Created by Lay Gonzalez Romero on 22/11/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import "Camera.h"
#import "math.h"
#import "Constantes.h"


double ratio(double size, double distance, double capture_screen_size, double fd)
{
	return 2 * fd * tan(atan(size / (2*distance))) / capture_screen_size;
}

@interface Camera ()

@property (nonatomic) double capture_screen_width;
@property (nonatomic) double capture_screen_height;
@property (nonatomic) double fd;

@end

@implementation Camera

- (Camera *)init
{
	self = [super init];
	self.capture_screen_height = 3;
	self.capture_screen_width = 4;
	self.fd = 4;
	
	return self;
}

- (Perception *)perceptionOf:(FSKSpriteNode *)node
{
	double x = node.x - self.x;
	double y = node.y - self.y;
	double z = node.z - self.z;
	double width = node.width;
	double height = node.height;
	
	double heightRatio = ratio(height, z, self.capture_screen_height, self.fd);
	double widthRatio = ratio(width, z, self.capture_screen_width, self.fd);
	
	double xRatio = ratio(x, z, self.capture_screen_width, self.fd);
	double yRatio = ratio(y, z, self.capture_screen_height, self.fd);
	
	return [[Perception alloc] initWithXRatio:xRatio YRatio:yRatio HeightRatio:heightRatio WidthRatio:widthRatio];
	
}

- (void)setX:(double)x
{
	_x = x;
	[self changeNodes2Dcoordinates];
}

- (void)setY:(double)y
{
	_y = y;
	[self changeNodes2Dcoordinates];
}

- (void)setZ:(double)z
{
	_z = z;
	[self changeNodes2Dcoordinates];
}

- (void)setPositionWithX:(double)x Y:(double)y Z:(double)z
{
	_x = x;
	_y = y;
	_z = z;
	[self changeNodes2Dcoordinates];
}

- (void)changeNodes2Dcoordinates
{
	NSArray *sprites = self.scene.children;
	for (FSKSpriteNode *sprite in sprites)
	{
		if ([sprite isKindOfClass:[FSKSpriteNode class]]) {
			Perception *p = [self perceptionOf:sprite];
			[sprite setPerception:p];
		}
	}
}

@end