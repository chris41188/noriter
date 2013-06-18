//
//  MainViewController.m
//  empty
//
//  Created by echo on 13. 5. 7..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController
@synthesize DB;
@synthesize tapGesture;

-(id)initWithDB:(DataBase *)_DB
{
    self = [super init];
    if(self)
    {
        DB = _DB;
        
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated
{
    nowComps = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekdayCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit fromDate:[NSDate date]];
    [self.view setBackgroundColor:[UIColor colorWithRed:0.851 green:0.851 blue:0.851 alpha:1]];
    [self initTap];
    [self initNaviItems];
    [self initfirToolbar];
    [self initsecToolbar];
    [self initMVC];
    [self initWVC];
    [self initDVC];
    [self showMVC];
}
-(void)showMVC
{
    [MVC.view setHidden:NO];
    [WVC.view setHidden:YES];
    [DVC.view setHidden:YES];
}

-(void)showWVC
{
    [MVC.view setHidden:YES];
    [WVC.view setHidden:NO];
    [DVC.view setHidden:YES];
}

-(void)showDVC
{
    [MVC.view setHidden:YES];
    [WVC.view setHidden:YES];
    [DVC.view setHidden:NO];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void)initDVC
{
    if(DVC != nil)
    {
        NSLog(@"Already has DVC");
        return;
    }
    
    NSLog(@"Setting DVC");
    DVC = [[DayViewController alloc]initWithDB:DB Frame:CGRectMake(0,ToolbarHeight*3 + 8.5, self.view.frame.size.width, self.view.frame.size.height-ToolbarHeight*3)];
    [self addChildViewController:DVC];
    [self.view addSubview:DVC.view];
    [DVC didMoveToParentViewController:self];
    [DVC setDateWithMonth:[nowComps month] Day:[nowComps day]];
    [DVC.view setHidden:YES];
    DVC.TVC.mainViewControllerDelegate = self;
}
-(void)initWVC
{
    if(WVC != nil)
    {
        NSLog(@"Already has WVC");
        return;
    }
    
    NSLog(@"Setting WVC");
    WVC = [[WeekViewController alloc]initWithDB:DB Frame:CGRectMake(0,ToolbarHeight*3 + 8.5, self.view.frame.size.width, self.view.frame.size.height-ToolbarHeight*3)];
    [self addChildViewController:WVC];
    [self.view addSubview:WVC.view];
    [WVC didMoveToParentViewController:self];
    [WVC setDateWithMonth:[nowComps month] Day:[nowComps day]];
    [WVC.view setHidden:YES];
    WVC.TVC.mainViewControllerDelegate = self;
}
-(void)initMVC
{
    if(MVC != nil)
    {
        NSLog(@"Already has MVC");
        return;
    }
    
    NSLog(@"Setting MVC");
    MVC = [[MonthViewController alloc]initWithDB:DB Frame:CGRectMake(0,ToolbarHeight*3 + 8.5 + 16, self.view.frame.size.width, self.view.frame.size.height-(ToolbarHeight*3 + 8.5 + 16))];
    [self addChildViewController:MVC];
    [self.view addSubview:MVC.view];
    [MVC didMoveToParentViewController:self];
    [MVC setDateWithMonth:[nowComps month]];
    [MVC.view setHidden:YES];
    MVC.TVC.mainViewControllerDelegate = self;
}
-(void)showDetialViewControllerWithDetailVC:(DetailViewController *)_DetailVC
{
    _DetailVC.title = self.title;
    [self presentViewController:_DetailVC animated:YES completion:nil ];
}
-(void)showAddTodoController
{
    AddTodoViewController *ATVC = [[AddTodoViewController alloc]init];
    [self presentViewController:ATVC animated:YES completion:nil ];
}

-(void)setDateViewerWithString:(NSString *)string
{
    //UIBarButtonItem *UIBBI = [[naviToolbar items] objectAtIndex:0];
    //UIButton *dateButton = (UIButton*)UIBBI.customView;
    //[dateButton setTitle:string forState:UIControlStateNormal];
    
}
-(void)initsecToolbar
{
    if([self.view.subviews indexOfObject:secToolbar] != NSNotFound)
    {
        NSLog(@"Already has Second Toolbar");
        return;
    }
    NSLog(@"Setting Second Toolbar");
    
    //secToolbar = [[UIToolbar alloc]init];
    secToolbar = [[UIView alloc]init];
    secToolbar.frame = CGRectMake(0,ToolbarHeight*2,self.view.frame.size.width,ToolbarHeight + 8.5 + 16);
//    secToolbar.tintColor = [UIColor grayColor];
    secToolbar.backgroundColor = [UIColor whiteColor];
    
    
    UIImageView *tearedPaperImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"back_paper_ios.png"]];
    tearedPaperImageView.frame = CGRectMake(0, 0, self.view.frame.size.width, 8.5);
    
    
    
    UILabel *dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(6.5, 8.5, 200, ToolbarHeight)];
    [dateLabel setText:@"2013.01" ];
    [dateLabel setNumberOfLines:0];
    [dateLabel setFont:[UIFont systemFontOfSize:21.14]];
    [dateLabel setTextColor:[UIColor colorWithRed:0.145 green:0.145 blue:0.145 alpha:1]];
    //[dateLabel setTextColor:[UIColor blackColor]];
