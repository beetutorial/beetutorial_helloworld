//
//  TestPullViewControllerWithModeViewController.m
//  Gospel_IOS
//
//  Created by sang on 4/11/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import "TestPullViewControllerWithModeViewController.h"

@interface TestPullViewControllerWithModeViewController ()

@end

@implementation TestPullViewControllerWithModeViewController

@synthesize source_array;
@synthesize delegate_board;

-(id)init_with_frame:(CGRect)frame  mode:(PageListViewMode)mode{
    if (self = [super init_with_frame:frame mode:mode]) {
        self.delegate = self;
        self.source_array = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // [self set_pull_down_enable:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - PageListViewController delegate


-(int)set_page_count
{
    return 2;
}

-(void)init_table_data
{
    if ([delegate_board respondsToSelector:@selector(init_table_data)]) {
        [delegate_board init_table_data];
    }
}
-(void)reload_next_page:(int)cur_page_number
{
    if ([delegate_board respondsToSelector:@selector(reload_next_page:)]) {
        [delegate_board reload_next_page:cur_page_number];
    }
}
 
#pragma mark - table
- (UITableViewCell *)page_list_view:(UITableView *)tableView cell_for_row_at_index_path:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    }
    
    NSDictionary *d = [self.result_array objectAtIndex:indexPath.row];
    if ([[d objectForKey:@"news"] count]>0) {
        NSString *title = [[[d objectForKey:@"news"] objectAtIndex:0] objectForKey:@"title"];
        cell.textLabel.text = [NSString stringWithFormat:@"#%d %@", indexPath.row,title];
    }else{
        cell.textLabel.text = [NSString stringWithFormat:@"#%d  ", indexPath.row];
    }
    
    return cell;
}

- (UITableViewCell *)page_list_view_next_page:(UITableView *)tableView cell_for_row_at_index_path:(NSIndexPath *)indexPath  has_more_page:(Boolean)has_next;
{
    static NSString *CellIdentifier = @"Cell111";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    }
    
    if (!has_next) {
        cell.textLabel.text = [NSString stringWithFormat:@"没有了", indexPath.row];
    }else{
        cell.textLabel.text = [NSString stringWithFormat:@"#%d  下一页", indexPath.row];
    }
    
    
    return cell;
}
-(void)page_list_view:(UITableView *)tableView did_select_row_at_index_path:(NSIndexPath *)indexPath
{
    NSLog(@"sss");
}


//- (void)page_list_view_next_page:(UITableView *)tableView did_select_row_at_index_path:(NSIndexPath *)indexPath  has_more_page:(Boolean)has_next;
//{
//    NSLog(@"sss");
//
//}


- (CGFloat)page_list_view:(UITableView *)tableView height_for_row_at_index_path:(NSIndexPath *)indexPath{
    return 55.0f;
}

//- (CGFloat)page_list_view_next_page:(UITableView *)tableView height_for_row_at_index_path:(NSIndexPath *)indexPath
//{
//    return 100.0f;
//}



@end
