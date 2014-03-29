//
//  Matriz.m
//  iOS Avance 5
//
//  Created by Lay Gonzalez Romero on 19/11/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import "Matrix.h"
#import "Transition.h"

@interface Matrix ()
@property(strong, nonatomic) NSArray *transitions;
@end

@implementation Matrix

- (Matrix *)initWithTransitions:(NSArray *)transitions
{
	self = [super init];
	self.transitions = transitions;
	return self;
}

- (NSArray *)getPossibleTransitionsForLevel:(Level *)level UserActionDescription:(UserAction *)userAction
{
	NSMutableArray *result = [[NSMutableArray alloc] init];
	
	for (Transition * transition in self.transitions)
	{
		if([transition meetsConditionForLevel:level Action:userAction])
		{
			[result addObject:transition];
		}
	}
	return result;
}

- (void)setDelegate:(NSObject<TransitionDelegate> *)delegate
{
	for (Transition *t in self.transitions) {
		t.delegate = delegate;
	}
}

@end
