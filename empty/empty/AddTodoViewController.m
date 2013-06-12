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
        [self initContainerView];
        [self initOptionView];
        [self borderWithview:self.view];
        
        
        [[NSNotificationCenter defaultCenter]
         addObserver:self
         selector: @selector(keyPressed:)
         name: UITextViewTextDidChangeNotification
         object: nil];
        
    }
    return self;
}
-(void)borderWithview:(UIView*)_view
{
    _view.layer.borderColor = [UIColor redColor].CGColor;
    _view.layer.borderWidth = 1.0f;
    
    for (UIView *_subview in _view.subviews) {
        [self borderWithview:_subview];
    }
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

    
    
    
    UIBarButtonItem *cancelBarButton = [[UIBarButtonItem alloc] initWithTitle:@"취소" style:UIBarButtonItemStyleBordered target:self action:@selector(popNavi)];
    UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc] initWithTitle:@"완료" style:UIBarButtonItemStyleDone target:self action:@selector(done)];
    
    
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
-(void)done
{
    [self popNavi];
}
-(void)popNavi
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)initContainerView
{
    CGRect newFrame;
    
    if([self.view.subviews indexOfObject:containerView] != NSNotFound)
    {
        NSLog(@"Already has Container View");
        return;
    }
    NSLog(@"Setting Container View");
    
    containerView = [[FlexibleScrollView alloc] initWithFrame:CGRectMake(0,
                                                                   [self subviewBottomCoordWithSuperview:self.view],
                                                                   self.view.frame.size.width,
                                                                   self.view.frame.size.height - 2 * ToolbarHeight )];
    [self.view addSubview:containerView];
   
    
    /// Date View ///
    [self initDateView];
    
    
    /// Content View ///
    [self initTextContentView];
        
    
    /// Picture View ///
    [self initPictureView];
    
    
    /// Navigation View ///
    [self initNavigationView];
    
}
-(void) initDateView
{
    NSLog(@"AddTodo :: Init Date View ");
    
    dateView = [[FlexibleView alloc]
                initWithFrame:CGRectMake( MarginWidth,
                                         [self subviewBottomCoordWithSuperview:containerView] + MarginHeight,
                                         self.view.frame.size.width - 2 * MarginWidth,
                                         0 )];
    [containerView addSubview:dateView];
    dateView.backgroundColor = [UIColor blueColor];
    
    dateButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    dateButton.frame = CGRectMake(0, 0, dateView.frame.size.width, ToolbarHeight);
    [dateButton setTitle:@"2013년 5월 31일 4시" forState:UIControlStateNormal];
    
    [dateView addSubview:dateButton];
    hasEndDate = NO;
    NSLog(@"dateview : %@",dateView);
}
-(void) initTextContentView
{
    NSLog(@"AddTodo :: Init TextContent View");
    textContentView = [[FlexibleView alloc]
                    initWithFrame:CGRectMake( MarginWidth,
                                             [self subviewBottomCoordWithSuperview:containerView] + MarginHeight,
                                             self.view.frame.size.width - 2 * MarginWidth,
                                             0 )];
    [containerView addSubview:textContentView];
    NSLog(@"1 %f",textContentView.frame.origin.y);
    [textContentView setBackgroundColor:[UIColor grayColor]];
    
    titleTextField = [[UITextField alloc]
                      initWithFrame:CGRectMake(0, [self subviewBottomCoordWithSuperview:textContentView], textContentView.frame.size.width, ToolbarHeight)];
    NSLog(@"2 %f",textContentView.frame.origin.y);
    
    [titleTextField setPlaceholder:@"일정을 입력하세요"];
    NSLog(@"3 %f",textContentView.frame.origin.y);
    
    [textContentView addSubview:titleTextField];
    NSLog(@"4 %f",textContentView.frame.origin.y);
    
    addTextDetailButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
    addTextDetailButton.frame = CGRectMake( textContentView.frame.size.width -MarginWidth - (ToolbarHeight - 2 * MarginWidth),
                                        MarginHeight,
                                        ToolbarHeight -  MarginWidth,
                                        ToolbarHeight -  MarginHeight);
    [addTextDetailButton addTarget:self action:@selector(addTextContent) forControlEvents:UIControlEventTouchDown];
    [textContentView addSubview:addTextDetailButton];
    NSLog(@"5 %f",textContentView.frame.origin.y);
    
    textDetailView = [[PHTextField alloc]
                       initWithFrame:CGRectMake(0, [self subviewBottomCoordWithSuperview:textContentView], textContentView.frame.size.width, 0) placeholder:@"상세 일정 내용을 입력하세요" ];
    [textContentView addSubview:textDetailView];
    NSLog(@"textContentview : %@",textContentView);
}
-(void) initPictureView
{
    NSLog(@"AddTodo :: Init Picture View");
    
    pictureAddViewController = [[PictureAddViewController alloc]
                   initWithViewFrame:CGRectMake( MarginWidth
                                                ,[self subviewBottomCoordWithSuperview:containerView] + MarginHeight
                                                ,self.view.frame.size.width - 2 * MarginWidth
                                                ,0)
                   ColCount:4 ComponentHeight:66];
    [containerView addSubview:pictureAddViewController.view];
    [self addChildViewController:pictureAddViewController];
    [pictureAddViewController.view setBackgroundColor:[UIColor greenColor]];

}
-(void) initNavigationView
{
    NSLog(@"AddTodo :: Init Navigation View");
    
    navigationView = [[FlexibleView alloc]
                      initWithFrame:CGRectMake( MarginWidth,
                                               [self subviewBottomCoordWithSuperview:containerView] + MarginHeight,
                                               self.view.frame.size.width - 2 * MarginWidth,
                                               0 )];
    UIView *subview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, ToolbarHeight*1.5)];
    subview.backgroundColor = [UIColor orangeColor];
    [navigationView addSubview:subview];
    [containerView addSubview:navigationView];
    [navigationView setBackgroundColor:[UIColor yellowColor]];
    
}
-(void) initOptionView
{
    NSLog(@"AddTodo :: Init Option View");
    
    optionView = [[FlexibleView alloc]
                  initWithFrame:CGRectMake( 0,
                                           [self subviewBottomCoordWithSuperview:self.view],
                                           self.view.frame.size.width,
                                           ToolbarHeight )];
    
    [self.view addSubview:optionView];
        [optionView setBackgroundColor:[UIColor grayColor]];
}
-(void) keyPressed: (NSNotification*) notification
{
    CGRect newframe = ((UIView*)[textDetailView.subviews objectAtIndex:0]).frame;
    newframe.origin = textDetailView.frame.origin;
    if(newframe.size.height < ToolbarHeight * 2) newframe.size.height = ToolbarHeight * 2;
    textDetailView.frame = newframe;
    [textContentView resetHeight];
}
-(void)addTextContent
{
    [addTextDetailButton removeFromSuperview];

    CGRect newframe = textDetailView.frame;
    newframe.size.height = 2 * ToolbarHeight;
    [textDetailView setFrame:newframe];
    
    [textContentView resetHeight];
}
-(void)dismissKeyboard:(UIGestureRecognizer *) gestureRecognizer {
    [self.view endEditing:YES];
}

-(CGFloat)subviewBottomCoordWithSuperview:(UIView*)_superview
{
    UIView *lastSubview = _superview.subviews.lastObject;
    if(lastSubview == nil) return 0;
    return [self bottomCoordWithView:lastSubview];
}
-(CGFloat)bottomCoordWithView:(UIView*)_view
{
    CGFloat bottomCoord = _view.frame.origin.y + _view.frame.size.height;
    return bottomCoord;
}


#pragma mark - Image picker delegate methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)selectedImage editingInfo:(NSDictionary *)editingInfo
{
	//UIGraphicsBeginImageContext(rect.size);
	//[selectedImage drawInRect:rect];
	//event.thumbnail = UIGraphicsGetImageFromCurrentImageContext();
	//UIGraphicsEndImageContext();
	
    [pictureAddViewController addImage:selectedImage];
    [self dismissViewControllerAnimated:YES completion:NULL];
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
	// The user canceled -- simply dismiss the image picker.
	[self dismissViewControllerAnimated:YES completion:NULL];
}


@end
