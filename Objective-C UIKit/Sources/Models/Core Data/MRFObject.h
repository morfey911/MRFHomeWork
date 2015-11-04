//
//  MRFObject.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 04.11.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface MRFObject : NSManagedObject
@property (nonatomic, strong)   NSString    *ID;

+ (id)managedObjectWithID:(NSString *)ID;

@end
