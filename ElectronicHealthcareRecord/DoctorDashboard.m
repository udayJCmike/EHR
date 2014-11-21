//
//  DashboardViewController.m
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 11/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import "DoctorDashboard.h"

@interface DoctorDashboard ()

@end

@implementation DoctorDashboard

@synthesize blurView;
@synthesize Clinic_image;
@synthesize bg_view;
@synthesize scrollView;
@synthesize previousmonth;
@synthesize thismonth;
@synthesize help_view;
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
    
    
    [scrollView addSubview:thismonth];
    [scrollView addSubview:previousmonth];
    
    
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * [_pageImages count], 220);
    [self.pv1 setTransform:CGAffineTransformMakeScale(1.0, 2.0)];
    [self.pv2 setTransform:CGAffineTransformMakeScale(1.0, 2.0)];
    [self.pv3 setTransform:CGAffineTransformMakeScale(1.0, 2.0)];
    [self.pv4 setTransform:CGAffineTransformMakeScale(1.0, 2.0)];
    [self.p2v1 setTransform:CGAffineTransformMakeScale(1.0, 2.0)];
    [self.p2v2 setTransform:CGAffineTransformMakeScale(1.0, 2.0)];
    [self.p2v3 setTransform:CGAffineTransformMakeScale(1.0, 2.0)];
    [self.p2v4 setTransform:CGAffineTransformMakeScale(1.0, 2.0)];
    UIButton *helpButton = [[UIButton alloc] initWithFrame:CGRectMake(15,5, 85,43)];
    [helpButton setBackgroundImage:[UIImage imageNamed:@"help.png"] forState:UIControlStateNormal];
    [helpButton addTarget:self action:@selector(HelpViewShow)
         forControlEvents:UIControlEventTouchUpInside];
    [helpButton setShowsTouchWhenHighlighted:YES];
    
    UIBarButtonItem *mailbutton =[[UIBarButtonItem alloc] initWithCustomView:helpButton];
    self.navigationItem.leftBarButtonItem =mailbutton;
    self.help_view.clipsToBounds=YES;
    self.help_view.layer.cornerRadius=10;
    self.help_scrollview.contentSize = CGSizeMake(self.help_scrollview.frame.size.width, 800);
    
}

-(void)HelpViewShow
{
    CGRect f=help_view.frame;
    f.origin.x=1000;
    f.origin.y=284;
    help_view.frame=f;
    CGRect frame = help_view.frame;
    
    frame.origin.x=154;
    frame.origin.y=281;
    
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:0.7];
    
    help_view.frame=frame;
    
    [UIView commitAnimations];
}
- (IBAction)closebtn:(id)sender {
    
    
    CGRect frame = help_view.frame;
    
    frame.origin.x=154;
    frame.origin.y=1050;
    
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:0.5];
    
    help_view.frame=frame;
    
    [UIView commitAnimations];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)viewappointments:(id)sender
{
    UIStoryboard *welcome=[UIStoryboard storyboardWithName:@"DoctorAppointments" bundle:nil];
    UIViewController *initialvc=[welcome instantiateInitialViewController];
    [self.navigationController pushViewController:initialvc animated:YES];
}
-(IBAction)holidaysettings:(id)sender
{
    UIStoryboard *welcome=[UIStoryboard storyboardWithName:@"DoctorHoliday" bundle:nil];
    UIViewController *initialvc=[welcome instantiateInitialViewController];
    [self.navigationController pushViewController:initialvc animated:YES];
}
-(IBAction)addappointments:(id)sender
{
    UIStoryboard *welcome=[UIStoryboard storyboardWithName:@"ViewPatientDetails" bundle:nil];
    UIViewController *initialvc=[welcome instantiateInitialViewController];
    [self.navigationController pushViewController:initialvc animated:YES];
}
-(IBAction)appointments:(id)sender
{
    UIStoryboard *welcome=[UIStoryboard storyboardWithName:@"DoctorTodayAppointment" bundle:nil];
    UIViewController *initialvc=[welcome instantiateInitialViewController];
    [self.navigationController pushViewController:initialvc animated:YES];
}
-(IBAction)basicinfo:(id)sender
{
    UIStoryboard *welcome=[UIStoryboard storyboardWithName:@"DoctorProfileInfo" bundle:nil];
    UIViewController *initialvc=[welcome instantiateInitialViewController];
    [self.navigationController pushViewController:initialvc animated:YES];
}
-(IBAction)viewpatient:(id)sender
{
    UIStoryboard *welcome=[UIStoryboard storyboardWithName:@"ViewPatientDetails" bundle:nil];
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
    UIStoryboard *welcome=[UIStoryboard storyboardWithName:@"DoctorPatientRecord" bundle:nil];
    UIViewController *initialvc=[welcome instantiateInitialViewController];
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
