//
//  DPCalendarMonthlySingleMonthCellDoctor.m
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 11/20/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import "DPCalendarMonthlySingleMonthCellDoctor.h"
#import "DPCalendarIconEvent.h"
#import "NSDate+DP.h"
#import "DPConstants.h"
#import "NSString+DP.h"
@implementation DPCalendarMonthlySingleMonthCellDoctor

#define DAY_TEXT_RIGHT_MARGIN 6.0f

#define ROW_MARGIN 3.0f
#define EVENT_START_MARGIN 1.0f
#define EVENT_END_MARGIN 1.0f
#define EVENT_TITLE_MARGIN 2.0f

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapCell:)];
        tapGestureRecognizer.cancelsTouchesInView = NO;
        [self addGestureRecognizer:tapGestureRecognizer];
    }
    return self;
}

-(void)setDate:(NSDate *)date calendar:(NSCalendar *)calendar events:(NSArray *)events iconEvents:(NSArray *)iconEvents {
    self.date = [calendar dateFromComponents:[calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:date]];
    self.events = events;
    self.iconEvents = iconEvents;
    self.calendar = calendar;
    
    [self setNeedsDisplay];
}

-(void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    [self setNeedsDisplay];
}

-(void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    [self setNeedsDisplay];
}

-(void)setIsInSameMonth:(BOOL)isInSameMonth {
    _isInSameMonth = isInSameMonth;
    [self setNeedsDisplay];
}

-(void) didTapCell:(UITapGestureRecognizer *)gesutreRecognizer {
    CGPoint point = [gesutreRecognizer locationInView:self];
    NSDate *day = self.date;
    for (DPCalendarEvent *event in self.events) {
        if (event.rowIndex == 0) {
            continue;
        }
        CGFloat eventOriginY = event.rowIndex * self.rowHeight;
        CGFloat eventMaxY = eventOriginY + self.rowHeight;
        if ((point.y >= eventOriginY) && (point.y < eventMaxY)) {
            [self.delegate didTapEvent:event onDate:day];
            break;
        }
    }
    
}

