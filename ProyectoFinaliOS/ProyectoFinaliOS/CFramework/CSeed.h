//
//  CSeed.h
//  ProyectoFinaliOS
//
//  Created by Joel on 3/29/14.
//  Copyright (c) 2014 Lay Gonzalez Romero. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "FSKSpriteNode.h"

@interface CSeed : FSKSpriteNode

@property (strong, nonatomic) NSArray *messages;

- (CSeed *)init;

- (NSString *)showMessage:(NSInteger)nmbrMsg;

@end
