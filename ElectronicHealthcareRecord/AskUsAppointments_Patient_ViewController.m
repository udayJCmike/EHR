//
//  AskUsAppointments_Patient_ViewController.m
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 11/21/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import "AskUsAppointments_Patient_ViewController.h"
#import "AskUsAppointmentTableViewCell.h"
@interface AskUsAppointments_Patient_ViewController ()

@end

@implementation AskUsAppointments_Patient_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.listOfApp=[[NSMutableArray alloc]init];
    NSMutableDictionary * message_content=[[NSMutableDictionary alloc]init];
    [message_content setValue:@"Appointment On 10/10/2014" forKey:@"title"];
    [message_content setValue:@"Some description about the question comes here! Some description about the question comes here! Some description about the question comes here! Some description about the question comes here! Some description about the question comes here?" forKey:@"subject"];
    [message_content setValue:@"15/10/2014" forKey:@"date"];
    [message_content setValue:@"10:15 AM" forKey:@"time"];
    
    [self.listOfApp addObject:message_content];
    message_content=[[NSMutableDictionary alloc]init];
    [message_content setValue:@"Appointment On 20/10/2014" forKey:@"title"];
    [message_content setValue:@"Some description about the question comes here! Some description about the question comes here! Some description about the question comes here! Some description about the question comes here! Some description about the question comes here?" forKey:@"subject"];
    [message_content setValue:@"01/10/2014" forKey:@"date"];
    [message_content setValue:@"09:15 AM" forKey:@"time"];
    
    [self.listOfApp addObject:message_content];
    message_content=[[NSMutableDictionary alloc]init];
    [message_content setValue:@"Appointment On 30/10/2014" forKey:@"title"];
    [message_content setValue:@"Some description about the question comes here! Some description about the question comes here! Some description about the question comes here! Some description about the question comes here! Some description about the question comes here?" forKey:@"subject"];
    [message_content setValue:@"23/10/2014" forKey:@"date"];
    [message_content setValue:@"13:15 AM" forKey:@"time"];
    
    [self.listOfApp addObject:message_content];
     message_content=[[NSMutableDictionary alloc]init];
    [message_content setValue:@"Appointment On 10/11/2014" forKey:@"title"];
    [message_content setValue:@"Some description about the question comes here! Some description about the question comes here! Some description about the question comes here! Some description about the question comes here! Some description about the question comes here?" forKey:@"subject"];
    [message_content setValue:@"26/10/2014" forKey:@"date"];
    [message_content setValue:@"21:15 AM" forKey:@"time"];
    
    [self.listOfApp addObject:message_content];
   message_content=[[NSMutableDictionary alloc]init];
    [message_content setValue:@"Appointment On 20/11/2014" forKey:@"title"];
    [message_content setValue:@"Some description about the question comes here! Some description about the question comes here! Some description about the question comes here! Some description about the question comes here! Some description about the question comes here?" forKey:@"subject"];
    [message_content setValue:@"25/10/2014" forKey:@"date"];
    [message_content setValue:@"18:15 AM" forKey:@"time"];
    
    [self.listOfApp addObject:message_content];
 message_content=[[NSMutableDictionary alloc]init];
    [message_content setValue:@"Appointment On 30/11/2014" forKey:@"title"];
    [message_content setValue:@"Some description about the question comes here! Some description about the question comes here! Some description about the question comes here! Some description about the question comes here! Some description about the question comes here?" forKey:@"subject"];
    [message_content setValue:@"18/11/2014" forKey:@"date"];
    [message_content setValue:@"10:15 AM" forKey:@"time"];
    
    [self.listOfApp addObject:message_content];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self.listOfApp count];
    
    // Return the number of rows in the section.
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    AskUsAppointmentTableViewCell *cell = (AskUsAppointmentTableViewCell*)[self.list_app dequeueReusableCellWithIdentifier:@"AskUsAppointments" forIndexPath:indexPath];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    NSDictionary *data_for_cell= [self.listOfApp objectAtIndex:indexPath.row];
    cell. app_title.text=[data_for_cell valueForKey:@"title"];
    cell.app_des.text=[data_for_cell valueForKey:@"subject"];
    cell.app_date.text=[data_for_cell valueForKey:@"date"];
    cell.app_time.text=[data_for_cell valueForKey:@"time"];

    return cell;
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // [self performSegueWithIdentifier:@"detailpage" sender:self];
    
}


@end
