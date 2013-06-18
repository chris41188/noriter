//
//  FriendsListViewController.m
//  empty
//
//  Created by echo on 13. 5. 22..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "FriendsListViewController.h"


@implementation FriendsListViewController
@synthesize owner;
@synthesize friendPopupView;
- (id)initWithOwner:(Person*)_owner
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        // Custom initialization
        owner = _owner;
        isPoped = false;
        
        searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
        self.tableView.tableHeaderView = searchBar;
        isSearching = NO;
        for (UIView *searchBarSubview in [searchBar subviews]) {
            if ([searchBarSubview conformsToProtocol:@protocol(UITextInputTraits)]) {
                    [(UITextField *)searchBarSubview setBorderStyle:UITextBorderStyleRoundedRect];
            }
        }
        [searchBar setBackgroundImage:[UIImage imageNamed:@"03_back_list_fri.png"]];
        
        [searchBar setPositionAdjustment:UIOffsetMake(-9, 0) forSearchBarIcon:UISearchBarIconSearch];
//        [searchBar setSearchTextPositionAdjustment:UIOffsetMake(-270, 0)];
        
        [self.view setBackgroundColor:[UIColor colorWithRed:0.13 green:0.13 blue:0.13 alpha:1]];
        self.tableView.separatorColor = [UIColor clearColor];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}
-(void)popupWithFriend:(Person *)_friend
{
    if(isPoped == false)
    {
        isPoped = true;
        friendPopupView = [[FriendPopupView alloc] initWithOwner:_friend Frame:CGRectMake(0, self.view.frame.size.height/3*2, self.view.frame.size.width, self.view.frame.size.height/3)];
        friendPopupView.motherViewControllerDelegate = self.motherViewControllerDelegate;
        [self.view addSubview:friendPopupView];
        
        tap = [[UITapGestureRecognizer alloc]
                                       initWithTarget:self
                                       action:@selector(popDown)];
        [self.view addGestureRecognizer:tap];
        
    }
    else
    {
        [self popDown];
        [self popupWithFriend:_friend];
    }
}
-(void)popDown
{
    if(isPoped == true)
    {
        isPoped = false;
        [friendPopupView removeFromSuperview];
        [self.view removeGestureRecognizer:tap];
    }
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

#pragma mark - Table view data source

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    // create and return a custom UIView to use for the section here
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 25)];
    UIImageView *backgroundImageView =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"03_back_list_category.png"]];
    backgroundImageView.frame = sectionView.frame;
    [sectionView addSubview:backgroundImageView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(2, 0, self.view.frame.size.width-2, 25)];
    titleLabel.numberOfLines = 1;
    titleLabel.textColor = [UIColor colorWithRed:0.933 green:0.933 blue:0.933 alpha:1];
    titleLabel.font = [UIFont systemFontOfSize:13];
    titleLabel.backgroundColor = [UIColor clearColor];
    NSLog(@"SEction = %d",section);
    if(section == 0)
    {
        titleLabel.text = @"그룹 & 즐겨찾기";
    }
    
//    [titleLabel sizeToFit];
    [sectionView addSubview:titleLabel];
    
    return sectionView;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSLog(@"%d",owner.ma_Friends.count);
    return owner.ma_Friends.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FriendListCell *cell = [[FriendListCell alloc]initWithOwner:[owner.ma_Friends objectAtIndex:indexPath.row]];
    // Configure the cell...
    cell.friendListViewControllerDelegate = self;
    
    return cell;
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

@end
