//
//  Comment.m
//  empty
//
//  Created by echo on 13. 5. 15..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "Comment.h"

@implementation Comment
@synthesize writter;
@synthesize content;
@synthesize uploadDate;
-(NSString*)getUploadDateString
{
    return [NSString stringWithFormat:@"%d/%d/%d %@ %2d:%.2d",uploadDate.year,uploadDate.month,uploadDate.day,[Schedule getWeekDaySymbolWithWeekday:[Schedule getWeekdayWithDateComps:uploadDate]],uploadDate.hour,uploadDate.minute];
}
@end
