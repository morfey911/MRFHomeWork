//
//  main.m
//  MRFObjCHomework
//
//  Created by Yurii Mamurko on 06.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MRFBeing.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"main() starting");
        
        MRFBeing *being = [[MRFBeing alloc] initWithName:@"MorFey" age:30];
        
        NSLog(@"%@", being.name);
        
        NSLog(@"main() ending");
    }
    return 0;
}
