//
//  Board.m
//  RushHour
//
//  Created by Lay Gonzalez Romero on 20/02/14.
//  Copyright (c) 2014 Lay Gonzalez Romero. All rights reserved.
//

#import "Board.h"

@interface Board()
@end

@implementation Board

- (Board *)initWithTileSize:(NSInteger)tileSize Size:(CGPoint)size ImageName:(NSString *)imageName
{
	self = [super initWithImageNamed:imageName];
	self.tileSize = tileSize;
	self.xTiles = size.x;
	self.yTiles = size.y;
	
	self.rows = [[NSMutableArray alloc] initWithCapacity:self.yTiles];
	for(int i = 0; i < self.yTiles; i++)
	{
		[self.rows setObject:[[NSMutableArray alloc] initWithCapacity:self.xTiles] atIndexedSubscript:i];
		for(int j = 0; j < self.xTiles; j++)
		{
			[[self.rows objectAtIndex:i] setObject:@0 atIndex:j];
		}
	}
	return self;
}

- (void)setPieces:(NSMutableArray *) pieces
{
	_pieces = pieces;
	for(RHPiece *piece in pieces)
	{
		[self addChild:piece];
		[piece updateBoardLocation];
		[[self.rows objectAtIndex:piece.rect.origin.y] setObject:piece atIndex:piece.rect.origin.x];
	}
}

- (RHPiece *)isOccupiedRow:(NSInteger)row Column:(NSInteger)column
{
	if([self cellIsOut:CGPointMake(column, row)]) return NO;
	id objectAt = [[self.rows objectAtIndex:row] objectAtIndex:column];
	if(![objectAt isKindOfClass:[NSNumber class]]) return objectAt;
	for(int i = 0; i <= row; i++)
	{
		for(int j = 0; j <= column; j++)
		{
			RHPiece *piece = [[self.rows objectAtIndex:i]objectAtIndex:j];
			if([piece isKindOfClass:[NSNumber class]])continue;
			if(!piece) continue;
			CGRect rect = piece.rect;
			if(row - rect.origin.y < rect.size.height &&
			   column - rect.origin.x < rect.size.width)
			{
				return piece;
			}
		}
	}
	return NULL;
}

- (CGPoint)getRobbedCellByPhantom:(CGPoint)phantom Piece:(RHPiece *)piece
{
	int deltaX = phantom.x - piece.position.x;
	int deltaY = phantom.y - piece.position.y;
	int robbedCellX = piece.rect.origin.x;
	int robbedCellY = piece.rect.origin.y;
	if(deltaX > 0)
	{
		robbedCellX = piece.rect.origin.x + piece.rect.size.width;
	}else if(deltaX < 0)
	{
		robbedCellX = piece.rect.origin.x - 1;
	}else if(deltaY > 0)
	{
		robbedCellY = piece.rect.origin.y + piece.rect.size.height;
	}else
	{
		robbedCellY = piece.rect.origin.y - 1;
	}
	return CGPointMake(robbedCellX, robbedCellY);
}

- (BOOL)cellIsOut:(CGPoint)position
{
	return position.x < 0 || position.x >= [self xTiles] ||
		position.y < 0 || position.y >= [self yTiles];
}

- (BOOL)pieceIsOut:(RHPiece *)piece Position:(CGPoint)position
{
	return
		position.x < 0 ||
		position.x + piece.size.width > self.xTiles * self.tileSize ||
		position.y < 0 ||
		position.y + piece.size.height > self.yTiles * self.tileSize;
}

- (BOOL)phantomOverlaps:(CGPoint)phantom Piece:(RHPiece *)piece
{
	int deltaX = phantom.x - piece.position.x;
	int deltaY = phantom.y - piece.position.y;
	int newOriginX = piece.rect.origin.x;
	int newOriginY = piece.rect.origin.y;
	if(deltaX > 0)
	{
		newOriginX = piece.rect.origin.x + 1;
	}else if(deltaX < 0)
	{
		newOriginX = piece.rect.origin.x - 1;
	}else if(deltaY > 0)
	{
		newOriginY = piece.rect.origin.y + 1;
	}else
	{
		newOriginY = piece.rect.origin.y - 1;
	}
	
	for(int i = 0; i < piece.rect.size.height; i++)
	{
		for(int j = 0; j < piece.rect.size.width; j++)
		{
			id objectInCell = [self isOccupiedRow:newOriginY + i Column:newOriginX + j];
			if(objectInCell != NULL && objectInCell != piece)return YES;
		}
	}
	return NO;
}
@end