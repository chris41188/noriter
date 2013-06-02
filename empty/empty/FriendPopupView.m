//
//  FriendPopupView.m
//  empty
//
//  Created by echo on 13. 6. 2..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "FriendPopupView.h"

@implementation FriendPopupView

- (id)initWithOwner:(Person*)_owner Frame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        owner = _owner;
        
        UIButton *exitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        exitButton.frame = CGRectMake(self.frame.size.width - 44 - 8, 8, 44, 44);
        [exitButton setTitle:@"exit" forState:UIControlStateNormal];
        //[exitButton setImage:[UIImage imageNamed:@"ic_exit"] forState:UIControlStateNormal];
        [exitButton addTarget:self.friendListViewControllerDelegate action:@selector(popDown) forControlEvents:UIControlEventTouchDown];
        [self addSubview:exitButton];
        
        
        UIButton *chatButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        chatButton.frame = CGRectMake(0, self.frame.size.height/4*3, self.frame.size.width/2, self.frame.size.height/4);
        [chatButton setTitle:@"chat" forState:UIControlStateNormal];
        //[chatButton setImage:[UIImage imageNamed:@"ic_chat"] forState:UIControlStateNormal];
        [self addSubview:chatButton];
        
        UIButton *showCalendarButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        showCalendarButton.frame = CGRectMake(self.frame.size.width/2, self.frame.size.height/4*3, self.frame.size.width/2, self.frame.size.height/4);
        [showCalendarButton setTitle:@"ShowCal." forState:UIControlStateNormal];
        [showCalendarButton addTarget:self action:@selector(showCalendar) forControlEvents:UIControlEventTouchDown];
        [self addSubview:showCalendarButton];
        
        
        
        for (UIView *_view in self.subviews) {
            _view.layer.borderColor = [UIColor redColor].CGColor;
            _view.layer.borderWidth = 1.0f;
        }
        
        self.layer.borderColor = [UIColor redColor].CGColor;
        self.layer.borderWidth = 1.0f;
    }
    return self;
}
-(void)showCalendar
{
    NSLog(@"%@",self.motherViewControllerDelegate);
    [self.motherViewControllerDelegate initMainViewControllerWithOwner:owner];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
