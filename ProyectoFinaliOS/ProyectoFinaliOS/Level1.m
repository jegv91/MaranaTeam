//
//  Level1.m
//  ProyectoFinaliOS
//
//  Created by Lay Gonzalez Romero on 21/11/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import "Level1.h"
#import "Constantes.h"
#import "CChameleon.h"
#import "Utils.h"
#import "CSize.h"
#import "FSKSpriteNode.h"
#import "UserActionDescription.h"
#import "TouchDescription.h"
#import "NonNodeTouch.h"
#import "NonNodeTouchDescription.h"
#import "RushHour.h"
#import "GameViewController.h"
#import "Touch.h"


@interface Level1 ()
@end

@implementation Level1

- (Level1 *) initWithSize:(CGSize)size Controller:(UIViewController *)controller
{
	Camera *camera = [[Camera alloc] init];
	camera.x = -10;
	camera.y = -5;
	camera.z = -10;
	camera.scene = self;
	self = [super
			initWithSize:size
			Matrix:[Level1 createMatrix]
			Camera:camera Controller:controller];
	self.backgroundColor = [UIColor whiteColor];
	
	CSize *presentP3NormalSize = [[CSize alloc] initWithWidth:20 Height:15];
	FSKSpriteNode *presentP3 = [[FSKSpriteNode alloc] initWithName:@"Level1PresentP3" IsSceneNode:YES StateNames:@[@"Normal"] Frames:@[@1] Sizes:@[presentP3NormalSize]];
	
	CSize *presentP2NormalSize = [[CSize alloc] initWithWidth:16 Height:12];
	FSKSpriteNode *presentP2 = [[FSKSpriteNode alloc] initWithName:@"Level1PresentP2" IsSceneNode:YES StateNames:@[@"Normal"] Frames:@[@1] Sizes:@[presentP2NormalSize]];
	
	CSize *presentP1NormalSize = [[CSize alloc] initWithWidth:12 Height:9];
	FSKSpriteNode *presentP1 = [[FSKSpriteNode alloc] initWithName:@"Level1PresentP1" IsSceneNode:YES StateNames:@[@"Normal"] Frames:@[@1] Sizes:@[presentP1NormalSize]];
	
	
	CChameleon *c = [[CChameleon alloc] init];
	
	CSize *chestSize = [[CSize alloc] initWithWidth:3 Height:2.32];
	FSKSpriteNode *chest = [[FSKSpriteNode alloc] initWithName:@"Chest" IsSceneNode:NO StateNames:@[@"Closed"] Frames:@[@1] Sizes:@[chestSize]];
	
    CSize *potSize =[[CSize alloc] initWithWidth:1.5 Height:3];
    FSKSpriteNode *pot = [[FSKSpriteNode alloc] initWithName:@"Maceta" IsSceneNode:NO StateNames:@[@"Normal"] Frames:@[@1] Sizes:@[potSize]];
    
    CSize *bottleSize =[[CSize alloc]initWithWidth:.9 Height:1.3];
    FSKSpriteNode *bottle = [[FSKSpriteNode alloc] initWithName:@"Bottle" IsSceneNode:NO StateNames:@[@"Normal"] Frames:@[@1] Sizes:@[bottleSize]];
	
	[self addChild:presentP3];
	[self addChild:chest];
	[self addChild:presentP2];
	[self addChild:presentP1];
    [self addChild:pot];
    [self addChild:bottle];
	[self addChild:c];
	
	
	presentP3.state = @"Normal";
	[presentP3 setThreeDPositionX:0 Y:0 Z:20];
	
	chest.state = @"Closed";
	[chest setThreeDPositionX:-2 Y:-3.6 Z:20];
	
	presentP2.state = @"Normal";
	[presentP2 setThreeDPositionX:0 Y:0 Z:16];
	
	presentP1.state = @"Normal";
	[presentP1 setThreeDPositionX:0 Y:0 Z:14];
	
	[c setThreeDPositionX:2 Y:-4 Z:17.5];
	c.state = @"Looking";
    
    
    //Animaciones escenario
    pot.state=@"Normal";
    [pot setThreeDPositionX:4.6 Y:-2.8 Z:14];//plano enfrente
    
    bottle.state=@"Normal";
    [bottle setThreeDPositionX:-1.6 Y:1.8 Z:16]; //plano medio
    bottle.anchorPoint= CGPointMake(.5, 1);

	return self;
}

- (void)cameraIntro
{
	dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		
		while (self.camera.x < 0)
		{
			[self.camera setPositionWithX:self.camera.x+.025 Y:self.camera.y+.0125 Z:self.camera.z+.025];
            
			usleep(10000);
		}
		self.paused = NO;
	});
}

