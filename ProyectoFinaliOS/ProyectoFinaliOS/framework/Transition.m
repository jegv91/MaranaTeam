//
//  Case.m
//  iOS Avance 5
//
//  Created by Lay Gonzalez Romero on 19/11/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import "Transition.h"

@interface Transition ()

@property (strong, nonatomic) ConditionBlock condition;
@property (strong, nonatomic) ActionsBlock actions;

@end

@implementation Transition

-(id)initWithUserActionDescription:(UserActionDescription *)userActionDescription Condition:(ConditionBlock) condition Actions:(ActionsBlock) actions;
{
	self = [super init];
	self.userActionDescription = userActionDescription;
	self.condition = condition;
	self.actions = actions;
	
	return self;
}

- (BOOL)meetsConditionForLevel:(Level *)level Action:(UserAction *)userAction;
{
	if(![self.userActionDescription mathesAction:userAction]) return false;
	return self.condition(level, userAction);
}

-  (void)excecute:(Level *)level Action:(UserAction *)action
{
	self.actions(level, action);
	[self.delegate didEndTransition:self];
}
@end
