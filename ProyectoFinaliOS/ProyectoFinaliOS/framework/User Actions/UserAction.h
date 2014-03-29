//
//  UserAction.h
//  iOS Avance 5
//
//  Created by Lay Gonzalez Romero on 20/11/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef BOOL (^BoolBlock)(void);
@interface UserAction : NSObject

- (BOOL)equivalentTo:(UserAction *)otherUserAction;
- (BOOL)meetsCondition:(BoolBlock)condition;

@end
