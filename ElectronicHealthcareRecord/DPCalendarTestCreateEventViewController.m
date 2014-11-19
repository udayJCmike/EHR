//
//  DPCalendarTestCreateEventViewController.m
//  DPCalendar
//
//  Created by Ethan Fang on 21/01/14.
//  Copyright (c) 2014 Ethan Fang. All rights reserved.
//

#import "DPCalendarTestCreateEventViewController.h"
#import "DPCalendarTestOptionsCell.h"
#import "NSDate+DP.h"

@interface DPCalendarTestCreateEventViewController ()<UITableViewDelegate, UITableViewDataSource, DPCalendarTestOptionsCellDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation DPCalendarTestCreateEventViewController

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
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonSelected)];
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonSelected)];
   
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.tableView.allowsSelection = NO;
    
    [self.view addSubview:self.tableView];
}

- (void) doneButtonSelected{
  
    NSString *title_name= self.navigationController.title;
    if (([title_name isEqualToString:@"Reschedule Appointment"])&&([self.event.startTime compare:self.event.endTime]==NSOrderedDescending)) {
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
      NSLog(@"Event %@", self.event);
   if([self.event.title length]>0)
   {
    [self.delegate eventCreated:self.event];
    [self dismissViewControllerAnimated:YES completion:nil];
   }
    else
    {
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Info" message:@"Give title" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
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

#define CELL_TITLE @"CELL_TITLE"
#define CELL_START_TIME @"CELL_START_TIME"
#define CELL_END_TIME @"CELL_END_TIME"

#pragma mark - UITableViewDelegate

#pragma mark - UITableViewDataSource

#define NEW_EVENT_CELL_IDENTIFIER @"NEW_EVENT_CELL_IDENTIFIER"
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DPCalendarTestOptionsCell *cell = [tableView dequeueReusableCellWithIdentifier:NEW_EVENT_CELL_IDENTIFIER];
    if (!cell) {
        cell = [[DPCalendarTestOptionsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NEW_EVENT_CELL_IDENTIFIER];
        
    }
   
    cell.delegate = self;
    switch (indexPath.row) {
        case 0:
        {
            cell.identifier = CELL_TITLE;
            NSString *title_name= self.navigationController.title;
            if ([title_name isEqualToString:@"Create Appointment"]) {
                cell.isReschedule=FALSE;
            }
            else if ([title_name isEqualToString:@"Reschedule Appointment"]) {
                cell.isReschedule=TRUE;
            }
            [cell setTitle:@"Appointment Name"];
            
            [cell setTextValue:self.event.title];
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
    return 3;
}
#pragma mark -DPCalendarTestOptionsCellDelegate
-(void)cell:(DPCalendarTestOptionsCell *)cell valueChanged:(id)value {
    NSString *identifier = cell.identifier;
    if ([identifier isEqualToString:CELL_TITLE]) {
        self.event.title = value;
    } else if ([identifier isEqualToString:CELL_START_TIME]) {
//    NSLog(@"start time changed %@",value);
        self.event.startTime = value;
        
    }
    else
    {
//        NSLog(@"End time changed %@",value);
        self.event.endTime = value;
    }
}
@end
