//
//  ContainerView.m
//  empty
//
//  Created by echo on 13. 6. 8..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "ContainerView.h"

@implementation ContainerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
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
-(void)resetYCoord
{
    UIView* preview = nil;
    CGRect newFrame;
    for (UIView* subview in self.subviews) {
        if([subview isKindOfClass:[UIImageView class]])
            continue;
        
        newFrame = subview.frame;
        if(preview != nil)
            newFrame.origin.y = [self bottomCoordWithView:preview] + MarginHeight;
        newFrame.size.height = [self subviewBottomCoordWithSuperview:subview];
        subview.frame = newFrame;
        
        preview = subview;
        
    }
    /// Resize Container View ///
    newFrame = self.frame;
    newFrame.size.height = [self bottomCoordWithView:[self.subviews objectAtIndex:self.subviews.count - 3]];
    
    self.contentSize = newFrame.size;
    NSLog(@"%@",self.subviews);
    NSLog(@"%f",self.contentSize.height);
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}

// 스크롤뷰가 스크롤 되기 직전에 실행된다.
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self endEditing:YES];
    if (decelerate) {
        NSLog(@"The scrolling movement will continue, but decelerate, after a touch-up gesture during a dragging operation");
    } else {
        NSLog(@"Scrolling stops immediately upon touch-up");
    }
}

@end
