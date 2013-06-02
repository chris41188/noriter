//
//  FriendListCell.h
//  empty
//
//  Created by echo on 13. 6. 2..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "FriendPopupView.h"

@interface FriendListCell : UITableViewCell
{
    Person *owner;
}
@property (strong, nonatomic) Person *owner;
- (id)initWithOwner:(Person*)_owner;
@property (assign) id <FriendListViewControllerDelegate> friendListViewControllerDelegate;

@end
