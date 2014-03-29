//
//  GameViewController.h
//  ProyectoFinaliOS
//
//  Created by Lay Gonzalez Romero on 25/11/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RushHour.h"

@interface GameViewController : UIViewController<RushHourDelegate>

@property (strong, nonatomic) SKView *skview;
@property (strong, nonatomic) SKTransition *reveal;
- (void)dismissWithDone:(BOOL)done;

@end
