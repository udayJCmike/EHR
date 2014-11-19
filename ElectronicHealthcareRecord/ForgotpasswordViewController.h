//
//  ForgotpasswordViewController.h
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 14/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButton+Bootstrap.h"
#import "NIDropDown.h"


@interface ForgotpasswordViewController : UIViewController<NIDropDownDelegate>
{
    
    NIDropDown *dropDown;
}
- (IBAction)selectClicked:(id)sender;
-(void)rel;
@property (retain, nonatomic) IBOutlet UIButton *recover;
@property (retain, nonatomic) IBOutlet UIButton *back;
@property (strong, nonatomic) IBOutlet UIButton *question;
@property (retain, nonatomic) IBOutlet UIView *bg;
@end
