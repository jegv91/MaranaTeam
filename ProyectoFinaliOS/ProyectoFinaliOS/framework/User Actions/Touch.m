//
//  Touch.m
//  iOS Avance 5
//
//  Created by Lay Gonzalez Romero on 20/11/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import "Touch.h"

@implementation Touch

- (Touch *)initWithTouchedElementsName:(NSString *)touchedElementsName Element:(SKNode *)element
{
	self = [super init];
	self.touchedElementsName = touchedElementsName;
	self.touchedNode = element;
	return self;
}

- (BOOL)equivalentTo:(UserAction *)otherUserAction
{
	return
		[otherUserAction isKindOfClass:[Touch class]]
		&&
	[self.touchedElementsName isEqualToString: ((Touch *)otherUserAction).touchedElementsName];
}

@end
