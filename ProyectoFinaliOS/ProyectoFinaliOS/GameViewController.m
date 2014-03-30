//
//  GameViewController.m
//  ProyectoFinaliOS
//
//  Created by Lay Gonzalez Romero on 25/11/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import "GameViewController.h"
#import <SpriteKit/SpriteKit.h>
#import "Level1.h"
#import "Constantes.h"
#import "CSeed.h"
#import "CClueMessage.h"
#import <AVFoundation/AVFoundation.h>

@interface GameViewController ()
@property (strong, nonatomic) AVAudioPlayer *player;
@property (strong, nonatomic) Level1 *l1;
@end

@implementation GameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self startMusic];
	
	self.skview = [[SKView alloc] initWithFrame:CGRectMake(0, 0, ipad_2_width, ipad_2_height)];
	self.l1 = [[Level1 alloc] initWithSize:self.skview.frame.size Controller:self];
	[self.view addSubview:self.skview];
	 self.reveal = [SKTransition revealWithDirection:SKTransitionDirectionDown duration:1.0];
	[self.skview presentScene:self.l1 transition:self.reveal];
	[self.l1 cameraIntro];
	
}

- (void)startMusic
{
	NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"Test1 Maraña" ofType: @"wav"];
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:soundFilePath ];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
    self.player.numberOfLoops = -1; //infinite loop
    [self.player play];
	
}

- (void)dismissWithDone:(BOOL)done
{
    [self.skview presentScene:self.l1 transition:self.reveal];
    
    if(done)
    {
        CSeed *seed = (CSeed *)[self.l1 childNodeWithName:@"Seed"];
        seed.state = @"Normal";
        CClueMessage *clue = (CClueMessage *)[self.l1 childNodeWithName:@"ClueLevel1"];
        [clue show];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
