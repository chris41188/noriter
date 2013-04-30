//
//  ScrollView.m
//  empty
//
//  Created by echo on 13. 4. 11..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "ScrollView.h"

@implementation ScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)setData:(NSMutableArray*)array
{
    data = array;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
-(int)tapTest:(CGPoint)point
{
    int cnt = 0;
    for (NSArray *array in data) {
        int start = [[array objectAtIndex:1] integerValue];
        int end = [[array objectAtIndex:2] integerValue];
        float relStart = start * self.frame.size.height / 24 - self.frame.origin.y;
        float relEnd = end * self.frame.size.height / 24 - self.frame.origin.y;
        CGRect rectangle = CGRectMake(0, relStart, self.frame.size.width, relEnd-relStart);
        if( CGRectContainsPoint(rectangle, point) == YES)
        {
            return cnt;
        }
        cnt++;
    }
    return -1;
}

@end
