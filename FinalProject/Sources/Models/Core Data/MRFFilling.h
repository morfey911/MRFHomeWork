//
//  MRFFilling.h
//  Final Project
//
//  Created by Yurii Mamurko on 10.11.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface MRFFilling : NSManagedObject
@property (nonatomic, retain)   NSNumber    *mileage;
@property (nonatomic, retain)   NSNumber    *volume;
@property (nonatomic, retain)   NSNumber    *price;
@property (nonatomic, retain)   NSString    *comment;
@property (nonatomic, retain)   NSDate      *date;

@end
