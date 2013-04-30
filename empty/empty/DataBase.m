//
//  DataBase.m
//  empty
//
//  Created by echo on 13. 4. 9..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "DataBase.h"

@implementation DataBase

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
    
}
@synthesize array;
-(id)init
{
    if(self = [super init])
    {
        //NSLog(@"DataBaseInit");
        int i,l,o,C;
        NSArray *title = [NSArray arrayWithObjects:@"놀아보아요", @"밥먹장", @"싸기" ,nil];
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
                    int end = o+rand()%1+1;
                    if ( rand()%3 < 2 )// || true ) // start
                    {
                        NSString *str = [NSString stringWithString:[title objectAtIndex:rand()%[title count]]];
                        NSMutableArray *event = [NSMutableArray arrayWithObjects:str, [NSNumber numberWithInt:start], [NSNumber numberWithInt:end], nil];
                        [Day addObject:event];
                    }
                    o=end;
                }
                [Month addObject:Day];
            }
            [array addObject:Month];
        }
        
        //array = [NSMutableArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
        return self;
    }
}
-(void)print{
    NSLog(@"HIHIHI");
}
@end
