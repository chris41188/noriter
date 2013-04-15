//
//  ScrollViewController.h
//  empty
//
//  Created by echo on 13. 4. 9..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ScrollView.h";
#import "TableViewController.h";
@interface ScrollViewController : UIViewController<UIGestureRecognizerDelegate>
{
    NSMutableArray *data;
    TableViewController* TVC;
    ScrollView *SV;
    
}
@property (strong,nonatomic) TableViewController *TVC;
-(void)setData:(NSMutableArray*)array;
-(void)clear;
- (IBAction)handleTap:(UITapGestureRecognizer *)TapGesture;
@end
