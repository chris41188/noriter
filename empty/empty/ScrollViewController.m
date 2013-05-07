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
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(gesturePiece:)];
    [panGesture setMaximumNumberOfTouches:2];
    [self.tableView addGestureRecognizer:panGesture];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gesturePiece:)];
    [tapGesture setNumberOfTapsRequired:1];
    [self.tableView addGestureRecognizer:tapGesture];
    
}
- (void)gesturePiece:(UIGestureRecognizer *)gestureRecognizer
{
    UIView *piece = [gestureRecognizer view];
    CGPoint coord = [gestureRecognizer locationInView:[piece superview]];
    [TVC setData:data];
    int tableRow = [self hitTest:coord];
    if(tableRow != -1)
    {
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return rowCount = [data count]*2+1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row = [indexPath row];
    float result = 0;
    if(row == 0)
    {
        result = abs( [[[data objectAtIndex:0] objectAtIndex:1] integerValue] ) * self.view.frame.size.height / 24;
        
    }
    else if(row == rowCount-1) // not max - last one is not 24hour
    {
        result = abs( [[[data objectAtIndex:[data count]-1] objectAtIndex:2] integerValue] - 24 ) * self.view.frame.size.height / 24;
    }
    else
    {
        result = abs( [[[data objectAtIndex:(row-1)/2] objectAtIndex:2] integerValue] - [[[data objectAtIndex:row/2] objectAtIndex:1] integerValue] ) * self.view.frame.size.height / 24;
    }
    return result;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier;
    UITableViewCell *cell;
    // Configure the cell...
    if(indexPath.row%2 == 1)
    {
        //CellIdentifier = @"Work";
        //cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        cell = [[UITableViewCell alloc]init];
        cell.textLabel.text = [[data objectAtIndex:(indexPath.row-1)/2] objectAtIndex:0];
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:10];
    }
    else
    {
//        CellIdentifier = @"Rest";
//        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        cell = [[UITableViewCell alloc]init];
        [cell setBackgroundColor:[UIColor colorWithRed:1 green:.8 blue:.8 alpha:1]];
    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row%2 == 1)
    {
        cell.backgroundColor = [UIColor redColor];
    }
    else
    {
        
    }
    
}

-(void)setData:(NSMutableArray*)array
{
    data = array;
}

+(ScrollViewController*)makeChildSVC:(UIViewController *)parent frame:(CGRect)rect
{
    ScrollViewController *SVC = [[ScrollViewController alloc] initWithStyle:UITableViewStylePlain];
    [parent addChildViewController:SVC];
    [parent.view addSubview:SVC.view];
    SVC.view.frame = rect;
    [SVC didMoveToParentViewController:parent];
    return SVC;
}
@end
