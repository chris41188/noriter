//
//  DetailViewController.m
//  empty
//
//  Created by echo on 13. 5. 13..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "DetailViewController.h"


@implementation DetailViewController
@dynamic schedule;



#define MARGIN_HEIGHT 5
#define MARGIN_WIDTH 5
#define PROF_IMAGE_FRAME CGRectMake(MARGIN_WIDTH*2,13,40,40)
#define NAME_LABEL_FRAME CGRectMake(60,15,150,17)
#define PERIOD_LABEL_FRAME CGRectMake(60,40,250,0)
#define CONT_LABEL_FRAME CGRectMake(MARGIN_WIDTH*2,85,290,0)
#define PIC_IMAGE_FRAME CGRectMake(MARGIN_WIDTH,MARGIN_HEIGHT,320-MARGIN_WIDTH*2,250)

-(id)initWithSchedule:(Schedule *)_sche
{
    self = [super init];
    if(self)
    {
        schedule = _sche;
    }
    return self;
}
-(void)viewDidAppear:(BOOL)animated
{
    [self.view.layer setBackgroundColor:[UIColor whiteColor].CGColor];
    [self initNaviItems];
    [self initContentView];
    NSLog(@"%@",schedule.p_Writter.s_Name);
}
-(void)initContentView
{
    NSLog(@"Setting ContentView");
    
    // set temp vari

    CGRect newFrame;
    CGSize maximumLabelSize;
    CGSize expectedLabelSize;
    UIView *lastSubview;
    
    // init contentView
    
    contentView = [[UIScrollView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:contentView];
    
    
    //Profile Image View
    
    profImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",schedule.p_Writter.s_ID]]];
    profImageView.frame = PROF_IMAGE_FRAME;
    
    [contentView addSubview:profImageView];
    
    
    //Name Label(beside Profile)
    
    nameLabel = [[UILabel alloc] initWithFrame:NAME_LABEL_FRAME];
    [nameLabel setText:schedule.p_Writter.s_Name];
    
    [contentView addSubview:nameLabel];
    
    //Period Label(beside Profile)
    periodLabel = [[UILabel alloc] init];
    [periodLabel setText:[schedule getPeriod]];
    
    periodLabel.lineBreakMode = NSLineBreakByCharWrapping;
    periodLabel.numberOfLines = 0;
    
    //set label height by text line
    maximumLabelSize = CGSizeMake(PERIOD_LABEL_FRAME.size.width, FLT_MAX);
    expectedLabelSize = [periodLabel.text sizeWithFont:periodLabel.font constrainedToSize:maximumLabelSize lineBreakMode:periodLabel.lineBreakMode];
    newFrame = PERIOD_LABEL_FRAME;
    newFrame.size.height = expectedLabelSize.height;
    periodLabel.frame = newFrame;
    
    [contentView addSubview:periodLabel];
    
    
    //CONTENT LABEL (under Profile)
    
    cntLabel = [[UILabel alloc] init];
    cntLabel.text = schedule.s_Content;
    
    cntLabel.lineBreakMode = NSLineBreakByCharWrapping;
    cntLabel.numberOfLines = 0;
    
    //set label height by text lines
    maximumLabelSize = CGSizeMake(CONT_LABEL_FRAME.size.width, FLT_MAX);
    expectedLabelSize = [cntLabel.text sizeWithFont:cntLabel.font constrainedToSize:maximumLabelSize lineBreakMode:cntLabel.lineBreakMode];
    //adjust the label the the new height.
    newFrame = CONT_LABEL_FRAME;
    newFrame.size.height = expectedLabelSize.height;
    cntLabel.frame = newFrame;
    
    [contentView addSubview:cntLabel];
    
    
    // Content Picture
    
    picImageView = [[UIImageView alloc] initWithImage:schedule.i_Picture.copy];

    newFrame = PIC_IMAGE_FRAME;
    newFrame.origin.y += cntLabel.frame.origin.y + cntLabel.frame.size.height + MARGIN_HEIGHT/2;
    picImageView.frame = newFrame;
    
    [contentView addSubview:picImageView];

    
    // Map ImageView
    
    mapImageView = [[UIImageView alloc] initWithImage:[schedule getGoogleMapsImage]];
    
    mapImageView.frame = CGRectMake(picImageView.frame.origin.x, picImageView.frame.origin.y + picImageView.frame.size.height + MARGIN_HEIGHT, mapImageView.image.size.width,mapImageView.image.size.height);//mapImageView.image.size.width, mapImageView.image.size.height);

    [contentView addSubview:mapImageView];
    
    
    // Coment & Share Numbers Label

    commentAndShareLabel = [[UILabel alloc]init];
    commentAndShareLabel.text = [NSString stringWithFormat:@"댓글(%d) 공유(%d)",schedule.ma_Comment.count,schedule.ma_Share.count];

    [commentAndShareLabel sizeToFit];
    commentAndShareLabel.frame = CGRectMake(320 - commentAndShareLabel.frame.size.width - MARGIN_WIDTH, mapImageView.frame.origin.y + mapImageView.frame.size.height + MARGIN_HEIGHT, commentAndShareLabel.frame.size.width, commentAndShareLabel.frame.size.height);
    
    [contentView addSubview:commentAndShareLabel];
    
    
    // Comments
    
    int i = -1;
    for (Comment *_comment in schedule.ma_Comment) {
        i++;
        UIView *commentView = [[UIView alloc]init];
        
        
        UIImageView *commentProfileImageView = [[UIImageView alloc]initWithImage:_comment.writter.i_Picture];
        
        commentProfileImageView.frame = CGRectMake(MARGIN_WIDTH, MARGIN_HEIGHT, 30, 30);
        
        [commentView addSubview:commentProfileImageView];
        
        
        UILabel *commentNameLabel = [[UILabel alloc]init];
        commentNameLabel.text = _comment.writter.s_Name;
        
        commentNameLabel.frame = CGRectMake(40, MARGIN_HEIGHT, 0, 0);
        [commentNameLabel sizeToFit];
        
        [commentView addSubview:commentNameLabel];
        
        NSLog(@"1");
        UILabel *commentUploadDateLabel = [[UILabel alloc]init];
        commentUploadDateLabel.text =  [_comment getUploadDateString];
        NSLog(@"2, commentUpload Date Text : %@",commentUploadDateLabel.text);
        commentUploadDateLabel.frame = CGRectMake(commentNameLabel.frame.origin.x + commentNameLabel.frame.size.width + MARGIN_WIDTH, MARGIN_HEIGHT, 0, 0);
                NSLog(@"3");
        [commentUploadDateLabel sizeToFit];
        [commentView addSubview:commentUploadDateLabel];
        
        
        UILabel *commentContentLabel = [[UILabel alloc]init];
        commentContentLabel.text = _comment.content;

        commentContentLabel.lineBreakMode = NSLineBreakByCharWrapping;
        commentContentLabel.numberOfLines = 0;
        
        maximumLabelSize = CGSizeMake(contentView.frame.size.width - 2 * MARGIN_WIDTH, FLT_MAX);
        expectedLabelSize = [commentContentLabel.text sizeWithFont:commentContentLabel.font constrainedToSize:maximumLabelSize lineBreakMode:commentContentLabel.lineBreakMode];
        
        commentContentLabel.frame = CGRectMake(MARGIN_WIDTH, commentNameLabel.frame.origin.y + commentNameLabel.frame.size.height+MARGIN_HEIGHT, contentView.frame.size.width - 2 * MARGIN_WIDTH, expectedLabelSize.height);

        [commentView addSubview:commentContentLabel];
        
        
        // new Frame -> make  ContentView Frame With Last Object(of ContentView)'s Position
        
        newFrame.origin.x = 0;

        lastSubview = (UIView*)[[contentView subviews] lastObject];
        
        newFrame.origin.y = lastSubview.frame.origin.y + lastSubview.frame.size.height;
        newFrame.size.width = self.view.frame.size.width;
        
        lastSubview = (UIView*)[[commentView subviews]lastObject];
        
        newFrame.size.height = lastSubview.frame.origin.y + lastSubview.frame.size.height;
        
        commentView.frame = newFrame;
        
        [contentView addSubview:commentView];
    }
    
     lastSubview = (UIView*)contentView.subviews.lastObject;
    contentView.contentSize = CGSizeMake( contentView.frame.size.width, lastSubview.frame.origin.y + lastSubview.frame.size.height + MARGIN_HEIGHT );
    
#ifdef DEBUG
    for (UIView* _view in contentView.subviews) {
        _view.layer.borderColor = [UIColor redColor].CGColor;
        _view.layer.borderWidth = 1.0f;
    }
    /*contentView.layer.borderColor = [UIColor redColor].CGColor;
    contentView.layer.borderWidth = 1.0f;
    profImageView.layer.borderColor = [UIColor redColor].CGColor;
    profImageView.layer.borderWidth = 1.0f;
    nameLabel.layer.borderColor = [UIColor redColor].CGColor;
    nameLabel.layer.borderWidth = 1.0f;
    periodLabel.layer.borderColor = [UIColor redColor].CGColor;
    periodLabel.layer.borderWidth = 1.0f;
    cntLabel.layer.borderColor = [UIColor redColor].CGColor;
    cntLabel.layer.borderWidth = 1.0f;
    picImageView.layer.borderColor = [UIColor redColor].CGColor;
    picImageView.layer.borderWidth = 1.0f;
    mapImageView.layer.borderColor = [UIColor redColor].CGColor;
    mapImageView.layer.borderWidth = 1.0f;*/
#endif
    
    
}
-(void)initNaviItems
{
    NSLog(@"Setting Navi Imtes");
    
    //left
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backImage = [UIImage imageNamed:@"ic_back.png"];
    [backButton setFrame:CGRectMake(0, 0, 30, 30)];
    [backButton setImage:backImage forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(popNavi) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    [self.navigationItem setLeftBarButtonItem:backBarButton];
    
    
    //right
    UIButton *briefButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [briefButton setFrame:CGRectMake(0, 0, 30,30)];//self.navigationController.navigationBar.frame.size.height, self.navigationController.navigationBar.frame.size.height)];
    [briefButton setImage:[UIImage imageNamed:@"ic_brief.png"] forState:UIControlStateNormal];
    UIBarButtonItem *briefBarButton = [[UIBarButtonItem alloc] initWithCustomView:briefButton];
    
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *addImage = [UIImage imageNamed:@"ic_addtodo.png"];
    [addButton setFrame:CGRectMake(0, 0, 30, 30)];
    [addButton setImage:addImage forState:UIControlStateNormal];
    UIBarButtonItem *addBarButton = [[UIBarButtonItem alloc] initWithCustomView:addButton];
    
    [self.navigationItem setRightBarButtonItems:[[NSArray alloc] initWithObjects:addBarButton,briefBarButton, nil] animated:YES];
}
-(void)popNavi
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
