//
//  MRFFetchedArrayModel.h
//  Final Project
//
//  Created by Yurii Mamurko on 11.11.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import <CoreData/CoreData.h>

#import "MRFArrayModel.h"

@interface MRFFetchedArrayModel : MRFArrayModel <NSFetchedResultsControllerDelegate>

+ (instancetype)fetchedArrayModelWithFetchRequest:(NSFetchRequest *)request;

- (instancetype)initWithFetchRequest:(NSFetchRequest *)request;

@end
