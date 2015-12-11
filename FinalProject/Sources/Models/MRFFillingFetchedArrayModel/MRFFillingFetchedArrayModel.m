//
//  MRFFillingFetchedArrayModel.m
//  Final Project
//
//  Created by Yurii Mamurko on 11.12.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFFillingFetchedArrayModel.h"

#import "MRFFilling.h"

@interface MRFFillingFetchedArrayModel ()

- (NSUInteger)placeForFillingModel:(MRFFilling *)model;

@end

@implementation MRFFillingFetchedArrayModel

#pragma mark -
#pragma mark Private

- (NSUInteger)placeForFillingModel:(MRFFilling *)model {
    NSDate *modelsDate = model.date;
    NSArray *sortedArray = self.array;
    
    if ([modelsDate compare:[sortedArray.firstObject date]] == NSOrderedDescending) {
        return 0;
    }
    
    for (NSUInteger index = 1; index < sortedArray.count; index++) {
        if ([modelsDate compare:[sortedArray[index - 1] date]] == NSOrderedAscending &&
            [modelsDate compare:[sortedArray[index] date]] == NSOrderedDescending)
        {
            return index;
        }
    }
    
    return sortedArray.count;
}

#pragma mark -
#pragma mark NSFetchedResultsControllerDelegate

- (void)controller:(NSFetchedResultsController *)controller
   didChangeObject:(id)anObject
       atIndexPath:(nullable NSIndexPath *)indexPath
     forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(nullable NSIndexPath *)newIndexPath
{
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self insertModel:anObject atIndex:[self placeForFillingModel:anObject]];
            break;
            
        default:
            [super controller:controller
              didChangeObject:anObject
                  atIndexPath:indexPath
                forChangeType:type
                 newIndexPath:newIndexPath];
    }
}

@end
