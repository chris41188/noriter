//
//  AddTodoViewController.m
//  empty
//
//  Created by echo on 13. 5. 23..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "AddTodoViewController.h"

//const NSInteger ToolbarHeight = 44;
//const NSInteger MarginHeight = 5;
//const NSInteger MarginWidth = 5;
@implementation AddTodoViewController



-(id)init
{
    if( self = [super init])
    {
        NSLog(@"%@",self.view);
        [self initNaviItems];
        //[self initFirstToolbar];
        //[self initSecondToolbar];
        //[self initContentView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                       initWithTarget:self
                                       action:@selector(dismissKeyboard)];
        
        [self.view addGestureRecognizer:tap];
    }
    return self;
}

-(void)initNaviItems
{

    if([self.view.subviews indexOfObject:naviToolbar] != NSNotFound)
    {
        NSLog(@"Already has Navigation Toolbar");
        return;
    }
    NSLog(@"Setting Navigation Toolbar");
    naviToolbar = [[UIToolbar alloc]init];
    naviToolbar.frame = CGRectMake(0,0,self.view.frame.size.width,ToolbarHeight);
    naviToolbar.tintColor = [UIColor grayColor];

    
    
    
    UIBarButtonItem *cancelBarButton = [[UIBarButtonItem alloc] initWithTitle:@"취소" style:UIBarButtonItemStylePlain target:nil action:nil];
    UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc] initWithTitle:@"완료" style:UIBarButtonItemStyleDone target:nil action:nil];
    
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 44)];
    titleLabel.text = @"일정 추가";
    UIBarButtonItem *titleBarButton = [[UIBarButtonItem alloc] initWithCustomView:titleLabel];
    
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                      target:nil
                                      action:nil];
    [naviToolbar setItems:[[NSArray alloc] initWithObjects:cancelBarButton, flexibleSpace,titleBarButton,flexibleSpace,doneBarButton, nil] animated:YES];
    [self.view addSubview:naviToolbar];
    
}
-(void)popNavi
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)initFirstToolbar
{
    if([self.view.subviews indexOfObject:firstToolbar] != NSNotFound)
    {
        NSLog(@"Already has First Toolbar");
        return;
    }
    NSLog(@"Setting First Toolbar");
    firstToolbar = [[UIToolbar alloc]init];
    firstToolbar.frame = CGRectMake(0,ToolbarHeight,self.view.frame.size.width,ToolbarHeight);
    firstToolbar.tintColor = [UIColor grayColor];
    
    UIButton *addEndButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [addEndButton setFrame:CGRectMake(0, 0, ToolbarHeight, ToolbarHeight)];
    [addEndButton setImage:[UIImage imageNamed:@"ic_addend.png"] forState:UIControlStateNormal];
    [addEndButton addTarget:self action:@selector(toggleEnd) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *addEndBarButton = [[UIBarButtonItem alloc] initWithCustomView:addEndButton];
    
    
    UILabel *startDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/4*3, ToolbarHeight)];
    startDateLabel.text = [Schedule getDateWithDateComp:[[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekCalendarUnit|NSWeekdayCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit fromDate:[NSDate date]]];
    UIBarButtonItem *startDateBarButton = [[UIBarButtonItem alloc] initWithCustomView:startDateLabel];
    
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                      target:nil
                                      action:nil];
    
    
    [self.view addSubview:firstToolbar];
    [firstToolbar setItems:[[NSArray alloc] initWithObjects:addEndBarButton, flexibleSpace,startDateBarButton, nil] animated:YES];

}

