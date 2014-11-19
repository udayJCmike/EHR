//
//  BasicInformationViewController.m
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 11/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import "AddPatientViewController.h"

@interface AddPatientViewController ()

@end

@implementation AddPatientViewController

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
	
	yellowRC.frame = CGRectMake(0, 65, 768, 50);
    self.personalinfo.layer.cornerRadius=10;
    self.personalinfo.layer.masksToBounds=YES;
    self.view1.layer.cornerRadius=10;
    self.view1.layer.masksToBounds=YES;
    [self.update primaryStyle];
    [self.cancel defaultStyle];
}


#pragma mark - UIControlEventValueChanged

- (void)segmentedControlChangedValue:(SVSegmentedControl*)segmentedControl {
	NSLog(@"segmentedControl %i did select index %i (via UIControl method)", segmentedControl.tag, segmentedControl.selectedSegmentIndex);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)cancel:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
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
