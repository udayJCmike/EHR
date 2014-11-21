//
//  DetailedPatientViewController.h
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 17/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SVSegmentedControl.h"
#import <QuartzCore/QuartzCore.h>
#import "UIButton+Bootstrap.h"
@interface DetailedPatientViewController : UIViewController
{
    UIButton *navButton;
}
@property (strong, nonatomic) IBOutlet UIView *bgview;
@property (strong, nonatomic) UINavigationController *navController;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *make_appointment;
@end
