//
//  DataBase.h
//  일정들을 저장하는 하나의 캘린더 달력의 역활
//
//  Created by echo on 13. 4. 9..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Schedule.h"
#import "Comment.h"
@interface DataBase : NSObject
{
    NSMutableArray *array;
    NSString *title;
    Person *owner;
}
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) Person *owner;
@property (strong, nonatomic) NSMutableArray *array;
//+ (DataBase *)sharedDataBase;
-(NSArray*)getSchedulesWithMonth:(NSInteger)month Day:(NSInteger)day;
-(Schedule*)getScheduleWithMonth:(NSInteger)month Day:(NSInteger)day Index:(NSInteger)index;
-(NSArray*)getSchedulesWithMonth:(NSInteger)month;
-(id)initWithOwner:(Person*)_owner;
@end
