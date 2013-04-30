//
//  WeekViewController.h
//  empty
//
//  Created by echo on 13. 4. 16..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataBase.h"
#import "TableViewController.h"
#import "ScrollViewController.h"
@interface WeekViewController : UIViewController
{
    DataBase *DB;
    NSMutableArray *arrSVC;
    TableViewController *TVC;
}
@end
