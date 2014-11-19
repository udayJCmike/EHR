//
//  ViewHistoryViewController.h
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 11/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DoctorPatientRecordCellViewController.h"
@interface DoctorPatientRecordsViewController : UIViewController
@property(nonatomic,retain)IBOutlet UITableView *record_tblView;
@property(nonatomic,retain)NSMutableArray *record_array;
@property(nonatomic,retain)NSMutableDictionary *record_content;
@end
