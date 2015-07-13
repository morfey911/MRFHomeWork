//
//  MRFBeingTests.m
//  MRFBeingTests
//
//  Created by Yurii Mamurko on 09.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>

#import "MRFBeing.h"

@interface MRFBeingTests : XCTestCase

@end

@implementation MRFBeingTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)MRFBeingBehaviourTest {
//    MRFBeing *being1 = [[[MRFBeing alloc] initWithGender:kMRFBeingMaleGender] autorelease];
//    MRFBeing *being2 = [[[MRFBeing alloc] initWithGender:kMRFBeingFemaleGender] autorelease];
//
//    being1.name = @"Being1";
//    being2.name = @"ololo";
//
//    for (int i = 0; i < 10; i++) {
//        MRFBeing *newBaby = [being2 giveBirth];
//        
//        [being1 addChild:newBaby];
//        [being2 addChild:newBaby];
//    }
//    
//    NSLog(@"\n%@\n%@", being1, being1.children);
//    NSLog(@"\n%@\n%@", being2, being2.children);
    
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
