//
//  DPCalendarMonthlyDoctorView.h
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 11/20/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DPCalendarMonthlySingleMonthCellDoctor.h"
#import "DPCalendarEvent.h"
#import "ElectronicHealthcareRecordAppDelegate.h"
#define AppDelegate (ElectronicHealthcareRecordAppDelegate *)[[UIApplication sharedApplication] delegate]

/*
 Dictionary keys used by -monthlyViewAttributes: for view customizations
 */

extern NSString *const DPCalendarMonthlyViewAttributeWeekdayHeightDoctor; //Height of weekday cell - Dafault: 20
extern NSString *const DPCalendarMonthlyViewAttributeWeekdayFontDoctor; //Font of weekday - Dafault: [UIFont systemFontOfSize:12]

extern NSString *const DPCalendarMonthlyViewAttributeCellTodayBannerBkgColorDoctor; //Today's color in cell
extern NSString *const DPCalendarMonthlyViewAttributeCellHeightDoctor; //Height of date cell
extern NSString *const DPCalendarMonthlyViewAttributeDayFontDoctor; //Font of day label
extern NSString *const DPCalendarMonthlyViewAttributeEventFontDoctor; //Font of event, which has underline
extern NSString *const DPCalendarMonthlyViewAttributeCellRowHeightDoctor; //Height of event
extern NSString *const DPCalendarMonthlyViewAttributeEventColorsDoctor; //Underline color of the event
extern NSString *const DPCalendarMonthlyViewAttributeIconEventFontDoctor; //Font of icon event
extern NSString *const DPCalendarMonthlyViewAttributeIconEventBkgColorsDoctor; //Background color of icon event
extern NSString *const DPCalendarMonthlyViewAttributeIconEventMarginXDoctor;
extern NSString *const DPCalendarMonthlyViewAttributeIconEventMarginYDoctor;
extern NSString *const DPCalendarMonthlyViewAttributeCellNotInSameMonthColorDoctor; //Background color of the cell that is not in current month
extern NSString *const DPCalendarMonthlyViewAttributeCellHighlightedColorDoctor; //Highlight color of the cell
extern NSString *const DPCalendarMonthlyViewAttributeCellSelectedColorDoctor; //Selected color of the cell
extern NSString *const DPCalendarMonthlyViewAttributeCellNotInSameMonthSelectableDoctor; //Whether the cell that is not in current month can be selected
extern NSString *const DPCalendarMonthlyViewAttributeEventDrawingStyleDoctor;//Drawing style of event

extern NSString *const DPCalendarMonthlyViewAttributeSeparatorColorDoctor; //Border color of cell

extern NSString *const DPCalendarMonthlyViewAttributeStartDayOfWeekDoctor; //Start day of the week (0 means starting from Sunday)
extern NSString *const DPCalendarMonthlyViewAttributeMonthRowsDoctor; //A convenient function to define the height of cell

@protocol DPCalendarMonthlyDoctorViewDelegate <NSObject>

-(void) didScrollToMonth:(NSDate *)month firstDate:(NSDate *)firstDate lastDate:(NSDate *)lastDate;//When calendar scrolling stops

-(void) didSkipToMonth:(NSDate *)month firstDate:(NSDate *)firstDate lastDate:(NSDate *)lastDate;//When calendar flips through (When finger flips at fast speed)

@optional
- (Class) monthlyCellClass;
- (Class) monthlyWeekdayClassClass;

- (BOOL) shouldHighlightItemWithDate:(NSDate *)date;
- (BOOL) shouldSelectItemWithDate:(NSDate *)date;
- (void) didSelectItemWithDateFromDoctor:(NSDate *)date;
- (void)didTapEvent:(DPCalendarEvent *)event onDate:(NSDate *)date;
- (NSDictionary *) monthlyViewAttributes;

@end

@interface DPCalendarMonthlyDoctorView : UIScrollView<UICollectionViewDataSource, UICollectionViewDelegate>
{
    ElectronicHealthcareRecordAppDelegate *delegate;
}

//Current selected date
@property (nonatomic, readonly) NSDate *selectedDate;
@property BOOL MultipletimeReloading;  ///Set to restrict multiple time DidSelectItem method calling
//Current selected month
@property (nonatomic, readonly) NSDate *seletedMonth;

//Background Color for monthly scroll view
@property(nonatomic, strong) UIColor *monthlyViewBackgroundColor;

@property (nonatomic, weak) id<DPCalendarMonthlyDoctorViewDelegate> monthlyViewDelegate;


-(id)initWithFrame:(CGRect)frame delegate:(id<DPCalendarMonthlyDoctorViewDelegate>)monthViewDelegate;

-(void) scrollToMonth:(NSDate *)month complete:(void (^)(void))complete;
-(void) scrollToPreviousMonthWithComplete:(void (^)(void))complete;
-(void) scrollToNextMonthWithComplete:(void (^)(void))complete;

- (NSDate *)firstVisibleDateOfMonth:(NSDate *)date;
- (NSDate *)lastVisibleDateOfMonth:(NSDate *)date;

- (void) clickDate:(NSDate *)date;

- (NSArray *)eventsForDay:(NSDate *)date;
- (NSArray *)iconEventsForDay:(NSDate *)date;

- (void) setEvents:(NSArray *)events complete:(void (^)(void))complete;
- (void) setIconEvents:(NSArray *)iconEvents complete:(void (^)(void))complete;

- (void) resetViews;

@end
