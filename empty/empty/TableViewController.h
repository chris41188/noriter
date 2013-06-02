//
//  TableViewController.h
//  empty
//
//  Created by echo on 13. 4. 9..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataBase.h"
#import "TableCell.h"
#import "DetailViewController.h"
@protocol MainViewControllerDelegate <NSObject>
- (void)showDetialViewControllerWithDetailVC:(DetailViewController*)_DetailVC;
@end
@interface TableViewController : UITableViewController <UITableViewDelegate>
{
    DataBase *DB;
    NSInteger month, day;
}
@property (assign) id <MainViewControllerDelegate> mainViewControllerDelegate;
@property (nonatomic, strong)DataBase *DB;
-(void)setDataWithMonth:(NSInteger)_month Day:(NSInteger)_day;
+(TableViewController*)makeChildTVCByParent:(UIViewController*)parent DB:(DataBase*)_DB frame:(CGRect)rect;
@end
