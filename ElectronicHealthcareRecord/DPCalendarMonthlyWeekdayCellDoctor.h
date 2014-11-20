//
//  DPCalendarMonthlyWeekdayCellDoctor.h
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 11/20/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import "DPCalendarMonthlyCellDoctorCollectionViewCell.h"

@interface DPCalendarMonthlyWeekdayCellDoctor : DPCalendarMonthlyCellDoctorCollectionViewCell
@property (nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, assign) NSString *weekday;

@property (nonatomic, strong) UIFont *font;
@end
