//
//  DoctorViewDetailedAppointmentViewController.m
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 18/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import "DoctorTodayAppointmentDetailedViewController.h"

@interface DoctorTodayAppointmentDetailedViewController ()

@end

@implementation DoctorTodayAppointmentDetailedViewController
@synthesize detailedData;
@synthesize reshedule;
@synthesize cancel;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.grey_view.clipsToBounds=YES;
    self.grey_view.layer.cornerRadius=10;
    [cancel defaultStyle];
    [reshedule primaryStyle];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
