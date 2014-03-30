//
//  CClueMessage.m
//  ProyectoFinaliOS
//
//  Created by Joel on 3/29/14.
//  Copyright (c) 2014 Lay Gonzalez Romero. All rights reserved.
//

#import "CClueMessage.h"
#import "CSize.h"

#define HIDDEN_SIZE [[CSize alloc] initWithWidth:0 Height:0]
#define NORMAL_SIZE [[CSize alloc] initWithWidth:5 Height:1]
#define MSG_CLUE_LEVEL1 @"ClueLevel1"

@implementation CClueMessage

NSArray *messages;

//Initializes CClueMessage Object
- (CClueMessage *)initWithMsgNumber:(NSInteger) msgNumber
{
    NSString *name;

    messages = [NSArray arrayWithObjects:MSG_CLUE_LEVEL1, nil];
    if(msgNumber < [messages count])
        name = [messages objectAtIndex:msgNumber];
    else
        name = @"";
    //initialize game object
	self = [super initWithName: name
                   IsSceneNode: NO
					StateNames: @[@"Hidden", @"Normal"]
						Frames: @[@1, @1]
						 Sizes: @[HIDDEN_SIZE, NORMAL_SIZE]];
    self.anchorPoint = CGPointMake(.5, 0);
	self.shouldInvert = YES;
	self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.size];

	return self;
}

- (void) show
{
    dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		
        self.state = @"Normal";
        usleep(3000000);
		self.state = @"Hidden";
	});
}

@end
