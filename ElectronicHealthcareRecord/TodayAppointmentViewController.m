//
//  ViewHistoryViewController.m
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 11/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import "DoctorAppointmentsViewController.h"
#import "DoctorViewDetailedAppointmentViewController.h"
#import "DoctorAppointmentTableCellViewController.h"
@interface DoctorAppointmentsViewController ()

@end

@implementation DoctorAppointmentsViewController
@synthesize record_array;
@synthesize appointment_tblView;
@synthesize record_content;
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
    
    record_array=[[NSMutableArray alloc]init];
    record_content=[[NSMutableDictionary alloc]init];
    [record_content setValue:@"Dr.Russell Saari" forKey:@"doctorname"];
    [record_content setValue:@"Pain in spinal guard" forKey:@"discussedabout"];
    [record_content setValue:@"apollo" forKey:@"clinicname"];
    [record_content setValue:@"14/10/2014" forKey:@"dateofvisit"];
    [record_content setValue:@"Xray ,BloodPressure" forKey:@"test"];
    [record_content setValue:@"1" forKey:@"status"];
    [record_array addObject:record_content];
    record_content=[[NSMutableDictionary alloc]init];
    [record_content setValue:@"Dr.Eugene Sabaitis" forKey:@"doctorname"];
    [record_content setValue:@"Pain in spinal guard" forKey:@"discussedabout"];
    [record_content setValue:@"apollo" forKey:@"clinicname"];
    [record_content setValue:@"15/11/2014" forKey:@"dateofvisit"];
    [record_content setValue:@"SugarTest,BoneDensity" forKey:@"test"];
    [record_content setValue:@"0" forKey:@"status"];
    [record_array addObject:record_content];
    record_content=[[NSMutableDictionary alloc]init];
    [record_content setValue:@"Dr.Damaris Sabater" forKey:@"doctorname"];
    [record_content setValue:@"Pain in spinal guard" forKey:@"discussedabout"];
    [record_content setValue:@"apollo" forKey:@"clinicname"];
    [record_content setValue:@"11/11/2014" forKey:@"dateofvisit"];
    [record_content setValue:@"SugarTest,BoneDensity" forKey:@"test"];
    [record_content setValue:@"0" forKey:@"status"];
    [record_array addObject:record_content];
    record_content=[[NSMutableDictionary alloc]init];
    [record_content setValue:@"Dr.Russell Saari" forKey:@"doctorname"];
    [record_content setValue:@"Pain in spinal guard" forKey:@"discussedabout"];
    [record_content setValue:@"apollo" forKey:@"clinicname"];
    [record_content setValue:@"18/10/2014" forKey:@"dateofvisit"];
    [record_content setValue:@"SugarTest,BoneDensity" forKey:@"test"];
    [record_content setValue:@"1" forKey:@"status"];
    [record_array addObject:record_content];
    record_content=[[NSMutableDictionary alloc]init];
    [record_content setValue:@"Dr.Russell Saari" forKey:@"doctorname"];
    [record_content setValue:@"Pain in spinal guard" forKey:@"discussedabout"];
    [record_content setValue:@"apollo" forKey:@"clinicname"];
    [record_content setValue:@"09/10/2014" forKey:@"dateofvisit"];
    [record_content setValue:@"SugarTest,BoneDensity" forKey:@"test"];
    [record_content setValue:@"0" forKey:@"status"];
    [record_array addObject:record_content];
    record_content=[[NSMutableDictionary alloc]init];
    [record_content setValue:@"Dr.Brett Saal" forKey:@"doctorname"];
    [record_content setValue:@"Pain in spinal guard" forKey:@"discussedabout"];
    [record_content setValue:@"apollo" forKey:@"clinicname"];
    [record_content setValue:@"21/10/2014" forKey:@"dateofvisit"];
    [record_content setValue:@"BoneDensity" forKey:@"test"];
    [record_content setValue:@"1" forKey:@"status"];
    [record_array addObject:record_content];
    record_content=[[NSMutableDictionary alloc]init];
    [record_content setValue:@"Dr.Brett Saal" forKey:@"doctorname"];
    [record_content setValue:@"Pain in spinal guard" forKey:@"discussedabout"];
    [record_content setValue:@"apollo" forKey:@"clinicname"];
    [record_content setValue:@"26/09/2014" forKey:@"dateofvisit"];
    [record_content setValue:@"BoneDensity" forKey:@"test"];
    [record_content setValue:@"0" forKey:@"status"];
    record_content=[[NSMutableDictionary alloc]init];
    [record_content setValue:@"Dr.Russell Saari" forKey:@"doctorname"];
    [record_content setValue:@"Pain in spinal guard" forKey:@"discussedabout"];
    [record_content setValue:@"apollo" forKey:@"clinicname"];
    [record_content setValue:@"14/10/2014" forKey:@"dateofvisit"];
    [record_content setValue:@"Xray ,BloodPressure" forKey:@"test"];
    [record_content setValue:@"1" forKey:@"status"];
    [record_array addObject:record_content];
    record_content=[[NSMutableDictionary alloc]init];
    [record_content setValue:@"Dr.Eugene Sabaitis" forKey:@"doctorname"];
    [record_content setValue:@"Pain in spinal guard" forKey:@"discussedabout"];
    [record_content setValue:@"apollo" forKey:@"clinicname"];
    [record_content setValue:@"15/11/2014" forKey:@"dateofvisit"];
    [record_content setValue:@"SugarTest,BoneDensity" forKey:@"test"];
    [record_content setValue:@"0" forKey:@"status"];
    [record_array addObject:record_content];
    //    record_content=[[NSMutableDictionary alloc]init];
    //    [record_content setValue:@"Dr.Damaris Sabater" forKey:@"doctorname"];
    //    [record_content setValue:@"Pain in spinal guard" forKey:@"discussedabout"];
    //    [record_content setValue:@"apollo" forKey:@"clinicname"];
    //    [record_content setValue:@"11/11/2014" forKey:@"dateofvisit"];
    //    [record_content setValue:@"SugarTest,BoneDensity" forKey:@"test"];
    //    [record_content setValue:@"0" forKey:@"status"];
    //    [record_array addObject:record_content];
    //    record_content=[[NSMutableDictionary alloc]init];
    //    [record_content setValue:@"Dr.Russell Saari" forKey:@"doctorname"];
    //    [record_content setValue:@"Pain in spinal guard" forKey:@"discussedabout"];
    //    [record_content setValue:@"apollo" forKey:@"clinicname"];
    //    [record_content setValue:@"18/10/2014" forKey:@"dateofvisit"];
    //    [record_content setValue:@"SugarTest,BoneDensity" forKey:@"test"];
    //    [record_content setValue:@"1" forKey:@"status"];
    //    [record_array addObject:record_content];
    //    [record_array addObject:record_content];
    //    [record_array addObject:record_content];
    
    self.appointment_tblView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];}

