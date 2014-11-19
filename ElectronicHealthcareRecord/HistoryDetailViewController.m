//
//  HistoryDetailViewController.m
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 12/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import "HistoryDetailViewController.h"

@interface HistoryDetailViewController ()

@end

@implementation HistoryDetailViewController
@synthesize detailData;
@synthesize clinic_name;
@synthesize discussed_about;
@synthesize doctor_name;
@synthesize date_of_visit;
@synthesize test_taken;
@synthesize status;
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
   doctor_name.text=[detailData valueForKey:@"doctorname"];
  // discussed_about.text =[detailData valueForKey:@"discussedabout"];
  
  clinic_name.text=[detailData valueForKey:@"clinicname"];
    date_of_visit.text =[detailData valueForKey:@"dateofvisit"];
   test_taken.text=[detailData valueForKey:@"test"];
   
    if ([[detailData valueForKey:@"status"]isEqualToString:@"0"]) {
        [self.status setTitle:@"Send Request" forState:UIControlStateNormal];
            [self.status warningStyle];
    }
    else if ([[detailData valueForKey:@"status"]isEqualToString:@"1"]) {
         [self.status setTitle:@"Download Report" forState:UIControlStateNormal];
           [self.status primaryStyle];
    }
    self.grey_view.layer.cornerRadius=10;
    self.grey_view.layer.masksToBounds=YES;
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
