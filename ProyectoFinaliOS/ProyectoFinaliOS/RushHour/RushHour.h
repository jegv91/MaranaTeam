//
//  RushHour.h
//  RushHour
//
//  Created by Lay Gonzalez Romero on 17/02/14.
//  Copyright (c) 2014 Lay Gonzalez Romero. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#include "RHPiece.h"

@protocol RushHourDelegate <NSObject>

- (void)dismissWithDone:(BOOL)done;

@end

@class RHPiece;

static const uint32_t pieceBitMask = 0x1 << 0;
static const uint32_t boardBitMask = 0x1 << 1;

@interface RushHour : SKScene

-(RushHour *)initWithSize:(CGSize)size Delegate:(id<RushHourDelegate>)delegate;

@property (nonatomic, strong) id<RushHourDelegate>delegate;
@property (nonatomic, strong) SKSpriteNode *background;
@property (nonatomic, strong) RHPiece *selectedNode;
@property (nonatomic)BOOL horizontalPan;
@property (nonatomic)CGPoint goalPosition;

@end
