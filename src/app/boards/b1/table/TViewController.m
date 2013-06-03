//
//  TViewController.m
//  helloworld
//
//  Created by sang alfred on 5/27/13.
//
//
#import "T2Vc.h"
#import "TViewController.h"

@interface TViewController ()

@end

@implementation TViewController

- (void)load
{
	[super load];
    //do
    self.style = UITableViewStylePlain;
    
}

- (void)unload
{
    //do
    
    
	//
	[super unload];
}

#pragma mark - Signals



// BeeUIBoard signal goes here
- (void)handleUISignal_T2Vc:(BeeUISignal *)signal
{
	[super handleUISignal:signal];
	
	if ( [signal is:T2Vc.TEST] )
	{
        CC(@"ddd");
        // 界面创建
        
    }
}
// BeeUIBoard signal goes here
- (void)handleUISignal_BeeUIBoard:(BeeUISignal *)signal
{
	[super handleUISignal:signal];
	
	if ( [signal is:BeeUIBoard.CREATE_VIEWS] )
	{
        // 界面创建
        self.view.backgroundImage = __BASE_BOARD_IMAGE( @"main_board_bg" );
        [self showNavigationBarAnimated:NO];
		[self setTitleString:@"表1时"];
        
        
        
        self.tableView = [[DAModularTableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]
                                                             style:self.style];
        self.view = self.tableView;
        
        DAModularTableSection *shareSection = [DAModularTableSection section];
        shareSection.headerTitle = @"Share";
        shareSection.headerHeight = 35.0f;
        [self.tableView insertSection:shareSection];
        
        DAModularTableRow *emailRow = [DAModularTableRow row];
        emailRow.text = @"Share via Email";
        emailRow.didSelectBlock = ^(NSIndexPath *indexPath){
            DAModularTableRow *tableRow = [self.tableView rowAtIndexPath:indexPath];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                            message:tableRow.text
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
            [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
        };
        [self.tableView insertRow:emailRow];
        
        DAModularTableRow *smsRow = [DAModularTableRow row];
        smsRow.text = @"Share table";
        smsRow.didSelectBlock = ^(NSIndexPath *indexPath){
            DAModularTableRow *tableRow = [self.tableView rowAtIndexPath:indexPath];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                            message:tableRow.text
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
//            [alert show];
//            [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
            
            [[self stack] pushBoard:[T2Vc board] animated:YES];
            
        };
        [self.tableView insertRow:smsRow];

        
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


@end
