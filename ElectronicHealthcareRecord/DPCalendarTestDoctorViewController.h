//
//  DPCalendarTestDoctorViewController.h
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 11/20/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ElectronicHealthcareRecordAppDelegate.h"
#define AppDelegate (ElectronicHealthcareRecordAppDelegate *)[[UIApplication sharedApplication] delegate]
@interface DPCalendarTestDoctorViewController :UIViewController<UIAlertViewDelegate>

{
    NSDate *response_date;
    int IndexOfUpdatedEvent;
    BOOL isUpdating;
    BOOL DidTapWithReschedule;
    DPCalendarEvent *DidTapEvent;
}

@end
