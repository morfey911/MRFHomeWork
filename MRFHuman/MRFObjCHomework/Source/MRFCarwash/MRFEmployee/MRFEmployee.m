//
//  MRFEmployee.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 13.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFEmployee.h"

@interface MRFEmployee ()
@property (nonatomic, assign) MRFEmployeeState state;
@property (nonatomic, retain) NSRecursiveLock *lock;

@end

@implementation MRFEmployee

@synthesize money = _money;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    return [self initWithMoney:0 salary:0 experience:0];
}

- (instancetype)initWithMoney:(uint8_t)money salary:(uint8_t)salary experience:(uint8_t)experience {
    self = [super init];
    
    if (self) {
        self.money = money;
        self.salary = salary;
        self.experience = experience;
        self.state = kMRFEmployeeDidBecomeFree;
        self.lock = [[NSRecursiveLock new] autorelease];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setState:(MRFEmployeeState)state {
    NSUInteger currentState = self.state;
    NSRecursiveLock *lock = self.lock;
    if (currentState != state) {
        [lock lock];
        if (currentState != state) {
            _state = state;
            
            [self performSelectorOnMainThread:@selector(notifyObserversWithSelector:)
                                   withObject:[self selectorForState:state]
                                waitUntilDone:NO];
        }
        [lock unlock];
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)employeeMayBeFree {
    self.state = kMRFEmployeeDidBecomeFree;
}

- (void)employeeStartWork {
    self.state = kMRFEmployeeDidBecomeBusy;
}

- (void)employeeFinishWork {
    self.state = kMRFEmployeeDidPerformWorkWithObject;
}

- (void)performWorkWithObject:(id<MRFMoneyFlow>)object {
    [self doesNotRecognizeSelector:_cmd];
}

- (void)performWorkWithObjectInBackground:(id<MRFMoneyFlow>)object {
    [self performSelectorInBackground:@selector(performWorkWithObject:) withObject:object];
}

- (NSString *)selectorForState:(MRFEmployeeState)state {
    NSDictionary *selectors = @{@(kMRFEmployeeDidBecomeFree) : NSStringFromSelector(@selector(MRFEmployeeDidBecomeFree:)), @(kMRFEmployeeDidBecomeBusy) : NSStringFromSelector(@selector(MRFEmployeeDidBecomeBusy:)),
        @(kMRFEmployeeDidPerformWorkWithObject) : NSStringFromSelector(@selector(MRFEmployeeDidPerformWorkWithObject:))};
    
    return selectors[@(state)];
}

#pragma mark -
#pragma mark MRFMoneyFlow protocol

- (void)takeMoney:(uint8_t)money fromMoneyKeeper:(id <MRFMoneyFlow>)moneyKeeper {
    self.money += money;
    moneyKeeper.money -= money;
}

- (void)giveMoney:(uint8_t)money toMoneyKeeper:(id <MRFMoneyFlow>)moneyKeeper {
    self.money -= money;
    moneyKeeper.money += money;
}

#pragma mark -
#pragma mark <MRFEmployeeObserver> protocol

- (void)MRFEmployeeDidPerformWorkWithObject:(id<MRFMoneyFlow>)object {
    [self performWorkWithObject:object];
}

@end
