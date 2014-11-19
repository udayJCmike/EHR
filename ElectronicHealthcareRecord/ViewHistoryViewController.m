//
//  ViewHistoryViewController.m
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 11/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import "ViewHistoryViewController.h"
#import "HistoryDetailViewController.h"
@interface ViewHistoryViewController ()

@end

@implementation ViewHistoryViewController
@synthesize history_array;
@synthesize history_tbview;
@synthesize history_content;
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
    history_array=[[NSMutableArray alloc]init];
    history_content=[[NSMutableDictionary alloc]init];
    [history_content setValue:@"Dr.Russell Saari" forKey:@"doctorname"];
    [history_content setValue:@"Pain in spinal guard" forKey:@"discussedabout"];
    [history_content setValue:@"apollo" forKey:@"clinicname"];
    [history_content setValue:@"14/10/2014" forKey:@"dateofvisit"];
    [history_content setValue:@"Xray ,BloodPressure" forKey:@"test"];
    [history_content setValue:@"1" forKey:@"status"];
    [history_array addObject:history_content];
    history_content=[[NSMutableDictionary alloc]init];
    [history_content setValue:@"Dr.Eugene Sabaitis" forKey:@"doctorname"];
    [history_content setValue:@"Pain in spinal guard" forKey:@"discussedabout"];
    [history_content setValue:@"apollo" forKey:@"clinicname"];
    [history_content setValue:@"15/11/2014" forKey:@"dateofvisit"];
    [history_content setValue:@"SugarTest,BoneDensity" forKey:@"test"];
    [history_content setValue:@"0" forKey:@"status"];
    [history_array addObject:history_content];
    history_content=[[NSMutableDictionary alloc]init];
    [history_content setValue:@"Dr.Damaris Sabater" forKey:@"doctorname"];
    [history_content setValue:@"Pain in spinal guard" forKey:@"discussedabout"];
    [history_content setValue:@"apollo" forKey:@"clinicname"];
    [history_content setValue:@"11/11/2014" forKey:@"dateofvisit"];
    [history_content setValue:@"SugarTest,BoneDensity" forKey:@"test"];
    [history_content setValue:@"0" forKey:@"status"];
    [history_array addObject:history_content];
    history_content=[[NSMutableDictionary alloc]init];
    [history_content setValue:@"Dr.Russell Saari" forKey:@"doctorname"];
    [history_content setValue:@"Pain in spinal guard" forKey:@"discussedabout"];
    [history_content setValue:@"apollo" forKey:@"clinicname"];
    [history_content setValue:@"18/10/2014" forKey:@"dateofvisit"];
    [history_content setValue:@"SugarTest,BoneDensity" forKey:@"test"];
    [history_content setValue:@"1" forKey:@"status"];
    [history_array addObject:history_content];
    history_content=[[NSMutableDictionary alloc]init];
    [history_content setValue:@"Dr.Russell Saari" forKey:@"doctorname"];
    [history_content setValue:@"Pain in spinal guard" forKey:@"discussedabout"];
    [history_content setValue:@"apollo" forKey:@"clinicname"];
    [history_content setValue:@"09/10/2014" forKey:@"dateofvisit"];
    [history_content setValue:@"SugarTest,BoneDensity" forKey:@"test"];
    [history_content setValue:@"0" forKey:@"status"];
    [history_array addObject:history_content];
    history_content=[[NSMutableDictionary alloc]init];
    [history_content setValue:@"Dr.Brett Saal" forKey:@"doctorname"];
    [history_content setValue:@"Pain in spinal guard" forKey:@"discussedabout"];
    [history_content setValue:@"apollo" forKey:@"clinicname"];
    [history_content setValue:@"21/10/2014" forKey:@"dateofvisit"];
    [history_content setValue:@"BoneDensity" forKey:@"test"];
    [history_content setValue:@"1" forKey:@"status"];
    [history_array addObject:history_content];
    history_content=[[NSMutableDictionary alloc]init];
    [history_content setValue:@"Dr.Brett Saal" forKey:@"doctorname"];
    [history_content setValue:@"Pain in spinal guard" forKey:@"discussedabout"];
    [history_content setValue:@"apollo" forKey:@"clinicname"];
    [history_content setValue:@"26/09/2014" forKey:@"dateofvisit"];
    [history_content setValue:@"BoneDensity" forKey:@"test"];
    [history_content setValue:@"0" forKey:@"status"];
    history_content=[[NSMutableDictionary alloc]init];
    [history_content setValue:@"Dr.Russell Saari" forKey:@"doctorname"];
    [history_content setValue:@"Pain in spinal guard" forKey:@"discussedabout"];
    [history_content setValue:@"apollo" forKey:@"clinicname"];
    [history_content setValue:@"14/10/2014" forKey:@"dateofvisit"];
    [history_content setValue:@"Xray ,BloodPressure" forKey:@"test"];
    [history_content setValue:@"1" forKey:@"status"];
    [history_array addObject:history_content];
    history_content=[[NSMutableDictionary alloc]init];
    [history_content setValue:@"Dr.Eugene Sabaitis" forKey:@"doctorname"];
    [history_content setValue:@"Pain in spinal guard" forKey:@"discussedabout"];
    [history_content setValue:@"apollo" forKey:@"clinicname"];
    [history_content setValue:@"15/11/2014" forKey:@"dateofvisit"];
    [history_content setValue:@"SugarTest,BoneDensity" forKey:@"test"];
    [history_content setValue:@"0" forKey:@"status"];
    [history_array addObject:history_content];
