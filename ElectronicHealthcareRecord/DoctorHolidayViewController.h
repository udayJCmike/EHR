//
//  DoctorHolidayViewController.h
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 18/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SVSegmentedControl.h"
#import <QuartzCore/QuartzCore.h>
#import "UIButton+Bootstrap.h"
#import "CYCustomMultiSelectPickerView.h"
@interface DoctorHolidayViewController : UIViewController<CYCustomMultiSelectPickerViewDelegate>
{
    UIButton *navButton;
    NSArray *entries;
    NSMutableDictionary *selectionDays;
    int buttontag;
   CYCustomMultiSelectPickerView *multiPickerView;
}
- (void)segmentedControlChangedValue:(SVSegmentedControl*)segmentedControl;

@property (strong, nonatomic) IBOutlet UIButton *update;
@property (strong, nonatomic) IBOutlet UIButton *cancel;
@property (strong, nonatomic) IBOutlet UIButton *reset;
@property (strong, nonatomic) IBOutlet UIView *personalinfo;
@property (strong, nonatomic) IBOutlet UIView *workinghours1;
@property (strong, nonatomic) IBOutlet UIView *workinghours2;
@property (strong, nonatomic) IBOutlet UIView *holiday1;
@property (strong, nonatomic) IBOutlet UIView *holiday2;
@property (strong, nonatomic) IBOutlet UIView *bgview;
@property (strong, nonatomic) IBOutlet UIDatePicker *timePicker;


@end
