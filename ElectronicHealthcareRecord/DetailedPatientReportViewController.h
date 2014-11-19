//
//  DetailedPatientReportViewController.h
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 18/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButton+Bootstrap.h"
@interface DetailedPatientReportViewController : UIViewController<UIScrollViewDelegate>
@property(nonatomic,retain)NSDictionary *detailedData;
@property(nonatomic,retain)IBOutlet UILabel *patname;
@property(nonatomic,retain)IBOutlet UITextView *result;
@property(nonatomic,retain)IBOutlet UILabel *problem;
@property(nonatomic,retain)IBOutlet UILabel *cost;
@property(nonatomic,retain)IBOutlet UITextView *comments;
@property(nonatomic,retain)IBOutlet UIButton *DownloadStatus;
@property (strong, nonatomic) IBOutlet UIView *grey_view;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) NSArray *pageImages;
@property (strong, nonatomic) IBOutlet UIPageControl *pagecontrol;
@end
