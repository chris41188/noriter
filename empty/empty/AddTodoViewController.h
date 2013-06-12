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
#import "ContainerView.h"
#import "FlexibleScrollView.h"
#import "FlexibleView.h"
#import "PictureAddViewController.h"
#import "PHTextField.h"
extern const NSInteger ToolbarHeight;
extern const NSInteger MarginHeight;
extern const NSInteger MarginWidth;
@protocol MotherViewControllerDelegate <NSObject>

@end
@interface AddTodoViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate>
{
    /// Navi Toolbar ( Top Toolbar)
    UIToolbar *naviToolbar;
    
    
    /// Container View's
    FlexibleScrollView *containerView;
    
    ///@ Date View's
    FlexibleView *dateView;
    UIButton *dateButton;
    NSDateComponents *startDate;
    NSDateComponents *endDate;
    bool hasEndDate;
    
    ///@ TextContent View's
    FlexibleView *textContentView;
    UITextField *titleTextField;
    UIButton *addTextDetailButton;
    PHTextField* textDetailView;
    
    ///@ Picture View's
    PictureAddViewController *pictureAddViewController;
    //NSMutableArray *pictureArray;
    //UIButton *addPictureButton;
    //UIPickerView *pictureStandardUnitView;
    //UIButton *removePictureButton;
    
    ///@ Navigation View
    FlexibleView *navigationView;
    
    
    /// Option View
    FlexibleView *optionView;
    
    
    
        
    UIToolbar *firstToolbar;
    UIToolbar *secondToolbar;
    bool hasEnd;
    bool hasPic;
    bool hasMap;
    
    UITapGestureRecognizer *tap;
}
@property (assign) id <MotherViewControllerDelegate> motherViewControllerDelegate;
@end
