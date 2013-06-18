//
//  MonthViewController.h
//  empty
//
//  Created by echo on 13. 4. 29..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MonthDayView.h"
#import "DataBase.h"
#import "TableViewController.h"
@interface MonthViewController : UIViewController
{
    DataBase *DB;
    NSMutableArray *arrMDVC;
    NSMutableArray *arrMDV;
    NSInteger  intActioning;
    NSInteger preCol,preRow;
    BOOL isOpen;
    TableViewController *TVC;
    NSDateComponents *nowDateComps;
    NSInteger month;
    
    int sh;
    int h_n;
    int w_n;
}
@property (nonatomic) NSInteger month;
@property (nonatomic, strong)TableViewController *TVC;
@property (nonatomic, strong)DataBase *DB;
-(id)initWithDB:(DataBase*)_DB Frame:(CGRect)frame;
-(void)setDateWithMonth:(int)_month;
-(void)expandRow:(int)row Col:(int)col;
@end
