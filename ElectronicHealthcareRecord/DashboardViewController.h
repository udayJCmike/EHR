//
//  DashboardViewController.h
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 11/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppointmentsViewController.h"
#import "BasicInformationViewController.h"
#import "MessagesViewController.h"
#import "ViewHistoryViewController.h"

@interface DashboardViewController : UIViewController<UIGestureRecognizerDelegate,UIScrollViewDelegate>
@property (nonatomic, weak) IBOutlet UIView *blurView;
@property (nonatomic, weak) IBOutlet UIImageView *Clinic_image;
@property (nonatomic, weak) IBOutlet UIView *bg_view;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIPageControl *pagecontrol;
@property (strong, nonatomic) NSArray *pageImages;
@property (nonatomic, weak) IBOutlet UIView *doctor_details;
@property (nonatomic, weak) IBOutlet UIView *clinic_details;
@property(nonatomic,retain)IBOutlet UIProgressView *pv1;
@property(nonatomic,retain)IBOutlet UIProgressView *pv2;
@property(nonatomic,retain)IBOutlet UIProgressView *pv3;
@property(nonatomic,retain)IBOutlet UIProgressView *pv4;
@property (strong, nonatomic) IBOutlet UIView *help_view;

@property (strong, nonatomic) IBOutlet UIButton *close_button;
@property(nonatomic,retain)IBOutlet UIScrollView*help_scrollview;
@end
