//
//  BMDrawRectView.m
//
//  Created by Adam Iredale on 19/02/2015.
//  Copyright (c) 2015 Bionic Monocle Pty Ltd. All rights reserved.
//

#import "BMDrawRectView.h"

@interface BMDrawRectView ()

@end

@implementation BMDrawRectView

#pragma mark - Init

- (instancetype)init
{
    self = [self initWithDrawRectBlock:nil];
    if (self)
    {

    }
    return self;
}

- (instancetype)initWithDrawRectBlock:(void (^)(CGRect))drawRectBlock
{
    // Some sensible default, but you really should be using AutoLayout :D
    self = [super initWithFrame:CGRectMake(0, 0, 100, 100)];
    if (self)
    {
        self.drawRectBlock = drawRectBlock;
    }
    return self;
}

#pragma mark - Accessors

- (void)setDrawRectBlock:(BMDrawRectBlock)drawRectBlock
{
    _drawRectBlock = [drawRectBlock copy];
    [self setNeedsDisplay];
}

#pragma mark - Drawing

- (void)drawRect:(CGRect)rect
{
    if (_drawRectBlock)
    {
        _drawRectBlock(rect);
    }
}

#pragma mark - Class Methods

+ (instancetype)viewWithDrawRectBlock:(void (^)(CGRect))drawRectBlock
{
    BMDrawRectView *view = nil;
    @autoreleasepool
    {
        view = [[BMDrawRectView alloc] initWithDrawRectBlock:drawRectBlock];
    }
    return view;
}

@end
