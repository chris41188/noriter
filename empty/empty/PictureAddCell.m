//
//  PictureAddCell.m
//  empty
//
//  Created by echo on 13. 6. 10..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "PictureAddCell.h"

@implementation PictureAddCell
@synthesize image;
- (id)initWithFrame:(CGRect)frame Image:(UIImage*)_image;
{
    self = [super initWithFrame:frame];
    if (self) {
        CGRect newFrame = frame;
        newFrame.origin = CGPointZero;
        
        
        image = _image;
        UIButton *imageButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        imageButton.frame = newFrame;
        
        
        [imageButton setImage:_image forState:UIControlStateNormal];
        [self addSubview:imageButton];
    }
    return self;
}


@end
