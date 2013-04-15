//
//  ScrollViewController.m
//  empty
//
//  Created by echo on 13. 4. 15..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "ScrollViewController.h"


@implementation ScrollViewController
@synthesize TVC;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(gesturePiece:)];
    [panGesture setMaximumNumberOfTouches:2];
    [self.tableView addGestureRecognizer:panGesture];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gesturePiece:)];
    [tapGesture setNumberOfTapsRequired:1];
    [self.tableView addGestureRecognizer:tapGesture];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (void)gesturePiece:(UIGestureRecognizer *)gestureRecognizer
{
    UIView *piece = [gestureRecognizer view];
    CGPoint coord = [gestureRecognizer locationInView:[piece superview]];
    //CGPoint translation = [gestureRecognizer translationInView:[piece superview]];
    NSLog(@"%0f , %0f",coord.x,coord.y);
    
    int tableRow = [self hitTest:coord];
    if(tableRow != -1)
    {
        NSLog(@"%d",tableRow);
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:tableRow inSection:0];
        [TVC.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
        [TVC.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    }
}
-(NSInteger)hitTest:(CGPoint)point
{
    int i=0;
    for (NSArray *array in data) {
        if([[array objectAtIndex:1] integerValue] * self.view.frame.size.height / 24 <= point.y
           && [[array objectAtIndex:2] integerValue] * self.view.frame.size.height / 24 >= point.y)
        {
            return i;
        }
        i++;
    }
    return -1;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return rowCount = [data count]*2+1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row = [indexPath row];
    float result = 0;
    if(row == 0)
    {
        NSLog(@"row : %d -> %f",row,abs( [[[data objectAtIndex:0] objectAtIndex:1] integerValue] ) * self.view.frame.size.height / 24);
        result = abs( [[[data objectAtIndex:0] objectAtIndex:1] integerValue] ) * self.view.frame.size.height / 24;
        
    }
    else if(row == rowCount-1) // not max - last one is not 24hour
    {
        NSLog(@"row : %d -> %f",row,abs( [[[data objectAtIndex:[data count]-1] objectAtIndex:2] integerValue] - 24 ) * self.view.frame.size.height / 24);
        result = abs( [[[data objectAtIndex:[data count]-1] objectAtIndex:2] integerValue] - 24 ) * self.view.frame.size.height / 24;
    }
    else
    {
        NSLog(@"row : %d -> %f",row,abs( [[[data objectAtIndex:(row-1)/2] objectAtIndex:2] integerValue] - [[[data objectAtIndex:row/2] objectAtIndex:1] integerValue] ) * self.view.frame.size.height / 24);
        result = abs( [[[data objectAtIndex:(row-1)/2] objectAtIndex:2] integerValue] - [[[data objectAtIndex:row/2] objectAtIndex:1] integerValue] ) * self.view.frame.size.height / 24;
    }
    return result;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier;
    UITableViewCell *cell;
    if(indexPath.row%2 == 1)
    {
        CellIdentifier = @"Work";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        cell.textLabel.text = [[data objectAtIndex:(indexPath.row-1)/2] objectAtIndex:0];
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:10];
        //CGRect tmpFrame = cell.textLabel.frame;
        //tmpFrame.origin.x = -100;
        //cell.textLabel.frame = tmpFrame;
        
        NSLog(@"%f",cell.textLabel.frame.origin.x);
        //[cell setBackgroundColor:[UIColor colorWithRed:.8 green:.8 blue:1 alpha:1]];
    }
    else
    {
        CellIdentifier = @"Rest";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        [cell setBackgroundColor:[UIColor colorWithRed:1 green:.8 blue:.8 alpha:1]];
        
    }
    // Configure the cell...
    
    return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row%2 == 1)
    {
        cell.backgroundColor = [UIColor redColor];
    }
    else
    {
        
    }
    
}
/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}
-(void)setData:(NSMutableArray*)array
{
    data = array;
    //[(ScrollView*)self.view setData:data];
    //NSLog(@"%@",data);
    //[self clear];
    //[self draw];
}
@end
