//
//  PictureAddViewController.h
//  empty
//
//  Created by echo on 13. 6. 10..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlexibleView.h"
#import "PictureAddCell.h"


@interface PictureAddViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    NSMutableArray *imageViews;
    NSInteger colCount;
    CGSize componentSize;
    UIButton *addButton;
    
    NSMutableArray *removeButtons;
}
- (id)initWithViewFrame:(CGRect)viewFrame ColCount:(NSInteger)_colCount ComponentHeight:(CGFloat)_compHeight;
-(void) addImage:(UIImage*)image;
@end
