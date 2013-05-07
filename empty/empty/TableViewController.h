//
//  TableViewController.h
//  empty
//
//  Created by echo on 13. 4. 9..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface TableViewController : UITableViewController <UITableViewDelegate>
{
    NSMutableArray *data;
}
-(void)setData:(NSMutableArray*)array;
+(TableViewController*)makeChildTVC:(UIViewController*)parent frame:(CGRect)rect;
@property (strong, nonatomic) NSMutableArray *data;
@end
