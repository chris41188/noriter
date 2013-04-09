//
//  ScrollViewController.m
//  empty
//
//  Created by echo on 13. 4. 9..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()

@end

@implementation ScrollViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setData:(NSMutableArray*)array
{
    data = array;
    NSLog(@"%@",data);
    [self clear];
    [self draw];
}
-(void)draw
{
    for (NSArray *array in data) {
        int start = [[array objectAtIndex:1] integerValue];
        int end = [[array objectAtIndex:2] integerValue];
        float relStart = start * self.view.bounds.size.height / 24 - self.view.bounds.origin.y;
        float relEnd = end * self.view.bounds.size.height / 24 - self.view.bounds.origin.y;
        NSLog(@"%f -> %f",relStart,relEnd-relStart);
        [self drawRect:CGRectMake(0, relStart, self.view.frame.size.width, relEnd-relStart)];
    }
}
-(void)clear
{
//    [self.view ]
}
-(void) drawRect:(CGRect)rect{
    UIView *subview =[[UIView alloc] initWithFrame:rect];
    [subview setBackgroundColor:[UIColor blueColor]];
    subview.layer.borderColor = [UIColor redColor].CGColor;
    subview.layer.borderWidth = 1.0f;
    [self.view addSubview: subview];
    
}

@end
