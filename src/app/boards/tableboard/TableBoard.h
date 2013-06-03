//
//  TableBoard.h
//  helloworld
//
//  Created by sang alfred on 5/21/13.
//
//

#import "Bee_UIBoard.h"
//#import "TestPullViewControllerWithModeViewController.h"
#import "InformationViewController.h"


//BeeUITableBoard : BeeUIBoard<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>
@interface TableBoard : BeeUIBoard<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (nonatomic, retain,readwrite) DAModularTableView *tableView;
@property (nonatomic,readwrite) UITableViewStyle style;

@end



//#import "DAModularTableView.h"
//
//@interface DAModularTableViewController : UITableViewController
//
//@property (nonatomic, strong) DAModularTableView *tableView;
//
//@end
