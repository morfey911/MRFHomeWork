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
    @interface viewControllerClass (__MRFPrivateBaseView) \
    MRFDefineBaseViewProperty(propertyName, baseViewClass) \
    \
    @end \
    \
    @implementation viewControllerClass (__MRFPrivateBaseView) \
    \
    @dynamic propertyName; \
    \
    MRFBaseViewGetterSynthesize(propertyName, baseViewClass) \
    \
    @end