-(void)initSecondToolbar
{
    if([self.view.subviews indexOfObject:secondToolbar] != NSNotFound)
    {
        NSLog(@"Already has Second Toolbar");
        return;
    }
    NSLog(@"Setting Second Toolbar");
    secondToolbar = [[UIToolbar alloc]init];
    secondToolbar.frame = CGRectMake(0,ToolbarHeight*2,self.view.frame.size.width,ToolbarHeight);
    secondToolbar.tintColor = [UIColor grayColor];
    ///
    [secondToolbar setHidden:YES];
    ///
    [self.view addSubview:secondToolbar];
    
    UILabel *endDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/4*3, ToolbarHeight)];
    endDateLabel.text = [Schedule getDateWithDateComp:[[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekCalendarUnit|NSWeekdayCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit fromDate:[NSDate date]]];
    UIBarButtonItem *endDateBarButton = [[UIBarButtonItem alloc] initWithCustomView:endDateLabel];
    
    UIBarButtonItem *fixedSpace =  [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil ];
    [fixedSpace setWidth:ToolbarHeight];
    
    [secondToolbar setItems:[[NSArray alloc] initWithObjects:fixedSpace,endDateBarButton, nil] animated:YES];

}
-(void)initContentView
{
    CGRect newFrame;
    
    if([self.view.subviews indexOfObject:contentView] != NSNotFound)
    {
        NSLog(@"Already has Content View");
        return;
    }
    NSLog(@"Setting Content View");
    
    contentView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, ToolbarHeight*2, self.view.frame.size.width, self.view.frame.size.height-ToolbarHeight*3)];
    [self.view addSubview:contentView];
    
    
    picImageView = [[UIImageView alloc] initWithFrame:CGRectMake(MarginWidth, MarginHeight, 0, 0)];
    [contentView addSubview:picImageView];
    hasPic = false;
    
    
    contentTextView = [[UITextView alloc]init];
    newFrame = picImageView.frame;
    newFrame.origin = CGPointMake(MarginWidth
                                  , newFrame.size.height + newFrame.origin.y + MarginHeight );
    newFrame.size.width = contentView.frame.size.width - 2*MarginWidth;
    newFrame.size.height = contentView.frame.size.height/5*4;
    contentTextView.frame = newFrame;
    [contentView addSubview:contentTextView];
    [contentTextView scrollRangeToVisible:NSMakeRange([contentTextView.text length], 0)];
    
    mapImageView = [[UIImageView alloc] initWithFrame:CGRectMake(MarginWidth
                                                                 , contentTextView.frame.size.height + contentTextView.frame.origin.y + MarginHeight
                                                                 , self.view.frame.size.width
                                                                 , 0)];
    [contentTextView addSubview:mapImageView];
    hasMap = false;
    
    UIView *lastView = contentView.subviews.lastObject;
    contentView.contentSize = CGSizeMake(self.view.frame.size.width, lastView.frame.size.height + lastView.frame.origin.y + MarginHeight);
#ifdef DEBUG
    for (UIView* _view in contentView.subviews) {
        _view.layer.borderColor = [UIColor redColor].CGColor;
        _view.layer.borderWidth = 1.0f;
    }
    contentView.layer.borderColor = [UIColor redColor].CGColor;
    contentView.layer.borderWidth = 1.0f;
#endif
    
}
-(void)toggleEnd
{
    NSLog(@"Toogle End Form %d -> %d",hasEnd,!hasEnd);
    hasEnd = !hasEnd;
    
//1  CGRect secondToolbarDestination = secondToolbar.frame;
    
    if(hasEnd == true)
    {
        [secondToolbar setHidden:NO];
//1        secondToolbarDestination.size.height = ToolbarHeight;
    }
    else
    {
        [secondToolbar setHidden:YES];
//1        secondToolbarDestination.size.height = 0;
    }
/*1
    [UIView animateWithDuration:0.25 animations:^{
        
        secondToolbar.frame = secondToolbarDestination;
    } completion:^(BOOL finished) {
    }];
1*/
    
}
-(void)initContentToolbar
{
    
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
}

