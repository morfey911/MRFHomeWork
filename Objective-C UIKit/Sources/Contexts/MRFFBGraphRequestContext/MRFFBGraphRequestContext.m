//
//  MRFFBGraphRequestContext.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 29.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFFBGraphRequestContext.h"

#import <FBSDKCoreKit.h>

#import "MRFModel.h"

#import "MRFMacros.h"

@interface MRFFBGraphRequestContext ()
@property (nonatomic, strong)   MRFModel                    *model;
@property (nonatomic, strong)   FBSDKGraphRequestConnection *connection;
@property (nonatomic, readonly) FBSDKGraphRequest           *request;
@property (nonatomic, readonly) id                          handler;

@end

@implementation MRFFBGraphRequestContext

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.connection = nil;
}

- (instancetype)initWithModel:(MRFModel *)model {
    self = [super init];
    if (self) {
        self.model = model;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (FBSDKGraphRequest *)request {
    return [[FBSDKGraphRequest alloc] initWithGraphPath:[self graphPath] parameters:[self graphPathParameters]];
}

- (void)setConnection:(FBSDKGraphRequestConnection *)connection {
    if (_connection != connection) {
        [_connection cancel];
        _connection = connection;
    }
}

- (id)handler {
    MRFWeakify(self);
    return ^(FBSDKGraphRequestConnection *connection,
             id result,
             NSError *error)
    {
        MRFStrongifyAndReturnIfNil(self);
        if (error ) {
            [self.model setState:MRFModelDidFailLoading withObject:error];
            return;
        }
        
        [self parseResult:result error:error];
    };
}

#pragma mark -
#pragma mark Public

- (NSString *)graphPath {
    return nil;
}

- (NSDictionary *)graphPathParameters {
    return nil;
}

- (void)parseResult:(id)result error:(NSError *)error {
    
}

#pragma mark -
#pragma mark MRFBaseContext

- (void)execute {
    self.connection = [self.request startWithCompletionHandler:self.handler];
}

- (void)cancel {
    self.connection = nil;
}

@end
