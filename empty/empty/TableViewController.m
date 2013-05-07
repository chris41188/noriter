//
//  TableViewController.m
//  empty
//
//  Created by echo on 13. 4. 9..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "TableViewController.h"

@implementation TableViewController
@synthesize data;
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
    NSLog(@"%d",[data count]);
    return [data count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [[UITableViewCell alloc]init];//[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSArray *array =[data objectAtIndex:(indexPath.row)];
    
    cell.textLabel.text = [array objectAtIndex:0];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ -> %@",[array objectAtIndex:1],[array objectAtIndex:2]];
    
    return cell;
}

+(TableViewController*)makeChildTVC:(UIViewController*)parent frame:(CGRect)rect
{
    TableViewController *TVC = [[TableViewController alloc] initWithStyle:UITableViewStylePlain];
    [parent addChildViewController:TVC];
    [parent.view addSubview:TVC.view];
    TVC.view.frame = rect;
    [TVC didMoveToParentViewController:parent];
    return TVC;
}
-(void)setData:(NSMutableArray*)array
{
    data = array;
    [self.tableView reloadData];
}
@end
