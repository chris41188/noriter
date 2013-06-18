//
//  DateAddCell.m
//  empty
//
//  Created by echo on 13. 6. 13..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "DateAddCell.h"

@implementation DateAddCell
@synthesize dateComps;/*
@synthesize yearAndMonthButton = [UIButton buttonWithType:UIButtonTypeRoundedRect]
@synthesize calendarButton = [UIButton buttonWithType:UIButtonTypeRoundedRect]
@synthesize dayButton = [UIButton buttonWithType:UIButtonTypeRoundedRect]
@synthesize weekAndWeekdayButton = [UIButton buttonWithType:UIButtonTypeRoundedRect]
@synthesize useHourCheckButton = [UIButton buttonWithType:UIButtonTypeRoundedRect]
@synthesize hourAndMinuteButton = [UIButton buttonWithType:UIButtonTypeRoundedRect]*/
- (id)initWithFrame:(CGRect)frame DateComps:(NSDateComponents*)_dateComps;
{
    self = [super initWithFrame:frame];
    if (self) {
        
        yearButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        yearButton.frame = CGRectMake(MarginWidth, MarginHeight, self.frame.size.width - MarginWidth * 2 - (ToolbarHeight + MarginWidth), ToolbarHeight);
        [self addSubview:yearButton];

        calendarButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        calendarButton.frame = CGRectMake(self.frame.size.width - MarginWidth - ToolbarHeight,
                                        MarginHeight,
                                          ToolbarHeight,
                                          ToolbarHeight);
        [self addSubview:calendarButton];
        
        monthAndDayButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        monthAndDayButton.frame = CGRectMake(MarginWidth, yearButton.frame.origin.y + yearButton.frame.size.height + MarginHeight, self.frame.size.width - MarginWidth * 2, ToolbarHeight);
        [self addSubview:monthAndDayButton];
        
//        weekAndWeekdayButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        useHourCheckButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        useHourCheckButton.frame = CGRectMake(MarginWidth, monthAndDayButton.frame.origin.y + monthAndDayButton.frame.size.height + MarginHeight, ToolbarHeight, ToolbarHeight);
        [self addSubview:useHourCheckButton];
        
        hourAndMinuteButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        hourAndMinuteButton.frame = CGRectMake(useHourCheckButton.frame.origin.x + useHourCheckButton.frame.size.width + MarginWidth, useHourCheckButton.frame.origin.y, self.frame.size.width - useHourCheckButton.frame.size.width - 3 * MarginWidth, ToolbarHeight);
        [self addSubview:hourAndMinuteButton];
        
        [self setDateComps:_dateComps];
    }
    return self;
}
- (void)setDateComps:(NSDateComponents *)_dateComps
{
    dateComps = _dateComps;
    
    [self setYear:dateComps.year];
    [self setMonth:dateComps.month Day:dateComps.day];
    [self setHour:dateComps.hour Minute:dateComps.minute];
}
- (void)setYear:(NSInteger)_year
{
    dateComps.year = _year;
    
    [yearButton setTitle:[NSString stringWithFormat:@"%4d년",_year] forState:UIControlStateNormal];
}
-(void)setMonth:(NSInteger)_month Day:(NSInteger)_day
{
    dateComps.month = _month;
    dateComps.day = _day;
    
    [monthAndDayButton setTitle:[NSString stringWithFormat:@"%2d월 %2d일(%@)",_month ,_day, [Schedule getWeekDaySymbolWithWeekday:[Schedule getWeekdayWithYear:dateComps.year Month:dateComps.month Day:dateComps.day]] ]  forState:UIControlStateNormal];
    
    // week and weekday setting.
}
-(void)setHour:(NSInteger)_hour Minute:(NSInteger)_minute
{
    dateComps.hour = _hour;
    dateComps.minute = _minute;
    
    [hourAndMinuteButton setTitle:[NSString stringWithFormat:@"%2d시 %2d분",_hour ,_minute] forState:UIControlStateNormal];
}
/*
-(void)setWeek:(NSInteger)_week Weekday:(NSInteger)_weekday
{
    weekAndWeekdayButton.titleLabel.text = [NSString stringWithFormat:@"%d주 %@요일",_week,[Schedule getWeekDaySymbolWithWeekday:_weekday]];
    dateComps.week = _week;
    dateComps.weekday = _weekday;
    
    // set Day
}*/
-(void)checkHour
{
    useHourCheckButton.selected = !useHourCheckButton.selected;
    if (useHourCheckButton.selected)
    {
        //        endToogleButton //.image = checkedImaged;
    }
    else
    {
        //        myCheckboxButton.image = nonCheckedImage;
    }
}
@end
