//
//  FlexibleView.m
//  empty
//
//  Created by echo on 13. 6. 10..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "FlexibleView.h"

@implementation FlexibleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        preFrame = self.frame;
    }
    return self;
}
-(void)addSubview:(UIView *)view
{
    [super addSubview:view];
    [self resetHeight];
}
-(void)resetHeight
{
    CGFloat maxHeight = 0;
    for (UIView* subview in self.subviews) {
        if(maxHeight < [self bottomCoordWithView:subview])
            maxHeight = [self bottomCoordWithView:subview];
    }
    CGRect newFrame = self.frame;
    NSLog(@"%f",self.frame.origin.y);
    newFrame.size.height = maxHeight;
    [self setFrame:newFrame];
}
-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    if(CGSizeEqualToSize(preFrame.size, frame.size) == false)
    {
        if([self.superview isKindOfClass:[FlexibleView class]])
        {
            FlexibleView* parentFlexibleView = (FlexibleView*)self.superview;
            [parentFlexibleView resetHeight];
        }
        else if([self.superview isKindOfClass:[FlexibleScrollView class]])
        {
            FlexibleScrollView* parentFlexibleScrollView = (FlexibleScrollView*)self.superview;
            [parentFlexibleScrollView resetSubviewOriginYcoord];
            
        }
    }
    preFrame = frame;
}



-(CGFloat)bottomCoordWithView:(UIView*)_view
{
    CGFloat bottomCoord = _view.frame.origin.y + _view.frame.size.height;
    return bottomCoord;
}

@end
