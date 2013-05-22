//
//  B1Board.m
//  helloworld
//
//  Created by sang alfred on 5/20/13.
//
//

#import "B1Board.h"

#import "TableBoard.h"

@implementation B1Board
@synthesize _news_source_array;
@synthesize f;

#pragma mark - Lifecycle

- (void)load
{
	[super load];
    //do
    self._news_source_array = [NSMutableArray array];
 
    
    [self api_get_top_news];
}

- (void)unload
{
    //do
    
    
	//
	[super unload];
}

#pragma mark - Signals

- (void)handleUISignal_Lesson2View2:(BeeUISignal *)signal
{
	[super handleUISignal:signal];
	
	if ( [signal is:Lesson2View2.TEST] )
	{
        [self api_get_top_news];
        [BeeCustomTabBoard hide:YES animated:NO];
        [[self stack] pushBoard:[LoginBoard board] animated:YES];
        
//        [[self stack] pushBoard:[TableBoard board] animated:YES];
        
//		[BeeUIAlertView showMessage:@"Signal received" cancelTitle:@"OK"];
	}
}


// BeeUIBoard signal goes here
- (void)handleUISignal_BeeUIBoard:(BeeUISignal *)signal
{
	[super handleUISignal:signal];
	
	if ( [signal is:BeeUIBoard.CREATE_VIEWS] )
	{
        // 界面创建
        self.view.backgroundColor = [UIColor clearColor];
        self.view.frame = __TAB_CONTROLLER_VIEW_FRAME;
//        self.view.backgroundImage = __BASE_BOARD_IMAGE( @"main_board_bg" );
        //        [self hideNavigationBarAnimated:NO];
		[self setTitleString:@"新闻"];
		[self showNavigationBarAnimated:NO];
        
        CGRect innerFrame;
		innerFrame.size.width = self.viewSize.width - 20.0f;
		innerFrame.size.height = 44.0f;
		innerFrame.origin.x = 10.0f;
		innerFrame.origin.y =100;
		
        
        CC(@"%d", self.viewSize.height);
        CC(@"%d", self.view);
        CC(@"%d", self.viewSize.width);
        
		_innerView = [[Lesson2View1 alloc] initWithFrame:innerFrame];
		_innerView.backgroundColor = [UIColor clearColor];
		[self.view addSubview:_innerView];
        
        
//		innerFrame.size.width = self.viewSize.width - 20.0f;
//		innerFrame.size.height = 44.0f;
//		innerFrame.origin.x = 10.0f;
//		innerFrame.origin.y = 200;
//		
//		_innerView = [[Lesson2View1 alloc] initWithFrame:innerFrame];
//		_innerView.backgroundColor = [UIColor clearColor];
//        [self.view addSubview:_innerView];
//        
//		innerFrame.size.width = self.viewSize.width - 20.0f;
//		innerFrame.size.height = 44.0f;
//		innerFrame.origin.x = 10.0f;
//		innerFrame.origin.y = 300;
//		
//		_innerView = [[Lesson2View1 alloc] initWithFrame:innerFrame];
//		_innerView.backgroundColor = [UIColor clearColor];
//        [self.view addSubview:_innerView];
//        
//        
//        innerFrame.size.width = self.viewSize.width - 20.0f;
//		innerFrame.size.height = 44.0f;
//		innerFrame.origin.x = 10.0f;
//		innerFrame.origin.y = 500;
//		
//		_innerView = [[Lesson2View1 alloc] initWithFrame:innerFrame];
//		_innerView.backgroundColor = [UIColor clearColor];
//        [self.view addSubview:_innerView];
        
       self.f = [[TestPullViewControllerWithModeViewController alloc] init_with_frame:CGRectMake(0, 0, 320, 400) mode:PageListViewModeDrag];
        self.f.delegate_board = self;
        
        [self.view addSubview:self.f.view];
        
//        [self addTopTabView];
	}
	else if ( [signal is:BeeUIBoard.DELETE_VIEWS] )
	{
		// 界面删除
	}
	else if ( [signal is:BeeUIBoard.LAYOUT_VIEWS] )
	{
		// 界面重新布局
        
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
 

#pragma mark - Override
- (NSMutableArray *)get_top_tab_data_source
{
    return [NSMutableArray arrayWithObjects:@"沪深",@"港股",@"美股", nil];
}

#pragma mark - 
-(NSMutableArray *)init_table_data
{
    [self api_get_top_news];
}

-(NSMutableArray *)reload_next_page:(int)cur_page_number
{

}

@end
