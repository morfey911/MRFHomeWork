//
//  MRFDispatch.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 24.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#ifndef __Objective_C_UIKit__MRFDispatch__
#define __Objective_C_UIKit__MRFDispatch__

#import <Foundation/Foundation.h>

void MRFDispatchSyncOnMainThread(void(^block)(void));

#endif /* defined(__Objective_C_UIKit__MRFDispatch__) */
