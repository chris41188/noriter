
//
//  DayViewController.m
//  empty
//
//  Created by echo on 13. 4. 9..
//  Copyright (c) 2013년 echo. All rights reserved.
//
#import "DayViewController.h"


@implementation DayViewController
@synthesize DB;
@synthesize TVC;
#define TVC_W_P 0.9
#define SVC_W_P 0.1
#define TVC_H_P 1
#define SVC_H_P 1
#define STD_W self.view.frame.size.width
#define STD_H self.view.frame.size.height
#define TVC_W TVC_W_P*STD_W
#define SVC_W SVC_W_P*STD_W
#define TVC_H TVC_H_P*STD_H
#define SVC_H SVC_H_P*STD_H
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
-(id)initWithDB:(DataBase *)_DB Frame:(CGRect)frame
{
    self = [super init];
    if(self)
    {
        DB = _DB;
        self.view.frame = frame;
        
        dateComps = [[NSDateComponents alloc]init];
        [dateComps setYear:2013];
        [dateComps setDay:1];
        [dateComps setMonth:1];
        [dateComps setWeek:1];
        TVC = [TableViewController makeChildTVCByParent:self DB:DB frame:CGRectMake(0, 0, TVC_W, TVC_H)];
        
        SVC = [ScrollViewController makeChildSVCByParent:self DB:DB frame:CGRectMake(STD_W-SVC_W, 0, SVC_W, SVC_H)];
        SVC.TVC = TVC;
        
        [self setDateWithMonth:[dateComps month] Day:[dateComps day]];
    }
    return self;
}
-(void)setDateWithMonth:(int)month Day:(int)day
{
    [dateComps setMonth:month];
    [dateComps setDay:day];
    NSDate *date = [[NSCalendar currentCalendar] dateFromComponents:dateComps];
    dateComps = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekCalendarUnit|NSWeekdayCalendarUnit|NSDayCalendarUnit fromDate:date];
    
    [SVC setDataWithMonth:[dateComps month] Day:[dateComps day]];
    [TVC setDataWithMonth:[dateComps month] Day:[dateComps day]];
    
}
-(void)viewDidLayoutSubviews
{
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
