//
//  ContainerView.h
//  empty
//
//  Created by echo on 13. 6. 8..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import <UIKit/UIKit.h>

extern const NSInteger ToolbarHeight;
extern const NSInteger MarginHeight;
extern const NSInteger MarginWidth;
@interface ContainerView : UIScrollView <UIScrollViewDelegate>
-(void)resetYCoord;
@end
