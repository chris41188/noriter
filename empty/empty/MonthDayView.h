//
//  MonthDayView.h
//  empty
//
//  Created by echo on 13. 4. 29..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "MonthViewController.h"
#import "Schedule.h"
@interface MonthDayView : UIView
{
    NSMutableArray *data;
    NSInteger row;
    NSInteger col;
    UILabel *label;
    id MVC;
    NSDateComponents *dateComps;
}
@property (nonatomic) NSDateComponents *dateComps;

@property (nonatomic, strong) id MVC;
-(void)setMonth:(NSInteger)_month Day:(NSInteger)_day;
-(void)setData:(NSMutableArray*)array;
@property NSInteger row;
@property NSInteger col;
@property (nonatomic, strong) UILabel* label;
@end
