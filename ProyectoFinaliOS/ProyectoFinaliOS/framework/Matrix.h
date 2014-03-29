//
//  Matriz.h
//  iOS Avance 5
//
//  Created by Lay Gonzalez Romero on 19/11/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Level.h"
#import "UserAction.h"
#import "TransitionDelegate.h"

@class Level;

@interface Matrix : NSObject

- (Matrix *)initWithTransitions:(NSArray *)transitions;
- (NSArray *)getPossibleTransitionsForLevel:(Level *)level UserActionDescription:(UserAction *)userAction;

- (void)setDelegate:(NSObject<TransitionDelegate> *)delegate;

@end
