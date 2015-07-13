//
//  MRFFemaleBeing.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 09.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFBeing.h"

@interface MRFFemaleBeing : MRFBeing
@property (nonatomic, assign, readonly) id lastBornChild;

- (void)giveBirth;

@end
