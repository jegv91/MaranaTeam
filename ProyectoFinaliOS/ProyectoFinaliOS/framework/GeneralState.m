//
//  GeneralState.m
//  iOS Avance 5
//
//  Created by Lay Gonzalez Romero on 19/11/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import "GeneralState.h"

@interface GeneralState ()
@property (strong, nonatomic) NSArray *states;
@end

@implementation GeneralState

- (id) initWithName:(NSString *)name States:(NSArray *) states
{
	self = [super init];
	self.name = name;
	self.states = states;
	return self;
}

@end
