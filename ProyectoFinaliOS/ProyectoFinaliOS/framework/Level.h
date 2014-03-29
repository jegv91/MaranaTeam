//
//  Level.h
//  iOS Avance 5
//
//  Created by Lay Gonzalez Romero on 19/11/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Matrix.h"
#import "TransitionDelegate.h"
#import "Camera.h"

@class Matrix;

@interface Level : SKScene<TransitionDelegate>

@property (strong, nonatomic) Matrix* matrix;
@property (strong, nonatomic) Camera *camera;

-(id)initWithSize:(CGSize) size
		   Matrix:(Matrix *)matrix
		   Camera:(Camera *)camera;

@end