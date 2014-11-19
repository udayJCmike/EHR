//
//  Patientdetailcell.h
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 17/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Clinic_Appointments_Table_CellViewController : UITableViewCell
@property(nonatomic,retain)IBOutlet UILabel *patientid;
@property(nonatomic,retain)IBOutlet UILabel *email;
@property(nonatomic,retain)IBOutlet UILabel *number;
@property(nonatomic,retain)IBOutlet UILabel *date;
@property(nonatomic,retain)IBOutlet UILabel *time;


@end
