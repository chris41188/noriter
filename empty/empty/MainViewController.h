//
//  MainViewController.h
//  empty
//
//  Created by echo on 13. 5. 7..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MonthViewController.h"
#import "WeekViewController.h"
#import "DayViewController.h"
#import "DataBase.h"
#import "SideView.h"
@interface MainViewController  : UIViewController <ChildViewControllerDelegate>
{
    UIToolbar *firToolbar;
    UIToolbar *secToolbar;
    MonthViewController *MVC;
    WeekViewController *WVC;
    DayViewController *DVC;
    NSDateComponents *nowComps;
    DataBase *DB;
    SideView *sideView;
}
-(id)initWithDB:(DataBase*)_DB;
@property(nonatomic, strong)DataBase *DB;
@end
