//
//  MonthDayView.m
//  empty
//
//  Created by echo on 13. 4. 29..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "MonthDayView.h"

@implementation MonthDayView
@synthesize col;
@synthesize row;
@synthesize MVC;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.layer.borderColor = [UIColor redColor].CGColor;
        self.layer.borderWidth = 1.0f;
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gesturePiece:)];
        [tapGesture setNumberOfTapsRequired:1];
        [self addGestureRecognizer:tapGesture];
        //라벨추가시키기
    }
    return self;
}
- (void)gesturePiece:(UIGestureRecognizer *)gestureRecognizer
{
    //[self co /// 부모인 Controller를 어떻게 찾지?]
    MonthViewController *_MVC = (MonthViewController*)MVC;
    NSLog(@"hi");
    [_MVC expandRow:row Col:col];
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
