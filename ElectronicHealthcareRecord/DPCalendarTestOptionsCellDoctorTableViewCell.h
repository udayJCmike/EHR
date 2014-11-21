//
//  DPCalendarTestOptionsCellDoctorTableViewCell.h
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 11/20/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSDate+DP.h"
#import "DPCalendarEvent.h"
@class DPCalendarTestOptionsCellDoctorTableViewCell;

@protocol DPCalendarTestOptionsCellDoctorTableViewCellDelegate <NSObject>

@optional
- (void) cell:(DPCalendarTestOptionsCellDoctorTableViewCell *)cell valueChanged:(id)value;

@end

@interface DPCalendarTestOptionsCellDoctorTableViewCell : UITableViewCell<UIPickerViewDataSource,UIPickerViewDelegate,UITextViewDelegate,UITextFieldDelegate>
{
     UITapGestureRecognizer *tap ;
}
- (void) setTitle:(NSString *)title;
@property (nonatomic, strong) DPCalendarEvent *event;
@property (nonatomic, strong) NSString *textValue;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *identifier;
@property  BOOL isReschedule;
@property (nonatomic, weak) id<DPCalendarTestOptionsCellDoctorTableViewCellDelegate> delegate;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIDatePicker *datePicker;
@property (nonatomic, strong) UIPickerView *timePicker;
@property (nonatomic, strong) UITextView *valueTextField;
@property (nonatomic, strong) UISwitch *valueSwitch;
@property (nonatomic, strong) UISlider *valueSlider;
@property (nonatomic, strong) UILabel *dateLabel;
@property(nonatomic,retain)NSMutableArray *timeArray;
@property (nonatomic) enum CellType cellType;
@property (nonatomic, strong) UIPopoverController *datePopover;
@property (nonatomic, strong) UITextField *nameTextField;
@end