-(void)dismissKeyboard {
    [contentTextView resignFirstResponder];
}
//-(void)viewDidAppear:(BOOL)animated
//{
//    [self.view.layer setBackgroundColor:[UIColor whiteColor].CGColor];
//    [self initNaviItems];
//    [self initContentView];
//    NSLog(@"%@",schedule.p_Writter.s_Name);
//}
//-(void)initContentView
//{
//    NSLog(@"Setting ContentView");
//    
//    // set temp vari
//    
//    CGRect newFrame;
//    CGSize maximumLabelSize;
//    CGSize expectedLabelSize;
//    UIView *lastSubview;
//    
//    // init contentView
//    
//    contentView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, ToolbarHeight, self.view.frame.size.width, self.view.frame.size.height - ToolbarHeight)];
//    [self.view addSubview:contentView];
//    
//    
//    //Profile Image View
//    
//    profImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",schedule.p_Writter.s_ID]]];
//    profImageView.frame = PROF_IMAGE_FRAME;
//    
//    [contentView addSubview:profImageView];
//    
//    
//    //Name Label(beside Profile)
//    
//    nameLabel = [[UILabel alloc] initWithFrame:NAME_LABEL_FRAME];
//    [nameLabel setText:schedule.p_Writter.s_Name];
//    
//    [contentView addSubview:nameLabel];
//    
//    //Period Label(beside Profile)
//    periodLabel = [[UILabel alloc] init];
//    [periodLabel setText:[schedule getPeriod]];
//    
//    periodLabel.lineBreakMode = NSLineBreakByCharWrapping;
//    periodLabel.numberOfLines = 0;
//    
//    //set label height by text line
//    maximumLabelSize = CGSizeMake(PERIOD_LABEL_FRAME.size.width, FLT_MAX);
//    expectedLabelSize = [periodLabel.text sizeWithFont:periodLabel.font constrainedToSize:maximumLabelSize lineBreakMode:periodLabel.lineBreakMode];
//    newFrame = PERIOD_LABEL_FRAME;
//    newFrame.size.height = expectedLabelSize.height;
//    periodLabel.frame = newFrame;
//    
//    [contentView addSubview:periodLabel];
//    
//    
//    //CONTENT LABEL (under Profile)
//    
//    cntLabel = [[UILabel alloc] init];
//    cntLabel.text = schedule.s_Content;
//    
//    cntLabel.lineBreakMode = NSLineBreakByCharWrapping;
//    cntLabel.numberOfLines = 0;
//    
//    //set label height by text lines
//    maximumLabelSize = CGSizeMake(CONT_LABEL_FRAME.size.width, FLT_MAX);
//    expectedLabelSize = [cntLabel.text sizeWithFont:cntLabel.font constrainedToSize:maximumLabelSize lineBreakMode:cntLabel.lineBreakMode];
//    //adjust the label the the new height.
//    newFrame = CONT_LABEL_FRAME;
//    newFrame.size.height = expectedLabelSize.height;
//    cntLabel.frame = newFrame;
//    
//    [contentView addSubview:cntLabel];
//    
//    
//    // Content Picture
//    
//    picImageView = [[UIImageView alloc] initWithImage:schedule.i_Picture.copy];
//    
//    newFrame = PIC_IMAGE_FRAME;
//    newFrame.origin.y += cntLabel.frame.origin.y + cntLabel.frame.size.height + MARGIN_HEIGHT/2;
//    picImageView.frame = newFrame;
//    
//    [contentView addSubview:picImageView];
//    
//    
//    // Map ImageView
//    
//    mapImageView = [[UIImageView alloc] initWithImage:[schedule getGoogleMapsImage]];
//    
//    mapImageView.frame = CGRectMake(picImageView.frame.origin.x, picImageView.frame.origin.y + picImageView.frame.size.height + MARGIN_HEIGHT, mapImageView.image.size.width,mapImageView.image.size.height);//mapImageView.image.size.width, mapImageView.image.size.height);
//    
//    [contentView addSubview:mapImageView];
//    
//    
//    // Coment & Share Numbers Label
//    
//    commentAndShareLabel = [[UILabel alloc]init];
//    commentAndShareLabel.text = [NSString stringWithFormat:@"댓글(%d) 공유(%d)",schedule.ma_Comment.count,schedule.ma_Share.count];
//    
//    [commentAndShareLabel sizeToFit];
//    commentAndShareLabel.frame = CGRectMake(320 - commentAndShareLabel.frame.size.width - MARGIN_WIDTH, mapImageView.frame.origin.y + mapImageView.frame.size.height + MARGIN_HEIGHT, commentAndShareLabel.frame.size.width, commentAndShareLabel.frame.size.height);
//    
//    [contentView addSubview:commentAndShareLabel];
//    
//    
//    // Comments
//    
//    int i = -1;
//    for (Comment *_comment in schedule.ma_Comment) {
//        i++;
//        UIView *commentView = [[UIView alloc]init];
//        
//        
//        UIImageView *commentProfileImageView = [[UIImageView alloc]initWithImage:_comment.writter.i_Picture];
//        
//        commentProfileImageView.frame = CGRectMake(MARGIN_WIDTH, MARGIN_HEIGHT, 30, 30);
//        
//        [commentView addSubview:commentProfileImageView];
//        
//        
//        UILabel *commentNameLabel = [[UILabel alloc]init];
//        commentNameLabel.text = _comment.writter.s_Name;
//        
//        commentNameLabel.frame = CGRectMake(40, MARGIN_HEIGHT, 0, 0);
//        [commentNameLabel sizeToFit];
//        
//        [commentView addSubview:commentNameLabel];
//        
//        NSLog(@"1");
//        UILabel *commentUploadDateLabel = [[UILabel alloc]init];
//        commentUploadDateLabel.text =  [_comment getUploadDateString];
//        NSLog(@"2, commentUpload Date Text : %@",commentUploadDateLabel.text);
//        commentUploadDateLabel.frame = CGRectMake(commentNameLabel.frame.origin.x + commentNameLabel.frame.size.width + MARGIN_WIDTH, MARGIN_HEIGHT, 0, 0);
//        NSLog(@"3");
//        [commentUploadDateLabel sizeToFit];
//        [commentView addSubview:commentUploadDateLabel];
//        
//        
//        UILabel *commentContentLabel = [[UILabel alloc]init];
//        commentContentLabel.text = _comment.content;
//        
//        commentContentLabel.lineBreakMode = NSLineBreakByCharWrapping;
//        commentContentLabel.numberOfLines = 0;
//        
//        maximumLabelSize = CGSizeMake(contentView.frame.size.width - 2 * MARGIN_WIDTH, FLT_MAX);
//        expectedLabelSize = [commentContentLabel.text sizeWithFont:commentContentLabel.font constrainedToSize:maximumLabelSize lineBreakMode:commentContentLabel.lineBreakMode];
//        
//        commentContentLabel.frame = CGRectMake(MARGIN_WIDTH, commentNameLabel.frame.origin.y + commentNameLabel.frame.size.height+MARGIN_HEIGHT, contentView.frame.size.width - 2 * MARGIN_WIDTH, expectedLabelSize.height);
//        
//        [commentView addSubview:commentContentLabel];
//        
//        
//        // new Frame -> make  ContentView Frame With Last Object(of ContentView)'s Position
//        
//        newFrame.origin.x = 0;
//        
//        lastSubview = (UIView*)[[contentView subviews] lastObject];
//        
//        newFrame.origin.y = lastSubview.frame.origin.y + lastSubview.frame.size.height;
//        newFrame.size.width = self.view.frame.size.width;
//        
//        lastSubview = (UIView*)[[commentView subviews]lastObject];
//        
//        newFrame.size.height = lastSubview.frame.origin.y + lastSubview.frame.size.height;
//        
//        commentView.frame = newFrame;
//        
//        [contentView addSubview:commentView];
//    }
//    
//    lastSubview = (UIView*)contentView.subviews.lastObject;
//    contentView.contentSize = CGSizeMake( contentView.frame.size.width, lastSubview.frame.origin.y + lastSubview.frame.size.height + MARGIN_HEIGHT );
//    
//#ifdef DEBUG
//    for (UIView* _view in contentView.subviews) {
//        _view.layer.borderColor = [UIColor redColor].CGColor;
//        _view.layer.borderWidth = 1.0f;
//    }
//    contentView.layer.borderColor = [UIColor redColor].CGColor;
//    contentView.layer.borderWidth = 1.0f;
//    /*profImageView.layer.borderColor = [UIColor redColor].CGColor;
//     profImageView.layer.borderWidth = 1.0f;
//     nameLabel.layer.borderColor = [UIColor redColor].CGColor;
//     nameLabel.layer.borderWidth = 1.0f;
//     periodLabel.layer.borderColor = [UIColor redColor].CGColor;
//     periodLabel.layer.borderWidth = 1.0f;
//     cntLabel.layer.borderColor = [UIColor redColor].CGColor;
//     cntLabel.layer.borderWidth = 1.0f;
//     picImageView.layer.borderColor = [UIColor redColor].CGColor;
//     picImageView.layer.borderWidth = 1.0f;
//     mapImageView.layer.borderColor = [UIColor redColor].CGColor;
//     mapImageView.layer.borderWidth = 1.0f;*/
//#endif
//    
//    
//}
//-(void)initNaviItems
//{
//
//}
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//	// Do any additional setup after loading the view.
//}
//
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//@end

@end
