//
//  DetailedPatientViewController.m
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 17/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import "Clinic_DetailViewController.h"

@interface Clinic_DetailViewController ()

@end

@implementation Clinic_DetailViewController

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
    
    SVSegmentedControl *yellowRC = [[SVSegmentedControl alloc] initWithSectionTitles:[NSArray arrayWithObjects:@"Personal Details", @"Insurance Details", nil]];
    [yellowRC addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    yellowRC.crossFadeLabelsOnDrag = YES;
    yellowRC.font = [UIFont fontWithName:@"Helvetica Neue" size:20];
    yellowRC.titleEdgeInsets = UIEdgeInsetsMake(0, 14, 0, 14);
    yellowRC.height = 50;
    [yellowRC setSelectedSegmentIndex:0 animated:NO];
    yellowRC.thumb.tintColor = [UIColor colorWithRed:51/255.0 green:214/255.0 blue:133/255.0 alpha:1] ;
    yellowRC.thumb.textColor = [UIColor whiteColor];
    yellowRC.thumb.textShadowColor = [UIColor blackColor];
    yellowRC.thumb.textShadowOffset = CGSizeMake(0, 1);
    //
	
    [self.view addSubview:yellowRC];
    
    self.bgview.clipsToBounds=YES;
    self.bgview.layer.cornerRadius=10;
    //
    yellowRC.frame = CGRectMake(0, 65, 768, 50);
    // Do any additional setup after loading the view.
    
    
     [self addNavigationBarButton];
}
- (void)segmentedControlChangedValue:(SVSegmentedControl*)segmentedControl {
	NSLog(@"segmentedControl %i did select index %i (via UIControl method)", segmentedControl.tag, segmentedControl.selectedSegmentIndex);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)addNavigationBarButton{
    UIBarButtonItem *myNavBtn = [[UIBarButtonItem alloc] initWithTitle:
                                 @"Edit Patient" style:UIBarButtonItemStyleBordered target:
                                 self action:@selector(myButtonClicked:)];
    
    //  [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    [self.navigationItem setRightBarButtonItem:myNavBtn];
    
    // create a navigation push button that is initially hidden
    navButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [navButton setFrame:CGRectMake(60, 50, 200, 40)];
    [navButton setTitle:@"Push Navigation" forState:UIControlStateNormal];
    [navButton addTarget:self action:@selector(pushNewView:)
        forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:navButton];
    [navButton setHidden:YES];
}

-(IBAction)myButtonClicked:(id)sender{
   [self performSegueWithIdentifier:@"updatenavigation" sender:self];
    
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
