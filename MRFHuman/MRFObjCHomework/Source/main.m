//
//  main.m
//  MRFObjCHomework
//
//  Created by Yurii Mamurko on 06.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MRFBeing.h"
#import "MRFBeingTests.h"
#import "NSStringExtensionsTests.h"
#import "MRFCarwashTests.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        [MRFBeingTests MRFBeingBehaviourTest];
//        [NSStringExtensions NSStringPerfomExtensionsTests];
        [MRFCarwashTests MRFCarwashBehaviourTests];
    }
    return 0;
}
