//
//  DoctorAppointmentsViewController.h
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 18/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DoctorTodayAppointmentCellViewController.h"
@interface DoctorTodayAppointmentViewController : UIViewController
@property(nonatomic,retain)IBOutlet UITableView *appointment_tblView;
@property(nonatomic,retain)NSMutableArray *record_array;
@property(nonatomic,retain)NSMutableDictionary *record_content;
@end
