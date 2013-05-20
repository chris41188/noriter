//
//  Comment.h
//  empty
//
//  Created by echo on 13. 5. 15..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Schedule.h"
@interface Comment : NSObject
{
    Person *writter;
    NSString *content;
    NSDateComponents *uploadDate;
}
-(NSString*)getUploadDateString;
@property (nonatomic, strong) Person *writter;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSDateComponents *uploadDate;
@end
