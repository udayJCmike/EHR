//
//  FFMonthCellForYearCell.h
//  FFCalendar
//
//  Created by Fernanda G. Geraissate on 3/10/14.
//  Copyright (c) 2014 Fernanda G. Geraissate. All rights reserved.
//
//  http://fernandasportfolio.tumblr.com
//

#import <UIKit/UIKit.h>

@interface FFMonthCellForYearCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *labelDay;
@property (nonatomic, strong) UILabel *statusDay;
- (void)initLayout;
- (void)markAsCurrentDay;
- (void)markAsAvailable;
- (void)markAsCompleted;
- (void)markAsGoingtoEnd;
@end
