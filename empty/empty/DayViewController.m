
//
//  DayViewController.m
//  empty
//
//  Created by echo on 13. 4. 9..
//  Copyright (c) 2013년 echo. All rights reserved.
//
#import "DayViewController.h"

@interface DayViewController ()

@end

@implementation DayViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    DataBase *DB = [DataBase sharedDataBase];
    NSLog(@"hi");
    NSLog(@"DBinitFinish");
    NSLog(@"getArrayFinish");
    NSLog([NSString stringWithFormat:@"%d",[DB.array count]]);
    NSLog(@"array:%@",DB.array);
    int x = 5;
    int y = 10;
    x = x+y;
    
    NSLog(@"%@",[self childViewControllers]);
    
    for(UIViewController *childViewController in [self childViewControllers])
    {
        if([childViewController isKindOfClass:[TableViewController class]])
        {
            TBC =  (TableViewController*)childViewController;
        }
        else if ([childViewController isKindOfClass:[ScrollViewController class]])
        {
            SVC = (ScrollViewController*)childViewController;
        }
    }
    [TBC loadView];
    [TBC setData:DB.array];
    [SVC loadView];
    [SVC setData:DB.array];
    
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTap:)];
    [self.view addGestureRecognizer:singleFingerTap];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//The event handling method
- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    CGPoint location = [recognizer locationInView:[recognizer.view superview]];
    
    //Do stuff here...
    NSLog(@"%f, %f",(float)location.x,(float)location.y);
}
@end
