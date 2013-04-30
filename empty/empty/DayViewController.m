
//
//  DayViewController.m
//  empty
//
//  Created by echo on 13. 4. 9..
//  Copyright (c) 2013년 echo. All rights reserved.
//
#import "DayViewController.h"


@implementation DayViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    DataBase *DB = [DataBase sharedDataBase];
    
    for(UIViewController *childViewController in [self childViewControllers])
    {
        if([childViewController isKindOfClass:[TableViewController class]])
        {
            TVC = (TableViewController*)childViewController;
        }
        else if ([childViewController isKindOfClass:[ScrollViewController class]])
        {
            SVC = (ScrollViewController*)childViewController;
        }
    }
    [TVC loadView];
    SVC.TVC = TVC;

    NSDateComponents * now = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekdayCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit fromDate:[NSDate date]];
    NSLog(@"%@",now);
    [TVC setData:[[DB.array objectAtIndex:[now month]-1 ] objectAtIndex:[now day]-1]];
    [SVC setData:[[DB.array objectAtIndex:[now month]-1 ] objectAtIndex:[now day]-1]];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
