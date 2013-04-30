//
//  MonthDayViewController.h
//  empty
//
//  Created by echo on 13. 4. 29..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "MonthViewController.h"
@interface MonthDayViewController : UIViewController
{
    NSMutableArray *data;
    NSInteger row;
    NSInteger col;
}
-(void)setData:(NSMutableArray*)array;
@property NSInteger row;
@property NSInteger col;
@property (nonatomic,strong) IBOutlet UILabel *label;
@end
