//
//  PictureAddCell.h
//  empty
//
//  Created by echo on 13. 6. 10..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PictureAddCell : UIView
{
    UIImage *image;
}
@property (nonatomic, strong) UIImage *image;


- (id)initWithFrame:(CGRect)frame Image:(UIImage*)_image;
@end
