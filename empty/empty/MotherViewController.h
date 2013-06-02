//
//  MotherViewController.h
//  empty
//
//  Created by echo on 13. 5. 22..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "SideViewController.h"
#import "DataBase.h"

extern const NSInteger ToolbarHeight;

@interface MotherViewController : UIViewController <MotherViewControllerDelegate>
{
    MainViewController *mainViewController;
    SideViewController *sideViewController;
    DataBase *db;
    Person *owner;
    bool isSlided;
}
-(void)initMainViewControllerWithOwner:(Person*)_owner;
@end
