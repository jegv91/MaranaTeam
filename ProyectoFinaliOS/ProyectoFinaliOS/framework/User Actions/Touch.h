//
//  Touch.h
//  iOS Avance 5
//
//  Created by Lay Gonzalez Romero on 20/11/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import "UserAction.h"
#import <SpriteKit/SpriteKit.h>

@interface Touch : UserAction

@property (strong, nonatomic) NSString *touchedElementsName;
@property (strong, nonatomic) SKNode *touchedNode;

- (Touch *)initWithTouchedElementsName:(NSString *)touchedElementsName Element:(SKNode *)element;

@end
