//
//  Utils.m
//  TercerAvance
//
//  Created by Lay Gonzalez Romero on 29/10/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import "Utils.h"


@implementation Utils

+ (NSArray *) APALoadFramesFromAtlas:(NSString *)atlasName Extension:(NSString *)ext NumberOfFrames:(NSInteger) numberOfFrames
{
    NSMutableArray *frames = [NSMutableArray arrayWithCapacity:numberOfFrames];
    
    SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:atlasName];
    for (int i = 1; i <= numberOfFrames; i++) {
        NSString *fileName = [NSString stringWithFormat:@"%@%0.4d.%@", atlasName, i, ext];
        SKTexture *texture = [atlas textureNamed:fileName];
        [frames addObject:texture];
    }
    
    return frames;
}

+ (SKTextureAtlas *) LoadAtlas:(NSString *)atlasName
{
	SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:atlasName];
	return atlas;
}
@end
