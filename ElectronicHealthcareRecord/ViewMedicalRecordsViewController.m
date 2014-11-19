//
//  ViewMedicalRecordsViewController.m
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 13/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import "ViewMedicalRecordsViewController.h"

@interface ViewMedicalRecordsViewController ()

@end

@implementation ViewMedicalRecordsViewController
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
   
    [history_content setValue:@"X-Ray" forKey:@"treatment"];
    [history_content setValue:@"Heavy injury in spinal guard" forKey:@"result"];
    [history_content setValue:@"14/10/2014" forKey:@"dateoftest"];
    [history_content setValue:@"$10" forKey:@"cost"];
    [history_content setValue:@"Need to take treatments for that" forKey:@"comments"];
    [history_content setValue:@"1" forKey:@"status"];
    [history_array addObject:history_content];
    history_content=[[NSMutableDictionary alloc]init];
    [history_content setValue:@"X-Ray" forKey:@"treatment"];
    [history_content setValue:@"Heavy injury in spinal guard" forKey:@"result"];
    [history_content setValue:@"14/10/2014" forKey:@"dateoftest"];
    [history_content setValue:@"$10" forKey:@"cost"];
    [history_content setValue:@"Need to take treatments for that" forKey:@"comments"];
    [history_content setValue:@"1" forKey:@"status"];
    [history_array addObject:history_content];
    history_content=[[NSMutableDictionary alloc]init];
    [history_content setValue:@"X-Ray" forKey:@"treatment"];
    [history_content setValue:@"Heavy injury in spinal guard" forKey:@"result"];
    [history_content setValue:@"14/10/2014" forKey:@"dateoftest"];
    [history_content setValue:@"$10" forKey:@"cost"];
    [history_content setValue:@"Need to take treatments for that" forKey:@"comments"];
    [history_content setValue:@"1" forKey:@"status"];
    [history_array addObject:history_content];
    history_content=[[NSMutableDictionary alloc]init];
    [history_content setValue:@"X-Ray" forKey:@"treatment"];
    [history_content setValue:@"Heavy injury in spinal guard" forKey:@"result"];
    [history_content setValue:@"14/10/2014" forKey:@"dateoftest"];
    [history_content setValue:@"$10" forKey:@"cost"];
    [history_content setValue:@"Need to take treatments for that" forKey:@"comments"];
    [history_content setValue:@"1" forKey:@"status"];
    [history_array addObject:history_content];
    history_content=[[NSMutableDictionary alloc]init];
    [history_content setValue:@"X-Ray" forKey:@"treatment"];
    [history_content setValue:@"Heavy injury in spinal guard" forKey:@"result"];
    [history_content setValue:@"14/10/2014" forKey:@"dateoftest"];
    [history_content setValue:@"$10" forKey:@"cost"];
    [history_content setValue:@"Need to take treatments for that" forKey:@"comments"];
    [history_content setValue:@"1" forKey:@"status"];
    [history_array addObject:history_content];
    history_content=[[NSMutableDictionary alloc]init];
    [history_content setValue:@"X-Ray" forKey:@"treatment"];
    [history_content setValue:@"Heavy injury in spinal guard" forKey:@"result"];
    [history_content setValue:@"14/10/2014" forKey:@"dateoftest"];
    [history_content setValue:@"$10" forKey:@"cost"];
    [history_content setValue:@"Need to take treatments for that" forKey:@"comments"];
    [history_content setValue:@"1" forKey:@"status"];
    [history_array addObject:history_content];
    history_content=[[NSMutableDictionary alloc]init];
    [history_content setValue:@"X-Ray" forKey:@"treatment"];
    [history_content setValue:@"Heavy injury in spinal guard" forKey:@"result"];
    [history_content setValue:@"14/10/2014" forKey:@"dateoftest"];
    [history_content setValue:@"$10" forKey:@"cost"];
    [history_content setValue:@"Need to take treatments for that" forKey:@"comments"];
    [history_content setValue:@"1" forKey:@"status"];
    history_content=[[NSMutableDictionary alloc]init];
    [history_content setValue:@"X-Ray" forKey:@"treatment"];
    [history_content setValue:@"Heavy injury in spinal guard" forKey:@"result"];
    [history_content setValue:@"14/10/2014" forKey:@"dateoftest"];
    [history_content setValue:@"$10" forKey:@"cost"];
    [history_content setValue:@"Need to take treatments for that" forKey:@"comments"];
    [history_content setValue:@"1" forKey:@"status"];
    [history_array addObject:history_content];
    history_content=[[NSMutableDictionary alloc]init];
    [history_content setValue:@"X-Ray" forKey:@"treatment"];
    [history_content setValue:@"Heavy injury in spinal guard" forKey:@"result"];
    [history_content setValue:@"14/10/2014" forKey:@"dateoftest"];
    [history_content setValue:@"$10" forKey:@"cost"];
    [history_content setValue:@"Need to take treatments for that" forKey:@"comments"];
    [history_content setValue:@"1" forKey:@"status"];
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
    
    
    ViewMedicalRecordsTableViewCell *cell = (ViewMedicalRecordsTableViewCell*)[self.history_tbview dequeueReusableCellWithIdentifier:@"recordlist" forIndexPath:indexPath];
    
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
    cell.treatment.text=[data_for_cell valueForKey:@"treatment"];
    cell.result.text =[data_for_cell valueForKey:@"result"];
    cell.dateoftest.text=[data_for_cell valueForKey:@"dateoftest"];
    cell.cost.text =[data_for_cell valueForKey:@"cost"];
    cell.comments.text=[data_for_cell valueForKey:@"comments"];
    //cell.status.image=[UIImage imageNamed:[self imageSet:[data_for_cell valueForKey:@"DownloadStatus"]]];
    
    return cell;
    
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier]isEqualToString:@"detaillist"]) {
        NSIndexPath *index=[self.history_tbview indexPathForSelectedRow];
        ViewMedicalRecordDetailViewController *vc=[segue destinationViewController];
        vc.detailData=[history_array objectAtIndex:index.row];
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self performSegueWithIdentifier:@"detaillist" sender:self];
    
}


@end
