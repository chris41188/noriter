//
//  ScrollViewController.h
//  empty
//
//  Created by echo on 13. 4. 15..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewController.h"

@interface ScrollViewController : UITableViewController
{
    NSMutableArray *data;
    TableViewController* TVC;
    int rowCount;
}
@property (strong,nonatomic) TableViewController *TVC;
-(void)setData:(NSMutableArray*)array;
-(NSInteger)hitTest:(CGPoint)point;
@end
