//
//  CClueMessage.h
//  ProyectoFinaliOS
//
//  Created by Joel on 3/29/14.
//  Copyright (c) 2014 Lay Gonzalez Romero. All rights reserved.
//

#import "FSKSpriteNode.h"

#define CLUE_LEVEL1 0

@interface CClueMessage : FSKSpriteNode

- (CClueMessage *)initWithMsgNumber: (NSInteger) msgNumber;

- (void) show;

@end