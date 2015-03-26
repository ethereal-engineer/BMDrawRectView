//
//  BMDRVViewController.m
//  BMDrawRectView
//
//  Created by Adam Iredale on 03/13/2015.
//  Copyright (c) 2014 Adam Iredale. All rights reserved.
//

#import "BMDRVViewController.h"

@interface BMDRVViewController ()

@property (strong, nonatomic) IBOutlet BMDrawRectView *storyboardCreatedView;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@end

@implementation BMDRVViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateBlockChoiceFromSegmentedController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private

- (void)updateBlockChoiceFromSegmentedController
{
    BMDrawRectBlock firstBlock = ^(CGRect rect)
    {
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGContextSetStrokeColorWithColor(ctx, [UIColor colorWithRed:0.401 green:1.000 blue:0.695 alpha:1.000].CGColor);
        CGContextStrokeEllipseInRect(ctx, rect);
    };
    
    BMDrawRectBlock secondBlock = ^(CGRect rect)
    {
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(ctx, [UIColor colorWithRed:0.401 green:0.5 blue:0.695 alpha:1.000].CGColor);
        CGContextFillEllipseInRect(ctx, rect);
    };
    
    _storyboardCreatedView.drawRectBlock = (_segmentedControl.selectedSegmentIndex ? secondBlock : firstBlock);
}

#pragma mark - Actions

- (IBAction)segmentDidChange:(id)sender
{
    [self updateBlockChoiceFromSegmentedController];
}

- (IBAction)dynamicButtonTapped:(id)sender
{
    // The real power of this class is in the ease of inline use. I wrote it originally for debugging and drafting
    // ideas in the middle of a single project class. We can quickly create views with custom drawrect blocks.
    // No extra subclassing - making up the rules as we go. Curious as to what else it might be handy for.
    
    // Change whatever we like... (it's captured by the instance's block copy)
    UIColor *starColor = @[[UIColor redColor],[UIColor greenColor],[UIColor blueColor]][arc4random() % 3];
    
    CGRect frame = CGRectMake(arc4random() % (int)self.view.bounds.size.width, arc4random() % (int)self.view.bounds.size.height, arc4random() % 200, arc4random() % 200);
    
    BMDrawRectView *view = [BMDrawRectView viewWithFrame:frame drawRectBlock:^(CGRect frame)
                            {
                                //// Star Drawing Pasted Shamelessly from PaintCode2 :)
                                UIBezierPath* starPath = UIBezierPath.bezierPath;
                                [starPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.51163 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.09091 * CGRectGetHeight(frame))];
                                [starPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.66746 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.31312 * CGRectGetHeight(frame))];
                                [starPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.93186 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.38929 * CGRectGetHeight(frame))];
                                [starPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.76377 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.60279 * CGRectGetHeight(frame))];
                                [starPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.77135 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.87208 * CGRectGetHeight(frame))];
                                [starPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.51163 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.78182 * CGRectGetHeight(frame))];
                                [starPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.25191 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.87208 * CGRectGetHeight(frame))];
                                [starPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.25949 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.60279 * CGRectGetHeight(frame))];
                                [starPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.09139 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.38929 * CGRectGetHeight(frame))];
                                [starPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.35580 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.31312 * CGRectGetHeight(frame))];
                                [starPath closePath];
                                [starColor setFill];
                                [starPath fill];
                            }];
    // Make it clear
    view.backgroundColor = [UIColor clearColor];
    view.opaque = NO;
    // Shake things up a bit
    // But keep it orderly
    [self.view insertSubview:view belowSubview:sender];
    // Of course, you can swap blocks in and out as you wish at runtime, create them in storyboards as well as in code (see other example methods above)
}

#pragma mark - Exit Segue

- (IBAction)returnToMain:(UIStoryboardSegue *)segue
{
    // SRSLY with exit segues...
}

@end
