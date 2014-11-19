//
//  ViewMedicalRecordsViewController.h
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 13/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewMedicalRecordsTableViewCell.h"
#import "ViewMedicalRecordDetailViewController.h"
@interface ViewMedicalRecordsViewController : UIViewController
@property(nonatomic,retain)IBOutlet UITableView *history_tbview;
@property(nonatomic,retain)NSMutableArray *history_array;
@property(nonatomic,retain)NSMutableDictionary *history_content;
@end
