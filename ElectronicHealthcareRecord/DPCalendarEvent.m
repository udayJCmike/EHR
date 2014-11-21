//
//  DPCalendarEvent.m
//  DPCalendar
//
//  Created by Ethan Fang on 7/01/14.
//  Copyright (c) 2014 Ethan Fang. All rights reserved.
//

#import "DPCalendarEvent.h"

@implementation DPCalendarEvent

-(id)initWithTitle:(NSString *)title startTime:(NSDate *)startTime endTime:(NSDate *)endTime description:(NSString *)description colorIndex:(uint)colorIndex {
    self = [super init];
    if (self) {
        _title = title;
        _startTime = startTime;
        _endTime = endTime;
        _des=description;
        _colorIndex = colorIndex;
    }
    return self;
}

-(NSString *)description {
    return [NSString stringWithFormat:@"Title:%@, StartTime:%@, EndTime:%@, Description:%@, colorIndex:%d", self.title, self.startTime, self.endTime, self.des,self.colorIndex];
}

@end
