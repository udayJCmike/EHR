//
//  DPCalendarMonthlyWeekdayCellDoctor.m
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 11/20/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import "DPCalendarMonthlyWeekdayCellDoctor.h"


@implementation DPCalendarMonthlyWeekdayCellDoctor
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        self.titleLabel.font = self.font;
        self.titleLabel.textColor = [UIColor colorWithRed:82/255.0f green:82/255.0f blue:82/255.0f alpha:1];
        self.titleLabel.highlightedTextColor = [UIColor whiteColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.userInteractionEnabled = NO;
        self.titleLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (void)setWeekday:(NSString *)weekday {
    _weekday = weekday;
    self.titleLabel.text = weekday;
    [self setNeedsDisplay];
}

-(void)setFont:(UIFont *)font {
    _font = font;
    [self.titleLabel setFont:font];
}
@end
