//
//  MRFMacros.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 14.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

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

//use ONLY after MRFWeakify macros!!!11
#define MRFStrongify(object) \
    __strong __typeof(object) object = __MRFWeak_##object

//use ONLY after MRFWeakify macros!!!11
#define MRFStrongifyAndReturnIfNil(object) \
    MRFStrongify(object); \
    if (!object) { \
        return; \
    }

#define MRFStrongifyAndReturnNilIfNil(object) \
    MRFStrongify(object); \
    if (!object) { \
        return nil; \
    }
