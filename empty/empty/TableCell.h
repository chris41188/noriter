//
//  TableCell.h
//  empty
//
//  Created by echo on 13. 5. 13..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Schedule.h"
@interface TableCell : UITableViewCell
{
    Schedule *schedule;
}
@property (nonatomic, strong)Schedule *schedule;
@end
