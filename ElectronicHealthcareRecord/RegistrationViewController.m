//
//  RegistrationViewController.m
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 13/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import "RegistrationViewController.h"

@interface RegistrationViewController ()

@end

@implementation RegistrationViewController
@synthesize username;
@synthesize password;
@synthesize cpassword;
@synthesize terms;
@synthesize bg;
@synthesize signup;
@synthesize reset;

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
    [self.reset defaultStyle];
    [self.signup primaryStyle];
    bg.layer.cornerRadius=10;
    bg.layer.masksToBounds=YES;
    // Do any additional setup after loading the view.
    self.clinic_names.layer.borderWidth = 1;
    self.clinic_names.layer.borderColor = [[UIColor colorWithRed:0 green:0 blue:0 alpha:1]CGColor] ;
    self.clinic_names.layer.cornerRadius = 5;
    
}
- (IBAction)selectClicked:(id)sender {
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"Dollar Chiropractic Clinic", @"Essential Care Chiropractic", @"Dollar Chiropractic Clinic", @"Essential Care Chiropractic",nil];
    NSArray * arrImage = [[NSArray alloc] init];
    // arrImage = [NSArray arrayWithObjects:[UIImage imageNamed:@"super_admin.png"], [UIImage imageNamed:@"clinic_admin.jpeg"], [UIImage imageNamed:@"patient.png"], nil];
    if(dropDown == nil) {
        CGFloat f = 200;
        dropDown = [[NIDropDown alloc]showDropDown:sender :&f :arr :arrImage :@"down"];
        dropDown.delegate = self;
    }
    else {
        [dropDown hideDropDown:sender];
        [self rel];
    }
}

- (void) niDropDownDelegateMethod: (NIDropDown *) sender {
    [self rel];
}

-(void)rel{
    //    [dropDown release];
    dropDown = nil;
}
- (void)viewDidUnload {
    //    [btnSelect release];
    self.clinic_names = nil;
    
    [super viewDidUnload];
    
}

- (IBAction)checkbox:(UIButton*)sender {
    
    sender.selected = !sender.selected;
    if(sender.selected){
        [sender setImage:[UIImage imageNamed:@"checkBoxMarked.png"] forState:UIControlStateNormal];
    }
    else{
        [sender setImage:[UIImage imageNamed:@"checkBox.png"] forState:UIControlStateNormal];
    }
    
}
- (IBAction)termsOfservice:(id)sender {
   
}
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
