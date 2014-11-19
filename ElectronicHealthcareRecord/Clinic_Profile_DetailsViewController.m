//
//  Clinic_Profile_DetailsViewController.m
//  ElectronicHealthcareRecord
//
//  Created by deemsys on 11/17/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import "Clinic_Profile_DetailsViewController.h"

@interface Clinic_Profile_DetailsViewController ()

@end

@implementation Clinic_Profile_DetailsViewController
@synthesize img_view;

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
    // Do any additional setup after loading the view.
    img_view.layer.cornerRadius=100;
    img_view.layer.masksToBounds=YES;
    
    self.grey_view.clipsToBounds=YES;
    self.grey_view.layer.cornerRadius=10;
    
    self.heading_view.clipsToBounds=YES;
    self.heading_view.layer.cornerRadius=30;
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
