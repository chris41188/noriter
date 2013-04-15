//
//  ScrollView.h
//  empty
//
//  Created by echo on 13. 4. 11..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@interface ScrollView : UIView
{
    NSMutableArray *data;
}
-(void)setData:(NSMutableArray*)array;
-(int)tapTest:(CGPoint)point;
@end
