//
//  DateAddViewController.h
//  empty
//
//  Created by echo on 13. 6. 13..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DateAddCell.h"
#import "FlexibleScrollView.h"
extern const NSInteger ToolbarHeight;
@interface DateAddViewController : UIViewController
{
    DateAddCell* startDAC;
    DateAddCell* endDAC;
    bool hasEnd;
    UIButton *endToogleButton;
}
-(id)initWithDateComps:(NSDateComponents*)dateComps;
-(void)toggleEndVieCell;
@end