+(void) Move:(FSKSpriteNode*)element x:(double)x y:(double)y z:(double)z duration:(double)duration
{
    int ciclos = duration * 10;
    double deltaX = (x- element.x) / ciclos;
    double deltaY = (y - element.y) / ciclos;
    double deltaZ = (z - element.z) / ciclos;
    
    dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        int ciclosCounter = ciclos;
		while (ciclosCounter > 0)
		{
            ciclosCounter --;
            
			element.x += deltaX;
            element.y += deltaY;
            element.z += deltaZ;
            
			usleep(100000);
		}
        element.state = @"Looking";
	});
	
}

+ (InventoryItem *)createKeyItem
{
	SKSpriteNode *keyItem = [SKSpriteNode spriteNodeWithImageNamed:@"Key"];
	return [[InventoryItem alloc] initWithItem:keyItem Name:@"Key" Quantity:1 Enumerable:YES];
}


+(SKAction *) createShakeWithCounts:(NSInteger)counts Degrees:(double)degrees Duration:(double) duration
{
    return [SKAction repeatAction:[SKAction sequence:@[[SKAction rotateByAngle:degrees duration:duration], [SKAction rotateByAngle:-1*degrees duration:duration]]] count:counts];
}

+ (Matrix *)createMatrix
{
	TouchDescription *t = [[TouchDescription alloc] initWithTargetName:@"Chest" Target:nil];
	
	Transition *showRushHour = [[Transition alloc]
							 
							 initWithUserActionDescription:t
							 
							 Condition:^BOOL(Level *level, UserAction *userAction)
							 {
								 Touch *touch = (Touch *)userAction;
								 CChameleon * c = (CChameleon *)[level childNodeWithName:@"Chameleon"];
								 return [((FSKSpriteNode *)touch.touchedNode).state isEqualToString:@"Closed"];
								 
							 }
							 Actions:^(Level *level, UserAction *userAction)
							 {
								 
								 CLevel *cLevel = (CLevel *)level;
								 GameViewController *gvc = (GameViewController *)cLevel.controller;
								 RushHour *rhScene = [[RushHour alloc] initWithSize:ipad_size Delegate:gvc];
								 [gvc.skview presentScene:rhScene transition:gvc.reveal];
								 
							 }];
    
	TouchDescription *t2=[[TouchDescription alloc] initWithTargetName:@"Maceta" Target:nil];
    Transition *MacetaAnim =[[Transition alloc] initWithUserActionDescription:t2 Condition:^BOOL(Level *level, UserAction *userAction) {
        Touch *touch = (Touch *) userAction;
        return [((FSKSpriteNode *)touch.touchedNode).state isEqualToString:@"Normal"];
        
		
    } Actions:^(Level *level, UserAction *userAction) {
        Touch *touch =(Touch *) userAction;
		
		[touch.touchedNode runAction:[Level1 createShakeWithCounts:4 Degrees:.349 Duration:.05]];
		
    }];
    
    
    //falta mover el anchor point para arriba en el centro.. para que se mueva..
    
    TouchDescription *t3=[[TouchDescription alloc] initWithTargetName:@"Bottle" Target:nil];
    Transition *BottleAnim =[[Transition alloc] initWithUserActionDescription:t3 Condition:^BOOL(Level *level, UserAction *userAction) {
        Touch *touch = (Touch *) userAction;
        return [((FSKSpriteNode *)touch.touchedNode).state isEqualToString:@"Normal"];
        
        
    } Actions:^(Level *level, UserAction *userAction) {
        Touch *touch =(Touch *) userAction;
		
		[touch.touchedNode runAction:[Level1 createShakeWithCounts:4 Degrees:.349 Duration:.05]];
        
    }];
	
	NonNodeTouchDescription *nt = [[NonNodeTouchDescription alloc] initWithAllowed:YES];
	
	Transition *moveToNonNodeTouch = [[Transition alloc] initWithUserActionDescription:nt Condition:^BOOL(Level *level, UserAction *userAction) {
		return YES;
	} Actions:^(Level *level, UserAction *userAction) {
		NonNodeTouch *touch = (NonNodeTouch *) userAction;
        CChameleon * c = (CChameleon *)[level childNodeWithName:@"Chameleon"];
        c.state = @"Walking";
		[c setDirection:touch.x - c.x];
		float distance = abs(c.x - touch.x);
        [Level1 Move:c x:touch.x y:c.y z:c.z duration:distance*5.0/touch.touchedNode.width];

	}];
	
	return [[Matrix alloc] initWithTransitions:@[showRushHour, MacetaAnim, BottleAnim, moveToNonNodeTouch]];
}

@end
