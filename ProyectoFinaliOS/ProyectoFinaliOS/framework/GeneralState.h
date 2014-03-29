//
//  GeneralState.h
//  iOS Avance 5
//
//  Created by Lay Gonzalez Romero on 19/11/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GeneralState : NSObject

@property (strong, nonatomic) NSString *name;

- (GeneralState *) initWithName:(NSString *)name States:(NSArray *) states;

@end
