//
//  ViewController.m
//  ProyectoFinaliOS
//
//  Created by Lay Gonzalez Romero on 21/11/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import "HomeViewController.h"
#import "GameViewController.h"
#import "AppDelegate.h"
#import <AVFoundation/AVFoundation.h>


@interface HomeViewController ()

@property (nonatomic, strong) AVAudioPlayer *player;
@property (nonatomic, strong) NSMutableDictionary *postParams;


@end
@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self startMusic];

}
- (IBAction)play:(id)sender
{
	AudioServicesPlaySystemSound(menu_select);
	
	[self.player stop];
	GameViewController *gameVC = [[GameViewController alloc] init];
	[self presentViewController:gameVC animated:YES completion:nil];
}

- (void)startMusic
{
	NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"Jesus" ofType: @"mp3"];
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:soundFilePath ];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
    self.player.numberOfLoops = -1; //infinite loop
    [self.player play];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) alertView:(UIAlertView *)alertView
didDismissWithButtonIndex:(NSInteger)buttonIndex
{
	[[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}

/*

- (void)publishStory
{
    [FBRequestConnection
     startWithGraphPath:@"me/feed"
     parameters:self.postParams
     HTTPMethod:@"POST"
     completionHandler:^(FBRequestConnection *connection,
                         id result,
                         NSError *error) {
         NSString *alertText;
         if (error) {
             alertText = [NSString stringWithFormat:
                          @"error: domain = %@, code = %d",
                          error.domain, error.code];
         } else {
             alertText = [NSString stringWithFormat:
                          @"Posted action, id: %@",
                          result[@"id"]];
         }
         // Show the result in an alert
         [[[UIAlertView alloc] initWithTitle:@"Result"
                                     message:alertText
                                    delegate:self
                           cancelButtonTitle:@"OK!"
                           otherButtonTitles:nil]
          show];
     }];
}
- (IBAction)shareFB:(id)sender
{
	// Hide keyboard if showing when button clicked
    if ([self.postMessageTextView isFirstResponder]) {
        [self.postMessageTextView resignFirstResponder];
    }
    // Add user message parameter if user filled it in
    if (![self.postMessageTextView.text
          isEqualToString:kPlaceholderPostMessage] &&
        ![self.postMessageTextView.text isEqualToString:@""]) {
        self.postParams[@"message"] = self.postMessageTextView.text;
    }
	
    // Ask for publish_actions permissions in context
    if ([FBSession.activeSession.permissions
         indexOfObject:@"publish_actions"] == NSNotFound) {
        // Permission hasn't been granted, so ask for publish_actions
        [FBSession openActiveSessionWithPublishPermissions:@[@"publish_actions"]
                                           defaultAudience:FBSessionDefaultAudienceFriends
                                              allowLoginUI:YES
                                         completionHandler:^(FBSession *session, FBSessionState state, NSError *error) {
											 if (FBSession.activeSession.isOpen && !error) {
												 // Publish the story if permission was granted
												 [self publishStory];
											 }
										 }];
    } else {
        // If permissions present, publish the story
        [self publishStory];
    }
}
 */

@end
