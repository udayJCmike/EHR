//
//  ViewHistoryViewController.m
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 11/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import "Clinic_PatientViewController.h"
#import "Clinic_DetailViewController.h"
#import "Clinic_Patient_Table_ContentViewController.h"

@interface Clinic_PatientViewController ()

@end

@implementation Clinic_PatientViewController
@synthesize patientarray;
@synthesize patientcontent;
@synthesize patientlist;
@synthesize addbtn;

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
    
    
    patientarray=[[NSMutableArray alloc]init];
    patientcontent=[[NSMutableDictionary alloc]init];
    [patientcontent setValue:@"Dr.Russell Saari" forKey:@"doctorname"];
    [patientcontent setValue:@"Pain in spinal guard" forKey:@"discussedabout"];
    [patientcontent setValue:@"apollo" forKey:@"clinicname"];
    [patientcontent setValue:@"14/10/2014" forKey:@"dateofvisit"];
    [patientcontent setValue:@"Xray ,BloodPressure" forKey:@"test"];
    [patientcontent setValue:@"1" forKey:@"status"];
    patientcontent=[[NSMutableDictionary alloc]init];
    [patientcontent setValue:@"Dr.Damaris Sabater" forKey:@"doctorname"];
    [patientcontent setValue:@"Pain in spinal guard" forKey:@"discussedabout"];
    [patientcontent setValue:@"apollo" forKey:@"clinicname"];
    [patientcontent setValue:@"11/11/2014" forKey:@"dateofvisit"];
    [patientcontent setValue:@"SugarTest,BoneDensity" forKey:@"test"];
    [patientcontent setValue:@"0" forKey:@"status"];
    [patientarray addObject:patientcontent];
    patientcontent=[[NSMutableDictionary alloc]init];
    [patientcontent setValue:@"Dr.Russell Saari" forKey:@"doctorname"];
    [patientcontent setValue:@"Pain in spinal guard" forKey:@"discussedabout"];
    [patientcontent setValue:@"apollo" forKey:@"clinicname"];
    [patientcontent setValue:@"18/10/2014" forKey:@"dateofvisit"];
    [patientcontent setValue:@"SugarTest,BoneDensity" forKey:@"test"];
    [patientcontent setValue:@"1" forKey:@"status"];
    [patientarray addObject:patientcontent];
    patientcontent=[[NSMutableDictionary alloc]init];
    [patientcontent setValue:@"Dr.Russell Saari" forKey:@"doctorname"];
    [patientcontent setValue:@"Pain in spinal guard" forKey:@"discussedabout"];
    [patientcontent setValue:@"apollo" forKey:@"clinicname"];
    [patientcontent setValue:@"09/10/2014" forKey:@"dateofvisit"];
    [patientcontent setValue:@"SugarTest,BoneDensity" forKey:@"test"];
    [patientcontent setValue:@"0" forKey:@"status"];
    [patientarray addObject:patientcontent];
    patientcontent=[[NSMutableDictionary alloc]init];
    [patientcontent setValue:@"Dr.Brett Saal" forKey:@"doctorname"];
    [patientcontent setValue:@"Pain in spinal guard" forKey:@"discussedabout"];
    [patientcontent setValue:@"apollo" forKey:@"clinicname"];
    [patientcontent setValue:@"21/10/2014" forKey:@"dateofvisit"];
    [patientcontent setValue:@"BoneDensity" forKey:@"test"];
    [patientcontent setValue:@"1" forKey:@"status"];
    [patientarray addObject:patientcontent];
    patientcontent=[[NSMutableDictionary alloc]init];
    [patientcontent setValue:@"Dr.Brett Saal" forKey:@"doctorname"];
    [patientcontent setValue:@"Pain in spinal guard" forKey:@"discussedabout"];
    [patientcontent setValue:@"apollo" forKey:@"clinicname"];
    [patientcontent setValue:@"26/09/2014" forKey:@"dateofvisit"];
    [patientcontent setValue:@"BoneDensity" forKey:@"test"];
    [patientcontent setValue:@"0" forKey:@"status"];
    patientcontent=[[NSMutableDictionary alloc]init];
    [patientcontent setValue:@"Dr.Russell Saari" forKey:@"doctorname"];
    [patientcontent setValue:@"Pain in spinal guard" forKey:@"discussedabout"];
    [patientcontent setValue:@"apollo" forKey:@"clinicname"];
    [patientcontent setValue:@"14/10/2014" forKey:@"dateofvisit"];
    [patientcontent setValue:@"Xray ,BloodPressure" forKey:@"test"];
    [patientcontent setValue:@"1" forKey:@"status"];
    [patientarray addObject:patientcontent];
    patientcontent=[[NSMutableDictionary alloc]init];
    [patientcontent setValue:@"Dr.Eugene Sabaitis" forKey:@"doctorname"];
    [patientcontent setValue:@"Pain in spinal guard" forKey:@"discussedabout"];
    [patientcontent setValue:@"apollo" forKey:@"clinicname"];
    [patientcontent setValue:@"15/11/2014" forKey:@"dateofvisit"];
    [patientcontent setValue:@"SugarTest,BoneDensity" forKey:@"test"];
    [patientcontent setValue:@"0" forKey:@"status"];
    [patientarray addObject:patientcontent];
    
    
    
    
    
    
    
    
    
    
    //    SVSegmentedControl *yellowRC = [[SVSegmentedControl alloc] initWithSectionTitles:[NSArray arrayWithObjects:@"Personal Details", @"Insurance Details", nil]];
    //    [yellowRC addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    //	yellowRC.crossFadeLabelsOnDrag = YES;
    //	yellowRC.font = [UIFont fontWithName:@"Helvetica Neue" size:20];
    //	yellowRC.titleEdgeInsets = UIEdgeInsetsMake(0, 14, 0, 14);
    //	yellowRC.height = 50;
    //   [yellowRC setSelectedSegmentIndex:0 animated:NO];
    //	yellowRC.thumb.tintColor = [UIColor colorWithRed:0/255.0 green:166/255.0 blue:108/255.0 alpha:1] ;
    //	yellowRC.thumb.textColor = [UIColor whiteColor];
    //	yellowRC.thumb.textShadowColor = [UIColor blackColor];
    //	yellowRC.thumb.textShadowOffset = CGSizeMake(0, 1);
    //
    //
    //	[self.view addSubview:yellowRC];
  [self addNavigationBarButton];
    //
    //	yellowRC.frame = CGRectMake(0, 65, 768, 50);
    
    // Do any additional setup after loading the view.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (IBAction)addbtn:(id)sender {
    
    
    
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [patientarray count];
    
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
    
    
    Clinic_Patient_Table_ContentViewController *cell = (Clinic_Patient_Table_ContentViewController*)[self.patientlist dequeueReusableCellWithIdentifier:@"patientlist" forIndexPath:indexPath];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    NSDictionary *data_for_cell= [patientarray objectAtIndex:indexPath.row];
    
    //    if (indexPath.row %2==0)
    //    {
    //        cell.backgroundColor=[UIColor colorWithRed:51.0/255.0f green:214.0/255.0f blue:133.0/255.0f alpha:0.5f];
    //    }
    //    else
    //    {
    //        cell.backgroundColor=[UIColor colorWithRed:193.0/255.0f green:193.0/255.0f blue:193.0/255.0f alpha:0.5f];
    //    }
    cell.patientname.text=[data_for_cell valueForKey:@"doctorname"];
    cell.email.text =[data_for_cell valueForKey:@"discussedabout"];
    cell.number.text=[data_for_cell valueForKey:@"clinicname"];
    cell.address.text =[data_for_cell valueForKey:@"dateofvisit"];
    cell.designation.text=[data_for_cell valueForKey:@"test"];
    cell.status.image=[UIImage imageNamed:[self imageSet:[data_for_cell valueForKey:@"status"]]];
    
    return cell;
    
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier]isEqualToString:@"patientdetail"]) {
        NSIndexPath *index=[self.patientlist indexPathForSelectedRow];
        //c.detailData=[history_array objectAtIndex:index.row];
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self performSegueWithIdentifier:@"details" sender:self];
    
  
    
}
-(void)addNavigationBarButton{
    UIBarButtonItem *myNavBtn = [[UIBarButtonItem alloc] initWithTitle:
                                 @"Add Patient" style:UIBarButtonItemStyleBordered target:
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
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)myButtonClicked:(id)sender{
//    [self performSegueWithIdentifier:@"addnavigation" sender:self];
    UIViewController *vc= [self.storyboard instantiateViewControllerWithIdentifier:@"AddPatient"];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)segmentedControlChangedValue:(SVSegmentedControl*)segmentedControl {
	NSLog(@"segmentedControl %i did select index %i (via UIControl method)", segmentedControl.tag, segmentedControl.selectedSegmentIndex);
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
