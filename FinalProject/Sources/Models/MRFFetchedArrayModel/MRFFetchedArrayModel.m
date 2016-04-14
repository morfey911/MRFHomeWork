//
//  MRFFetchedArrayModel.m
//  Final Project
//
//  Created by Yurii Mamurko on 11.11.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFFetchedArrayModel.h"

#import "IDPCoreDataManager.h"

#import "MRFDispatch.h"

#import "MRFMacros.h"

@interface MRFFetchedArrayModel ()
@property (nonatomic, strong)   NSFetchedResultsController  *controller;

@end

@implementation MRFFetchedArrayModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)fetchedArrayModelWithFetchRequest:(NSFetchRequest *)request {
    return [[self alloc] initWithFetchRequest:request];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithFetchRequest:(NSFetchRequest *)request {
    self = [super init];
    if (self) {
        self.controller = [self fetchedResultsControllerWithRequest:request];
    }
    
    return self;
}

#pragma mark -
#pragma mark Private

- (NSFetchedResultsController *)fetchedResultsControllerWithRequest:(NSFetchRequest *)request {
    NSManagedObjectContext *context = [[IDPCoreDataManager sharedManager] managedObjectContext];
    NSFetchedResultsController *controller = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                                 managedObjectContext:context
                                                                                   sectionNameKeyPath:nil
                                                                                            cacheName:nil];
    
    controller.delegate = self;
    
    return controller;
}

#pragma mark -
#pragma mark MRFModel

- (void)performLoading {
    NSError *error = nil;
    
    [self.controller performFetch:&error];
    NSArray *fetchedObjects = self.controller.fetchedObjects;
    
    id block = ^{
        [self addModels:fetchedObjects];
    };
    
    [self performBlockWithoutNotification:block];
    
    MRFDispatchAsyncOnMainThread(^{
        self.state = MRFModelDidLoad;
    });
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
            [self addModel:anObject];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self removeModel:anObject];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self updateModel:anObject];
            break;
            
        default:
            break;
    }
}

@end
