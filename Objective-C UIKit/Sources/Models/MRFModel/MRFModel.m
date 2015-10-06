//
//  MRFModel.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 06.10.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFModel.h"

#import "MRFDispatch.h"
#import "MRFMacros.h"

#import "MRFModelProtocol.h"

@implementation MRFModel

#pragma mark -
#pragma mark Public

- (void)load {
    @synchronized(self) {
        NSUInteger state = self.state;
        
        if (MRFModelDidLoad == state || MRFModelWillLoad == state) {
            [self notifyObservers];
            
            return;
        }
        
        self.state = MRFModelWillLoad;
    }
    
    [self setupLoading];
    
    MRFWeakify(self);
    MRFDispatchAsyncOnBackgroundThread(^{
        MRFStrongifyAndReturnIfNil(self);
        [self performLoading];
    });
}

- (void)setupLoading {
    
}

- (void)performLoading {
    [self doesNotRecognizeSelector:_cmd];
}

#pragma mark -
#pragma mark Observable Object

- (SEL)selectorForState:(NSUInteger)state {
    SEL selector = nil;
    
    switch (state) {
        case MRFModelWillLoad:
            selector = @selector(modelWillLoad:);
            break;
            
        case MRFModelDidFailLoading:
            selector = @selector(modelDidFailLoading:);
            break;
            
        case MRFModelDidLoad:
            selector = @selector(modelDidLoad:);
            break;
            
        case MRFModelDidChange:
            selector = @selector(model:didChangeWithObject:);
            break;
            
        default:
            selector = [super selectorForState:state];
            break;
    }
    
    return selector;
}

@end
