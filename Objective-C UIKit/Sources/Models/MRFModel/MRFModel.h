//
//  MRFModel.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 06.10.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFObservableObject.h"

typedef NS_ENUM(NSUInteger, MRFModelState) {
    MRFModelNotLoaded,
    MRFModelWillLoad,
    MRFModelDidFailLoading,
    MRFModelDidLoad,
    MRFModelDidChange
};

@interface MRFModel : MRFObservableObject

- (void)load;

- (void)setupLoading;

- (void)performLoading;

@end
