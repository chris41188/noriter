//
//  TableViewController.m
//  empty
//
//  Created by echo on 13. 4. 9..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "TableViewController.h"

@implementation TableViewController
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
}
- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath
{
    DetailViewController *DetailVC = [[DetailViewController alloc]initWithSchedule:[DB getScheduleWithMonth:month Day:day Index:indexPath.row]];
    [self.delegate ChangeViewControllwerWithDetailVC:DetailVC];
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
    return [DB getSchedulesWithMonth:month Day:day].count;
    
}

- (TableCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableCell *cell = [[TableCell alloc]init];
    
    // Configure the cell...
    cell.schedule = [DB getScheduleWithMonth:month Day:day Index:indexPath.row];
    cell.textLabel.text = cell.schedule.s_Content;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d시 -> %d시",cell.schedule.dc_StartDateComp.hour,cell.schedule.dc_EndDateComp.hour];
    
    return cell;
}

+(TableViewController*)makeChildTVCByParent:(UIViewController*)parent DB:(DataBase*)_DB frame:(CGRect)rect
{
    TableViewController *TVC = [[TableViewController alloc] initWithStyle:UITableViewStylePlain];
    [parent addChildViewController:TVC];
    [parent.view addSubview:TVC.view];
    TVC.view.frame = rect;
    [TVC didMoveToParentViewController:parent];
    TVC.DB = _DB;
    return TVC;
}
-(void)setDataWithMonth:(NSInteger)_month Day:(NSInteger)_day
{
    month = _month, day = _day;
    [self.tableView reloadData];
}
@end
