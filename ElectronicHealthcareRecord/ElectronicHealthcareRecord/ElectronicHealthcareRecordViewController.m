//
//  ElectronicHealthcareRecordViewController.m
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 11/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import "ElectronicHealthcareRecordViewController.h"
#import "categorypopoverViewController.h"



@interface ElectronicHealthcareRecordViewController ()
{
    UIPopoverController*userDataPopover;
}
@end

@implementation ElectronicHealthcareRecordViewController
@synthesize username;
@synthesize password;
@synthesize loginbutton;
@synthesize resetbutton;
@synthesize userroleSelect;
@synthesize bg;
@synthesize google;
@synthesize fb;
@synthesize signupbutton;
NSString *title;;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.loginbutton primaryStyle];
    [self.signupbutton primaryStyle];
    [self.resetbutton defaultStyle];
  google.layer.cornerRadius = 5;
    fb.layer.cornerRadius = 5;
    userroleSelect.layer.borderWidth = 1;
    userroleSelect.layer.borderColor = [[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]CGColor] ;
    userroleSelect.layer.cornerRadius = 5;
// NSLog(@"%@", username.layer.borderColor);
    bg.layer.cornerRadius=10;
    bg.layer.masksToBounds=YES;
    
   
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    //    [btnSelect release];
    //    [super dealloc];
}

- (IBAction)selectClicked:(id)sender {
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"Clinic Admin",@"Doctor", @"Patient",nil];
    NSArray * arrImage = [[NSArray alloc] init];
  //  arrImage = [NSArray arrayWithObjects:[UIImage imageNamed:@"super_admin.png"], [UIImage imageNamed:@"clinic_admin.jpeg"], [UIImage imageNamed:@"patient.png"], nil];
    if(dropDown == nil) {
        NSLog(@"in nil");
        title= [(UIButton *)sender currentTitle];
        CGFloat f = 200;
        dropDown = [[NIDropDown alloc]showDropDown:sender :&f :arr :arrImage :@"down"];
        dropDown.delegate = self;
    }
    else {
        NSLog(@"values");
        [dropDown hideDropDown:sender];
        [self rel];
    }
    
//
}

- (void) niDropDownDelegateMethod: (NIDropDown *) sender {
    [self rel];
}

-(void)rel{
    //    [dropDown release];
    dropDown = nil;
}

- (void)categorylistener:(id)sender
{
   NSString * categoryname=[sender valueForKey:@"object"];
   NSLog(@"catergory name %@",categoryname);
    [userroleSelect setTitle:categoryname forState:UIControlStateNormal];
    
    [userDataPopover dismissPopoverAnimated:NO];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"Categorylist" object:nil];
   
}

- (IBAction)login_action:(id)sender {
    title= [(UIButton *)userroleSelect currentTitle];
   // NSLog(title);
    if([title isEqualToString:@"Doctor"])
    {
        UIStoryboard *welcome=[UIStoryboard storyboardWithName:@"DoctorDashboard" bundle:nil];
        UIViewController *initialvc=[welcome instantiateInitialViewController];
        [self.navigationController pushViewController:initialvc animated:YES];
    }
    if([title isEqualToString:@"Clinic Admin"])
    {
        UIStoryboard *welcome=[UIStoryboard storyboardWithName:@"Clinic_Dashboard_Storyboard" bundle:nil];
        UIViewController *initialvc=[welcome instantiateInitialViewController];
        [self.navigationController pushViewController:initialvc animated:YES];
    }
    if([title isEqualToString:@"Patient"])
    {
        UIStoryboard *welcome=[UIStoryboard storyboardWithName:@"Dashboard_Storyboard" bundle:nil];
        UIViewController *initialvc=[welcome instantiateInitialViewController];
        [self.navigationController pushViewController:initialvc animated:YES];
    }

}
- (IBAction)signup:(id)sender {
  

}
- (IBAction)signin_google:(id)sender {
   
}
- (IBAction)signin_fb:(id)sender {
}
- (IBAction)forgot_password:(id)sender {
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    //    [btnSelect release];
    userroleSelect = nil;
    
    [super viewDidUnload];
    
}
@end
