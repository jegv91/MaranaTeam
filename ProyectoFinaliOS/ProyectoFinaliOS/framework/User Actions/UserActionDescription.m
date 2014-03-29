//
//  UserActionDescription.m
//  iOS Avance 5
//
//  Created by Lay Gonzalez Romero on 20/11/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import "UserActionDescription.h"

@implementation UserActionDescription

- initWithKind:(Class)kind
{
	self = [super init];
	self.kind = kind;
	return self;
}

- (BOOL)mathesAction:(UserAction *)action
{
	return [action class] == self.kind;
}
@end
