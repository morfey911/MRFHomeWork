//
//  DBImage.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 02.11.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DBUser;

@interface DBImage : NSManagedObject
@property (nonatomic, strong)   NSString    *path;
@property (nonatomic, strong)   DBUser      *user;

@end
