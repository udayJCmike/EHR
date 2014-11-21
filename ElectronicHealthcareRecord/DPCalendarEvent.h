//
//  DPCalendarEvent.h
//  DPCalendar
//
//  Created by Ethan Fang on 7/01/14.
//  Copyright (c) 2014 Ethan Fang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DPCalendarEvent : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *des;
@property (nonatomic, strong) NSDate *startTime;
@property (nonatomic, strong) NSDate *endTime;

@property (nonatomic) uint colorIndex;

@property (nonatomic, assign) uint rowIndex;

-(id)initWithTitle:(NSString *)title startTime:(NSDate *)startTime endTime:(NSDate *)endTime description:(NSString *)description colorIndex:(uint)colorIndex;
@end
