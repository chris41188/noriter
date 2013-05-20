//
//  DataBase.m
//  empty
//
//  Created by echo on 13. 4. 9..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "DataBase.h"

@implementation DataBase
/*
+ (DataBase *)sharedDataBase

{
    static DataBase *dataBase = nil;
    if(dataBase == nil)
    {
        @synchronized(self)
        {
            if(dataBase == nil)
            {
                dataBase = [[self alloc] init];
            }
            
        }
        
    }
    return dataBase;
    
}*/
@synthesize title;
@synthesize owner;
@synthesize array;
-(id)init //random
{
    if(self = [super init])
    {

        
        NSLog(@"Data Base Init");
        int i,l,o,C;
        title = @"NamSE의 IOS";
        NSArray *content = [NSArray arrayWithObjects:@"밥먹겠습니다. 밥먹을거에요 밥먹자 밥 그래 밥밥밥 바라밥바 밥밥! 바라발바ㅏ바바밥 \n바바바르아르베밥 디너 브레이크퍼스트 런치! 야 씩 은 치 킨!!", @"오늘은\n    회사에\n       가는날    ! @ ! *&^$#@", @"잠잘겁니다. 오늘 잘게요. 잘자요 사요나라 ^^" ,nil];
        array = [[NSMutableArray alloc]init];
        
        //MockData
        for(i=1;i<=12;i++)
        {
            if(i==1||i==3||i==4||i==7||i==8||i==10||i==12) C = 1;
            else if(i!=2) C = 0;
            else C = -1;
            NSMutableArray *Month = [[NSMutableArray alloc]init];
            //[Month addObject:[NSNumber numberWithInt:i]];
            for(l=1;l<=30+C;l++)
            {
                NSMutableArray *Day = [[NSMutableArray alloc] init];
                //[Day addObject:[NSNumber numberWithInt:l]];
                for(o=0;o<24;)
                {
                    int start = o;
                    int end = o+rand()%3+1;
                    if ( rand()%3 < 2 )// || true ) // start
                    {
                        Schedule *schedule = [[Schedule alloc] init];
                        
                        schedule.dc_StartDateComp = [[NSDateComponents alloc]init];
                        schedule.dc_StartDateComp.year = 2013;
                        schedule.dc_StartDateComp.month = i;
                        schedule.dc_StartDateComp.day = l;
                        schedule.dc_StartDateComp.hour = start;
                        schedule.dc_StartDateComp.minute = 0;
                        
                        schedule.dc_EndDateComp = [[NSDateComponents alloc]init];
                        schedule.dc_EndDateComp.year = 2013;
                        schedule.dc_EndDateComp.month = i;
                        schedule.dc_EndDateComp.day = l;
                        schedule.dc_EndDateComp.hour = end;
                        schedule.dc_EndDateComp.minute = 0;
                        
                        if( rand()%2 == 0)
                        {
                            schedule.i_Picture = [UIImage imageNamed:@"Diet.jpg"];
                            schedule.s_Content = [content objectAtIndex:0];
                            schedule.s_Address = @"식당";
                        }
                        else if( rand()%2 == 0)
                        {
                            schedule.i_Picture = [UIImage imageNamed:@"Company.jpg"];
                            schedule.s_Content = [content objectAtIndex:1];
                            schedule.s_Address = @"회사";
                        }
                        else
                        {
                            schedule.i_Picture = [UIImage imageNamed:@"Sleep.jpg"];
                            schedule.s_Content = [content objectAtIndex:2];
                            schedule.s_Address = @"집";
                        }
                        
                        schedule.ma_Comment = [[NSMutableArray alloc] init];
                        schedule.ma_Share = [[NSMutableArray alloc] init];
                        schedule.f_Latitude = (double)arc4random() / 0x100000000 * 180.0 - 90.0;
                        schedule.f_Longitude = (double)arc4random() / 0x100000000 * 360.0 - 180.0;
                        schedule.p_Writter = owner;
                        
                        int p, r=rand()%5;
                        for(p=0; p<r; p++)
                        {
                            Comment* _comment = [[Comment alloc]init];
                            _comment.writter = owner;
                            _comment.content = [content objectAtIndex:rand()%3];
                            _comment.uploadDate = [[NSDateComponents alloc]init];
                            _comment.uploadDate.year = 2013;
                            _comment.uploadDate.month = rand()%12+1;
                            _comment.uploadDate.day = rand()%29+1;
                            _comment.uploadDate.hour = rand()%25;
                            _comment.uploadDate.minute = rand()%60;
                            [schedule.ma_Comment addObject:_comment];
                        } 
                        
                        //if( rand()%2 == 0 ) schedule.p_Writter = Namse;
                        //else if( rand()%2 == 0 ) schedule.p_Writter = Minhwa;
                        //else schedule.p_Writter = Yenarae;
                        
                        [Day addObject:schedule];
                    }
                    o=end;
                }
                [Month addObject:Day];
            }
            [array addObject:Month];
        }
    }
    return self;
}
-(NSArray*)getSchedulesWithMonth:(NSInteger)month
{
    if(month <= 0) return nil;
    return [array objectAtIndex:month-1];
}
-(NSArray*)getSchedulesWithMonth:(NSInteger)month Day:(NSInteger)day
{
    if(day <= 0) return nil;
    return [[self getSchedulesWithMonth:month] objectAtIndex:day-1];
}
-(Schedule*)getScheduleWithMonth:(NSInteger)month Day:(NSInteger)day Index:(NSInteger)index
{
    if(index < 0) return nil;
    return [[self getSchedulesWithMonth:month Day:day] objectAtIndex:index];
}
-(void)print{
    NSLog(@"HIHIHI");
}
@end
