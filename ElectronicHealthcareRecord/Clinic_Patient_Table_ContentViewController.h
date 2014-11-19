//
//  Patientdetailcell.h
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 17/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Clinic_Patient_Table_ContentViewController : UITableViewCell
@property(nonatomic,retain)IBOutlet UILabel *patientname;
@property(nonatomic,retain)IBOutlet UILabel *email;
@property(nonatomic,retain)IBOutlet UILabel *address;
@property(nonatomic,retain)IBOutlet UILabel *number;
@property(nonatomic,retain)IBOutlet UILabel *designation;
@property(nonatomic,retain)IBOutlet UIImageView *status;

@end
