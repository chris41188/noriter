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
@synthesize DB;
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
    [TVC setDataWithMonth:month Day:day];
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
    for (Schedule* sche in [DB getSchedulesWithMonth:month Day:day]) {
        if(sche.dc_StartDateComp.hour * self.view.frame.size.height / 24 <= point.y
           && sche.dc_EndDateComp.hour * self.view.frame.size.height / 24 >= point.y)
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
    return rowCount = [DB getSchedulesWithMonth:month Day:day].count*2+1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row = [indexPath row];
    float result = 0;
    if(row == 0)
    {
        result = [DB getScheduleWithMonth:month Day:day Index:0].dc_StartDateComp.hour * self.view.frame.size.height / 24;
        
    }
    else if(row == rowCount-1) // not max - last one is not 24hour
    {
        result = abs( [DB getScheduleWithMonth:month Day:day Index:[[DB getSchedulesWithMonth:month Day:day] count]-1].dc_EndDateComp.hour - 24 ) * self.view.frame.size.height / 24;
    }
    else
    {
        result = abs( [DB getScheduleWithMonth:month Day:day Index:(row-1)/2].dc_EndDateComp.hour - [DB getScheduleWithMonth:month Day:day Index:row/2].dc_StartDateComp.hour ) * self.view.frame.size.height / 24;
    }
    return result;
}
- (TableCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableCell *cell;
    // Configure the cell...
    if(indexPath.row%2 == 1)
    {
        cell = [[TableCell alloc]init];
        cell.schedule = [DB getScheduleWithMonth:month Day:day Index:(indexPath.row-1)/2];
        cell.textLabel.text = cell.schedule.s_Content;
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:10];
    }
    else
    {
        cell = [[TableCell alloc]init];
        [cell setBackgroundColor:[UIColor colorWithRed:1 green:.8 blue:.8 alpha:1]];
    }    
    return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(TableCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row%2 == 1)
    {
        cell.backgroundColor = [UIColor redColor];
    }
    else
    {
        
    }
    
}

-(void)setDataWithMonth:(NSInteger)_month Day:(NSInteger)_day
{
    month = _month;
    day = _day;
    [self.tableView reloadData];
}

+(ScrollViewController*)makeChildSVCByParent:(UIViewController *)parent DB:(DataBase*)_DB frame:(CGRect)rect
{
    ScrollViewController *SVC = [[ScrollViewController alloc] initWithStyle:UITableViewStylePlain];
    [parent addChildViewController:SVC];
    [parent.view addSubview:SVC.view];
    SVC.view.frame = rect;
    [SVC didMoveToParentViewController:parent];
    SVC.DB = _DB;
    return SVC;
}
@end