- (void)didReceiveMemoryWarning
{
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
    
    return [record_array count];
    
    // Return the number of rows in the section.
    
}
-(NSString *)imageSet:(NSString *)status
{
    if ([status isEqualToString:@"0"]) {
        return  @"OrderNow.png";
    }
    else if ([status isEqualToString:@"1"]) {
        return  @"Download.png";
    }
    return @"OrderNow.png";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    DoctorAppointmentTableCellViewController *cell = (DoctorAppointmentTableCellViewController*)[self.appointment_tblView dequeueReusableCellWithIdentifier:@"appointments" forIndexPath:indexPath];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    NSDictionary *data_for_cell= [record_array objectAtIndex:indexPath.row];
    
    //    if (indexPath.row %2==0)
    //    {
    //        cell.backgroundColor=[UIColor colorWithRed:51.0/255.0f green:214.0/255.0f blue:133.0/255.0f alpha:0.5f];
    //    }
    //    else
    //    {
    //        cell.backgroundColor=[UIColor colorWithRed:193.0/255.0f green:193.0/255.0f blue:193.0/255.0f alpha:0.5f];
    //    }
    cell.pat_id.text=[data_for_cell valueForKey:@"doctorname"];
    cell.time.text =[data_for_cell valueForKey:@"discussedabout"];
    cell.email.text=[data_for_cell valueForKey:@"clinicname"];
    cell.contact_number.text =[data_for_cell valueForKey:@"dateofvisit"];
    cell.date.text=[data_for_cell valueForKey:@"test"];
    // cell.status.image=[UIImage imageNamed:[self imageSet:[data_for_cell valueForKey:@"status"]]];
    
    return cell;
    
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier]isEqualToString:@"detailedappointment"]) {
        NSIndexPath *index=[self.appointment_tblView indexPathForSelectedRow];
        DoctorViewDetailedAppointmentViewController *vc=[segue destinationViewController];
        vc.detailedData=[record_array objectAtIndex:index.row];
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self performSegueWithIdentifier:@"detailedappointment" sender:self];
    
}


@end
