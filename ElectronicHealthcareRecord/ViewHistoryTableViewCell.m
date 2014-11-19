//
//  ViewHistoryTableViewCell.m
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 13/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import "ViewHistoryTableViewCell.h"

@implementation ViewHistoryTableViewCell
@synthesize clinic_name;
@synthesize discussed_about;
@synthesize doctor_name;
@synthesize date_of_visit;
@synthesize test_taken;
@synthesize status;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
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
