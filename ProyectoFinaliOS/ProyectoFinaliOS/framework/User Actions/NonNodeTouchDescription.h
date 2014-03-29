//
//  TouchDescription.h
//  iOS Avance 5
//
//  Created by Lay Gonzalez Romero on 20/11/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import "UserActionDescription.h"
#import <SpriteKit/SpriteKit.h>

@interface NonNodeTouchDescription : UserActionDescription
@property (nonatomic) BOOL allowed;

- initWithAllowed:(BOOL)allowed;

@end