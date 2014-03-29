//
//  Case.h
//  iOS Avance 5
//
//  Created by Lay Gonzalez Romero on 19/11/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserAction.h"
#import "UserActionDescription.h"
#import "Level.h"
#import "TransitionDelegate.h"

@class Level;
@protocol TransitionDelegate;

typedef BOOL (^ConditionBlock)(Level* level, UserAction *userAction);
typedef void (^ActionsBlock)(Level* level, UserAction* userAction);

@interface Transition : NSObject

@property (strong, nonatomic) UserActionDescription* userActionDescription;

@property (nonatomic) NSInteger state;
@property (strong, nonatomic) id<TransitionDelegate> delegate;

-(id)initWithUserActionDescription:(UserActionDescription *)userActionDescription Condition:(ConditionBlock) condition Actions:(ActionsBlock) actions;

- (BOOL)meetsConditionForLevel:(Level *)level Action:(UserAction *)userAction;
- (void)excecute:(Level *)level Action:(UserAction *)action;

@end