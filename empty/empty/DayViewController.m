
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
    //NSLog(@"hi");
    //NSLog(@"DBinitFinish");
    //NSLog(@"getArrayFinish");
    //NSLog([NSString stringWithFormat:@"%d",[DB.array count]]);
    //NSLog(@"array:%@",DB.array);
    int x = 5;
    int y = 10;
    x = x+y;
    
    //NSLog(@"%@",[self childViewControllers]);
    
    for(UIViewController *childViewController in [self childViewControllers])
    {
        if([childViewController isKindOfClass:[TableViewController class]])
        {
            TVC =  (TableViewController*)childViewController;
        }
        else if ([childViewController isKindOfClass:[ScrollViewController class]])
        {
            SVC = (ScrollViewController*)childViewController;
        }
    }
    [TVC loadView];
    [TVC setData:DB.array];
    
    for(UIView *childView in self.view.subviews)
    {
        childView.userInteractionEnabled = YES;
        //if([childView isKindOfClass:[ScrollView class]])
        //{
        // TBC =  (*)childViewController;
        //}
        if ([childView isKindOfClass:[ScrollView class]])
        {
            SV = (ScrollView*)childView;
        }
    }
    [SVC setData:DB.array];
    SVC.TVC = TVC;
}
- (BOOL) gestureRecognizer:(UIGestureRecognizer*)gestureRecognizer shouldReceiveTouch:(UITouch *)touch;
{
    return (touch.view == self.view);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
