//
//  FriendPopupView.h
//  empty
//
//  Created by echo on 13. 6. 2..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import "Person.h"
#import "DataBase.h"
@protocol MotherViewControllerDelegate <NSObject>
-(void)initMainViewControllerWithOwner:(Person*)_owner;
@end

@protocol FriendListViewControllerDelegate <NSObject>
-(void)popDown;
-(void)popupWithFriend:(Person *)_friend;
@end
@interface FriendPopupView : UIView
{
    Person *owner;
}
- (id)initWithOwner:(Person*)_owner Frame:(CGRect)frame;
@property (assign) id <FriendListViewControllerDelegate> friendListViewControllerDelegate;

@property (assign) id <MotherViewControllerDelegate> motherViewControllerDelegate;
@end
