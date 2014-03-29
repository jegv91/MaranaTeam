//
//  Rect.m
//  RushHour
//
//  Created by Lay Gonzalez Romero on 17/02/14.
//  Copyright (c) 2014 Lay Gonzalez Romero. All rights reserved.
//

#import "Rectangle.h"

@implementation Rectangle

+ (Rectangle *)createRectWithName:(NSString *)name ImageName:(NSString *)imageName Size:(CGSize)size Position:(CGPoint)position
{
	Rectangle *r = [Rectangle new];
	r.name = name;
	r.size = size;
	r.position = position;
	r.imageName = imageName;
	return r;
}
@end
