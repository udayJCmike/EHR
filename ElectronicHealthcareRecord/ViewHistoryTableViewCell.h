//
//  ViewHistoryTableViewCell.h
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 13/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewHistoryTableViewCell : UITableViewCell
@property(nonatomic,retain)IBOutlet UILabel *clinic_name;
@property(nonatomic,retain)IBOutlet UILabel *discussed_about;
@property(nonatomic,retain)IBOutlet UILabel *doctor_name;
@property(nonatomic,retain)IBOutlet UILabel *date_of_visit;
@property(nonatomic,retain)IBOutlet UILabel *test_taken;
@property(nonatomic,retain)IBOutlet UIImageView *status;
@end
