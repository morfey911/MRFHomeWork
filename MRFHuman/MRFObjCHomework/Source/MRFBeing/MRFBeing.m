//
//  MRFBeing.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 06.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFBeing.h"

/*
 Задание 1.
 Условие:
 Есть существо, у существа есть typedef пола, есть строка имени, есть масса, есть возраст, есть массив детей. Существо умеет воевать и рожать детей. При родах существо не добавляет к себе ребенка автоматом. Существо умеет добавит к себе детей и удалить. Существо умеет говорить "Привет!", причем, когда существо говорит привет, то сначала говорит оно, а потом все его дети (значит и дети детей, и т.д.).
 Задание:
 1. Написать класс существа;
 2. Создать несколько существ и положить их в массив, каждому из существ добавить детей;
 3. В цикле пройти по массиву существ и проверить их пол. Если мужик, то надо отправить существо воевать, если баба, то рожать детей;
 4. У существа наружу должен быть немутабельный массив детей через динамическое проперти с копи+авторелиз, а внутри - еще и мутабельное свойство.
 */

@interface MRFBeing ()

@property (nonatomic, retain) NSMutableArray *mutableChildren;
@property (nonatomic, assign) MRFBeingGender gender;

- (void) say:(NSString *)message;

@end

@implementation MRFBeing

@dynamic children;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.name = nil;
    self.mutableChildren = nil;
    
    [super dealloc];
}

- (instancetype)init {
    return [self initWithGender:kMRFBeingUndefinedGender];
}

- (instancetype)initWithGender:(MRFBeingGender)gender {
    self = [super init];
    
    if (self) {
        self.mutableChildren = [[[NSMutableArray alloc] init] autorelease];
        self.gender = gender;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)children {
    return [[self.mutableChildren copy] autorelease];
}

- (NSString *)description {
    NSMutableString *result = [[[NSMutableString alloc] initWithString:@"undefined"] autorelease];
    uint8_t genderValue = self.gender;
    
    if (kMRFBeingMaleGender == genderValue) {
        [result setString:@"male"];
    }
    if (kMRFBeingFemaleGender == genderValue) {
        [result setString:@"female"];
    }
    
    return [NSString stringWithFormat: @"%@ Being name: %@ age: %d gender: %@",
            [super description],
            self.name,
            self.age,
            result];
}

#pragma mark -
#pragma mark Public Methods

- (void)fight {
    [self say:@"I'm going to fight"];
}

- (void)sayHi {
    [self say:@"Hi"];
    
    for (MRFBeing *child in self.mutableChildren) {
        [child sayHi];
    }
}

- (instancetype)giveBirth {
    MRFBeingGender randomGender = (arc4random() % 2) + 1;
    
    return [[[self class] alloc] initWithGender:randomGender];
}

- (void)addChild:(MRFBeing *)child {
    if (nil != child) {
        [self.mutableChildren addObject:child];
    }
}

- (void)removeChild:(MRFBeing *)child {
    [self.mutableChildren removeObject:child];
}

- (void)performGenderSpecificOperation {
    
}

#pragma mark -
#pragma mark Private Methods

- (void)say:(NSString *)message {
    NSLog(@"%@", message);
}

@end
