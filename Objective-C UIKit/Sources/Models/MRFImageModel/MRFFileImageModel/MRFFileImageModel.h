//
//  MRFFileImageModel.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 13.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFImageModel.h"

@interface MRFFileImageModel : MRFImageModel
@property (nonatomic, readonly)                         NSString    *filePath;
@property (nonatomic, readonly)                         NSString    *fileName;
@property (nonatomic, readonly)                         NSString    *fileFolder;
@property (nonatomic, readonly, getter=isFileCached)    BOOL        fileCached;

- (void)dump;

@end
