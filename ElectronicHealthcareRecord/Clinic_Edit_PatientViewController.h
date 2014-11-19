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
@interface Clinic_Edit_PatientViewController : UIViewController
- (void)segmentedControlChangedValue:(SVSegmentedControl*)segmentedControl;

@property (strong, nonatomic) IBOutlet UIButton *update;
@property (strong, nonatomic) IBOutlet UIButton *cancel;
@property (strong, nonatomic) IBOutlet UIView *personalinfo;
@end
