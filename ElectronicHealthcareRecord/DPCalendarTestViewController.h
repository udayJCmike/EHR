//
//  DPCalendarTestViewController.h
//  DPCalendar
//
//  Created by Ethan Fang on 19/12/13.
//  Copyright (c) 2013 Ethan Fang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ElectronicHealthcareRecordAppDelegate.h"
#define AppDelegate (ElectronicHealthcareRecordAppDelegate *)[[UIApplication sharedApplication] delegate]
@interface DPCalendarTestViewController : UIViewController

{
    int IndexOfUpdatedEvent;
    BOOL isUpdating;
}

@end
