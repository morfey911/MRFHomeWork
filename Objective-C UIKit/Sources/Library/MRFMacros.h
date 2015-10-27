//
//  MRFMacros.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 14.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#define MRFShouldSleep 1
#define MRFEmpty

#define MRFDefineBaseViewProperty(propertyName, viewClass) \
    @property (nonatomic, readonly) viewClass *propertyName;

#define MRFBaseViewGetterSynthesize(selector, viewClass) \
    - (viewClass *)selector { \
        if ([self isViewLoaded] && [self.view isKindOfClass:[viewClass class]]) { \
            return (viewClass *)self.view; \
        } \
        \
        return nil; \
    }

#define MRFViewControllerBaseViewProperty(viewControllerClass, propertyName, baseViewClass) \
    @interface viewControllerClass (__##baseViewClass##__##propertyName) \
    MRFDefineBaseViewProperty(propertyName, baseViewClass) \
    \
    @end \
    \
    @implementation viewControllerClass (__##baseViewClass##__##propertyName) \
    \
    @dynamic propertyName; \
    \
    MRFBaseViewGetterSynthesize(propertyName, baseViewClass) \
    \
    @end


#define MRFWeakify(object) \
    __weak __typeof(object) __MRFWeak_##object = object

//use MRFStrongify ONLY after MRFWeakify macros!!!

#define MRFStrongify(object) \
    __strong __typeof(object) object = __MRFWeak_##object

#define __MRFStrongifyAndReturnValueIfNil(object, value) \
    MRFStrongify(object); \
    if (!object) { \
        return value; \
    }

#define MRFStrongifyAndReturnIfNil(object) \
    __MRFStrongifyAndReturnValueIfNil(object, MRFEmpty)

#define MRFStrongifyAndReturnNilIfNil(object) \
    __MRFStrongifyAndReturnValueIfNil(object, nil)


#define MRFLoad(propertyName) \
    [_##propertyName load];

#define __MRFSynthesizeObservingSetterWithParameter(propertyName, parameter) \
    if (_##propertyName != propertyName) { \
        [_##propertyName removeObserver:self]; \
        _##propertyName = propertyName; \
        [_##propertyName addObserver:self]; \
        parameter \
    }

#define MRFSynthesizeObservingSetter(propertyName) \
    __MRFSynthesizeObservingSetterWithParameter(propertyName, MRFEmpty)

#define MRFSynthesizeObservingSetterAndLoad(propertyName) \
    __MRFSynthesizeObservingSetterWithParameter(propertyName, MRFLoad(propertyName))

#define MRFSynthesizeContextSetter(propertyName) \
    if (_##propertyName != propertyName) { \
        [_##propertyName cancel]; \
        _##propertyName = propertyName; \
        [_##propertyName execute]; \
    }

#if MRFShouldSleep == 1
#define MRFSleep(time) [NSThread sleepForTimeInterval:time];
#else
#define MRFSleep(time)
#endif

