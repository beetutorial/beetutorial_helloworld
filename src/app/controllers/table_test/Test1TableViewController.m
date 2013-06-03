//
//  Test1TableViewController.m
//  helloworld
//
//  Created by sang alfred on 5/24/13.
//
//

#import "Test1TableViewController.h"

@interface Test1TableViewController ()

@end

@implementation Test1TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Dynamic Insertion";
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                               target:self
                                                                               action:@selector(insertNewObject)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    DAModularTableSection *tableSection = [DAModularTableSection section];
    [self.tableView insertSection:tableSection];
}

- (void)insertNewObject
{
    DAModularTableRow *newRow = [DAModularTableRow row];
    newRow.text = [[NSDate date] description];
    newRow.didSelectBlock = ^(NSIndexPath *indexPath){
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
        DAModularTableRow *tableRow = [self.tableView rowAtIndexPath:indexPath];
        [self.tableView removeRow:tableRow animated:YES];
    };
    [self.tableView insertRow:newRow atIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES];
}


@end
