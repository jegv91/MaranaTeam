//
//  Utils.h
//  TercerAvance
//
//  Created by Lay Gonzalez Romero on 29/10/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface Utils : NSObject
+ (SKTextureAtlas *) LoadAtlas:(NSString *)atlasName;
+ (NSArray *) APALoadFramesFromAtlas:(NSString *)atlasName Extension:(NSString *)ext NumberOfFrames:(NSInteger) numberOfFrames;
@end
