//
//  DetailViewController.h
//  empty
//
//  Created by echo on 13. 5. 13..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Schedule.h"
#import "Comment.h"
@interface DetailViewController : UIViewController
{
    Schedule *schedule;
    UIScrollView *contentView;
    UIImageView *profImageView; // Profile Image View
    UILabel *nameLabel; // Writter Name Label
    UILabel *periodLabel; // Date Label
    UIButton *rightButton;
    
    UILabel *cntLabel; // Content Label
    UIImageView *picImageView; // Picture Image View
    UIImageView *mapImageView; // GoogleMap Image View
    
    UILabel *commentAndShareLabel; // comment and share label
    NSMutableArray *commentViewArray;
    
}
-(id)initWithSchedule:(Schedule*)_sche;
@property (nonatomic, strong) Schedule *schedule;
@end
