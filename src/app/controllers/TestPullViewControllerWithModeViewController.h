//
//  TestPullViewControllerWithModeViewController.h
//  helloworld
//
//  Created by sang alfred on 5/21/13.
//
//

#import <Foundation/Foundation.h>
#import "PageListViewController.h"

@protocol TestPullViewControllerProtocol <NSObject>

-(NSMutableArray *)init_table_data;
-(NSMutableArray *)reload_next_page:(int)cur_page_number;

@end

@interface TestPullViewControllerWithModeViewController : PageListViewWithModeController

@property(nonatomic,retain,readwrite) NSMutableArray *    source_array;

@property(nonatomic,assign,readwrite) id<TestPullViewControllerProtocol>    delegate_board;

@end



