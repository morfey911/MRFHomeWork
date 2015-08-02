//
//  MRFAlphabetWithStrings.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 27.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFAlphabet.h"

@interface MRFAlphabetWithStrings : MRFAlphabet

- (instancetype)initWithStrings:(NSArray *)strings;

- (instancetype)initWithAlphabets:(NSArray *)alphabets;

@end