-(void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    //Draw borders
    CGFloat pixel = 1.f / [UIScreen mainScreen].scale;
    CGSize size = rect.size;
    CGRect internalRect = CGRectMake(0, 0, size.width - pixel, size.height);
    
    //Draw background colors
    if (self.isSelected || self.isPreviousSelectedCell) {
        [self drawCellWithColor:self.selectedColor InRect:internalRect context:context];
    } else if (!self.isInSameMonth) {
        [self drawCellWithColor:self.noInSameMonthColor InRect:internalRect context:context];
    } else {
        [self drawCellWithColor:[UIColor clearColor] InRect:internalRect context:context];
    }
    
    [super drawRect:rect];
    
    
    //Right Border
    DPDoctorContextDrawLine(context,
                      CGPointMake(size.width - pixel, pixel),
                      CGPointMake(size.width - pixel, size.height),
                      self.separatorColor.CGColor,
                      pixel);
    
    //Bottom Border
    DPDoctorContextDrawLine(context,
                      CGPointMake(0.f, self.bounds.size.height),
                      CGPointMake(self.bounds.size.width, self.bounds.size.height),
                      self.separatorColor.CGColor,
                      pixel);
    
    //Top Border if necessary
    if (self.isFirstRow) {
        DPDoctorContextDrawLine(context,
                          CGPointMake(0.f, pixel),
                          CGPointMake(self.bounds.size.width, pixel),
                          self.separatorColor.CGColor,
                          pixel);
    }
    
    //Set text style
    NSMutableParagraphStyle *textStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    textStyle.lineBreakMode = NSLineBreakByWordWrapping;
    textStyle.alignment = NSTextAlignmentLeft;
    NSStringDrawingContext *stringContext = [[NSStringDrawingContext alloc] init];
    stringContext.minimumScaleFactor = 1;
    
    BOOL isDayToday = [self.date compare:[[NSDate date] dp_dateWithoutTimeWithCalendar:self.calendar]] == NSOrderedSame;
    if (isDayToday) {
        [self drawCellWithColor:self.todayBannerBkgColor InRect:CGRectMake(0, 0, rect.size.width, self.rowHeight) context:context];
    }
    //    NSLog(@"backgroudn color %@",self.todayBannerBkgColor);
    //    self.backgroundColor=[UIColor redColor];
    
    //Draw Day
    NSDateComponents *components =
    [self.calendar components:NSMonthCalendarUnit|NSDayCalendarUnit|NSWeekdayCalendarUnit
                     fromDate:self.date];
    NSString *dayString = [NSString stringWithFormat:@"%ld", (long)components.day];
    
    CGSize daySize = [dayString dp_boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, self.dayFont.pointSize + 1)
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:@{
                                                          NSFontAttributeName: [UIFont systemFontOfSize:self.dayFont.pointSize]
                                                          } context:stringContext].size;
    
    
    CGRect dayRect = CGRectMake(size.width - daySize.width - DAY_TEXT_RIGHT_MARGIN, (self.rowHeight - self.dayFont.pointSize) / 2, daySize.width, daySize.height);
    [dayString dp_drawInRect:dayRect withAttributes:@{NSFontAttributeName:self.dayFont, NSParagraphStyleAttributeName:textStyle, NSForegroundColorAttributeName:isDayToday ? [UIColor whiteColor] : self.dayTextColor}];
    
    
    int eventsNotShowingCount = 0;
    
    //Draw Icon events
    float iconX = self.iconEventMarginX;
    for (int i = 0; i < self.iconEvents.count; i++) {
        DPCalendarIconEvent *event = [self.iconEvents objectAtIndex:i];
        CGFloat titleWidth = [event.title dp_boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, self.iconEventFont.pointSize)
                                                          options:NSStringDrawingUsesLineFragmentOrigin
                                                       attributes:@{
                                                                    NSFontAttributeName: [UIFont systemFontOfSize:self.iconEventFont.pointSize]
                                                                    } context:stringContext].size.width;
        
        BOOL isWidthLonger = event.icon.size.width > event.icon.size.height;
        float iconMaxHeight = self.rowHeight - self.iconEventMarginY * 2;
        float scale = (iconMaxHeight) / (isWidthLonger ? event.icon.size.width : event.icon.size.height);
        float iconWidth = isWidthLonger ? (iconMaxHeight) : event.icon.size.width * scale;
        float iconHeight = isWidthLonger ? event.icon.size.height * scale : (iconMaxHeight);
        
        if (event.title.length) {
            if (iconX + titleWidth + iconWidth> rect.size.width - daySize.width - DAY_TEXT_RIGHT_MARGIN) {
                //Not enough space
            } else {
                [self drawRoundedRect:CGRectMake(iconX, 0, titleWidth + iconWidth + iconHeight, self.rowHeight) radius:self.rowHeight / 2 withColor:[self.iconEventBkgColors objectAtIndex:event.bkgColorIndex]];
                
                NSMutableParagraphStyle *textStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
                textStyle.lineBreakMode = NSLineBreakByWordWrapping;
                textStyle.alignment = NSTextAlignmentLeft;
                
                [event.title dp_drawInRect:CGRectMake(iconX + iconHeight / 2, (self.rowHeight - self.iconEventFont.pointSize) / 2, titleWidth, self.iconEventFont.pointSize) withAttributes:@{NSFontAttributeName:self.iconEventFont, NSParagraphStyleAttributeName:textStyle, NSForegroundColorAttributeName:[UIColor whiteColor]}];
                
                
                [event.icon drawInRect:CGRectMake(iconHeight / 2 + iconX + titleWidth, (self.rowHeight - iconHeight) / 2, iconWidth, iconHeight)];
                iconX += iconWidth + titleWidth + iconWidth + 2 * iconHeight + self.iconEventMarginX;
            }
        } else {
            if (iconX + iconWidth > rect.size.width - daySize.width - DAY_TEXT_RIGHT_MARGIN) {
                //Not enough space
            } else {
                [event.icon drawInRect:CGRectMake(iconX, (self.rowHeight - iconHeight) / 2, iconWidth, iconHeight)];
                iconX += iconWidth + self.iconEventMarginX;
            }
        }
    }
    
    //Draw Events
    for (DPCalendarEvent *event in self.events) {
        
        NSDate *day = self.date;
        
        UIColor *color = [self.eventColors objectAtIndex:event.colorIndex % self.eventColors.count];
        
        if (event.rowIndex == 0 || ((event.rowIndex + 2) * self.rowHeight  > rect.size.height)) {
            eventsNotShowingCount++;
            continue;
        }
        
        
        NSDate *tomorrow = [self.date dateByAddingYears:0 months:0 days:1];
        BOOL isEventEndedToday = [event.endTime compare:tomorrow] == NSOrderedAscending;
        BOOL isEventStartToday = !([event.startTime compare:day] == NSOrderedAscending) || ([event.startTime compare:day] == NSOrderedAscending && [self.date isEqualToDate:self.firstVisiableDateOfMonth]);
        
        float startPosition = isEventStartToday ? EVENT_START_MARGIN : 0;
        float width = isEventStartToday ? (isEventEndedToday ? (size.width - EVENT_START_MARGIN - EVENT_END_MARGIN):(size.width - EVENT_START_MARGIN - pixel) ) : (isEventEndedToday ? (size.width-EVENT_END_MARGIN-pixel) : (size.width-pixel));
        
        if (self.eventDrawingStyle == DPCalendarMonthlyViewEventDrawingStyleBar) {
            //Draw Bar
            [self drawCellWithColor:[color colorWithAlphaComponent:0.2] InRect:CGRectMake(startPosition, event.rowIndex * self.rowHeight + ROW_MARGIN, width, self.rowHeight - ROW_MARGIN) context:context];
        } else {
            //Draw Underline
            [self drawCellWithColor:color InRect:CGRectMake(startPosition, (event.rowIndex + 1) * self.rowHeight, width, 0.5f) context:context];
        }
        
        if (isEventStartToday) {
            //Draw Left line
            [self drawCellWithColor:color InRect:CGRectMake(EVENT_START_MARGIN, event.rowIndex * self.rowHeight + ROW_MARGIN, 2, self.rowHeight - ROW_MARGIN) context:context];
            
            
            [[UIColor blackColor] set];
            [event.title dp_drawInRect:CGRectMake(startPosition + 2 +  EVENT_TITLE_MARGIN, event.rowIndex * self.rowHeight + ROW_MARGIN, rect.size.width - EVENT_END_MARGIN, self.rowHeight - ROW_MARGIN) withAttributes:@{NSFontAttributeName:self.eventFont, NSParagraphStyleAttributeName:textStyle, NSForegroundColorAttributeName:[UIColor colorWithRed:67/255.0f green:67/255.0f blue:67/255.0f alpha:1]}];
        }
        
        
        
    }
    if (eventsNotShowingCount > 0) {
        //show more
        [[NSString stringWithFormat:@"%d more...", eventsNotShowingCount] dp_drawInRect:CGRectMake(5, rect.size.height - self.rowHeight, rect.size.width - 5, self.rowHeight - 2) withAttributes:@{NSFontAttributeName:self.eventFont, NSParagraphStyleAttributeName:textStyle, NSForegroundColorAttributeName:[UIColor colorWithRed:67/255.0f green:67/255.0f blue:67/255.0f alpha:1]}];
    }
    
    
}

-(void)setIsPreviousSelectedCell:(BOOL)isPreviousSelectedCell {
    _isPreviousSelectedCell = isPreviousSelectedCell;
}

@end
