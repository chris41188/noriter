//
//  PHTextField.h
//  empty
//
//  Created by echo on 13. 6. 10..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlexibleScrollView.h"
extern const NSInteger ToolbarHeight;
@interface PHTextField : UITextView <UITextViewDelegate>
{
    NSString* placeHolder;
    BOOL isPlaceHolder;
}
- (id)initWithFrame:(CGRect)frame placeholder:(NSString*)_placeHolder;
@end
