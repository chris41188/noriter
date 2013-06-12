//
//  FlexibleScrollView.m
//  empty
//
//  Created by echo on 13. 6. 10..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "FlexibleScrollView.h"

@implementation FlexibleScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.delegate = self;
        self.alwaysBounceVertical = YES;
    }
    return self;
}
-(void)addSubview:(UIView *)view
{
    [super addSubview:view];
    [self resetContentHeight];
}
-(void)resetContentHeight
{
    CGFloat maxHeight = 0;
    for (UIView* subview in self.subviews) {
        if(maxHeight < [self bottomCoordWithView:subview])
            maxHeight = [self bottomCoordWithView:subview];
    }
    CGSize newSize = self.contentSize;
    newSize.height = maxHeight;
    self.contentSize = newSize;
}
-(void)resetSubviewOriginYcoord
{
    UIView *preSubview = nil;
    CGRect newFrame;
    for (UIView* subview in self.subviews) {
        if(preSubview != nil)
        {
            newFrame = subview.frame;
            newFrame.origin.y = [self bottomCoordWithView:preSubview];
            if(CGRectEqualToRect(subview.frame, newFrame) == false)
                subview.frame = newFrame;
        }
        preSubview = subview;
    }
}
-(CGFloat)bottomCoordWithView:(UIView*)_view
{
    CGFloat bottomCoord = _view.frame.origin.y + _view.frame.size.height;
    return bottomCoord;
}


- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
{
	return YES;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(scrollView.tracking == true)
        [self.superview endEditing:YES];
}
@end
