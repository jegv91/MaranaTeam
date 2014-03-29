//
//  UserActionDescription.h
//  iOS Avance 5
//
//  Created by Lay Gonzalez Romero on 20/11/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserAction.h"

@interface UserActionDescription : NSObject

@property (unsafe_unretained, nonatomic) Class kind;

- initWithKind:(Class) kind;

- (BOOL)mathesAction:(UserAction *)action;

@end
