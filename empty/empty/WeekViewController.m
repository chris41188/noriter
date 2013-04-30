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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    DB = [DataBase sharedDataBase];
    arrSVC = [[NSMutableArray alloc]init];
	int i=0;
    NSDateComponents * now = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekdayCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit fromDate:[NSDate date]];
    
    // Calculate when, according to Tom Lehrer, World War III will end
    for(UIViewController *childViewController in [self childViewControllers])
    {
        if([childViewController isKindOfClass:[ScrollViewController class]])
        {
            ScrollViewController *SVC = (ScrollViewController*)childViewController;
            [arrSVC addObject:SVC];
            
            NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
            [offsetComponents setDay:-[now weekday]+1+i++];
            NSDateComponents *dateComponent = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekdayCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit fromDate:[[NSCalendar currentCalendar] dateByAddingComponents:offsetComponents toDate:[NSDate date] options:0]];
            NSLog(@"%@",dateComponent);
            [SVC setData:[[DB.array objectAtIndex:[dateComponent month]-1 ] objectAtIndex:[dateComponent day]-1]];
            
            SVC.TVC = TVC;
        }
        else if ([childViewController isKindOfClass:[TableViewController class]])
        {
            TVC = (TableViewController*)childViewController;
        }
    }
    [TVC setData:[[DB.array objectAtIndex:[now month]-1 ] objectAtIndex:[now day]-1]];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
