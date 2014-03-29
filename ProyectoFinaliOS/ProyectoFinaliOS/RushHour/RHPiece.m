//
//  RHPiece.m
//  RushHour
//
//  Created by Lay Gonzalez Romero on 17/02/14.
//  Copyright (c) 2014 Lay Gonzalez Romero. All rights reserved.
//

#import "RHPiece.h"
#import "Rectangle.h"
#include "RushHour.h"


@implementation RHPiece

- (RHPiece *)initWithRectangle:(Rectangle *)rectangle
					  Board:(Board *)board
{
	RHPiece *result = [[RHPiece alloc] initWithImageNamed:rectangle.imageName];
	result.anchorPoint = CGPointZero;
	result.rect = CGRectMake(rectangle.position.x,
							 rectangle.position.y, rectangle.size.width, rectangle.size.height);
	result.board = board;
	
	[result setName:rectangle.name];
	
	[result setPositionForBoardLocation];
	
	CGSize size = CGSizeMake(result.board.tileSize*rectangle.size.width, result.board.tileSize*rectangle.size.height);
	result.size = size;

	return result;
}

- (void) updateBoardLocation
{
	CGPoint boardLocation = [self boardLocationForPosition:self.position];
	[[self.board.rows objectAtIndex:self.rect.origin.y] setObject:@0 atIndex:self.rect.origin.x];
	[[self.board.rows objectAtIndex:boardLocation.y] setObject:self atIndex:boardLocation.x];
	self.rect = CGRectMake(boardLocation.x, boardLocation.y, self.rect.size.width, self.rect.size.height);
}

- (BOOL)needsToUpdateBoardLocation
{
	CGPoint newBoardLocation = [self boardLocationForPosition:self.position];
	return newBoardLocation.x != self.rect.origin.x ||
		newBoardLocation.y != self.rect.origin.y;
}

- (CGPoint)boardLocationForPosition:(CGPoint)position
{
	return CGPointMake(round(self.position.x/self.board.tileSize),
					   round(self.position.y/self.board.tileSize));
}

- (void)setPositionForBoardLocation
{
	[self setPosition:(CGPointMake(self.rect.origin.x*self.board.tileSize,
								   self.rect.origin.y*self.board.tileSize))];
}

- (void)snapToGrid
{
	[self updateBoardLocation];
	[self setPositionForBoardLocation];
}

- (void)changeLocationInBoardWithNewLocation:(CGPoint)newLocation
{
	self.rect = CGRectMake(newLocation.x, newLocation.y, self.rect.size.width, self.rect.size.height);
}
+ (NSMutableArray *)CreatePiecesWith:(NSArray *)descriptions
					 Board:(Board *)board
{
	NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:descriptions.count];
	for (int i = 0; i < descriptions.count; i++)
	{
		Rectangle *r = [descriptions objectAtIndex:i];
		[result setObject: [[RHPiece alloc] initWithRectangle:r Board:board] atIndexedSubscript:i];
	}
	return result;
}

- (CGPoint)getPositionFromBoardPosition
{
	return CGPointMake(self.rect.origin.x * self.board.tileSize, self.rect.origin.y * self.board.tileSize);
}

@end
