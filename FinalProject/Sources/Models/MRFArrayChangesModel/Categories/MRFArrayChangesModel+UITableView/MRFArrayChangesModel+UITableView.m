//
//  MRFArrayChangesModel+UITableView.m
//  
//
//  Created by Yurii Mamurko on 11.10.15.
//
//

#import "MRFArrayChangesModel+UITableView.h"

@implementation MRFArrayChangesModel (UITableView)

- (void)applyToTableView:(UITableView *)tableView {
    [self applyToTableView:tableView rowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)applyToTableView:(UITableView *)tableView rowAnimation:(UITableViewRowAnimation)rowAnimation {

}

@end

@implementation MRFPositionModel (UITableView)

- (void)applyToTableView:(UITableView *)tableView rowAnimation:(UITableViewRowAnimation)rowAnimation {
    NSIndexPath *path = self.indexPath;
    
    switch (self.state) {
        case MRFArrayModelAppendChanges:
            [tableView insertRowsAtIndexPaths:@[path] withRowAnimation:rowAnimation];
            break;
            
        case MRFArrayModelDeleteChanges:
            [tableView deleteRowsAtIndexPaths:@[path] withRowAnimation:rowAnimation];
            break;
            
        case MRFArrayModelUpdateChanges:
            [tableView reloadRowsAtIndexPaths:@[path] withRowAnimation:rowAnimation];
            break;
            
        default:
            break;
    }
}

@end

@implementation MRFMovingPositionModel (UITableView)

- (void)applyToTableView:(UITableView *)tableView rowAnimation:(UITableViewRowAnimation)rowAnimation {
    [tableView moveRowAtIndexPath:self.sourceIndexPath toIndexPath:self.destinationIndexPath];
}

@end