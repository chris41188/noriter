//
//  WeekViewController.m
//  empty
//
//  Created by echo on 13. 4. 16..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "WeekViewController.h"

@implementation WeekViewController
@synthesize TVC;
@synthesize DB;
#define TVC_W_P 1
#define TVC_H_P 0.5

#define SVC_W_P 1.0/7.0
#define SVC_H_P 0.5

#define STD_W self.view.frame.size.width
#define STD_H self.view.frame.size.height

#define TVC_W TVC_W_P*STD_W
#define TVC_H TVC_H_P*STD_H

#define SVC_W SVC_W_P*STD_W
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
        nowDateComps = [[NSDateComponents alloc]init];
        [nowDateComps setYear:2013];
        [nowDateComps setDay:1];
        [nowDateComps setMonth:1];
        [nowDateComps setWeek:1];
        
        arrSVC = [[NSMutableArray alloc]init];
        int i=0;
        TVC = [TableViewController makeChildTVCByParent:self DB:DB frame:CGRectMake(0, SVC_H, TVC_W, TVC_H)];
        
        for(i=0;i<7;i++)
        {
            ScrollViewController *SVC = [ScrollViewController makeChildSVCByParent:self DB:DB frame:CGRectMake(SVC_W*i, 0, SVC_W, SVC_H)];
            
            [arrSVC addObject:SVC];
            
            
            SVC.TVC = TVC;
        }
        [self setDateWithMonth:[nowDateComps month] Day:[nowDateComps day]];
    }
    return self;
}
-(void)setDateWithMonth:(int)month Day:(int)day
{
    [nowDateComps setMonth:month]; 
    [nowDateComps setDay:day];
    NSDate *date = [[NSCalendar currentCalendar] dateFromComponents:nowDateComps];
    nowDateComps = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekCalendarUnit|NSWeekdayCalendarUnit|NSDayCalendarUnit fromDate:date];
    
    [TVC setDataWithMonth:[nowDateComps month] Day:[nowDateComps day] ];
    for(int i=0;i<7;i++)
    {
        ScrollViewController *SVC = [arrSVC objectAtIndex:i];
        NSDateComponents *offsetComps = [[NSDateComponents alloc] init];
        [offsetComps setDay:-[nowDateComps weekday]+1+i];
        NSDateComponents *dateComps = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekdayCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit fromDate:[[NSCalendar currentCalendar] dateByAddingComponents:offsetComps toDate:[NSDate date] options:0]];
        [SVC setDataWithMonth:[dateComps month] Day:[dateComps day]];
    }
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
