//
//  SideView.h
//  empty
//
//  Created by echo on 13. 5. 16..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
@protocol ChildViewControllerDelegate <NSObject>
- (void)SlideMainView;
@end
@interface SideView : UIView
{
    NSInteger ToolbarHeight;
    Person *owner;
}
@property NSInteger ToolbarHeight;
- (id)initWithFrame:(CGRect)frame ToolbarHeight:(NSInteger)height Onwer:(Person*)_owner;
-(void)slide;
@end
