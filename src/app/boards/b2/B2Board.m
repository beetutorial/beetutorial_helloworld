//
//  B2Board.m
//  helloworld
//
//  Created by sang alfred on 5/20/13.
//
//

#import "B2Board.h"


@implementation MyTableDelegate

DEF_SINGLETON(MyTableDelegate)

@end

@implementation B2Board

@synthesize mytableview;



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
        self.view.backgroundColor = [UIColor orangeColor];
//        self.view.backgroundImage = __BASE_BOARD_IMAGE( @"main_board_bg" );
        [self showNavigationBarAnimated:NO];
		[self setTitleString:@"精选"];
        
        
        self.mytableview = [__table_builder get_fast_add_refresh_table_view:self.view];
        
        CGRect f = self.mytableview.frame;
        f.size.height = 400;
        self.mytableview.frame =f;
        
        
        self.mytableview.cellForRowBlock = ^(UITableViewCell *cell, NSIndexPath *indexPath,id data){
            cell.textLabel.text = data;
        };
        
        self.mytableview.heightForRowAtIndexPath = ^(NSIndexPath *indexPath){
            return 44.0f;
        };
        
        [self.mytableview set_delegate:[MyTableDelegate sharedInstance]];
        
        NSMutableArray *a = [NSMutableArray arrayWithObjects:@"2",@"2",@"2",@"2",@"2",@"2",@"2",@"2", nil];
        
        [self.mytableview reload_data_with_one_section:a];
	}
	else if ( [signal is:BeeUIBoard.DELETE_VIEWS] )
	{
		// 界面删除
	}
	else if ( [signal is:BeeUIBoard.LAYOUT_VIEWS] )
	{
		// 界面重新布局
        //        self.view.frame = __TAB_CONTROLLER_VIEW_FRAME;
        [self setTitleString:@"精选"];
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

#pragma mark - Messages
- (void)handleMessage:(BeeMessage *)msg
{
	[super handleMessage:msg];
}



@end
