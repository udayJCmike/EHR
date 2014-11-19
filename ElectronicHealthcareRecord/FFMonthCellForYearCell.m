//
//  FFMonthCellForYearCell.m
//  FFCalendar
//
//  Created by Fernanda G. Geraissate on 3/10/14.
//  Copyright (c) 2014 Fernanda G. Geraissate. All rights reserved.
//
//  http://fernandasportfolio.tumblr.com
//

#import "FFMonthCellForYearCell.h"

@interface FFMonthCellForYearCell ()
@property (strong, nonatomic) UIImageView *imageViewCircle;
@end

@implementation FFMonthCellForYearCell

#pragma mark - Synthesize

@synthesize labelDay;
@synthesize imageViewCircle;
@synthesize statusDay;
#pragma mark - Lifecycle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)initLayout {
    
    if (!labelDay) {
        
        imageViewCircle = [[UIImageView alloc] initWithFrame:CGRectMake(0., 0., self.frame.size.width, self.frame.size.height)];
        [imageViewCircle setContentMode:UIViewContentModeScaleAspectFit];
        [self addSubview:imageViewCircle];
        
       
        statusDay = [[UILabel alloc] initWithFrame:CGRectMake(0., 0., self.frame.size.width, self.frame.size.height)];
        [statusDay setTextAlignment:NSTextAlignmentLeft];
        [self addSubview:statusDay];
        labelDay = [[UILabel alloc] initWithFrame:CGRectMake(0., 0., self.frame.size.width, self.frame.size.height)];
        [labelDay setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:labelDay];
    }
    
    [labelDay setText:@""];
    [labelDay setTextColor:[UIColor blackColor]];
    [statusDay setText:@""];
    [statusDay setTextColor:[UIColor blackColor]];
    [imageViewCircle setImage:nil];
}

- (void)markAsCurrentDay {
    
    [labelDay setTextColor:[UIColor blackColor]];
     [statusDay setTextColor:[UIColor blackColor]];
    [imageViewCircle setImage:[UIImage imageNamed:@"redCircle"]];
      // [self.statusDay setBackgroundColor:[UIColor yellowColor]];
}
- (void)markAsAvailable {
    
    [self.labelDay setTextColor:[UIColor whiteColor]];
    [self.statusDay setBackgroundColor:[UIColor greenColor]];
    
}
- (void)markAsCompleted {
    
    [self.labelDay setTextColor:[UIColor whiteColor]];
     [self.statusDay setBackgroundColor:[UIColor redColor]];
   // [self.imageViewCircle setImage:[UIImage imageNamed:@"redCircle"]];
}
- (void)markAsGoingtoEnd {
    
    [self.labelDay setTextColor:[UIColor whiteColor]];
     [self.statusDay setBackgroundColor:[UIColor yellowColor]];
    //[self.imageViewCircle setImage:[UIImage imageNamed:@"redCircle"]];
}
@end
