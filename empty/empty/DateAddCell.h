//
//  DateAddCell.h
//  empty
//
//  Created by echo on 13. 6. 13..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Schedule.h"
extern const NSInteger ToolbarHeight;
extern const NSInteger MarginHeight;
extern const NSInteger MarginWidth;

@interface DateAddCell : UIView
{
    NSDateComponents *dateComps;
    UIButton *yearButton;
    UIButton *calendarButton;
    UIButton *monthAndDayButton;
//    UIButton *weekAndWeekdayButton;
    UIButton *useHourCheckButton;
    UIButton *hourAndMinuteButton;
}
@property (nonatomic)  NSDateComponents *dateComps;/*
@property (nonatomic)  UIButton *yearAndMonthButton;
@property (nonatomic)  UIButton *calendarButton;
@property (nonatomic)  UIButton *dayButton;
@property (nonatomic)  UIButton *weekAndWeekdayButton;
@property (nonatomic)  UIButton *useHourCheckButton;
@property (nonatomic)  UIButton *hourAndMinuteButton;*/
- (id)initWithFrame:(CGRect)frame DateComps:(NSDateComponents*)_datecomps;
@end
