//
//  MRFImageCache.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 12.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MRFImageCache : NSObject

+ (MRFImageCache *)imageCache;

- (void)addObject:(id)object forKey:(id)key;

- (void)removeObjectForKey:(id)key;

- (id)objectForKey:(id)key;

@end
