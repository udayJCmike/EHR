//
//  DetailedPatientViewController.m
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 17/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import "DetailedPatientViewController.h"
#import "DPCalendarTestDoctorViewController.h"
@interface DetailedPatientViewController ()

@end

@implementation DetailedPatientViewController

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
    self.bgview.clipsToBounds=YES;
    self.bgview.layer.cornerRadius=10;
    SVSegmentedControl *yellowRC = [[SVSegmentedControl alloc] initWithSectionTitles:[NSArray arrayWithObjects:@"Personal Details", @"Insurance Details", nil]];
    [yellowRC addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
	yellowRC.crossFadeLabelsOnDrag = YES;
	yellowRC.font = [UIFont fontWithName:@"Helvetica Neue" size:20];
	yellowRC.titleEdgeInsets = UIEdgeInsetsMake(0, 14, 0, 14);
	yellowRC.height = 50;
    [yellowRC setSelectedSegmentIndex:0 animated:NO];
    yellowRC.thumb.tintColor =  [UIColor colorWithRed:0.2 green:0.839 blue:0.522 alpha:1];
	yellowRC.thumb.textColor = [UIColor whiteColor];
	yellowRC.thumb.textShadowColor = [UIColor blackColor];
	yellowRC.thumb.textShadowOffset = CGSizeMake(0, 1);
	
	[self.view addSubview:yellowRC];
	 [self addNavigationBarButton];
	yellowRC.frame = CGRectMake(0, 65, 768, 50);
}
-(void)addNavigationBarButton{
    UIBarButtonItem *myNavBtn = [[UIBarButtonItem alloc] initWithTitle:
                                 @"Edit Patient" style:UIBarButtonItemStyleBordered target:
                                 self action:@selector(myButtonClicked:)];
    
    //  [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    [self.navigationItem setRightBarButtonItem:myNavBtn];
    
    
    UIBarButtonItem *fixedItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedItem.width = 30.;
    [self.navigationItem setRightBarButtonItems:@[self.make_appointment, fixedItem, myNavBtn]];
}
- (IBAction)Make_appointment:(id)sender {
    DPCalendarTestDoctorViewController *testViewController = [DPCalendarTestDoctorViewController new];
    
    [self presentViewController:testViewController animated:YES completion:nil];
}

- (void)segmentedControlChangedValue:(SVSegmentedControl*)segmentedControl {
	NSLog(@"segmentedControl %i did select index %i (via UIControl method)", segmentedControl.tag, segmentedControl.selectedSegmentIndex);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)myButtonClicked:(id)sender{
    
   // [self performSegueWithIdentifier:@"editpatient" sender:self];
   
    UIViewController *vc= [self.storyboard instantiateViewControllerWithIdentifier:@"AddPatient"];
    [self.navigationController pushViewController:vc animated:YES];
    
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
