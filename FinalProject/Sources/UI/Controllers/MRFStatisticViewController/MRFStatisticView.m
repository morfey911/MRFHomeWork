//
//  MRFStatisticView.m
//  Final Project
//
//  Created by Yurii Mamurko on 07.12.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFStatisticView.h"

@interface MRFStatisticView ()

- (CGGradientRef)bottomGraphGradient;

@end

@implementation MRFStatisticView

#pragma mark -
#pragma mark Accessors

- (void)setGraphView:(BEMSimpleLineGraphView *)graphView {
    if (_graphView != graphView) {
        _graphView = graphView;
        
        _graphView.alwaysDisplayPopUpLabels = YES;
        _graphView.formatStringForValues = @"%.2f";
        _graphView.animationGraphStyle = BEMLineAnimationFade;
        _graphView.gradientBottom = [self bottomGraphGradient];
    }
}

#pragma mark -
#pragma mark Private

- (CGGradientRef)bottomGraphGradient {
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    size_t num_locations = 2;
    CGFloat locations[2] = { 0.0, 1.0 };
    CGFloat components[8] = {
        1.0, 1.0, 1.0, 1.0,
        1.0, 1.0, 1.0, 0.0
    };
    
    return CGGradientCreateWithColorComponents(colorspace, components, locations, num_locations);
}

@end
