//
//  ViewHistoryViewController.m
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 11/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import "Clinic_AppointmentsViewController.h"
#import "Clinic_Detail_AppointmentsViewController.h"
#import "Clinic_View_Appointments_Table_CellViewController.h"

@interface Clinic_AppointmentsViewController ()

@end

@implementation Clinic_AppointmentsViewController
@synthesize patientarray;
@synthesize patientcontent;
@synthesize view_appointments;

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
    [patientcontent setValue:@"ABCD_ID" forKey:@"patientid"];
    [patientcontent setValue:@"imans@gmail.com" forKey:@"email"];
    [patientcontent setValue:@"9589545625" forKey:@"number"];
    [patientcontent setValue:@"14/10/2014" forKey:@"date"];
    [patientcontent setValue:@"25" forKey:@"time"];
    
    patientcontent=[[NSMutableDictionary alloc]init];
    [patientcontent setValue:@"ABCD_ID" forKey:@"patientid"];
    [patientcontent setValue:@"imans@gmail.com" forKey:@"email"];
    [patientcontent setValue:@"9589545625" forKey:@"number"];
    [patientcontent setValue:@"14/10/2014" forKey:@"date"];
    [patientcontent setValue:@"25" forKey:@"time"];
    [patientarray addObject:patientcontent];
    
    
    
    
    patientarray=[[NSMutableArray alloc]init];
    patientcontent=[[NSMutableDictionary alloc]init];
    [patientcontent setValue:@"ABCD_ID" forKey:@"patientid"];
    [patientcontent setValue:@"imans@gmail.com" forKey:@"email"];
    [patientcontent setValue:@"9589545625" forKey:@"number"];
    [patientcontent setValue:@"14/10/2014" forKey:@"date"];
    [patientcontent setValue:@"25" forKey:@"time"];
    
    patientcontent=[[NSMutableDictionary alloc]init];
    [patientcontent setValue:@"ABCD_ID" forKey:@"patientid"];
    [patientcontent setValue:@"imans@gmail.com" forKey:@"email"];
    [patientcontent setValue:@"9589545625" forKey:@"number"];
    [patientcontent setValue:@"14/10/2014" forKey:@"date"];
    [patientcontent setValue:@"25" forKey:@"time"];
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
    return 3;
}



-(void)addNavigationBarButton{
    UIBarButtonItem *myNavBtn = [[UIBarButtonItem alloc] initWithTitle:
                                 @"Add Appointments" style:UIBarButtonItemStyleBordered target:
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
    UIStoryboard *welcome=[UIStoryboard storyboardWithName:@"Appointments" bundle:nil];
    UIViewController *initialvc=[welcome instantiateInitialViewController];
    [self.navigationController pushViewController:initialvc animated:YES];
    
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [patientarray count];
    
    // Return the number of rows in the section.
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    Clinic_View_Appointments_Table_CellViewController *cell = (Clinic_View_Appointments_Table_CellViewController*)[self.view_appointments dequeueReusableCellWithIdentifier:@"add_appointments" forIndexPath:indexPath];
    
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
    cell.patientid.text=[data_for_cell valueForKey:@"patientid"];
    cell.email.text =[data_for_cell valueForKey:@"email"];
    cell.number.text=[data_for_cell valueForKey:@"number"];
    cell.date.text =[data_for_cell valueForKey:@"date"];
    cell.time.text=[data_for_cell valueForKey:@"time"];
    
    
    return cell;
    
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier]isEqualToString:@"patientdetail"]) {
        NSIndexPath *index=[self.view_appointments indexPathForSelectedRow];
        //c.detailData=[history_array objectAtIndex:index.row];
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self performSegueWithIdentifier:@"details" sender:self];
    
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
