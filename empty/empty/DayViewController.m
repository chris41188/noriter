
//
//  DayViewController.m
//  empty
//
//  Created by echo on 13. 4. 9..
//  Copyright (c) 2013년 echo. All rights reserved.
//
#import "DayViewController.h"


@implementation DayViewController
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
    DB = [DataBase sharedDataBase];
}
-(void)viewDidLayoutSubviews
{
    NSDateComponents * now = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekdayCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit fromDate:[NSDate date]];
    
    TVC = [TableViewController makeChildTVC:self frame:CGRectMake(0, 0, TVC_W, TVC_H)];
    [TVC setData:[[DB.array objectAtIndex:[now month]-1 ] objectAtIndex:[now day]-1]];
    
    SVC = [ScrollViewController makeChildSVC:SVC frame:CGRectMake(STD_W-SVC_W, 0, SVC_W, SVC_H)];
    [SVC setData:[[DB.array objectAtIndex:[now month]-1 ] objectAtIndex:[now day]-1]];
    SVC.TVC = TVC;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
