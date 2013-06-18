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
@synthesize dateComps;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        /*UIView *upsideBorderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 1)];
        upsideBorderView.backgroundColor = [UIColor colorWithRed:0.851 green:0.851 blue:0.851 alpha:1];
        [self addSubview:upsideBorderView];
        
        UIView *rightsideBorderView = [[UIView alloc]initWithFrame:CGRectMake(frame.size.width-1, 0, 1, frame.size.height)];
        rightsideBorderView.backgroundColor = [UIColor colorWithRed:0.851 green:0.851 blue:0.851 alpha:1];
        [self addSubview:rightsideBorderView];
        */
        //self.layer.borderColor = [UIColor colorWithRed:0.851 green:0.851 blue:0.851 alpha:1].CGColor;
        //self.layer.borderWidth = 1;
        
        
        self.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gesturePiece:)];
        [tapGesture setNumberOfTapsRequired:1];
        [self addGestureRecognizer:tapGesture];
        
        label = [[UILabel alloc] init];
        label.frame = CGRectMake(2, 2.5, 30, 30);
        label.numberOfLines=1;
        //label.lineBreakMode=UILineBreakModeCharacterWrap;
        label.textColor=[UIColor blackColor];
        label.text = @"hi";
        label.font = [UIFont systemFontOfSize:12.23];
        label.backgroundColor = [UIColor clearColor];
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
-(void)setDateComps:(NSDateComponents *)_dateComps
{
    dateComps = _dateComps;
    [self resetLabel];
}
-(void)resetLabel
{
    label.text = [NSString stringWithFormat:@"00"];
    [label sizeToFit];
    label.text = [NSString stringWithFormat:@"%2d",[dateComps day]];
    MonthViewController *_MVC = (MonthViewController*)MVC;
    if(_MVC.month != [dateComps month])
    {
        [label setTextColor:[UIColor colorWithRed:0.851 green:0.851 blue:0.851 alpha:1]];
    }
    else if([Schedule getWeekdayWithDateComps:dateComps] == 0)
    {
        [label setTextColor:[UIColor colorWithRed:0.996 green:0.427 blue:0.086 alpha:1]];
    }
    else
    {
        [label setTextColor:[UIColor colorWithRed:0.263 green:0.263 blue:0.263 alpha:1]];
    }

}
/*
- (void)drawRect:(CGRect)rect {
	// Get the contextRef
	CGContextRef contextRef = UIGraphicsGetCurrentContext();
	
	// Set the border width
	CGContextSetLineWidth(contextRef, 1.0);
	
	// Set the border color to RED
	CGContextSetRGBStrokeColor(contextRef, 218.0, 218.0, 218.0, 1.0);
	
	// Draw the border along the view edge
	CGContextStrokeRect(contextRef, rect);
}*/

@end
