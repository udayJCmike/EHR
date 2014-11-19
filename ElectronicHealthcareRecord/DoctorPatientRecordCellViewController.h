//
//  ViewHistoryTableViewCell.h
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 13/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoctorPatientRecordCellViewController : UITableViewCell
@property(nonatomic,retain)IBOutlet UILabel *pat_id;
@property(nonatomic,retain)IBOutlet UILabel *pat_name;
@property(nonatomic,retain)IBOutlet UILabel *email;
@property(nonatomic,retain)IBOutlet UILabel *contact_number;
@property(nonatomic,retain)IBOutlet UILabel *joindate;
@property(nonatomic,retain)IBOutlet UIImageView *status;
@end
