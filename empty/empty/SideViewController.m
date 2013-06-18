//
//  SideView.m
//  empty
//
//  Created by echo on 13. 5. 16..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "SideViewController.h"

@implementation SideViewController
@synthesize ToolbarHeight;

- (id)initWithFrame:(CGRect)frame ToolbarHeight:(NSInteger)height Onwer:(Person*)_owner
{
    self = [super init];
    if (self) {
        
        NSLog(@"SideView : Init Side View");
        
        self.view.frame = frame;
        ToolbarHeight = height;
        owner = _owner;
        
        // Initialization code
        [self initFirstToolbar];
        [self initSecondToolbar];
        [self initFriendList];
        
    }
    return self;
}
-(void)initFriendList
{
    FLVC = [[FriendsListViewController alloc] initWithOwner:owner];
    FLVC.motherViewControllerDelegate = self.motherViewControllerDelegate;
    NSLog(@"SVC's mvcd = %@ , flvc's mvcd = %@",self.motherViewControllerDelegate,FLVC.motherViewControllerDelegate);
    FLVC.view.frame = CGRectMake(0, ToolbarHeight*2, self.view.frame.size.width, self.view.frame.size.height-2*ToolbarHeight);
    [self.view addSubview:FLVC.view];
}
-(void)initSecondToolbar
{
    NSLog(@"SideView : Init First Toolbar");
    
    UIView *secondToolbar = [[UIView alloc] initWithFrame:CGRectMake(0, ToolbarHeight, self.view.frame.size.width, ToolbarHeight)];
    //UIToolbar *secondToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, ToolbarHeight, self.view.frame.size.width, ToolbarHeight)];
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, ToolbarHeight)];
    [backgroundImageView setImage:[UIImage imageNamed:@"03_back_02.png"]];
    
    UIButton *friendsListButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [friendsListButton setFrame:CGRectMake(0, 0, ToolbarHeight, ToolbarHeight)];
    [friendsListButton setImage:[UIImage imageNamed:@"ic_friendslist.png"] forState:UIControlStateNormal];
    //    [profilePictureChangeButton addTarget:self action:@selector(popNavi) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *friendsListBarButton = [[UIBarButtonItem alloc] initWithCustomView:friendsListButton];
        NSLog(@"%@",friendsListButton.imageView.image);
    UIImageView *lineImageView_1 = [[UIImageView alloc]initWithFrame:CGRectMake(ToolbarHeight + 1, 0, 1, ToolbarHeight)];
    [lineImageView_1 setImage:[UIImage imageNamed:@"03_lin_02.png"]];
    
    
    UIButton *chatListButton = [UIButton buttonWithType:UIButtonTypeCustom];

    [chatListButton setFrame:CGRectMake(ToolbarHeight + 2, 0, ToolbarHeight, ToolbarHeight)];
    [chatListButton setImage:[UIImage imageNamed:@"ic_chatlist.png"] forState:UIControlStateNormal];
    //    [profileInfoChangeButton addTarget:self action:@selector(popNavi) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *chatListBarButton = [[UIBarButtonItem alloc] initWithCustomView:chatListButton];
    
    UIImageView *lineImageView_2 = [[UIImageView alloc]initWithFrame:CGRectMake(ToolbarHeight * 2 + 2, 0, 1, ToolbarHeight)];
    [lineImageView_2 setImage:[UIImage imageNamed:@"03_lin_02.png"]];
    
    
    UIButton *searchListButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [searchListButton setFrame:CGRectMake(ToolbarHeight * 2 + 3, 0, ToolbarHeight, ToolbarHeight)];
    [searchListButton setImage:[UIImage imageNamed:@"ic_search.png"] forState:UIControlStateNormal];
    //    [profileInfoChangeButton addTarget:self action:@selector(popNavi) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *searchListBarButton = [[UIBarButtonItem alloc] initWithCustomView:searchListButton];
    

    UIImageView *lineImageView_3 = [[UIImageView alloc]initWithFrame:CGRectMake(ToolbarHeight * 3 + 3, 0, 1, ToolbarHeight)];
    [lineImageView_3 setImage:[UIImage imageNamed:@"03_lin_02.png"]];
    
    
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                      target:nil
                                      action:nil];
    
    
    [self.view addSubview:secondToolbar];
    [secondToolbar addSubview:backgroundImageView];
    [secondToolbar addSubview:friendsListButton];
    [secondToolbar addSubview:chatListButton];
    [secondToolbar addSubview:searchListButton];
    [secondToolbar addSubview:lineImageView_1];
    [secondToolbar addSubview:lineImageView_2];
    [secondToolbar addSubview:lineImageView_3];
    
    //[secondToolbar setItems:[[NSArray alloc] initWithObjects: friendsListBarButton,chatListBarButton,searchListBarButton, nil] animated:YES];
}

-(void)initFirstToolbar
{
    NSLog(@"SideView : Init First Toolbar");
    
    UIView *firstToolbar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, ToolbarHeight)];
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, ToolbarHeight)];

    [backgroundImageView setImage:[UIImage imageNamed:@"03_back_01.png"]];
    
    
    UIButton *profilePictureChangeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [profilePictureChangeButton setFrame:CGRectMake(0, 0, ToolbarHeight, ToolbarHeight)];
    [profilePictureChangeButton setImage:[UIImage imageNamed:@"03_ic_me.png"] forState:UIControlStateNormal];
    //    [profilePictureChangeButton addTarget:self action:@selector(popNavi) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *profileNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(ToolbarHeight + 7, 0, self.view.frame.size.width-ToolbarHeight*2, ToolbarHeight)];
    profileNameLabel.text = owner.s_Name;
    profileNameLabel.backgroundColor = [UIColor clearColor];
    profileNameLabel.textColor = [UIColor whiteColor];
    
    
    UIButton *profileInfoEditButton = [UIButton buttonWithType:UIButtonTypeCustom];

    [profileInfoEditButton setFrame:CGRectMake(self.view.frame.size.width - ToolbarHeight, 0, ToolbarHeight, ToolbarHeight)];
    [profileInfoEditButton setImage:[UIImage imageNamed:@"03_ic_edit.png"] forState:UIControlStateNormal];
    //    [profileInfoChangeButton addTarget:self action:@selector(popNavi) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *lineImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width - ToolbarHeight - 1, 0, 1, ToolbarHeight)];
    [lineImageView setImage:[UIImage imageNamed:@"03_lin_01.png"]];
    
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                      target:nil
                                      action:nil];
    
    [self.view addSubview:firstToolbar];
    [firstToolbar addSubview:backgroundImageView];
    [firstToolbar addSubview:profilePictureChangeButton];
    [firstToolbar addSubview:profileNameLabel];
    [firstToolbar addSubview:profileInfoEditButton];
    [firstToolbar addSubview:lineImageView];    
//    [firstToolbar setItems:[[NSArray alloc] initWithObjects:ProfilePictureChangeBarButton,flexibleSpace,profileNameBarButton,flexibleSpace,ProfileInfoEditBarButton, nil] animated:YES];
    
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
