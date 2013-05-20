//
//  MonthDayView.m
//  empty
//
//  Created by echo on 13. 4. 29..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "MonthDayView.h"

@implementation MonthDayView
@synthesize label;
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
        self.layer.backgroundColor = [UIColor whiteColor].CGColor;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gesturePiece:)];
        [tapGesture setNumberOfTapsRequired:1];
        [self addGestureRecognizer:tapGesture];
        
        label = [[UILabel alloc] init];
        label.frame = CGRectMake(0, 0, 30, 30);
        label.numberOfLines=0;
        //label.lineBreakMode=UILineBreakModeCharacterWrap;
        label.textColor=[UIColor blackColor];
        label.text = @"hi";
        [self addSubview:label];
    }
    return self;
}
-(void)setData:(NSMutableArray *)array
{
    
}
- (void)gesturePiece:(UIGestureRecognizer *)gestureRecognizer
{
    MonthViewController *_MVC = (MonthViewController*)MVC;
    NSLog(@"Month Day Touched");
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
