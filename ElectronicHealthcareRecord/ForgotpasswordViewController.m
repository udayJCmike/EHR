//
//  ForgotpasswordViewController.m
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 14/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import "ForgotpasswordViewController.h"

@interface ForgotpasswordViewController ()

@end

@implementation ForgotpasswordViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.back defaultStyle];
    [self.recover primaryStyle];
    self.bg.layer.cornerRadius=10;
  self.bg.layer.masksToBounds=YES;
    self.question.layer.borderWidth = 1;
    self.question.layer.borderColor = [[UIColor colorWithRed:0 green:0 blue:0 alpha:1]CGColor] ;
    self.question.layer.cornerRadius = 5;
}
- (IBAction)selectClicked:(id)sender {
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"Which is your first mobile phone", @"What is your pet name", @"What is your mother name",@"Which is your first game",nil];
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
    self.question = nil;
    
    [super viewDidUnload];
    
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