//    [dateLabel sizeToFit];
    //UIButton *dateButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //[dateButton setFrame:CGRectMake(13, 0, 200, ToolbarHeight)];
    //[dateButton setTitle:@"2013.01" forState:UIControlStateNormal];
    //dateButton.titleLabel.font = [UIFont systemFontOfSize:42.29];
    //[dateButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //UIBarButtonItem *dateBarButton = [[UIBarButtonItem alloc] initWithCustomView:dateButton];

    /*
    UIButton *chatButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *chatImage = [UIImage imageNamed:@"01_ic_chat.png"];
    [chatButton setFrame:CGRectMake(0, 0, 30, 30)];
    [chatButton setImage:chatImage forState:UIControlStateNormal];
    UIBarButtonItem *chatBarButton = [[UIBarButtonItem alloc] initWithCustomView:chatButton];
    */

    UIButton *arrowleftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [arrowleftButton setFrame:CGRectMake(self.view.frame.size.width - 3 * ToolbarHeight, 8.5, ToolbarHeight, ToolbarHeight)];
    [arrowleftButton setImage:[UIImage imageNamed:@"01_ic_arrowleft_ios.png"] forState:UIControlStateNormal];
    [arrowleftButton setImage:[UIImage imageNamed:@"01_ic_arrowleft_c_ios.png"] forState:UIControlStateHighlighted];
    UIBarButtonItem *arrowleftBarButton = [[UIBarButtonItem alloc] initWithCustomView:arrowleftButton];

    UIButton *todayButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [todayButton setFrame:CGRectMake(self.view.frame.size.width - 2 * ToolbarHeight, 8.5, ToolbarHeight, ToolbarHeight)];
    [todayButton setImage:[UIImage imageNamed:@"01_ic_today_ios.png"] forState:UIControlStateNormal];
    [todayButton setImage:[UIImage imageNamed:@"01_ic_today_c_ios.png"] forState:UIControlStateHighlighted];
    UIBarButtonItem *todayBarButton = [[UIBarButtonItem alloc] initWithCustomView:todayButton];
    
    UIButton * arrowrightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [arrowrightButton setFrame:CGRectMake(self.view.frame.size.width - ToolbarHeight, 8.5, ToolbarHeight, ToolbarHeight)];
    [arrowrightButton setImage:[UIImage imageNamed:@"01_ic_arrowright_ios.png"] forState:UIControlStateNormal];
    [arrowrightButton setImage:[UIImage imageNamed:@"01_ic_arrowright_c_ios.png"] forState:UIControlStateHighlighted];
    UIBarButtonItem *arrowrightBarButton = [[UIBarButtonItem alloc] initWithCustomView:arrowrightButton];
    
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                      target:nil
                                      action:nil];
    for(int i=0; i<7;i++)
    {
        UILabel *weekdayLabel = [[UILabel alloc]initWithFrame:CGRectMake(i * (self.view.frame.size.width / 7.0), secToolbar.frame.size.height - 16, (self.view.frame.size.width / 7.0), 16)];
        weekdayLabel.font = [UIFont systemFontOfSize:12.23];
        [weekdayLabel setTextAlignment:NSTextAlignmentCenter];
        weekdayLabel.text = [Schedule getWeekDaySymbolWithWeekday:i];
        if(i == 0)
        {
            [weekdayLabel setTextColor:[UIColor colorWithRed:0.996 green:0.427 blue:0.086 alpha:1]];
        }
        else if( i == 6)
        {
            [weekdayLabel setTextColor:[UIColor colorWithRed:0.325 green:0.616 blue:0.804 alpha:1]];
        }
        else
        {
            [weekdayLabel setTextColor:[UIColor colorWithRed:0.263 green:0.263 blue:0.263 alpha:1]];
        }
        [secToolbar addSubview:weekdayLabel];
    }
    
    [self.view addSubview:secToolbar];
    //[secToolbar setItems:[[NSArray alloc] initWithObjects:dateBarButton,flexibleSpace,chatBarButton,flexibleSpace,arrowleftBarButton,flexibleSpace,todayBarButton,flexibleSpace,arrowrightBarButton, nil] animated:YES];
    [secToolbar addSubview:dateLabel];
    [secToolbar addSubview:tearedPaperImageView];
    [secToolbar addSubview:arrowleftButton];
    [secToolbar addSubview:todayButton];
    [secToolbar addSubview:arrowrightButton];
}
-(void)initfirToolbar
{
    if([self.view.subviews indexOfObject:firToolbar] != NSNotFound)
    {
        NSLog(@"Already has First Toolbar");
        return;
    }
    
    NSLog(@"Setting First Toolbar");
    firToolbar = [[UIView alloc]init];
    //firToolbar = [[UIToolbar alloc]init];
    firToolbar.frame = CGRectMake(0, ToolbarHeight, self.view.frame.size.width, ToolbarHeight);
    //firToolbar.tintColor = [UIColor grayColor];
    [firToolbar setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"back_2_ios.png"]]];
    
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *addImage = [UIImage imageNamed:@"01_ic_addtodo_ios.png"];
    [addButton setFrame:CGRectMake(0, 0, ToolbarHeight, ToolbarHeight)];
    [addButton setImage:addImage forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(showAddTodoController) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *addBarButton = [[UIBarButtonItem alloc] initWithCustomView:addButton];
    
    /*UIButton *dayButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *dayImage = [UIImage imageNamed:@"01_ic_day.png"];
    [dayButton setFrame:CGRectMake(0, 0, 30, 30)];
    [dayButton setImage:dayImage forState:UIControlStateNormal];
    [dayButton addTarget:self action:@selector(showDVC) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *dayBarButton = [[UIBarButtonItem alloc] initWithCustomView:dayButton];
    
    UIButton *weekButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *weekImage = [UIImage imageNamed:@"01_ic_week.png"];
    [weekButton setFrame:CGRectMake(0, 0, 30, 30)];
    [weekButton setImage:weekImage forState:UIControlStateNormal];
    [weekButton addTarget:self action:@selector(showWVC) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *weekBarButton = [[UIBarButtonItem alloc] initWithCustomView:weekButton];
    
    UIButton *monthButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *monthImage = [UIImage imageNamed:@"01_ic_month.png"];
    [monthButton setFrame:CGRectMake(0, 0, 30, 30)];
    [monthButton setImage:monthImage forState:UIControlStateNormal];
    [monthButton addTarget:self action:@selector(showMVC) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *monthBarButton = [[UIBarButtonItem alloc] initWithCustomView:monthButton];
    
    */
    UIButton *handleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *handleImage = [UIImage imageNamed:@"01_ic_selectcal_ios.png"];
    [handleButton setFrame:CGRectMake(self.view.frame.size.width - ToolbarHeight + 4, 0, ToolbarHeight, ToolbarHeight)];
    [handleButton setImage:handleImage forState:UIControlStateNormal];
    UIBarButtonItem *handleBarButton = [[UIBarButtonItem alloc] initWithCustomView:handleButton];

    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                      target:nil
                                      action:nil];
    
    [self.view addSubview:firToolbar];

    //[firToolbar setItems:[[NSArray alloc] initWithObjects:addBarButton,flexibleSpace,dayBarButton,flexibleSpace,weekBarButton,flexibleSpace,monthBarButton,flexibleSpace,handleBarButton, nil] animated:YES];
