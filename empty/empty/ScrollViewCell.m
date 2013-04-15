//
//  ScrollViewCell.m
//  empty
//
//  Created by echo on 13. 4. 15..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "ScrollViewCell.h"

@implementation ScrollViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)layoutSubviews {
    //have the cell layout normally
    [super layoutSubviews];
    //get the bounding rectangle that defines the position and size of the image
    CGRect imgFrame = [[self textLabel] frame];
    //anchor it to the top-left corner
    imgFrame.origin = CGPointZero;
    imgFrame.origin.x = 3;
    //change the height to be the height of the cell
    imgFrame.size.height = [self frame].size.height;
    //change the width to be the same as the height
    imgFrame.size.width = imgFrame.size.height;
    //set the imageView's frame (this will move+resize it)
    [[self textLabel] setFrame:imgFrame];
    
    //reposition the other labels accordingly
}
@end
