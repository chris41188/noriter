//
//  WeekViewController.m
//  empty
//
//  Created by echo on 13. 4. 16..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "WeekViewController.h"

@interface WeekViewController ()

@end

@implementation WeekViewController

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
    DB = [DataBase sharedDataBase];
    
}
-(void)viewDidLayoutSubviews
{
    arrSVC = [[NSMutableArray alloc]init];
	int i=0;
    NSDateComponents * now = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekdayCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit fromDate:[NSDate date]];
    TVC = [TableViewController makeChildTVC:self frame:CGRectMake(0, STD_H-TVC_H, TVC_W, TVC_H)];
    [TVC setData:[[DB.array objectAtIndex:[now month]-1 ] objectAtIndex:[now day]-1]];
    
    for(i=0;i<7;i++)
    {
        ScrollViewController *SVC = [ScrollViewController makeChildSVC:self frame:CGRectMake(SVC_W*i, 0, SVC_W, SVC_H)];
        
        [arrSVC addObject:SVC];
        
        NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
        [offsetComponents setDay:-[now weekday]+1+i];
        NSDateComponents *dateComponent = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekdayCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit fromDate:[[NSCalendar currentCalendar] dateByAddingComponents:offsetComponents toDate:[NSDate date] options:0]];
        [SVC setData:[[DB.array objectAtIndex:[dateComponent month]-1 ] objectAtIndex:[dateComponent day]-1]];
        
        SVC.TVC = TVC;
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
