//
//  MessageContentTableViewCell.h
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 13/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageContentTableViewCell : UITableViewCell
@property(nonatomic,retain)IBOutlet UILabel *title;
@property(nonatomic,retain)IBOutlet UILabel *content;
@property(nonatomic,retain)IBOutlet UILabel *date_sent;
@property(nonatomic,retain)IBOutlet UILabel *time_sent;
@property(nonatomic,retain)IBOutlet UIImageView *profileimage;
@end
