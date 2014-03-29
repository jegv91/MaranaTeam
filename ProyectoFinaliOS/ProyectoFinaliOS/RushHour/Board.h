//
//  Board.h
//  RushHour
//
//  Created by Lay Gonzalez Romero on 20/02/14.
//  Copyright (c) 2014 Lay Gonzalez Romero. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "RushHour.h"
#import "RHPiece.h"
@class RHPiece;

@interface Board : SKSpriteNode

@property (nonatomic) NSInteger yTiles;
@property (nonatomic) NSInteger xTiles;
@property (nonatomic) NSInteger tileSize;
@property (strong, nonatomic)NSMutableArray *rows;
@property (strong, nonatomic) NSMutableArray *pieces;
@property (strong, nonatomic) RHPiece *thePiece;

- (Board *)initWithTileSize:(NSInteger)tileSize Size:(CGPoint) size ImageName:(NSString *)imageName;
- (void)setPieces:(NSMutableArray *) pieces;
- (BOOL)cellIsOut:(CGPoint)position;
- (BOOL)pieceIsOut:(RHPiece *)piece Position:(CGPoint)position;
- (CGPoint)getRobbedCellByPhantom:(CGPoint)phantom Piece:(RHPiece *)piece;
- (BOOL)phantomOverlaps:(CGPoint)phantom Piece:(RHPiece *)piece;
@end