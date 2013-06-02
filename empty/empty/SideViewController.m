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
    
    
    UIToolbar *secondToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, ToolbarHeight, self.view.frame.size.width, ToolbarHeight)];
    
    
    UIButton *friendsListButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *friendsListImage = [UIImage imageNamed:@"ic_friendslist.png"];
    [friendsListButton setFrame:CGRectMake(0, 0, ToolbarHeight, ToolbarHeight)];
    [friendsListButton setImage:friendsListImage forState:UIControlStateNormal];
    //    [profilePictureChangeButton addTarget:self action:@selector(popNavi) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *friendsListBarButton = [[UIBarButtonItem alloc] initWithCustomView:friendsListButton];
    
    
    UIButton *chatListButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *chatListImage = [UIImage imageNamed:@"ic_chatlist.png"];
    [chatListButton setFrame:CGRectMake(0, 0, ToolbarHeight, ToolbarHeight)];
    [chatListButton setImage:chatListImage forState:UIControlStateNormal];
    //    [profileInfoChangeButton addTarget:self action:@selector(popNavi) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *chatListBarButton = [[UIBarButtonItem alloc] initWithCustomView:chatListButton];
    
    
    UIButton *searchListButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *searchListImage = [UIImage imageNamed:@"ic_search.png"];
    [searchListButton setFrame:CGRectMake(0, 0, ToolbarHeight, ToolbarHeight)];
    [searchListButton setImage:searchListImage forState:UIControlStateNormal];
    //    [profileInfoChangeButton addTarget:self action:@selector(popNavi) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *searchListBarButton = [[UIBarButtonItem alloc] initWithCustomView:searchListButton];
    
    
    
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                      target:nil
                                      action:nil];
    
    
    [self.view addSubview:secondToolbar];
    
    [secondToolbar setItems:[[NSArray alloc] initWithObjects: friendsListBarButton,chatListBarButton,searchListBarButton, nil] animated:YES];
}

-(void)initFirstToolbar
{
    NSLog(@"SideView : Init First Toolbar");
    
    
    UIToolbar *firstToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, ToolbarHeight)];
    
    UIButton *profilePictureChangeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *profilePictureChangeImage = [UIImage imageNamed:@"ic_profilepicturechange.png"];
    [profilePictureChangeButton setFrame:CGRectMake(0, 0, ToolbarHeight, ToolbarHeight)];
    [profilePictureChangeButton setImage:profilePictureChangeImage forState:UIControlStateNormal];
    //    [profilePictureChangeButton addTarget:self action:@selector(popNavi) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *ProfilePictureChangeBarButton = [[UIBarButtonItem alloc] initWithCustomView:profilePictureChangeButton];
    
    
    UILabel *profileNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(ToolbarHeight, 0, self.view.frame.size.width-ToolbarHeight*2, ToolbarHeight)];
    profileNameLabel.text = owner.s_Name;
    UIBarButtonItem *profileNameBarButton = [[UIBarButtonItem alloc] initWithCustomView:profileNameLabel];
    
    
    UIButton *profileInfoEditButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *profileInfoEditImage = [UIImage imageNamed:@"ic_profileinfoedit"];
    [profileInfoEditButton setFrame:CGRectMake(0, 0, ToolbarHeight, ToolbarHeight)];
    [profileInfoEditButton setImage:profileInfoEditImage forState:UIControlStateNormal];
    //    [profileInfoChangeButton addTarget:self action:@selector(popNavi) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *ProfileInfoEditBarButton = [[UIBarButtonItem alloc] initWithCustomView:profileInfoEditButton];
    
    
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                      target:nil
                                      action:nil];
    
    
    [self.view addSubview:firstToolbar];
    
    [firstToolbar setItems:[[NSArray alloc] initWithObjects:ProfilePictureChangeBarButton,flexibleSpace,profileNameBarButton,flexibleSpace,ProfileInfoEditBarButton, nil] animated:YES];
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
