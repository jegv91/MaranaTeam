//
//  RushHour.m
//  RushHour
//
//  Created by Lay Gonzalez Romero on 17/02/14.
//  Copyright (c) 2014 Lay Gonzalez Romero. All rights reserved.
//

#import "RushHour.h"
#import "Board.h"
#import "RHPiece.h"
#import "Rectangle.h"

NSString *kPieceNode = @"Piece";
NSString *kBoardName = @"Board";

int boardHeight = 5;
int boardWidth = 4;

int tileSize = 100;

int boardX = 154;
int boardY = 150;

@interface RushHour() <SKPhysicsContactDelegate>
@property (strong, nonatomic) Board *board;
@property (nonatomic) BOOL panLocked;
@end

@implementation RushHour

-(RushHour *)initWithSize:(CGSize)size Delegate:(id<RushHourDelegate>)delegate
{
    if (self = [super initWithSize:size])
	{
		self.delegate = delegate;
		self.physicsWorld.contactDelegate = self;
		// Loading the background
		self.board = [[Board alloc] initWithTileSize:tileSize Size:CGPointMake(4, 5) ImageName:@"Board.jgp"];
		[self.board setPosition:CGPointMake(boardX, boardY)];
		[self.board setAnchorPoint:CGPointMake(0, 0)];
		[self.board setName:kBoardName];
		
		[self addChild:self.board];
		
		NSArray *descriptions = @[
								  [Rectangle createRectWithName: kPieceNode ImageName:@"1.jpg"
																Size:CGSizeMake(1, 1)
															Position:CGPointMake(0, 0)],
								  [Rectangle createRectWithName: kPieceNode ImageName:@"1.jpg"
																Size:CGSizeMake(1, 1)
															Position:CGPointMake(0, 1)],
								  [Rectangle createRectWithName: kPieceNode ImageName:@"1.jpg"
																Size:CGSizeMake(1, 1)
															Position:CGPointMake(0, 2)],
								  [Rectangle createRectWithName: kPieceNode ImageName:@"1.jpg"
																Size:CGSizeMake(1, 1)
															Position:CGPointMake(0, 3)],
								  [Rectangle createRectWithName: kPieceNode ImageName:@"1.jpg"
																Size:CGSizeMake(1, 1)
															Position:CGPointMake(0, 4)],
								  
								  
								  [Rectangle createRectWithName: kPieceNode ImageName:@"1.jpg"
																Size:CGSizeMake(1, 1)
															Position:CGPointMake(3, 0)],
								  [Rectangle createRectWithName: kPieceNode ImageName:@"1.jpg"
																Size:CGSizeMake(1, 1)
															Position:CGPointMake(3, 1)],
								  [Rectangle createRectWithName: kPieceNode ImageName:@"1.jpg"
																Size:CGSizeMake(1, 1)
															Position:CGPointMake(3, 2)],
								  [Rectangle createRectWithName: kPieceNode ImageName:@"1.jpg"
																Size:CGSizeMake(1, 1)
															Position:CGPointMake(3, 3)],
								  [Rectangle createRectWithName: kPieceNode ImageName:@"1.jpg"
																Size:CGSizeMake(1, 1)
															Position:CGPointMake(3, 4)],
								  
								  [Rectangle createRectWithName: kPieceNode ImageName:@"1.jpg"
																Size:CGSizeMake(1, 2)
															Position:CGPointMake(1, 0)],
								  [Rectangle createRectWithName: kPieceNode ImageName:@"1.jpg"
																Size:CGSizeMake(1, 2)
															Position:CGPointMake(2, 0)],
								  ];
		RHPiece *thePiece = [[RHPiece alloc] initWithRectangle:[Rectangle createRectWithName: kPieceNode ImageName:@"1.jpg"
																								  Size:CGSizeMake(2, 2)
																							  Position:CGPointMake(1, 2)]
														 Board:self.board];
		NSMutableArray *piecesAcum = [RHPiece CreatePiecesWith:descriptions Board:self.board];
		[piecesAcum addObject:thePiece];
		[self.board setPieces:piecesAcum];
		self.board.thePiece = thePiece;
		self.goalPosition = CGPointMake(1, 0);
    }
	
    return self;
}

- (void)addToBoard:(RHPiece *)piece
{
	[self.board addChild:piece];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint positionInScene = [touch locationInNode:self];
    [self selectNodeForTouch:positionInScene];
}

- (void)selectNodeForTouch:(CGPoint)touchLocation {
	
	NSArray *touchedNodes = [self nodesAtPoint:touchLocation];
	SKNode *touchedNode = Nil;
	for(SKNode *aTouchedNode in touchedNodes)
	{
		if([aTouchedNode.name isEqualToString:kPieceNode] || [aTouchedNode.name isEqualToString:kPieceNode])
		{
			touchedNode = aTouchedNode;
		}
	}
	
	[self.selectedNode removeAllActions];
	[self.selectedNode runAction:[SKAction rotateToAngle:0.0f duration:0.1]];
	self.selectedNode = Nil;

	self.selectedNode = (RHPiece *)touchedNode;
}

- (void)didMoveToView:(SKView *)view {
    UIPanGestureRecognizer *gestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanFrom:)];
    [[self view] addGestureRecognizer:gestureRecognizer];
}

- (void)handlePanFrom:(UIPanGestureRecognizer *)recognizer
{
	
	if (recognizer.state == UIGestureRecognizerStateBegan)
	{
        CGPoint touchLocation = [recognizer locationInView:recognizer.view];
        touchLocation = [self convertPointFromView:touchLocation];
        [self selectNodeForTouch:touchLocation];
    } else if (recognizer.state == UIGestureRecognizerStateChanged)
	{
		CGPoint translation = [recognizer translationInView:recognizer.view];
		if(!self.panLocked)
		{
			self.horizontalPan = abs(translation.x) > abs(translation.y);
			self.panLocked = YES;
		}
		if(self.horizontalPan)
		{
			translation.y = 0;
		}else
		{
			translation.x = 0;
		}
		
		CGPoint currentRealPosition = self.selectedNode.position;
		CGPoint phantom = CGPointMake(currentRealPosition.x + translation.x, currentRealPosition.y - translation.y);
		if([self.board pieceIsOut:self.selectedNode Position:phantom] ||
		   [self.board phantomOverlaps:phantom Piece:self.selectedNode])
		{
			return;
		}
		translation = CGPointMake(translation.x, -translation.y);
        [self panForTranslation:translation];
        [recognizer setTranslation:CGPointZero inView:recognizer.view];
		if ([self.selectedNode needsToUpdateBoardLocation])
		{
			[self.selectedNode updateBoardLocation];
			if([self checkIfDone])
			{
				[self.delegate dismissWithDone:YES];
			}
		}
    } else if (recognizer.state == UIGestureRecognizerStateEnded)
	{
		self.panLocked = NO;
		[self.selectedNode snapToGrid];
        if (![[self.selectedNode name] isEqualToString:kPieceNode]) {
        }
    }
}

- (BOOL) checkIfDone
{
	return self.board.thePiece.rect.origin.x == self.goalPosition.x &&
	self.board.thePiece.rect.origin.y == self.goalPosition.y;
}

- (void)panForTranslation:(CGPoint)translation {
    CGPoint position = [_selectedNode position];
    if([[self.selectedNode name] isEqualToString:kPieceNode]) {
        [self.selectedNode setPosition:CGPointMake(position.x + translation.x, position.y + translation.y)];
    }
}

@end
