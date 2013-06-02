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
#import "AddTodoViewController.h"
#import "DataBase.h"

extern const NSInteger ToolbarHeight;

@protocol MotherViewControllerDelegate <NSObject>
-(void)slideViews;
@end

@interface MainViewController  : UIViewController <MainViewControllerDelegate>
{

    UIToolbar *firToolbar;
    UIToolbar *secToolbar;
    UIToolbar *naviToolbar;
    MonthViewController *MVC;
    WeekViewController *WVC;
    DayViewController *DVC;
    NSDateComponents *nowComps;
    DataBase *DB;
    UITapGestureRecognizer *tapGesture;
}
-(id)initWithDB:(DataBase*)_DB;
@property (assign) id <MotherViewControllerDelegate> motherViewControllerDelegate;
@property(nonatomic, strong)DataBase *DB;
@property(nonatomic, strong)UITapGestureRecognizer *tapGesture;
-(void)addTap;
-(void)removeTap;
-(void)showDetialViewControllerWithDetailVC:(DetailViewController *)_DetailVC;

@end
