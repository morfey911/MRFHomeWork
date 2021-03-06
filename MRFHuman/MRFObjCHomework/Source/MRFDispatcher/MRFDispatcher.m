//
//  MRFDispatcher.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 17.08.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFDispatcher.h"

#import "MRFQueue.h"
#import "MRFEmployeesPool.h"

@interface MRFDispatcher ()
@property (nonatomic, retain) MRFQueue *processingObjects;
@property (nonatomic, retain) MRFEmployeesPool *mutableHandlers;

- (void)processTheObject:(id)object withHandler:(MRFEmployee *)handler;

@end

@implementation MRFDispatcher

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    //todo remove the observations
    self.processingObjects = nil;
    self.mutableHandlers = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.processingObjects = [MRFQueue queue];
        self.mutableHandlers = [MRFEmployeesPool pool];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Implementations

- (void)addProcessingObject:(id)object {
    MRFEmployee *freeHandler = [self.mutableHandlers freeEmployee];
    
    @synchronized(freeHandler) {
        if (nil != freeHandler && kMRFEmployeeDidBecomeFree == freeHandler.state) {
            [self processTheObject:object withHandler:freeHandler];
        } else {
            [self.processingObjects enqueueObject:object];
        }
    }
}

- (void)addHandler:(MRFEmployee *)handler {
    @synchronized(handler) {
        [self.mutableHandlers addEmployee:handler];
        [handler addObserver:self];
    }
}

- (void)removeHandler:(MRFEmployee *)handler {
    @synchronized(handler) {
        if (kMRFEmployeeDidBecomeFree == handler.state) {
            [handler removeObserver:self];
            [self.mutableHandlers removeEmployee:handler];
        }
    }
}

#pragma mark -
#pragma mark Private Implementations

- (void)processTheObject:(id)object withHandler:(MRFEmployee *)handler {
    @synchronized(handler) {
        if (kMRFEmployeeDidBecomeFree == handler.state) {
            [handler performWorkWithObject:object];
        }
    }
}

#pragma mark -
#pragma mark MRFEmployeeObserver

- (void)MRFEmployeeDidBecomeFree:(MRFEmployee *)employee {
    MRFQueue *processingObjects = self.processingObjects;
    
    if (![processingObjects isEmpty]) {
        [self processTheObject:[processingObjects dequeueObject] withHandler:employee];
    }
}

@end
