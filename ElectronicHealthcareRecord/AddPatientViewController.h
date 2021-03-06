//
//  BasicInformationViewController.h
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 11/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SVSegmentedControl.h"
#import <QuartzCore/QuartzCore.h>
#import "UIButton+Bootstrap.h"
@interface AddPatientViewController : UIViewController
- (void)segmentedControlChangedValue:(SVSegmentedControl*)segmentedControl;
@property (strong, nonatomic) IBOutlet UIView *view1;

@property (strong, nonatomic) IBOutlet UIButton *update;
@property (strong, nonatomic) IBOutlet UIButton *cancel;
@property (strong, nonatomic) IBOutlet UIView *personalinfo;
@property (strong, nonatomic) IBOutlet UIView *view2;
@property (strong, nonatomic) IBOutlet UIView *insuranceDetails;
@property (strong, nonatomic) IBOutlet UIButton *update1;
@property (strong, nonatomic) IBOutlet UIButton *cancel1;
@end
