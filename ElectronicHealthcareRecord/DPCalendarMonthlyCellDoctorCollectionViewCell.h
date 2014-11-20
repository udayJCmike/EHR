//
//  DPCalendarMonthlyCellDoctorCollectionViewCell.h
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 11/20/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "NSDate+DP.h"
CG_EXTERN void DPDoctorContextDrawLine(CGContextRef c, CGPoint start, CGPoint end, CGColorRef color, CGFloat lineWidth);
@interface DPCalendarMonthlyCellDoctorCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong) UIColor *separatorColor;

- (void) drawCellWithColor:(UIColor *)color InRect: (CGRect)rect context: (CGContextRef)context;
- (void) drawRoundedRect:(CGRect)rect radius:(float)radius withColor:(UIColor *)color;
@end

