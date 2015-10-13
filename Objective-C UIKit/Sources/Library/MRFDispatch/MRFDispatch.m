//
//  MRFDispatch.c
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 24.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#include "MRFDispatch.h"

void MRFDispatchSyncOnMainThread(void(^block)(void)) {
    if (!block) {
        return;
    }
    
    if ([NSThread isMainThread]) {
        block();
    } else {
        dispatch_sync(dispatch_get_main_queue(), block);
    }
}

void MRFDispatchAsyncOnMainThread(void(^block)(void)) {
    if (!block) {
        return;
    }
    
    dispatch_async(dispatch_get_main_queue(), block);
}

void MRFDispatchAsyncOnBackgroundThread(void(^block)(void)) {
    if (!block) {
        return;
    }
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), block);
}
