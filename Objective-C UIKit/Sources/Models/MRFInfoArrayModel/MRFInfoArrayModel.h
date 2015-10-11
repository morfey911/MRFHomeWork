//
//  MRFInfoArrayModel.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 23.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFArrayModel.h"

@interface MRFInfoArrayModel : MRFArrayModel
@property (nonatomic, readonly)                     NSArray     *notifications;
@property (nonatomic, readonly)                     NSString    *filePath;
@property (nonatomic, readonly)                     NSString    *fileName;
@property (nonatomic, readonly)                     NSString    *fileFolder;
@property (nonatomic, readonly, getter=isCached)    BOOL        cached;

+ (instancetype)arrayWithModelsCount:(NSUInteger)count;

- (instancetype)initWithModelsCount:(NSUInteger)count;

- (void)save;

@end
