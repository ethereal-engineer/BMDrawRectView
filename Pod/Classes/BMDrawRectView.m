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

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [self initWithFrame:frame drawRectBlock:nil];
    if (self)
    {

    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame drawRectBlock:(BMDrawRectBlock)drawRectBlock
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _drawRectBlock = [drawRectBlock copy];
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
    if (self.drawRectBlock)
    {
        self.drawRectBlock(rect);
    }
}

#pragma mark - Class Methods

+ (instancetype)viewWithFrame:(CGRect)frame drawRectBlock:(void (^)(CGRect))drawRectBlock
{
    BMDrawRectView *view = nil;
    @autoreleasepool
    {
        view = [[BMDrawRectView alloc] initWithFrame:frame drawRectBlock:drawRectBlock];
    }
    return view;
}


#pragma mark - Deprecated

- (instancetype)initWithDrawRectBlock:(void (^)(CGRect))drawRectBlock
{
    // Some sensible default, but you really should be using AutoLayout :D
    self = [self initWithFrame:CGRectMake(0, 0, 100, 100) drawRectBlock:drawRectBlock];
    if (self)
    {
        
    }
    return self;
}

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
