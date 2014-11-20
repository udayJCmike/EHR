//
//  DPCalendarMonthlySingleMonthCellDoctor.h
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 11/20/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import "DPCalendarMonthlyCellDoctorCollectionViewCell.h"

#import "DPCalendarEvent.h"
#import "NSDate+DP.h"
typedef enum
{
    DPCalendarMonthlyViewEventDrawingStyleUnderline,
    DPCalendarMonthlyViewEventDrawingStyleBar
} DPCalendarMonthlyViewEventDrawingStyle;
@protocol DPCalendarMonthlySingleMonthCellDoctorDelegate <NSObject>

-(void) didTapEvent:(DPCalendarEvent *)event onDate:(NSDate *)date;

@end

@interface DPCalendarMonthlySingleMonthCellDoctor : DPCalendarMonthlyCellDoctorCollectionViewCell
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSCalendar *calendar;

@property (nonatomic, strong) NSArray *events;
@property (nonatomic, strong) NSArray *iconEvents;


-(void) setDate:(NSDate *)date calendar:(NSCalendar *)calendar events:(NSArray *)events iconEvents:(NSArray *)iconEvents;

@property (nonatomic, weak) id<DPCalendarMonthlySingleMonthCellDoctorDelegate> delegate;
@property (nonatomic) NSDate *firstVisiableDateOfMonth;
@property (nonatomic) BOOL isInSameMonth;
@property (nonatomic) BOOL isFirstRow;

@property (nonatomic, strong) UIColor *todayBannerBkgColor;

@property (nonatomic, strong) UIFont *dayFont;
@property (nonatomic, strong) UIColor *dayTextColor;
@property (nonatomic, strong) UIFont *eventFont;
@property (nonatomic) CGFloat rowHeight;
@property (nonatomic, strong) NSArray *eventColors;
@property (nonatomic, strong) UIFont *iconEventFont;
@property (nonatomic, strong) NSArray *iconEventBkgColors;

@property (nonatomic, strong) UIColor *noInSameMonthColor;
@property (nonatomic, strong) UIColor *selectedColor;
@property (nonatomic, strong) UIColor *highlightedColor;

@property (nonatomic) DPCalendarMonthlyViewEventDrawingStyle eventDrawingStyle;

@property (nonatomic, setter = setIsPreviousSelectedCell:) BOOL isPreviousSelectedCell;


@property(nonatomic) CGFloat iconEventMarginX;
@property(nonatomic) CGFloat iconEventMarginY;
@end
