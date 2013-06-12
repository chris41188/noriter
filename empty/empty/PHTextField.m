//
//  PHTextField.m
//  empty
//
//  Created by echo on 13. 6. 10..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "PHTextField.h"

@implementation PHTextField

- (id)initWithFrame:(CGRect)frame placeholder:(NSString*)_placeHolder
{
    self = [super initWithFrame:frame];
    if (self) {
        placeHolder = _placeHolder;
        [self textViewDidEndEditing:self];
        self.delegate = self;
    }
    return self;
}
- (void)textViewDidBeginEditing:(PHTextField *)textView
{
    if (isPlaceHolder) {
        isPlaceHolder = false;
        textView.text = @"";
        textView.textColor = [UIColor blackColor]; //optional
    }
    [textView becomeFirstResponder];
    
    // scroll view.
    UIView *superView = self.superview;
    CGFloat yCoord = 0;
    CGFloat xCoord = 0;
    while(superView != nil)
    {
        yCoord += superView.frame.origin.y;
        xCoord += superView.frame.origin.x;
        if([superView isKindOfClass:[UIScrollView class]] || [superView isKindOfClass:[FlexibleScrollView class]])
        {
            UIScrollView *scrollView = (UIScrollView*)superView;
            [scrollView setContentOffset:CGPointMake(0,yCoord) animated:YES];
            NSLog(@"%f, %f, %f, %f",xCoord, yCoord, self.frame.size.width, self.frame.size.height);
            break;
        }
        
        superView = superView.superview;
    }
    
}
-(void)textViewDidChange:(UITextView *)textView
{
    CGRect newframe = ((UIView*)[self.subviews objectAtIndex:0]).frame;
    newframe.origin = self.frame.origin;
    if(newframe.size.height < ToolbarHeight * 2) newframe.size.height = ToolbarHeight * 2;
    self.frame = newframe;
    
    // scroll view.
    UIView *superView = self.superview;
    CGFloat yCoord = 0;
    CGFloat xCoord = 0;
    
    
    /////
    /// 이쪽에서 스크롤 할 때 먼저 꽉 채우고 그다음에 스크롤링 되도록
    ////
    while(superView != nil)
    {
        yCoord += superView.frame.origin.y;
        xCoord += superView.frame.origin.x;
        if([superView isKindOfClass:[UIScrollView class]] || [superView isKindOfClass:[FlexibleScrollView class]])
        {
            UIScrollView *scrollView = (UIScrollView*)superView;
            [scrollView setContentOffset:CGPointMake(0, yCoord + [self caretRectForPosition:self.selectedTextRange.start].origin.y)
                                animated:YES];
            NSLog(@"%f, %f, %f, %f",xCoord, yCoord, self.frame.size.width, self.frame.size.height);
            break;
        }
        
        superView = superView.superview;
    }
}
- (void)textViewDidEndEditing:(PHTextField *)textView
{
    if ([textView.text isEqualToString:@""]) {
        textView.text = placeHolder;
        textView.textColor = [UIColor lightGrayColor]; //optional
        isPlaceHolder = true;
    }
    [textView resignFirstResponder];
}
@end
