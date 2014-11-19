//
//  DashboardViewController.m
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 11/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import "DashboardViewController.h"
#import "DPCalendarTestViewController.h"

@interface DashboardViewController ()

@end

@implementation DashboardViewController

@synthesize blurView;
@synthesize Clinic_image;
@synthesize bg_view;
@synthesize scrollView;
@synthesize doctor_details;
@synthesize clinic_details;
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
   [self.navigationItem setHidesBackButton:YES animated:YES];
 self.scrollView.delegate=self;
 _pageImages=@[@"clinic_details", @"doctor_details"];
//    [ self. blurView setBackgroundColor:[[UIColor clearColor] colorWithAlphaComponent:0.2]];
    blurView.layer.cornerRadius=10;
    blurView.layer.masksToBounds=YES;
    Clinic_image.layer.cornerRadius=100;
    Clinic_image.layer.masksToBounds=YES;
    bg_view.layer.cornerRadius=10;
    bg_view.layer.masksToBounds=YES;
//    bg_view.layer.borderWidth=3;
//    bg_view.layer.borderColor=[[UIColor blackColor]CGColor];
    UIPageControl *pageControl = [UIPageControl appearance];
    pageControl.pageIndicatorTintColor = [UIColor grayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:0/255.0 green:166/255.0 blue:108/255.0 alpha:1] ;
    pageControl.backgroundColor=[UIColor clearColor];

   
    [scrollView addSubview:clinic_details];
    [scrollView addSubview:doctor_details];
   
   
scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * [_pageImages count], 220);
    [self.pv1 setTransform:CGAffineTransformMakeScale(1.0, 2.0)];
     [self.pv2 setTransform:CGAffineTransformMakeScale(1.0, 2.0)];
     [self.pv3 setTransform:CGAffineTransformMakeScale(1.0, 2.0)];
     [self.pv4 setTransform:CGAffineTransformMakeScale(1.0, 2.0)];
    

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)appointments:(id)sender
{
//    UIStoryboard *welcome=[UIStoryboard storyboardWithName:@"Appointments" bundle:nil];
//    UIViewController *initialvc=[welcome instantiateInitialViewController];
//    [self.navigationController pushViewController:initialvc animated:YES];
    DPCalendarTestViewController *testViewController = [DPCalendarTestViewController new];
    
    [self presentViewController:testViewController animated:YES completion:nil];
}
-(IBAction)basicinfo:(id)sender
{
    UIStoryboard *welcome=[UIStoryboard storyboardWithName:@"BasicInformation" bundle:nil];
    UIViewController *initialvc=[welcome instantiateInitialViewController];
    [self.navigationController pushViewController:initialvc animated:YES];
}
-(IBAction)viewhistory:(id)sender
{
    UIStoryboard *welcome=[UIStoryboard storyboardWithName:@"ViewHistory" bundle:nil];
    UIViewController *initialvc=[welcome instantiateInitialViewController];
    [self.navigationController pushViewController:initialvc animated:YES];
}
-(IBAction)messages:(id)sender
{
    UIStoryboard *welcome=[UIStoryboard storyboardWithName:@"Messages" bundle:nil];
    UIViewController *initialvc=[welcome instantiateInitialViewController];
    [self.navigationController pushViewController:initialvc animated:YES];
}
-(IBAction)MedicalRecords:(id)sender
{
    UIStoryboard *welcome=[UIStoryboard storyboardWithName:@"ViewHistory" bundle:nil];
    UIViewController *initialvc=[welcome instantiateViewControllerWithIdentifier:@"MedicalRecords"];
    [self.navigationController pushViewController:initialvc animated:YES];
}
-(IBAction)logout:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)scrollViewDidScroll:(UIScrollView *)_scrollView{
    
   // NSLog(@"scroll");
    // Update the page when more than 50% of the previous/next page is visible
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pagecontrol.currentPage = page;
}


// Create Action for pageControl for changing views.

- (IBAction)pageChanged:(id)sender {
    
    int page = (int)self.pagecontrol.currentPage;
    CGRect frame = self.scrollView.frame;
    frame.origin.x = frame.size.width * page;
    
    [self.scrollView scrollRectToVisible:frame animated:YES];
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
