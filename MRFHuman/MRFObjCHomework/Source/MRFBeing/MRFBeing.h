//
//  MRFBeing.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 06.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    kMRFBeingUndefinedGender,
    kMRFBeingMaleGender,
    kMRFBeingFemaleGender
} MRFBeingGender;

@interface MRFBeing : NSObject

@property (nonatomic, copy)             NSString       *name;
@property (nonatomic, copy, readonly)   NSArray        *children;

@property (nonatomic, assign, readonly) MRFBeingGender gender;
@property (nonatomic, assign, readonly) uint8_t        age;
@property (nonatomic, assign, readonly) uint8_t        weight;

- (instancetype)initWithGender:(MRFBeingGender)gender;

- (void)fight;

- (void)sayHi;

- (MRFBeing *)giveBirth;

- (void)addChild:(MRFBeing *)child;

- (void)removeChild:(MRFBeing *)child;

- (void)performGenderSpecificOperation;

@end
