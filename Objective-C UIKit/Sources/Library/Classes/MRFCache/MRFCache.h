//
//  MRFCache.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 12.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MRFCache : NSObject

+ (MRFCache *)cache;

- (void)addObject:(id)object forKey:(id)key;

- (void)removeObjectForKey:(id)key;

- (id)objectForKey:(id)key;

@end
