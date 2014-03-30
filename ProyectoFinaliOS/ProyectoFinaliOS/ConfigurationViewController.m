//
//  ConfigurationViewController.m
//  ProyectoFinaliOS
//
//  Created by Joel on 3/29/14.
//  Copyright (c) 2014 Lay Gonzalez Romero. All rights reserved.
//

#import "ConfigurationViewController.h"

@interface ConfigurationViewController ()

@end

@implementation ConfigurationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    //self.sliderSound;
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.muteMusic.on = [defaults boolForKey:@"muteMusic"];
    self.muteSound.on = [defaults boolForKey:@"muteSound"];
    self.sliderMusic.value = [defaults floatForKey:@"volMusic"];
    self.sliderSound.value = [defaults floatForKey:@"volSound"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void) viewWillDisappear:(BOOL)animated
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool: self.muteMusic.on forKey: @"muteMusic"];
    [defaults setBool: self.muteSound.on forKey: @"muteSound"];
    [defaults setFloat: self.sliderMusic.value forKey: @"volMusic"];
    [defaults setFloat: self.sliderSound.value forKey: @"volSound"];
}

@end
