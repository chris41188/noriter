//
//  AddTodoViewController.h
//  empty
//
//  Created by echo on 13. 5. 23..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Schedule.h"
#import <QuartzCore/QuartzCore.h>

extern const NSInteger ToolbarHeight;
extern const NSInteger MarginHeight;
extern const NSInteger MarginWidth;
@protocol MotherViewControllerDelegate <NSObject>

@end
@interface AddTodoViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    UITextView *contentTextView;
    UIImageView *picImageView;
    UIImageView *mapImageView;
    UIButton *repeatButton;
    
    UIToolbar *naviToolbar;
    //UINavigationBar *naviBar;
    UIToolbar *firstToolbar;
    UIToolbar *secondToolbar;
    UIScrollView *contentView;
    NSDate *startDate;
    NSDate *endDate;
    bool hasEnd;
    bool hasPic;
    bool hasMap;
}
@property (assign) id <MotherViewControllerDelegate> motherViewControllerDelegate;
@end
