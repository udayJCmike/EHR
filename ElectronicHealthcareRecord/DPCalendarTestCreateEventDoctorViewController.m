//
//  DPCalendarTestCreateEventDoctorViewController.m
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 11/20/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import "DPCalendarTestCreateEventDoctorViewController.h"
#import "DPCalendarTestOptionsCellDoctorTableViewCell.h"
#import "NSDate+DP.h"
@interface DPCalendarTestCreateEventDoctorViewController ()<UITableViewDelegate, UITableViewDataSource, DPCalendarTestOptionsCellDoctorTableViewCellDelegate>
{
    ElectronicHealthcareRecordAppDelegate *delegate;
}
@property (nonatomic, strong) UITableView *tableView;

@end


@implementation DPCalendarTestCreateEventDoctorViewController

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
    
    //    self.event = [[DPCalendarEvent alloc] initWithTitle:@"Appointment" startTime:[[NSDate date] dateByAddingYears:0 months:0 days:0] endTime:[[NSDate date] dateByAddingYears:0 months:0 days:1] colorIndex:0];
    delegate=AppDelegate;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonSelected)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonSelected)];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.tableView.allowsSelection = NO;
    
    [self.view addSubview:self.tableView];
}
-(void)Change_EndTime
{
    NSString *stringDate = [NSString stringWithFormat:@"%@",self.event.startTime];
    //        NSLog(@"Reschedule gng to handle date for 4th case %@",stringDate);
    NSArray *mycomp = [stringDate componentsSeparatedByCharactersInSet:
                       [NSCharacterSet characterSetWithCharactersInString:@" "]
                       ];
    stringDate  = [mycomp objectAtIndex:0];
    
    //        NSLog(@"DAte from starttime %@",stringDate);
    
    NSString *stringTime = [NSString stringWithFormat:@"%@",self.event.endTime];
    
    NSArray *mytimecomp = [stringTime componentsSeparatedByCharactersInSet:
                           [NSCharacterSet characterSetWithCharactersInString:@" "]
                           ];
    mytimecomp = [[mytimecomp objectAtIndex:1] componentsSeparatedByCharactersInSet:
                  [NSCharacterSet characterSetWithCharactersInString:@":"]
                  ];
    stringTime =  [NSString stringWithFormat:@"%@:%@",[mytimecomp objectAtIndex:0],[mytimecomp objectAtIndex:1]];
    //         NSLog(@"Time from end time  %@",stringTime);
    NSString *endDate=  [NSString stringWithFormat:@"%@ %@:00 +0000",stringDate,stringTime];
    NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
    [formatter1 setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    NSDate *converted_endDate=  [formatter1 dateFromString:endDate];
    //        NSLog(@"Finally end date for event  %@",converted_endDate);
    self.event.endTime=converted_endDate;
    
}
- (void) doneButtonSelected{
    status=1;
    NSString *title_name= self.navigationController.title;
    if (([title_name isEqualToString:@"Reschedule Appointment"])&&([self.event.startTime compare:self.event.endTime]==NSOrderedDescending))
    {
        [self Change_EndTime];
    }
    if ([title_name isEqualToString:@"Reschedule Appointment"])
    {
        status=1;
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        NSDate  *today=[[NSDate date]dateByAddingYears:0 months:0 days:0];
        NSDate *s_date=[self.event.startTime dateByAddingYears:0 months:0 days:1];
        NSDate *s_date1=[self.event.startTime dateByAddingYears:0 months:0 days:0];
        NSString *selected_string=[formatter stringFromDate:s_date1];
        NSDateFormatter *weekFormatter = [[NSDateFormatter alloc] init] ;
        [weekFormatter setDateFormat:@"EEEE"];
        NSString *weekday= [weekFormatter stringFromDate:s_date1];
        // NSLog(@"Select date %@ and status %hhd",selected_string,[delegate.ListOfHolidays containsObject:selected_string]);
        //     NSLog(@"Select date %@ with  today date %@", s_date, today);
        if (([s_date compare:today]==NSOrderedAscending)||([weekday isEqualToString:@"Sunday"])||([weekday isEqualToString:@"Saturday"]))
        {
            status=0;
            UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Info" message:@"The day you have clicked is Unavailable! Please try to get an Appointment on some other days! Thank You!!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
        }
        else if([delegate.ListOfHolidays containsObject:selected_string])
        {
            status=0;
            UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Info" message:@"The day you have clicked is Unavailable! Please try to get an Appointment on some other days! Thank You!!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
        }
        
        else if ([delegate.ListOfappointment_status valueForKey:[formatter stringFromDate:s_date1]])
        {
            NSString *status_for_date=[delegate.ListOfappointment_status valueForKey:[formatter stringFromDate:s_date1]];
            if ([status_for_date isEqualToString:@"Available"])
            {
                status=1;
            }
            else if ([status_for_date isEqualToString:@"Waiting"])
            {
                status=0;
                UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Info" message:@"Your appointment will be in waiting status.Would you like to proceed?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
                [alert show];
            }
            else if ([status_for_date isEqualToString:@"Full"])
            {
                status=0;
                UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Info" message:@"The day you have clicked is Unavailable! Please try to get an Appointment on some other days! Thank You!!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                [alert show];
            }
        }
        else
        {
            status=1;
            
        }
        
    }
    else
    {
        
        status=1;
    }
    
    if (status==1)
    {
        if([self.event.title length]>0)
        {
            NSLog(@"Event %@", self.event);
            [self.delegate eventCreatedFromDoctor:self.event];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        else
        {
            status=0;
            UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Info" message:@"Enter Patient Name." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==1)
    {
        self.event.title=@"Waiting for app" ;
        status=1;
        if([self.event.title length]>0)
        {
            // NSLog(@"Event %@", self.event);
            [self.delegate eventCreatedFromDoctor:self.event];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        else
        {
            status=0;
            UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Info" message:@"Enter Patient Name" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
    else if (buttonIndex==0)
    {
        status=0;
        NSLog(@"Cancelled");
    }
}
- (void) cancelButtonSelected{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#define CELL_NAME @"CELL_NAME"
#define CELL_TITLE @"CELL_TITLE"
#define CELL_START_TIME @"CELL_START_TIME"
#define CELL_END_TIME @"CELL_END_TIME"

#pragma mark - UITableViewDelegate

#pragma mark - UITableViewDataSource

#define NEW_EVENT_CELL_IDENTIFIER @"NEW_EVENT_CELL_IDENTIFIER"
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==3) {
        return 150;
    }
    else
    {
        return 50;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DPCalendarTestOptionsCellDoctorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NEW_EVENT_CELL_IDENTIFIER];
    if (!cell) {
        cell = [[DPCalendarTestOptionsCellDoctorTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NEW_EVENT_CELL_IDENTIFIER];
        
    }
    
    cell.delegate = self;
    switch (indexPath.row) {
        case 0:
        {
            cell.identifier = CELL_NAME;
            NSString *title_name= self.navigationController.title;
            if ([title_name isEqualToString:@"Create Appointment"]) {
                cell.isReschedule=FALSE;
            }
            else if ([title_name isEqualToString:@"Reschedule Appointment"]) {
                cell.isReschedule=TRUE;
            }
            [cell setTitle:@"Patient Name"];
            
            [cell setTextFieldValue:self.event.title];
        }
            break;
        
        case 1:
        {
            cell.identifier = CELL_START_TIME;
            NSString *title_name= self.navigationController.title;
            if ([title_name isEqualToString:@"Create Appointment"]) {
                cell.isReschedule=FALSE;
            }
            else if ([title_name isEqualToString:@"Reschedule Appointment"]) {
                cell.isReschedule=TRUE;
            }
            [cell setTitle:@"Appointment Date"];
            [cell setDate:self.event.startTime];
            
        }
            break;
        case 2:
        {
            cell.identifier = CELL_END_TIME;
            NSString *title_name= self.navigationController.title;
            if ([title_name isEqualToString:@"Create Appointment"]) {
                cell.isReschedule=FALSE;
            }
            else if ([title_name isEqualToString:@"Reschedule Appointment"]) {
                cell.isReschedule=TRUE;
            }
            [cell setTitle:@"Appointment Time"];
            [cell setDate:self.event.endTime];
        }
            break;
        case 3:
        {
            cell.identifier = CELL_TITLE;
            NSString *title_name= self.navigationController.title;
            if ([title_name isEqualToString:@"Create Appointment"]) {
                cell.isReschedule=FALSE;
            }
            else if ([title_name isEqualToString:@"Reschedule Appointment"]) {
                cell.isReschedule=TRUE;
            }
            [cell setTitle:@"Notes"];
            
            [cell setTextValue:self.event.des];
        }
            break;
        default:
            break;
    }
    NSString *title_name= self.navigationController.title;
    if ([title_name isEqualToString:@"Create Appointment"]) {
        cell.isReschedule=FALSE;
    }
    else if ([title_name isEqualToString:@"Reschedule Appointment"]) {
        cell.isReschedule=TRUE;
    }
    cell.event=self.event;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}
#pragma mark -DPCalendarTestOptionsCellDoctorDelegate
-(void)cell:(DPCalendarTestOptionsCellDoctorTableViewCell *)cell valueChanged:(id)value {
    NSString *identifier = cell.identifier;
    if ([identifier isEqualToString:CELL_TITLE]) {
        self.event.des = value;
    }
    else if ([identifier isEqualToString:CELL_START_TIME]) {
        //    NSLog(@"start time changed %@",value);
        self.event.startTime = value;
        
    }
    else if ([identifier isEqualToString:CELL_NAME]) {
        
        self.event.title = value;
        
    }
    
    else
    {
        //        NSLog(@"End time changed %@",value);
        self.event.endTime = value;
    }
}
@end