//    history_content=[[NSMutableDictionary alloc]init];
//    [history_content setValue:@"Dr.Damaris Sabater" forKey:@"doctorname"];
//    [history_content setValue:@"Pain in spinal guard" forKey:@"discussedabout"];
//    [history_content setValue:@"apollo" forKey:@"clinicname"];
//    [history_content setValue:@"11/11/2014" forKey:@"dateofvisit"];
//    [history_content setValue:@"SugarTest,BoneDensity" forKey:@"test"];
//    [history_content setValue:@"0" forKey:@"status"];
//    [history_array addObject:history_content];
//    history_content=[[NSMutableDictionary alloc]init];
//    [history_content setValue:@"Dr.Russell Saari" forKey:@"doctorname"];
//    [history_content setValue:@"Pain in spinal guard" forKey:@"discussedabout"];
//    [history_content setValue:@"apollo" forKey:@"clinicname"];
//    [history_content setValue:@"18/10/2014" forKey:@"dateofvisit"];
//    [history_content setValue:@"SugarTest,BoneDensity" forKey:@"test"];
//    [history_content setValue:@"1" forKey:@"status"];
//    [history_array addObject:history_content];
//    [history_array addObject:history_content];
//    [history_array addObject:history_content];
    
    self.history_tbview.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];}

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
    
    return [history_array count];
    
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
    
    
    ViewHistoryTableViewCell *cell = (ViewHistoryTableViewCell*)[self.history_tbview dequeueReusableCellWithIdentifier:@"historylist" forIndexPath:indexPath];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
   NSDictionary *data_for_cell= [history_array objectAtIndex:indexPath.row];
    
//    if (indexPath.row %2==0)
//    {
//        cell.backgroundColor=[UIColor colorWithRed:51.0/255.0f green:214.0/255.0f blue:133.0/255.0f alpha:0.5f];
//    }
//    else
//    {
//        cell.backgroundColor=[UIColor colorWithRed:193.0/255.0f green:193.0/255.0f blue:193.0/255.0f alpha:0.5f];
//    }
    cell.doctor_name.text=[data_for_cell valueForKey:@"doctorname"];
    cell.discussed_about.text =[data_for_cell valueForKey:@"discussedabout"];
     cell.clinic_name.text=[data_for_cell valueForKey:@"clinicname"];
    cell.date_of_visit.text =[data_for_cell valueForKey:@"dateofvisit"];
     cell.test_taken.text=[data_for_cell valueForKey:@"test"];
     cell.status.image=[UIImage imageNamed:[self imageSet:[data_for_cell valueForKey:@"status"]]];
    
    return cell;
    
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier]isEqualToString:@"historydetail"]) {
        NSIndexPath *index=[self.history_tbview indexPathForSelectedRow];
        HistoryDetailViewController *vc=[segue destinationViewController];
        vc.detailData=[history_array objectAtIndex:index.row];
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self performSegueWithIdentifier:@"historydetail" sender:self];
    
}


@end
