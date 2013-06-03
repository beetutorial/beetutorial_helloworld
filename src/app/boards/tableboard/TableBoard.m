//
//  TableBoard.m
//  helloworld
//
//  Created by sang alfred on 5/21/13.
//
//

#import "TableBoard.h" 

@interface TableBoard ()



@end

@implementation TableBoard

@synthesize style = _style;
@synthesize tableView = _tableView;

#pragma mark - Lifecycle

- (void)load
{
	[super load];
    //do
    
    
}

- (void)unload
{
    //do
    
    
	//
	[super unload];
}

#pragma mark - Signals

// BeeUIBoard signal goes here
- (void)handleUISignal_BeeUIBoard:(BeeUISignal *)signal
{
	[super handleUISignal:signal];
	
	if ( [signal is:BeeUIBoard.CREATE_VIEWS] )
	{
        // 界面创建
        self.view.backgroundImage = __BASE_BOARD_IMAGE( @"main_board_bg" );
        [self showNavigationBarAnimated:NO];
		[self setTitleString:@"表格延时"];
        
      
        self.tableView = [[DAModularTableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]
                                                             style:self.style];
        self.view = self.tableView;
        
//        [f reloadDataSource:<#(NSArray *)#>];
	}
	else if ( [signal is:BeeUIBoard.DELETE_VIEWS] )
	{
		// 界面删除
	}
	else if ( [signal is:BeeUIBoard.LAYOUT_VIEWS] )
	{
		// 界面重新布局
        //        self.view.frame = __TAB_CONTROLLER_VIEW_FRAME;
	}
	else if ( [signal is:BeeUIBoard.LOAD_DATAS] )
	{
		// 数据加载
	}
	else if ( [signal is:BeeUIBoard.FREE_DATAS] )
	{
		// 数据释放
	}
	else if ( [signal is:BeeUIBoard.WILL_APPEAR] )
	{
		// 将要显示
	}
	else if ( [signal is:BeeUIBoard.DID_APPEAR] )
	{
		// 已经显示
	}
	else if ( [signal is:BeeUIBoard.WILL_DISAPPEAR] )
	{
		// 将要隐藏
	}
	else if ( [signal is:BeeUIBoard.DID_DISAPPEAR] )
	{
		// 已经隐藏
	}
}

#pragma mark - 
 


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self = [self init])
    {
        self.style = style;
    }
    return self;
}

//- (void)loadView
//{
//    self.tableView = [[DAModularTableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]
//                                                         style:self.style];
//    self.view = self.tableView;
//}
//
//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
//{
//    return (interfaceOrientation == UIInterfaceOrientationPortrait);
//}

@end
