//
//  WeekViewController.h
//  empty
//
//  Created by echo on 13. 4. 16..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewController.h"
#import "ScrollViewController.h"
#import "DataBase.h"
@interface WeekViewController : UIViewController
{
    DataBase *DB;
    NSMutableArray *arrSVC;
    TableViewController *TVC;
    NSDateComponents *nowDateComps;
}
@property (nonatomic, strong)TableViewController *TVC;
@property (nonatomic, strong)DataBase *DB;
-(id)initWithDB:(DataBase*)_DB Frame:(CGRect)frame;
-(void)setDateWithMonth:(int)month Day:(int)day;
@end
