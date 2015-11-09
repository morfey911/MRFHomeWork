//
//  MRFUserModelObserver.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 27.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFModelProtocol.h"

@protocol MRFUserModelObserver <MRFModelProtocol>

@optional

- (void)modelDidChangeID:(MRFModel *)model;

@end
