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

@interface MonthDayView : UIView
{
    NSMutableArray *data;
    NSInteger row;
    NSInteger col;
    id MVC;
}
@property (nonatomic, strong) id MVC;
-(void)setData:(NSMutableArray*)array;
@property NSInteger row;
@property NSInteger col;
@property (nonatomic,strong) IBOutlet UILabel *label;
@end
