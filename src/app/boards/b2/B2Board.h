//
//  B2Board.h
//  helloworld
//
//  Created by sang alfred on 5/20/13.
//
//

#import <UIKit/UIKit.h>
#import "No320_UITabBaseBoard.h"


@interface MyTableDelegate : Bee_TableViewDelegateBase

AS_SINGLETON(MyTableDelegate)

@end

@interface B2Board : No320_UITabBaseBoard


@property(nonatomic,retain,readwrite) Bee_RefreshTableView *mytableview;

@end
