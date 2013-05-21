//
//  B2Board.m
//  helloworld
//
//  Created by sang alfred on 5/20/13.
//
//

#import "B2Board.h"

@implementation B2Board



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
