//
//  Schedule.h
//  하나의 일정
//
//  Created by echo on 13. 5. 13..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
@interface Schedule : NSObject
{
    NSDateComponents *dc_StartDateComp;
    NSDateComponents *dc_EndDateComp;
    UIImage *i_Picture;
    NSString *s_Content;
    NSMutableArray *ma_Comment;
    NSMutableArray *ma_Share;
    float f_Latitude;
    float f_Longitude;
    NSString *s_Address;
    Person *p_Writter;
}

-(id)init;
-(UIImage*)getGoogleMapsImage;
-(NSURL*)getGoogleMapsURL;
-(NSString*)getPeriod;
+(int)getWeekdayWithYear:(int)year Month:(int)month Day:(int)day;
+(int)getWeekdayWithDateComps:(NSDateComponents*)DC;
+(NSString*)getWeekDaySymbolWithWeekday:(int)weekday;
+(NSString*)getDateWithDateComp:(NSDateComponents*)DC;
+(NSString*)getPeriodWithStartDateComp:(NSDateComponents *)SDC EndDateComp:(NSDateComponents *)EDC;
@property (nonatomic, strong)NSDateComponents *dc_StartDateComp;
@property (nonatomic, strong)NSDateComponents *dc_EndDateComp;
@property (nonatomic, strong)UIImage *i_Picture;
@property (nonatomic, strong)NSString *s_Content;
@property (nonatomic, strong)NSMutableArray *ma_Comment;
@property (nonatomic, strong)NSMutableArray *ma_Share;
@property float f_Latitude;
@property float f_Longitude;
@property (nonatomic, strong)NSString *s_Address;
@property (nonatomic, strong)Person *p_Writter;
@end
