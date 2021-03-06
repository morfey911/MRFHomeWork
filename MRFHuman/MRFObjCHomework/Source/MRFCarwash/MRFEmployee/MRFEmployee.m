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
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setState:(MRFEmployeeState)state {
    if (_state != state) {
        _state = state;
        
        [self notifyObserversOnMainThreadWithSelector:[self selectorForState:state]];
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

- (void)workWithObject:(id<MRFMoneyFlow>)object {
    
}

- (void)performWorkWithObject:(MRFEmployee *)object {
    NSLog(@"self = %@ object = %@", self, object);
    
    [self employeeStartWork];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self workWithObject:object];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self performWorkWithObjectOnMainThread:object];
        });
    });
}

- (void)performWorkWithObjectOnMainThread:(MRFEmployee *)object {
    [self employeeFinishWork];
    
    [object employeeMayBeFree];
}

- (NSString *)selectorForState:(MRFEmployeeState)state {
    NSDictionary *selectors = @{@(kMRFEmployeeDidBecomeFree) : NSStringFromSelector(@selector(MRFEmployeeDidBecomeFree:)),
                                @(kMRFEmployeeDidBecomeBusy) : NSStringFromSelector(@selector(MRFEmployeeDidBecomeBusy:)),
                                @(kMRFEmployeeDidPerformWorkWithObject) : NSStringFromSelector(@selector(MRFEmployeeDidPerformWorkWithObject:))};
    
    return selectors[@(state)];
}

#pragma mark -
#pragma mark MRFMoneyFlow protocol

- (void)takeMoney:(uint8_t)money fromMoneyKeeper:(id <MRFMoneyFlow>)moneyKeeper {
    @synchronized(moneyKeeper) {
        self.money += money;
        moneyKeeper.money -= money;
    }
}

- (void)giveMoney:(uint8_t)money toMoneyKeeper:(id <MRFMoneyFlow>)moneyKeeper {
    @synchronized(moneyKeeper) {
        self.money -= money;
        moneyKeeper.money += money;
    }
}

@end
