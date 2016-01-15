//
//  TaskListVC.m
//  MyWorxTasks
//
//  Created by saix on 16/1/14.
//  Copyright © 2016年 citrix. All rights reserved.
//

#import "TaskListVC.h"
#import "SWTableViewCell.h"
#import "UIView+YYAdd.h"
#import "MockData.h"

@interface TaskListVC ()
@property (nonatomic, strong)  NSArray* data;
@end

@implementation TaskListVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = self.navigationController.tabBarItem.title;
    
    self.tableView.tableHeaderView = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 0, 40)];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refreshTasks:) forControlEvents:UIControlEventValueChanged];
    
    
    self.navigationController.tabBarItem.badgeValue = nil;
    
    self.data = [MockData MockDataForAllTasks];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)refreshTasks:(id)sender
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [NSThread sleepForTimeInterval:2];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [sender endRefreshing];
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Refresh" message:@"No new tasks found!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        });
    });
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.data[section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SWTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TaskCell"];
    
    // Configure the cell...
    if (!cell) {
        cell = [[SWTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TaskCell"];
        cell.rightUtilityButtons = [self rightButtons];
        //cell.delegate = self;
    }
    
    cell.textLabel.text = self.data[indexPath.section][indexPath.row];
    
    return cell;
}

- (NSArray *)rightButtons
{
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.f green:0.f blue:0.f alpha:1.0]
                                                title:@"Action"];
    
    return rightUtilityButtons;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.f;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30.f;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* headView = [[UIView alloc] init];
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.text = [NSString stringWithFormat:@"Section %ld", section];
    [label sizeToFit];
    [headView addSubview:label];
    label.left = 16.f;
    label.top = (30.f-label.bounds.size.height)/2;
    
    headView.backgroundColor = [UIColor lightGrayColor];
    return headView;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
