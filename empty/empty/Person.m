//
//  Person.m
//  empty
//
//  Created by echo on 13. 5. 13..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "Person.h"

@implementation Person
@synthesize i_Picture;
@synthesize s_Name;
@synthesize s_ID;
@synthesize ma_DBs;
@synthesize ma_Friends;
-(id)init
{
    self = [super init];
    if(self)
    {
        ma_DBs = [[NSMutableArray alloc] init];
        ma_Friends = [[NSMutableArray alloc]init];
    }
    return self;
}
@end
