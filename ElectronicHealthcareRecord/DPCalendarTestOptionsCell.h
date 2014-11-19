//
//  DPCalendarTestOptionsCell.h
//  DPCalendar
//
//  Created by Ethan Fang on 21/01/14.
//  Copyright (c) 2014 Ethan Fang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSDate+DP.h"
#import "DPCalendarEvent.h"

@class DPCalendarTestOptionsCell;

@protocol DPCalendarTestOptionsCellDelegate <NSObject>

@optional
- (void) cell:(DPCalendarTestOptionsCell *)cell valueChanged:(id)value;

@end

@interface DPCalendarTestOptionsCell : UITableViewCell<UIPickerViewDataSource,UIPickerViewDelegate>
{
  
}
- (void) setTitle:(NSString *)title;
@property (nonatomic, strong) DPCalendarEvent *event;
@property (nonatomic, strong) NSString *textValue;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *identifier;
@property  BOOL isReschedule;
@property (nonatomic, weak) id<DPCalendarTestOptionsCellDelegate> delegate;

@end
