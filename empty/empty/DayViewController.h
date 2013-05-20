//
//  DayViewController.h
//  empty
//
//  Created by echo on 13. 4. 9..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewController.h"
#import "ScrollViewController.h"
#import "ScrollView.h"
#import "DataBase.h"
@interface DayViewController : UIViewController
{
    TableViewController *TVC;
    ScrollViewController *SVC;
    NSDateComponents *dateComps;
    DataBase *DB;
}
@property (nonatomic, strong)TableViewController *TVC;
@property (nonatomic, strong)DataBase* DB;
-(id)initWithDB:(DataBase*)_DB Frame:(CGRect)frame;
-(void)setDateWithMonth:(int)month Day:(int)day;
@end

