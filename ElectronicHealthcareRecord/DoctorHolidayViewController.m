//
//  DoctorHolidayViewController.m
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 18/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import "DoctorHolidayViewController.h"

@interface DoctorHolidayViewController ()

@end

@implementation DoctorHolidayViewController
@synthesize workinghours1;
@synthesize workinghours2;
@synthesize holiday1;
@synthesize holiday2;
@synthesize timePicker;
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
    SVSegmentedControl *yellowRC = [[SVSegmentedControl alloc] initWithSectionTitles:[NSArray arrayWithObjects:@"Working Hours", @"Holidays", nil]];
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
    entries = [[NSArray alloc] initWithObjects:@"Sunday", @"Monday", @"Tuesday", @"Wednesday", @"Thursday",@"Friday",@"Saturday", nil];
    selectionDays = [[NSMutableDictionary alloc] init];
    for (NSString *key in entries)
        [selectionDays setObject:[NSNumber numberWithBool:NO] forKey:key];
    
    // Init picker and add it to view
    
    
    
    workinghours2.hidden=NO;
    workinghours1.hidden=NO;
    holiday2.hidden=YES;
    holiday1.hidden=YES;
	yellowRC.frame = CGRectMake(0, 65, 768, 50);
    self.personalinfo.layer.cornerRadius=10;
    self.personalinfo.layer.masksToBounds=YES;
    self.workinghours2.layer.cornerRadius=10;
    self.workinghours2.layer.masksToBounds=YES;
    self.holiday2.layer.cornerRadius=10;
    self.holiday2.layer.masksToBounds=YES;
    self.bgview.layer.cornerRadius=10;
    self.bgview.layer.masksToBounds=YES;
    [self.update primaryStyle];
    [self.reset resetStyle];
    [self.cancel defaultStyle];
       // Do any additional setup after loading the view.
}


- (IBAction)date_changed:(id)sender {
    NSDateFormatter *form=[[NSDateFormatter alloc]init];
   [form setDateFormat:@"HH:mm"];
    UIButton *button = (UIButton *)[self.view viewWithTag:buttontag];
      button.backgroundColor=[UIColor clearColor];
    [button setTitle:[form stringFromDate:timePicker.date] forState:UIControlStateNormal];
    [timePicker setHidden:YES];
}
- (IBAction)showTime:(id)sender {
  
    UIButton *b= (UIButton*)sender ;
    b.backgroundColor=[UIColor grayColor];
    [timePicker setHidden:NO];
    buttontag=[(UIButton*)sender tag];
}



-(IBAction)HolidayList:(id)sender
{
    multiPickerView = [[CYCustomMultiSelectPickerView alloc] initWithFrame:CGRectMake(0,[UIScreen mainScreen].bounds.size.height - 280, 755, 304)];
    multiPickerView.entriesArray = entries;
    multiPickerView.multiPickerDelegate = self;
    [self.view addSubview:multiPickerView];
     [multiPickerView pickerShow];
}
#pragma mark - Delegate
//获取到选中的数据
-(void)returnChoosedPickerString:(NSMutableArray *)selectedEntriesArr
{
    NSLog(@"selectedArray=%@",selectedEntriesArr);
    
 //   NSString *dataStr = [selectedEntriesArr componentsJoinedByString:@"\n"];
    
    
}





- (void)segmentedControlChangedValue:(SVSegmentedControl*)segmentedControl {
	NSLog(@"segmentedControl %i did select index %i (via UIControl method)", segmentedControl.tag, segmentedControl.selectedSegmentIndex);
    
    if(segmentedControl.selectedSegmentIndex==1)
    {
        workinghours2.hidden=YES;
        workinghours1.hidden=YES;
        holiday2.hidden=NO;
        holiday1.hidden=NO;
    }
    else if(segmentedControl.selectedSegmentIndex==0)
    {
        workinghours2.hidden=NO;
        workinghours1.hidden=NO;
        holiday2.hidden=YES;
        holiday1.hidden=YES;
    }
}
-(IBAction)myButtonClicked:(id)sender{
    
    [self performSegueWithIdentifier:@"addpatient" sender:self];
    
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
