//
//  MRFBeing.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 06.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    kMRFBeingMaleGender = 1,
    kMRFBeingFemaleGender = 2
} MRFBeingGender;

@interface MRFBeing : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, retain, readonly) NSArray *children;

@property (nonatomic, assign, readonly) MRFBeingGender gender;
@property (nonatomic, assign, readonly) uint8_t age;
@property (nonatomic, assign, readonly) uint8_t weight;


- (instancetype) init;
- (instancetype) initWithName:(NSString *)name;
- (instancetype) initWithName:(NSString *)name age:(uint8_t)age;
- (instancetype) initWithName:(NSString *)name age:(uint8_t)age gender:(MRFBeingGender) gender;

- (void) fight;

- (void) sayHi;

- (MRFBeing *) giveBirth;

- (void) addChild:(MRFBeing *)child;

- (void) removeChild:(MRFBeing *)child;

- (void) performGenderSpecificOperation;

@end
