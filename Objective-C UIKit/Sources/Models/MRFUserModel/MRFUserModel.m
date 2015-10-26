//
//  MRFUserModel.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 24.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFUserModel.h"

@implementation MRFUserModel

#pragma mark -
#pragma mark Accessors

- (void)setUserID:(NSString *)userID {
    if (_userID != userID) {
        _userID = userID;
        
        self.state = MRFUserModelDidChangeID;
    }
}

#pragma mark -
#pragma mark MRFModel

- (void)performLoading {
    
}

- (SEL)selectorForState:(NSUInteger)state {
    SEL selector = NULL;
    
    switch (state) {
        case MRFUserModelDidChangeID:
            selector = @selector(userModelDidChangeID:);
            break;
            
        default:
            selector = [super selectorForState:state];
            break;
    }
    
    return selector;
}

@end
