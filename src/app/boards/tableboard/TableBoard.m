//
//  TableBoard.m
//  helloworld
//
//  Created by sang alfred on 5/21/13.
//
//

#import "TableBoard.h"
#import "TestPullViewControllerWithModeViewController.h"

@interface TableBoard ()

@end

@implementation TableBoard


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
        
        f = [[TestPullViewControllerWithModeViewController alloc] init_with_frame:CGRectMake(0, 0, 320, 400) mode:PageListViewModeDrag];

        f.delegate_board = self;
        
        [self.view addSubview:f.view];
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
-(NSMutableArray *)init_table_data
{

}

-(NSMutableArray *)reload_next_page:(int)cur_page_number
{

}

@end
