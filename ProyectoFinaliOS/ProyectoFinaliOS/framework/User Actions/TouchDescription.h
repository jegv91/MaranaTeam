//
//  TouchDescription.h
//  iOS Avance 5
//
//  Created by Lay Gonzalez Romero on 20/11/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import "UserActionDescription.h"
#import <SpriteKit/SpriteKit.h>

@interface TouchDescription : UserActionDescription

@property (strong, nonatomic) NSString *targetName;
@property (strong, nonatomic) SKNode *target;

- initWithTargetName:(NSString *)targetName Target:(SKNode *) target;
@end
