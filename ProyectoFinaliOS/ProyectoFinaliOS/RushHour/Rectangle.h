//
//  Rect.h
//  RushHour
//
//  Created by Lay Gonzalez Romero on 17/02/14.
//  Copyright (c) 2014 Lay Gonzalez Romero. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Rectangle : NSObject

@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) NSString *imageName;
@property(nonatomic)CGSize size;
@property(nonatomic)CGPoint position;

+ (Rectangle *)createRectWithName:(NSString *)name ImageName:(NSString *)name Size:(CGSize)size Position:(CGPoint)position;

@end
