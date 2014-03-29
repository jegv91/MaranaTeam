//
//  RHPiece.h
//  RushHour
//
//  Created by Lay Gonzalez Romero on 17/02/14.
//  Copyright (c) 2014 Lay Gonzalez Romero. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Rectangle.h"
#import "Board.h"
@class Board;
@interface RHPiece : SKSpriteNode

@property (nonatomic) CGRect rect;
@property (strong, nonatomic) Board *board;

+ (NSMutableArray *)CreatePiecesWith:(NSArray *)descriptions
							   Board:(Board *)board;

- (RHPiece *)initWithRectangle:(Rectangle *)rectangle
						 Board:(Board *)board;

- (void)changeLocationInBoardWithNewLocation:(CGPoint)newLocation;
- (void)updateBoardLocation;
- (BOOL)needsToUpdateBoardLocation;
- (void)snapToGrid;

- (CGPoint)getPositionFromBoardPosition;
@end
