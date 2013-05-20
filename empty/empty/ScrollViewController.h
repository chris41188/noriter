//
//  ScrollViewController.h
//  empty
//
//  Created by echo on 13. 4. 15..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewController.h"
#import "DataBase.h"
#import "TableCell.h"
@interface ScrollViewController : UITableViewController
{
    DataBase *DB;
    TableViewController* TVC;
    int rowCount;
    NSInteger month, day;
}
@property (strong,nonatomic) TableViewController *TVC;
@property (strong,nonatomic) DataBase* DB;
+(ScrollViewController*)makeChildSVCByParent:(UIViewController*)parent DB:(DataBase*)_DB frame:(CGRect)rect;
-(void)setDataWithMonth:(NSInteger)_month Day:(NSInteger)_day;
-(NSInteger)hitTest:(CGPoint)point;
@end
