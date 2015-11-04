//
//  MRFObject.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 04.11.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFObject.h"

#import "NSManagedObject+IDPExtensions.h"

#import "MRFObservableObject.h"

static NSString * const kMRFId = @"id";

@interface MRFObject ()
@property (nonatomic, strong)   MRFObservableObject *object;

@end

@implementation MRFObject

@synthesize object = _object;

@dynamic ID;

#pragma mark -
#pragma mark Class Methods

+ (id)managedObjectWithID:(NSString *)ID {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self.id like %@", ID];
    NSArray *objects = [self fetchEntityWithSortDescriptors:nil
                                                  predicate:predicate
                                              prefetchPaths:nil];
    
    if (objects.count > 0) {
        return [objects firstObject];
    }
    
    MRFObject *object = [self managedObject];
    object.ID = ID;
    
    return object;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (id)              initWithEntity:(NSEntityDescription*)entity
    insertIntoManagedObjectContext:(NSManagedObjectContext*)context
{
    self = [super initWithEntity:entity insertIntoManagedObjectContext:context];
    if (self) {
        self.object = [MRFObservableObject observableObjectWithTarget:self];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setID:(NSString *)ID {
    [self setCustomValue:ID forKey:kMRFId];
    
    self.state = MRFObjectDidChangeID;
}

- (NSString *)ID {
    return [self customValueForKey:kMRFId];
}

- (void)removeID:(NSString *)ID {
    [self removeCustomValue:ID inMutableSetForKey:kMRFId];
}

#pragma mark -
#pragma mark Forwading

- (id)forwardingTargetForSelector:(SEL)aSelector {
    MRFObservableObject *object = self.object;
    
    return [object respondsToSelector:aSelector] ? object : nil;
}

#pragma mark -
#pragma mark MRFObservableObject

- (SEL)selectorForState:(NSUInteger)state {
    SEL selector = nil;
    
    switch (state) {
        case MRFObjectWillLoad:
            selector = @selector(objectWillLoad:);
            break;
            
        case MRFObjectDidFailLoading:
            selector = @selector(objectDidFailLoading:);
            break;
            
        case MRFObjectDidLoad:
            selector = @selector(objectDidLoad:);
            break;
            
        case MRFObjectDidChange:
            selector = @selector(object:didChangeWithObject:);
            break;
            
        case MRFObjectDidChangeID:
            selector = @selector(objectDidChangeID:);
            break;
            
        default:
            selector = [self.object selectorForState:state];
            break;
    }
    
    return selector;
}

@end
