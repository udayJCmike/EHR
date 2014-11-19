//
//  DetailedPatientViewController.m
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 17/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import "Holiday_SettingViewController.h"

@interface Holiday_SettingViewController ()

@end

@implementation Holiday_SettingViewController
@synthesize grey_view;
@synthesize grey_view2;

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
    
    SVSegmentedControl *yellowRC = [[SVSegmentedControl alloc] initWithSectionTitles:[NSArray arrayWithObjects:@"Working Hours", @"Hoildays", nil]];
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
    
    //
    yellowRC.frame = CGRectMake(0, 65, 768, 50);
    // Do any additional setup after loading the view.
    
    self.grey_view.clipsToBounds=YES;
    self.grey_view.layer.cornerRadius=10;
    self.grey_view2.clipsToBounds=YES;
    self.grey_view2.layer.cornerRadius=10;
    
    grey_view.hidden=YES;
    grey_view2.hidden=NO;


    
}
- (void)segmentedControlChangedValue:(SVSegmentedControl*)segmentedControl {
	NSLog(@"segmentedControl %i did select index %i (via UIControl method)", segmentedControl.tag, segmentedControl.selectedSegmentIndex);
    
    if (segmentedControl.selectedSegmentIndex==0) {
        
        grey_view.hidden=YES;
        grey_view2.hidden=NO;
        
    }
    else if(segmentedControl.selectedSegmentIndex==1){
    
        grey_view2.hidden=YES;
        grey_view.hidden=NO;
        
        NSLog(@"index value=1");
    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
