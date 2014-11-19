//
//  HistoryDetailViewController.h
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 12/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButton+Bootstrap.h"
@interface HistoryDetailViewController : UIViewController
@property(nonatomic,retain)NSDictionary *detailData;
@property(nonatomic,retain)IBOutlet UILabel *clinic_name;
@property(nonatomic,retain)IBOutlet UITextView *discussed_about;
@property(nonatomic,retain)IBOutlet UILabel *doctor_name;
@property(nonatomic,retain)IBOutlet UILabel *date_of_visit;
@property(nonatomic,retain)IBOutlet UILabel *test_taken;
@property(nonatomic,retain)IBOutlet UIButton *status;
@property (strong, nonatomic) IBOutlet UIView *grey_view;
@end
