//
//  SideView.h
//  empty
//
//  Created by echo on 13. 5. 16..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "FriendsListViewController.h"

@interface SideViewController : UIViewController
{
    NSInteger ToolbarHeight;
    FriendsListViewController *FLVC;
    Person *owner;
}
@property NSInteger ToolbarHeight;
- (id)initWithFrame:(CGRect)frame ToolbarHeight:(NSInteger)height Onwer:(Person*)_owner;
@property (assign) id <MotherViewControllerDelegate> motherViewControllerDelegate;
@end
