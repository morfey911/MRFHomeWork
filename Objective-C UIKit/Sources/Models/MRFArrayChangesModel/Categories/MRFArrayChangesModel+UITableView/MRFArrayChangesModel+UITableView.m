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

- (void)applyToTableView:(UITableView *)tableView {
    [self applyToTableView:tableView rowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)applyToTableView:(UITableView *)tableView rowAnimation:(UITableViewRowAnimation)rowAnimation {
    switch (self.state) {
        case MRFArrayModelAppendChanges:
            [tableView insertRowsAtIndexPaths:@[self.indexPath] withRowAnimation:rowAnimation];
            break;
            
        case MRFArrayModelDeleteChanges:
            [tableView deleteRowsAtIndexPaths:@[self.indexPath] withRowAnimation:rowAnimation];
            break;
            
        default:
            break;
    }
}

@end

@implementation MRFMovingPositionModel (UITableView)

- (void)applyToTableView:(UITableView *)tableView {
    switch (self.state) {
        case MRFArrayModelMoveChanges:
            [tableView moveRowAtIndexPath:self.sourceIndexPath toIndexPath:self.destinationIndexPath];
            break;
            
        default:
            break;
    }
}

- (void)applyToTableView:(UITableView *)tableView rowAnimation:(UITableViewRowAnimation)rowAnimation {
    [self applyToTableView:tableView];
}

@end