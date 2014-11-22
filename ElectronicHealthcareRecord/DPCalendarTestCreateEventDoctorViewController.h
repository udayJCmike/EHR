//
//  DPCalendarTestCreateEventDoctorViewController.h
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 11/20/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "DPCalendarEvent.h"
#import "ElectronicHealthcareRecordAppDelegate.h"
#define AppDelegate (ElectronicHealthcareRecordAppDelegate *)[[UIApplication sharedApplication] delegate]
@protocol DPCalendarTestCreateEventDoctorViewControllerDelegate <NSObject>

- (void) eventCreatedFromDoctor:(DPCalendarEvent *)event;

@end

@interface DPCalendarTestCreateEventDoctorViewController: UIViewController<UIAlertViewDelegate>
{
    int status;
}
@property (nonatomic, strong) DPCalendarEvent *event;
@property (nonatomic, weak) id<DPCalendarTestCreateEventDoctorViewControllerDelegate> delegate;
@end


