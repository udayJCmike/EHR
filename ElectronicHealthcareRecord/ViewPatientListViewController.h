//
//  ViewPatientListViewController.h
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 17/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SVSegmentedControl.h"
#import <QuartzCore/QuartzCore.h>
#import "UIButton+Bootstrap.h"

@interface ViewPatientListViewController : UIViewController
{
 UIButton *navButton;
}
@property(nonatomic,retain)IBOutlet UITableView *patientlist;
@property(nonatomic,retain)NSMutableArray *patientarray;
@property(nonatomic,retain)NSMutableDictionary *patientcontent;
@property (strong, nonatomic) UINavigationController *navController;
@end
