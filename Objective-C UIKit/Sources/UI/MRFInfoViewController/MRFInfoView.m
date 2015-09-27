//
//  MRFInfoView.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 17.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFInfoView.h"

#import "MRFLoadingView.h"

#import "UINib+MRFExtensions.h"

@interface MRFInfoView ()
@property (nonatomic, strong)   MRFLoadingView  *loadingView;

@end

@implementation MRFInfoView

@dynamic editing;

#pragma mark -
#pragma mark ???

- (void)awakeFromNib {
    [super awakeFromNib];
    
    MRFLoadingView *loadingView = [UINib objectWithClass:[MRFLoadingView class]];
    self.loadingView = loadingView;
    [self addSubview:loadingView];
}

#pragma mark -
#pragma mark Accessors

- (void)setEditing:(BOOL)editing {
    [self.tableView setEditing:editing animated:YES];
}

- (BOOL)isEditing {
    return self.tableView.editing;
}

#pragma mark -
#pragma mark Public

- (void)hideLoadingView {
    [self.loadingView hideWithAnimation];
}

- (void)showLoadingView {
    [self.loadingView showWithAnimation];
}

@end
