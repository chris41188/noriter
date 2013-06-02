//
//  FriendListCell.m
//  empty
//
//  Created by echo on 13. 6. 2..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "FriendListCell.h"

@implementation FriendListCell
@synthesize owner;

- (id)initWithOwner:(Person*)_owner
{
    if(self = [super init])
    {
        owner = _owner;
        UIImageView *profilePictureImageView = [[UIImageView alloc]initWithImage:owner.i_Picture];
        profilePictureImageView.frame = CGRectMake(3, 3, 38, 38); // 44 * 44
        [self addSubview:profilePictureImageView];
        
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(52, 3, 132, 38)];
        nameLabel.text = owner.s_Name;
        [self addSubview:nameLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    if(selected)
    {
        [self.friendListViewControllerDelegate popupWithFriend:owner];
        self.selected = NO;
    }
    // Configure the view for the selected state
}

@end
