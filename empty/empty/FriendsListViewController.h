//
//  FriendsListViewController.h
//  empty
//
//  Created by echo on 13. 5. 22..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import "Person.h"
#import "FriendListCell.h"
#import "FriendPopupView.h"
@interface FriendsListViewController : UITableViewController<FriendListViewControllerDelegate>
{
    Person *owner;
    bool isPoped;
    FriendPopupView *friendPopupView;
    UITapGestureRecognizer *tap;
    UISearchBar *searchBar;
    bool isSearching;
}
@property (strong, nonatomic) Person *owner;
@property (strong, nonatomic)     FriendPopupView *friendPopupView;
- (id)initWithOwner:(Person*)_owner;
-(void)popupWithFriend:(Person*)_friend;
-(void)PopDown;
@property (assign) id <MotherViewControllerDelegate> motherViewControllerDelegate;
@end
