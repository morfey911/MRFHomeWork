//
//  MRFDispatch.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 24.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

void MRFDispatchSyncOnMainThread(void(^block)(void));

void MRFDispatchAsyncOnMainThread(void(^block)(void));

void MRFDispatchAsyncOnBackgroundThread(void(^block)(void));
