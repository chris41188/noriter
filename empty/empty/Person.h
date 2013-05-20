//
//  Person.h
//  empty
//
//  Created by echo on 13. 5. 13..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    UIImage *i_Picture;
    NSString *s_Name;
    NSString *s_ID;
    NSMutableArray *ma_DBs;
}
-(id)init;
@property (nonatomic, strong) UIImage *i_Picture;
@property (nonatomic, strong) NSString *s_Name;
@property (nonatomic, strong) NSString *s_ID;
@property (nonatomic, strong) NSMutableArray *ma_DBs;
@end
