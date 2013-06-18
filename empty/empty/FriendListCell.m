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
        UIImageView* backgroundImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [backgroundImageView setImage:[UIImage imageNamed:@"03_back_list_fri.png"]];
        [self addSubview:backgroundImageView];
        
        self.backgroundView = [[UIView alloc] initWithFrame:CGRectZero];
        
        UIImageView *profilePictureImageView = [[UIImageView alloc]initWithImage:owner.i_Picture];
        profilePictureImageView.frame = CGRectMake(3, 3, 38, 38); // 44 * 44
        [self addSubview:profilePictureImageView];
        
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(52, 3, 132, 38)];
        nameLabel.text = owner.s_Name;
        [nameLabel setTextColor:[UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1]];
        [nameLabel setBackgroundColor: [UIColor clearColor]];
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
