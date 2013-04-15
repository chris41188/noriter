//
//  ScrollViewController.m
//  empty
//
//  Created by echo on 13. 4. 9..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "ScrollViewController.h"

@implementation ScrollViewController
@synthesize TVC;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    SV = self.view;
}
- (IBAction)handleTap:(UITapGestureRecognizer *)TapGesture
{
    NSLog(@"TAP - TVC's view = %@ , size = %0f, %0f",TVC.tableView,TVC.view.bounds.size.width,TVC.view.bounds.size.height);
    //TVC.view.frame = TVC.view.bounds.size;
    CGPoint tapPoint = [TapGesture locationInView:self.view];
    int tableRow = [SV tapTest:tapPoint];
    if(tableRow != -1)
    {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:tableRow inSection:0];
        [TVC.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
        [TVC.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    }

}
- (BOOL) gestureRecognizer:(UIGestureRecognizer*)gestureRecognizer shouldReceiveTouch:(UITouch *)touch;
{
    return YES;//(touch.view == self.view);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setData:(NSMutableArray*)array
{
    data = array;
    [(ScrollView*)self.view setData:data];
    //NSLog(@"%@",data);
    [self clear];
    [self draw];
}
-(void)draw
{
   
}
-(void)clear
{
}
@end
