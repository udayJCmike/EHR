//
//  ViewMedicalRecordsTableViewCell.h
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 13/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewMedicalRecordsTableViewCell : UITableViewCell
@property(nonatomic,retain)IBOutlet UILabel *treatment;
@property(nonatomic,retain)IBOutlet UILabel *result;
@property(nonatomic,retain)IBOutlet UILabel *dateoftest;
@property(nonatomic,retain)IBOutlet UILabel *cost;
@property(nonatomic,retain)IBOutlet UILabel *comments;
@property(nonatomic,retain)IBOutlet UIImageView *DownloadStatus;

@end
