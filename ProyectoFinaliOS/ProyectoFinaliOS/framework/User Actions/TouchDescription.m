//
//  TouchDescription.m
//  iOS Avance 5
//
//  Created by Lay Gonzalez Romero on 20/11/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import "TouchDescription.h"
#import "Touch.h"

@implementation TouchDescription

- initWithTargetName:(NSString *)targetName Target:(SKNode *) target
{
	self = [super initWithKind:[Touch class]];
	self.targetName = targetName;
	self.target = target;
	
	return self;
}

- (BOOL)mathesAction:(UserAction *)action
{
	if(![super mathesAction:action]) return false;
	
	Touch *castedAction = (Touch *) action;
	if(self.targetName != nil && ![self.targetName isEqualToString:castedAction.touchedElementsName]) return false;
	if(self.target != nil && self.target != castedAction.touchedNode) return false;
	return true;
}

@end
