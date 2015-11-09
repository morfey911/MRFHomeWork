//
//  MRFAlphabets.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 28.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFAlphabet.h"

@interface MRFAlphabets : MRFAlphabet

+ (instancetype)uppercaseLetterAlphabet;
+ (instancetype)lowercaseLetterAlphabet;
+ (instancetype)letterAlphabet;
+ (instancetype)numericAlphabet;

@end
