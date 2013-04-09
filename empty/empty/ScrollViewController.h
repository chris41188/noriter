//
//  ScrollViewController.h
//  empty
//
//  Created by echo on 13. 4. 9..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ScrollViewController : UIViewController
{
    NSMutableArray *data;
}
-(void)setData:(NSMutableArray*)array;
-(void)clear;
//- (void)drawRect:(CGRect)rect;
@end
