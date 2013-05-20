//
//  TableCell.m
//  empty
//
//  Created by echo on 13. 5. 13..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "TableCell.h"

@implementation TableCell
@synthesize schedule;
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

@end
