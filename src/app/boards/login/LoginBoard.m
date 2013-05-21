//
//  LoginBoard.m
//  helloworld
//
//  Created by sang alfred on 5/21/13.
//
//

#import "LoginBoard.h"

@interface LoginBoard ()

@end

@implementation LoginBoard




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

- (void)handleUISignal_UINavigationBar:(BeeUISignal *)signal
{
	[super handleUISignal:signal];
	
	if ( [signal is:UINavigationBar.BACK_BUTTON_TOUCHED] )
	{
        [[self stack] popBoardAnimated:YES];
    }
}


// BeeUIBoard signal goes here
- (void)handleUISignal_BeeUIBoard:(BeeUISignal *)signal
{
	[super handleUISignal:signal];
	
	if ( [signal is:BeeUIBoard.CREATE_VIEWS] )
	{
        // 界面创建
//        self.view.backgroundColor = [UIColor orangeColor];
        //        self.view.backgroundImage = __BASE_BOARD_IMAGE( @"main_board_bg" );
        
        [self showBarButton:UINavigationBar.BARBUTTON_LEFT image:__BASE_BOARD_IMAGE(@"nav_back_btn.png")];
        
        [self showNavigationBarAnimated:NO];
		[self setTitleString:@"登陆"];
        
        LoginViewController *loginViewController = [[LoginViewController alloc] initWithNibName:nil bundle:nil];
        [self.view addSubview:loginViewController.view];
        
//        [BeeCustomTabBoard hide:YES animated:YES];

//        [BeeCustomTabBoard isHidden:YES];
        
        
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

#pragma mark - Messages
- (void)handleMessage:(BeeMessage *)msg
{
	[super handleMessage:msg];
}





@end
