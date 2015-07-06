//
//  MRFBeing.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 06.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    MRFBeingMaleGender,
    MRFBeingFemaleGender
} MRFBeingGender;

@interface MRFBeing : NSObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSMutableArray *children;

@property (nonatomic, assign) MRFBeingGender gender;
@property (nonatomic, assign) uint8_t age;
@property (nonatomic, assign) uint8_t weight;


- (id) initWithName:(NSString *)name;
- (id) initWithName:(NSString *)name age:(uint8_t)age;
- (id) initWithName:(NSString *)name age:(uint8_t)age gender:(MRFBeingGender) gender;

- (void) fight;

- (void) sayHi;

@end
