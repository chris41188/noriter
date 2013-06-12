//
//  ComponentAddViewViewController.m
//  empty
//
//  Created by echo on 13. 6. 10..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "ComponentAddViewViewController.h"

@implementation ComponentAddViewViewController

- (id)initWithViewFrame:(CGRect)viewFrame ColCount:(NSInteger)_colCount ComponentHeight:(CGFloat)_compHeight
{
    self = [super init];
    if(self)
    {
        self.view.frame = viewFrame;
        items = [[NSMutableArray alloc]init];
        colCount = _colCount;
        componentHeight = _compHeight;
    }
    return self;
}
-(void) addItem:(id)item
{
    [items addObject:item];
    
}
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

@end
