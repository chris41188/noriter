//
//  DataBase.h
//  empty
//
//  Created by echo on 13. 4. 9..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataBase : NSObject

{
    NSMutableArray *array;
}
@property (strong, nonatomic) NSMutableArray *array;
+ (DataBase *)sharedDataBase;

@end
