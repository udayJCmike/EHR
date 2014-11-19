//
//  MessageContentTableViewCell.m
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 13/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import "Clinic_Ask_Us_Content_TableViewController.h"

@implementation Clinic_Ask_Us_Content_TableViewController
@synthesize title;
@synthesize content;
@synthesize date_sent;
@synthesize time_sent;
@synthesize profileimage;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        profileimage.layer.masksToBounds=YES;
        profileimage.layer.cornerRadius=5.0;
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
