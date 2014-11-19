//
//  ViewMedicalRecordDetailViewController.h
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 13/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButton+Bootstrap.h"
@interface ViewMedicalRecordDetailViewController : UIViewController<UIScrollViewDelegate>
@property(nonatomic,retain)NSDictionary *detailData;
@property(nonatomic,retain)IBOutlet UILabel *treatment;
@property(nonatomic,retain)IBOutlet UITextView *result;
@property(nonatomic,retain)IBOutlet UILabel *dateoftest;
@property(nonatomic,retain)IBOutlet UILabel *cost;
@property(nonatomic,retain)IBOutlet UITextView *comments;
@property(nonatomic,retain)IBOutlet UIButton *DownloadStatus;
@property (strong, nonatomic) IBOutlet UIView *grey_view;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) NSArray *pageImages;
@property (strong, nonatomic) IBOutlet UIPageControl *pagecontrol;
@end
