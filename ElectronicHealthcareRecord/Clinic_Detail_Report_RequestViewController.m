//
//  Clinic_Detail_Report_RequestViewController.m
//  ElectronicHealthcareRecord
//
//  Created by deemsys on 11/18/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import "Clinic_Detail_Report_RequestViewController.h"

@interface Clinic_Detail_Report_RequestViewController ()

@end

@implementation Clinic_Detail_Report_RequestViewController



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
    // Do any additional setup after loading the view.
    
    
    
//    [[UINavigationBar appearance] setTintColor: [UIColor colorWithRed:51/255.0 green:214/255.0 blue:133/255.0 alpha:1.0]];
 //   [[UINavigationBar appearance] setBarTintColor: [UIColor colorWithRed:129/255.0 green:200/255.0 blue:244/255.0 alpha:1.0]];
//    UINavigationBar* navigationBar = navigationController.navigationBar;
//    
//    [navigationBar setBarTintColor:[UIColor colorWithRed:0.0f green:0.0f blue:90.0f/255.0f alpha:1]];

    

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
