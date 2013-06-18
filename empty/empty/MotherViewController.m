//
//  MotherViewController.m
//  empty
//
//  Created by echo on 13. 5. 22..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "MotherViewController.h"

@implementation MotherViewController

-(id)init
{
    if (self = [super init]) {
        isSlided = false;
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    Person *Namse = [[Person alloc]init];
    Namse.s_ID = @"skatpgus";
    Namse.s_Name = @"남세현";
    Namse.i_Picture = [UIImage imageNamed:@"Namse.jpg"];

    Person *friendAlpha = [[Person alloc]init];
    friendAlpha.s_ID = @"skatpgusAlpha";
    friendAlpha.s_Name = @"Alpha";
    friendAlpha.i_Picture = [UIImage imageNamed:@"Namse.jpg"];

    Person *friendBeta = [[Person alloc]init];
    friendBeta.s_ID = @"skatpgusBeta";
    friendBeta.s_Name = @"Beta";
    friendBeta.i_Picture = [UIImage imageNamed:@"Namse.jpg"];

    [Namse.ma_Friends addObject:friendAlpha];
    [friendAlpha.ma_Friends addObject:Namse];
    [Namse.ma_Friends addObject:friendBeta];
    [friendBeta.ma_Friends addObject:Namse];
    //temp DB
    db = [[DataBase alloc] initWithOwner:Namse];
    owner = Namse;
    
    
    [self initMainViewControllerWithOwner:Namse];
    NSLog(@"main view is : %@",mainViewController.view);
    NSLog(@"mother view is : %@",self.view);
}
-(void)initMainViewControllerWithOwner:(Person*)_owner
{
    mainViewController = [[MainViewController alloc]initWithDB:[[DataBase alloc] initWithOwner:_owner]];
    CGRect newFrame = mainViewController.view.frame;
    newFrame.origin.y = 0;
    mainViewController.view.frame = newFrame;
    [self.view addSubview:mainViewController.view];
    
    mainViewController.motherViewControllerDelegate = self;
    
    if(sideViewController != nil)
        [self slideViews];
}
-(void)slideViews
{
    NSLog(@"Slide Side View");
    
    
    if(sideViewController == nil)
    {
        CGRect newFrame = self.view.frame;
        newFrame.size.width *= 0.8;
        newFrame.origin.x = -newFrame.size.width;
        newFrame.origin.y = 0;
        sideViewController = [SideViewController alloc];
        sideViewController.motherViewControllerDelegate = self;
        sideViewController = [sideViewController initWithFrame:newFrame ToolbarHeight:ToolbarHeight Onwer:owner];
        NSLog(@"side view is : %@",sideViewController);
        [self.view addSubview:sideViewController.view];
        NSLog(@"%@",self.view.superview);
    }
    
    
    NSLog(@"Slide Views");
    
    CGRect mainDestination = mainViewController.view.frame;
    CGRect sideDestination = sideViewController.view.frame;
    
    if (isSlided == false) {
        [mainViewController addTap];
        mainDestination.origin.x = sideViewController.view.frame.size.width;
        sideDestination.origin.x = 0;
        NSLog(@"%@",mainViewController.view.gestureRecognizers);        
    }
    else{
        [mainViewController removeTap];
        mainDestination.origin.x = 0;
        sideDestination.origin.x = -sideViewController.view.frame.size.width;
        NSLog(@"%@",mainViewController.view.gestureRecognizers);
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        
        mainViewController.view.frame = mainDestination;
        sideViewController.view.frame = sideDestination;
    } completion:^(BOOL finished) {
                isSlided = !isSlided;
        //self.userInteractionEnabled = !(destination.origin.x > 0);
        
    }];
}
-(void)touchedMainView:(UIGestureRecognizer *)gestureRecognizer
{
    if(isSlided == true)
        [self slideViews];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
