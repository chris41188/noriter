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
        int i;
        NSArray *title = [NSArray arrayWithObjects:@"놀아보아요", @"밥먹장", @"싸기" ,nil];
        array = [[NSMutableArray alloc]init];
        
        for(i=0;i<24;)
        {
            int start = i;
            int end = i+rand()%1+1;
            //NSLog([NSString stringWithFormat:@"%d %d %d",i,start,end]);
            if ( rand()%3 < 2 )// || true ) // start
            {
                NSString *str = [NSString stringWithString:[title objectAtIndex:rand()%[title count]]];
                NSMutableArray *data = [NSMutableArray arrayWithObjects:str, [NSNumber numberWithInt:start], [NSNumber numberWithInt:end], nil];
                
                [array addObject:data];
            }
            i=end;
        }
        //array = [NSMutableArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
        return self;
    }
}
-(void)print{
    NSLog(@"HIHIHI");
}
@end
