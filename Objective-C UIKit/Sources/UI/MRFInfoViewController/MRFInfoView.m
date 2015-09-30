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
#pragma mark Initializations and Deallocations

- (void)awakeFromNib {
    [super awakeFromNib];
    
    MRFLoadingView *loadingView = [MRFLoadingView addLoadingToSelfSubviews:self];
    self.loadingView = loadingView;
    loadingView.animated = YES;
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
    [self.loadingView hide];
}

- (void)showLoadingView {
    [self.loadingView show];
}

@end
