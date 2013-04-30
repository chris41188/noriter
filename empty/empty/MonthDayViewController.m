//
//  MonthDayViewController.m
//  empty
//
//  Created by echo on 13. 4. 29..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "MonthDayViewController.h"

@implementation MonthDayViewController
@synthesize label;
@synthesize row;
@synthesize col;
-(void)setData:(NSMutableArray *)array
{
    data = array;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //self.view.layer.borderColor = [UIColor redColor].CGColor;
    //self.view.layer.borderWidth = 1.0f;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gesturePiece:)];
    [tapGesture setNumberOfTapsRequired:1];
    [self.view addGestureRecognizer:tapGesture];
}
- (void)gesturePiece:(UIGestureRecognizer *)gestureRecognizer
{
    MonthViewController *MVC = (MonthViewController*)self.parentViewController;
    NSLog(@"hi");
    [MVC expandRow:row Col:col];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
