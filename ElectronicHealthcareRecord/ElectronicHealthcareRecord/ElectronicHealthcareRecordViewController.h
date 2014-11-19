//
//  ElectronicHealthcareRecordViewController.h
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 11/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DashboardViewController.h"
#import "NIDropDown.h"
#import "UIButton+Bootstrap.h"
@interface ElectronicHealthcareRecordViewController : UIViewController<NIDropDownDelegate,UIPopoverControllerDelegate>
{

NIDropDown *dropDown;
}


- (IBAction)selectClicked:(id)sender;
@property (retain, nonatomic) IBOutlet UIView *bg;
-(void)rel;
@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UIButton *loginbutton;
@property (strong, nonatomic) IBOutlet UIButton *resetbutton;
@property (strong, nonatomic) IBOutlet UIButton *userroleSelect;
@property (strong, nonatomic) IBOutlet UIButton *signupbutton;
@property (strong, nonatomic) IBOutlet UIButton *google;
@property (strong, nonatomic) IBOutlet UIButton *fb;
@end
