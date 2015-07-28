//
//  MRFAlphabetWithRange.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 22.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFAlphabet.h"

@interface MRFAlphabetWithRange : MRFAlphabet

- (instancetype)initWithUnicodeRange:(NSRange)range;

@end
