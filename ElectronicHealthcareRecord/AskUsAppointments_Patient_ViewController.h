//
//  AskUsAppointments_Patient_ViewController.h
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 11/21/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AskUsAppointments_Patient_ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *list_app;
@property (strong, nonatomic)NSMutableArray *listOfApp;

@end
