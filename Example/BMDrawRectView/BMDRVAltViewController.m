//
//  BMDRVAltViewController.m
//  BMDrawRectView
//
//  Created by Adam Iredale on 26/03/2015.
//  Copyright (c) 2015 Adam Iredale. All rights reserved.
//

#import "BMDRVAltViewController.h"

@interface BMDRVAltViewController ()

@end

@implementation BMDRVAltViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // No need to make a view subclass if you don't need it for view controller subclasses
    // Works great with PaintCode2 StyleKit calls!
    [self.view insertSubview:
     [[BMDrawRectView alloc] initWithFrame:[[UIScreen mainScreen] bounds] drawRectBlock:^(CGRect rect)
      {
          // Your StyleKit Call Here... which will look something like this:
          [BMDRVAltViewController drawBackgroundWithFrame:rect];
      }] atIndex:0];
}

// Mock StyleKit Call
+ (void)drawBackgroundWithFrame: (CGRect)frame
{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* gradientTopColor = [UIColor colorWithRed: 0.426 green: 0.655 blue: 0.741 alpha: 1];
    UIColor* gradientBottomColor = [UIColor colorWithRed: 0.318 green: 0.494 blue: 0.445 alpha: 1];
    
    //// Gradient Declarations
    CGFloat gradientLocations[] = {0, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)gradientTopColor.CGColor, (id)gradientBottomColor.CGColor], gradientLocations);
    
    //// Rectangle Drawing
    CGRect rectangleRect = CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame), CGRectGetMaxX(frame), CGRectGetMaxY(frame));
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: rectangleRect];
    CGContextSaveGState(context);
    [rectanglePath addClip];
    CGContextDrawLinearGradient(context, gradient,
                                CGPointMake(CGRectGetMidX(rectangleRect), CGRectGetMinY(rectangleRect)),
                                CGPointMake(CGRectGetMidX(rectangleRect), CGRectGetMaxY(rectangleRect)),
                                0);
    CGContextRestoreGState(context);
    
    
    //// Cleanup
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}

@end
