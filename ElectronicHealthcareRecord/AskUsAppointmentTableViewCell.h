//
//  AskUsAppointmentTableViewCell.h
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 11/21/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AskUsAppointmentTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *App_image;
@property (strong, nonatomic) IBOutlet UILabel *app_title;
@property (strong, nonatomic) IBOutlet UILabel *app_des;
@property (strong, nonatomic) IBOutlet UILabel *app_time;
@property (strong, nonatomic) IBOutlet UILabel *app_date;
@end
