//
//  RegistrationViewController.h
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 13/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButton+Bootstrap.h"
#import "NIDropDown.h"



@interface RegistrationViewController : UIViewController<NIDropDownDelegate>
{
    
    NIDropDown *dropDown;
}
@property (strong, nonatomic) IBOutlet UIButton *clinic_names;
- (IBAction)selectClicked:(id)sender;
-(void)rel;
@property (retain, nonatomic) IBOutlet UIButton *signup;
@property (retain, nonatomic) IBOutlet UIButton *reset;
@property (strong, nonatomic) IBOutlet UIButton *terms;
@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UITextField *cpassword;
@property (retain, nonatomic) IBOutlet UIView *bg;
@end
