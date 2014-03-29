//
//  TransitionProtocol.h
//  iOS Avance 5
//
//  Created by Lay Gonzalez Romero on 20/11/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Transition.h"

@class Transition;

@protocol TransitionDelegate <NSObject>

-(void)didEndTransition:(Transition *)transition;

@end