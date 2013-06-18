//
//  Schedule.m
//  empty
//
//  Created by echo on 13. 5. 13..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "Schedule.h"

@implementation Schedule
@synthesize dc_EndDateComp;
@synthesize dc_StartDateComp;
@synthesize i_Picture;
@synthesize s_Content;
@synthesize ma_Comment;
@synthesize ma_Share;
@synthesize f_Latitude;
@synthesize f_Longitude;
@synthesize s_Address;
@synthesize p_Writter;

-(id)init
{
    self = [super init];
    if(self)
    {
        ma_Comment = [[NSMutableArray alloc]init];
        ma_Share = [[NSMutableArray alloc]init];
    }
    return self;
}

-(UIImage*)getGoogleMapsImage
{
    return [UIImage imageWithData: [NSData dataWithContentsOfURL:[self getGoogleMapsURL]]];
}

-(NSURL*)getGoogleMapsURL
{
    NSString *staticMapUrl = [NSString stringWithFormat:@"http://maps.google.com/maps/api/staticmap?markers=color:red|%f,%f&%@&sensor=false",f_Latitude, f_Longitude,@"zoom=1&size=300x200"];
    NSURL *mapUrl = [NSURL URLWithString:[staticMapUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    return mapUrl;
}

-(NSString*)getPeriod
{
    return [Schedule getPeriodWithStartDateComp:self.dc_StartDateComp EndDateComp:self.dc_EndDateComp];
}

+(NSString*)getDateWithDateComp:(NSDateComponents *)DC
{
    return [NSString stringWithFormat:@"%d / %d / %d(%@) %2d : %.2d"
            ,DC.year, DC.month, DC.day, [Schedule getWeekDaySymbolWithWeekday:[Schedule getWeekdayWithDateComps:DC]], DC.hour, DC.minute];
}

+(NSString*)getPeriodWithStartDateComp:(NSDateComponents *)SDC EndDateComp:(NSDateComponents *)EDC
{
    return [NSString stringWithFormat:@"%@ ~ %@",[Schedule getDateWithDateComp:SDC],[Schedule getDateWithDateComp:EDC]];
            /*
     NSString *period = @"hi";
     
     period = [NSString stringWithFormat:@"%d",SDC.year];
     period = [NSString stringWithFormat:@"%@/%d",period,SDC.month];
     period = [NSString stringWithFormat:@"%@/%d(%@) ",period,SDC.day,[[[NSDateFormatter alloc] weekdaySymbols] objectAtIndex:[Schedule getWeekdayWithYear:SDC.year Month:SDC.month Day:SDC.day]]];
     period = [NSString stringWithFormat:@"%@/%d:%2d",period,SDC.hour,SDC.minute];
     
     bool isNeedRest = NO;
     if (SDC.year != EDC.year || SDC.month != EDC.month || SDC.day != EDC.day || SDC.hour != EDC.hour || SDC.minute != EDC.minute) {
     period = [NSString stringWithFormat:@"%@~ ",period];
     if(SDC.year != EDC.year)
     {
     period = [NSString stringWithFormat:@"%@%d/",period,EDC.year];
     isNeedRest = YES;
     }
     if(SDC.month != EDC.month || isNeedRest == YES)
     {
     period = [NSString stringWithFormat:@"%@%d/",period,EDC.year];
     isNeedRest = YES;
     }
     }
     if (SDC.year != EDC.year) {
     period = [NSString stringWithFormat:@"%@%d/",period,EDC.year];
     }
     if (SDC.month != EDC.month) {
     period = [NSString stringWithFormat:@"%@%d/",period,EDC.month];
     }
     if (SDC.day != EDC.day) {
     period = [NSString stringWithFormat:@"%@%d(%@)",period,EDC.day,[[[NSDateFormatter alloc] weekdaySymbols] objectAtIndex:[Schedule getWeekdayWithYear:EDC.year Month:EDC.month Day:EDC.day]]];
     }
     if(SDC.hour != EDC.hour)
     {
     period = [NSString stringWithFormat:@"%@%d:%2d",period,EDC.hour,EDC.minute];
     }
     else
     period = [NSString stringWithFormat:@"%@%2d",period,EDC.minute];
     }*/
}

/*
+(NSInteger)getWeekWithDay:(NSInteger)_day Weekday:(NSInteger)_weekday
{
    int day = _day, weekday = _weekday;
    int week = 1;
    for( ; day>1; day--)
    {
        if(weekday - 1 < 0)
        {
            weekday = 6;
            week++;
        }
        else weekday--;
    }
    return 
}*/

+(NSString*)getWeekDaySymbolWithWeekday:(int)weekday
{
    return [[[NSDateFormatter alloc] shortWeekdaySymbols]objectAtIndex:weekday];
}

+(int)getWeekdayWithDateComps:(NSDateComponents*)DC
{
    return [Schedule getWeekdayWithYear:DC.year Month:DC.month Day:DC.day];
}

+(int)getWeekdayWithYear:(int)year Month:(int)month Day:(int)day
{
    
    if(month <= 2) {
        year--;
        month += 12;
    }
    
    int year1 = year/100;
    int year2 = year%100;
    
    int weekDay =  (day + 26*(month+1)/10 + year2 + year2/4 + year1/4 - year1*2) % 7 - 1;
    if (weekDay < 0) {
        weekDay += 7;
    }
    NSLog(@"weekday : %d",weekDay);
    return weekDay;
}
@end
