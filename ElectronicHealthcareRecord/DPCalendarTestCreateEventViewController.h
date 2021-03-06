//
//  DPCalendarTestCreateEventViewController.h
//  DPCalendar
//
//  Created by Ethan Fang on 21/01/14.
//  Copyright (c) 2014 Ethan Fang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DPCalendarEvent.h"
#import "ElectronicHealthcareRecordAppDelegate.h"
#define AppDelegate (ElectronicHealthcareRecordAppDelegate *)[[UIApplication sharedApplication] delegate]
@protocol DPCalendarTestCreateEventViewControllerDelegate <NSObject>

- (void) eventCreated:(DPCalendarEvent *)event;

@end

@interface DPCalendarTestCreateEventViewController : UIViewController
{
    int status;
}
@property (nonatomic, strong) DPCalendarEvent *event;
@property (nonatomic, weak) id<DPCalendarTestCreateEventViewControllerDelegate> delegate;
@end