//    [firToolbar setItems:[[NSArray alloc] initWithObjects:addBarButton, flexibleSpace, handleBarButton, nil] animated:YES];
    [firToolbar addSubview:addButton];
    [firToolbar addSubview:handleButton];
}

-(void)initNaviItems
{
    NSLog(@"Setting navi items");
    
    if([self.view.subviews indexOfObject:naviToolbar] != NSNotFound)
    {
        NSLog(@"Already has Navigation Toolbar");
        return;
    }
    NSLog(@"Setting Navigation Toolbar");
    
    CGSize newSize;
    UIImage *newImage;
    CGRect newFrame;
    
    //naviToolbar = [[UIToolbar alloc]init];
    naviToolbar = [[UIView alloc] init];
    [self.view addSubview:naviToolbar];
    naviToolbar.frame = CGRectMake(0,0,self.view.frame.size.width,ToolbarHeight);
    //[naviToolbar setBackgroundImage:[UIImage imageNamed:@"back_1_ios.png"] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
    
    UIImage* _image = [UIImage imageNamed:@"back_1_ios.png"];
    newSize = CGSizeMake(self.view.frame.size.width, ToolbarHeight);
    UIGraphicsBeginImageContext( newSize );
    [_image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
//    [naviToolbar setBackgroundColor:[UIColor colorWithPatternImage:newImage]];
    
    UIImageView *backimageview = [[UIImageView alloc] initWithImage:_image];
    backimageview.frame = CGRectMake(0, 0, self.view.frame.size.width, ToolbarHeight);
    [naviToolbar addSubview:backimageview];
    
    //[naviToolbar setBackgroundImage:_image forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
    //[naviToolbar setTintColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"back_1_ios.png"]]];
//    naviToolbar.tintColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"back_1_ios.png"]];
    
    
    // left
    UIButton *profileButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *bottomImage = [UIImage imageNamed:@"01_ic_friend_02_ios.png"]; //background image
    UIImage *image       = [UIImage imageNamed:@"01_ic_friend_ios.png"]; //foreground image
    
    newSize = CGSizeMake(ToolbarHeight*2, ToolbarHeight*2);
    UIGraphicsBeginImageContext( newSize );
    
    // Use existing opacity as is
    [bottomImage drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];//  blendMode:kCGBlendModeColor alpha:1];
    
    // Apply supplied opacity if applicable
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];// blendMode:kCGBlendModeNormal alpha:1];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    [profileButton setFrame:CGRectMake(0, 0, ToolbarHeight, ToolbarHeight)];
    [profileButton setImage:newImage forState:UIControlStateNormal];
    //[profileButton setImage:image forState:UIControlStateNormal];
    
    [profileButton addTarget:self.motherViewControllerDelegate action:@selector(slideViews) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *profileBarButton = [[UIBarButtonItem alloc] initWithCustomView:profileButton];

    
    // Center : title
    UILabel *profileNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(ToolbarHeight + MarginWidth	, 0, self.view.frame.size.width - 3 * ( ToolbarHeight + MarginWidth ), ToolbarHeight)];
    profileNameLabel.text = DB.title;
    profileNameLabel.backgroundColor = [UIColor clearColor];
    profileNameLabel.textColor = [UIColor whiteColor];
    UIBarButtonItem *profileNameBarButton = [[UIBarButtonItem alloc] initWithCustomView:profileNameLabel];
    
    
    
    //right
    

    
    UIButton *briefButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [briefButton setFrame:CGRectMake(self.view.frame.size.width - 2 * ToolbarHeight - 1, 0, ToolbarHeight, ToolbarHeight)];
    [briefButton setImage:[UIImage imageNamed:@"01_ic_brief_ios.png"] forState:UIControlStateNormal];
    UIBarButtonItem *briefBarButton = [[UIBarButtonItem alloc] initWithCustomView:briefButton];
    
    UIImageView *lineImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"lin_01_ios.png"]];
    [lineImageView setFrame:CGRectMake(self.view.frame.size.width - ToolbarHeight -1, 0, 1, ToolbarHeight)];
    
    UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [menuButton setFrame:CGRectMake(self.view.frame.size.width - ToolbarHeight, 0, ToolbarHeight, ToolbarHeight)];
    [menuButton setImage:[UIImage imageNamed:@"01_ic_menu_ios.png"] forState:UIControlStateNormal];
    UIBarButtonItem *menuBarButton = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
   
    /*UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc]
     initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
     target:nil
     action:nil];
    */
    
    //[naviToolbar setItems:[[NSArray alloc] initWithObjects:profileBarButton,flexibleSpace,profileNameBarButton,flexibleSpace,briefBarButton,flexibleSpace,menuBarButton, nil] animated:YES];
//    [naviToolbar setItems:[[NSArray alloc] initWithObjects:profileBarButton,profileNameBarButton,briefBarButton,menuBarButton, nil] animated:YES];
    [naviToolbar addSubview:profileNameLabel];
    [naviToolbar addSubview:profileButton];
    [naviToolbar addSubview:menuButton];
    [naviToolbar addSubview:briefButton];
    [naviToolbar addSubview:lineImageView];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initTap
{
    tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self.motherViewControllerDelegate action:@selector(touchedMainView:)];
    [tapGesture setNumberOfTapsRequired:1];
    tapGesture.delegate = (id)self.view;
}
-(void)addTap
{
    [self.view addGestureRecognizer:tapGesture];
    for (UIView* _view in self.view.subviews) {
        _view.userInteractionEnabled = NO;
    }
}
-(void)removeTap
{
    [self.view removeGestureRecognizer:tapGesture];
    for (UIView* _view in self.view.subviews) {
        _view.userInteractionEnabled = YES;
    }
}
@end
