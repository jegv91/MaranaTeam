//
//  ConfigurationViewController.h
//  ProyectoFinaliOS
//
//  Created by Joel on 3/29/14.
//  Copyright (c) 2014 Lay Gonzalez Romero. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConfigurationViewController : UIViewController

@property (strong, nonatomic) IBOutlet UISlider *sliderMusic;
@property (strong, nonatomic) IBOutlet UISlider *sliderSound;
@property (weak, nonatomic) IBOutlet UISwitch *muteMusic;
@property (weak, nonatomic) IBOutlet UISwitch *muteSound;

@end
