//
//  MonthViewController.h
//  empty
//
//  Created by echo on 13. 4. 29..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MonthDayViewController.h"
#import "MonthDayView.h"
#import "DataBase.h"
@interface MonthViewController : UIViewController
{
    DataBase *DB;
    NSMutableArray *arrMDVC;
    NSMutableArray *arrMDV;
    NSInteger intActioning;
    NSInteger preCol,preRow;
    BOOL isOpen;
}
-(void)expandRow:(int)row Col:(int)col;
@end
