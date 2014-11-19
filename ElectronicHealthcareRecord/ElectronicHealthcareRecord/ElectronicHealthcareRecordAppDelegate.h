//
//  ElectronicHealthcareRecordAppDelegate.h
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 11/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "DPCalendarEvent.h"
@interface ElectronicHealthcareRecordAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic)DPCalendarEvent * event;
@property (strong, nonatomic)NSMutableArray *ListOfAppointments;
@property (strong, nonatomic)NSMutableDictionary *ListOfappointment_status;
@property (strong, nonatomic)NSMutableArray *ListOfHolidays;
@end
