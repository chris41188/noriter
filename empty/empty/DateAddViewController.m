//
//  DateAddViewController.m
//  empty
//
//  Created by echo on 13. 6. 13..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "DateAddViewController.h"


@implementation DateAddViewController
#define DACFRAME CGRectMake(0, 0, self.view.frame.size.width, ToolbarHeight * 4)
-(id)init
{
    return [self initWithDateComps:[[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekCalendarUnit|NSWeekdayCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit fromDate:[NSDate date]]];
}
-(id)initWithDateComps:(NSDateComponents *)dateComps
{
    if (self = [super init]) {
        NSLog(@"%@",dateComps);
        self.view = [[FlexibleScrollView alloc]initWithFrame:self.view.frame];
        startDAC = [[DateAddCell alloc]initWithFrame:DACFRAME DateComps:dateComps];
        [self.view addSubview:startDAC];
        
    }
    return self;
}


- (void)myCheckboxToggle:(id)sender
{
    endToogleButton.selected = !endToogleButton.selected; // toggle the selected property, just a simple BOOL
    
    if (endToogleButton.selected)
    {
//        endToogleButton //.image = checkedImaged;
    }
    else
    {
//        myCheckboxButton.image = nonCheckedImage;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
