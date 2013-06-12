//
//  FlexibleView.h
//  empty
//
//  Created by echo on 13. 6. 10..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlexibleScrollView.h"
@interface FlexibleView : UIView
{
    CGRect preFrame;
}
- (id)initWithFrame:(CGRect)frame;
-(void)resetHeight;
@end
