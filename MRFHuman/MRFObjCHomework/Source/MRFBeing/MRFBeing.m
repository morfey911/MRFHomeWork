//
//  MRFBeing.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 06.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFBeing.h"
#import "MRFMaleBeing.h"
#import "MRFFemaleBeing.h"

/*
 Задание 1.
 Условие:
 Есть существо, у существа есть typedef пола, есть строка имени, есть масса, есть возраст, есть массив детей. Существо умеет воевать и рожать детей. При родах существо не добавляет к себе ребенка автоматом. Существо умеет добавит к себе детей и удалить. Существо умеет говорить "Привет!", причем, когда существо говорит привет, то сначала говорит оно, а потом все его дети (значит и дети детей, и т.д.).
 Задание:
 1. Написать класс существа;
 2. Создать несколько существ и положить их в массив, каждому из существ добавить детей;
 3. В цикле пройти по массиву существ и проверить их пол. Если мужик, то надо отправить существо воевать, если баба, то рожать детей;
 4. У существа наружу должен быть немутабельный массив детей через динамическое проперти с копи+авторелиз, а внутри - еще и мутабельное свойство.
 
 
 Задание 2.
 Условие:
 Дано существо из задания 1.
 Задание:
 1. Убрать переменную пол из существа, а также умение воевать и рожать детей;
 2. Вместо нее создать наследников существа: мужское и женское существо;
 3. Мужское существо умеет воевать, женское - рожать детей;
 4. Создать метод performGenderSpecificOperation у родительского существа, который ничего не делает, мужское существо по вызову этого метода идет воевать, женское рожает детей;
 5. Создать массив существ, в котором бы лежали только мужчины и женщины, пройтись по нему через for (Creature *creature in creatures) и вызвать метод performGenderSpecificOperation, которой, в зависимости от пола существа приведет либо к войне, либо к родам -> Подчеркнуть, что это - полиморфизм, значит, охуенно.
 6. Заменить alloc init autorelease на NSOBject категорию с методом object

 */

@interface MRFBeing ()
@property (nonatomic, retain) NSMutableArray *mutableChildren;

- (void) say:(NSString *)message;

@end

@implementation MRFBeing

@dynamic children;

#pragma mark -
#pragma mark Class methods

+ (Class)humanClassForGender:(MRFBeingGender)gender {
    return kMRFBeingMaleGender == gender ? [MRFMaleBeing class] : [MRFFemaleBeing class];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.name = nil;
    self.mutableChildren = nil;
    
    [super dealloc];
}

- (id)initWithGender:(MRFBeingGender)gender {
    self = [super init];
    Class humanClass = [[self class] humanClassForGender:gender];
    [self release];
    
    return [[humanClass alloc] init];
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)children {
    return [[self.mutableChildren copy] autorelease];
}

- (NSString *)description {
    return [NSString stringWithFormat: @"%@ Being name: %@ age: %d",
            [super description],
            self.name,
            self.age];
}

#pragma mark -
#pragma mark Public Methods

- (void)sayHi {
    [self say:@"Hi"];
    
    for (MRFBeing *child in self.mutableChildren) {
        [child sayHi];
    }
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
    NSLog(@"%@ %@", super.description ,message);
}

@end
