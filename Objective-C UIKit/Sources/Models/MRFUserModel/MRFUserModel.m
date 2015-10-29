//
//  MRFUserModel.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 24.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFUserModel.h"

#import "MRFUserModelObserver.h"

@implementation MRFUserModel

#pragma mark -
#pragma mark Accessors

- (void)setUserID:(NSString *)userID {
    if (_userID != userID) {
        _userID = userID;
        
        self.state = MRFModelDidChangeID;
    }
}

#pragma mark -
#pragma mark MRFModel

- (SEL)selectorForState:(NSUInteger)state {
    SEL selector = NULL;
    
    switch (state) {
        case MRFModelDidChangeID:
            selector = @selector(modelDidChangeID:);
            break;
            
        default:
            selector = [super selectorForState:state];
            break;
    }
    
    return selector;
}

@end
