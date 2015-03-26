//
//  BMDrawRectView.h
//
//  Created by Adam Iredale on 19/02/2015.
//  Copyright (c) 2015 Bionic Monocle Pty Ltd. All rights reserved.
//

/**
 *  Allows fast block-based instantiation of a custom draw-rect view for whatever
 */

typedef void(^BMDrawRectBlock)(CGRect rect);

@interface BMDrawRectView : UIView
/**
 *  Hot-swappable block that's called each time the view "needs display" (i.e. when drawRect is called).
 *  A nil value will simply skip drawing. Changing this property will trigger `setNeedsDisplay`.
 */
@property (nonatomic, copy) BMDrawRectBlock drawRectBlock;

/**
 *  Convenience Initializer
 *
 *  @param frame         View frame
 *  @param drawRectBlock Convenience for setting the drawrect block property. Setting nil will simply skip drawing.
 *
 *  @return An instance of BMDrawRectView
 */
- (instancetype)initWithFrame:(CGRect)frame drawRectBlock:(BMDrawRectBlock)drawRectBlock;

/**
 *  Convenience Initializer (best for Q&D spitballing)
 *
 *  @param drawRectBlock Convenience for setting the drawrect block property. Setting nil will simply skip drawing.
 *
 *  @return An (autoreleased) instance of BMDrawRectView
 */
+ (instancetype)viewWithFrame:(CGRect)frame drawRectBlock:(BMDrawRectBlock)drawRectBlock;

/**
 *  @name Deprecated methods. Will be removed in next major release.
 */

/**
 *  Convenience Initializer
 *
 *  @param drawRectBlock Convenience for setting the drawrect block property. Setting nil will simply skip drawing.
 *
 *  @return An instance of BMDrawRectView
 */
- (instancetype)initWithDrawRectBlock:(BMDrawRectBlock)drawRectBlock DEPRECATED_ATTRIBUTE;

/**
 *  Convenience Initializer (best for Q&D spitballing)
 *
 *  @param drawRectBlock Convenience for setting the drawrect block property. Setting nil will simply skip drawing.
 *
 *  @return An (autoreleased) instance of BMDrawRectView
 */
+ (instancetype)viewWithDrawRectBlock:(BMDrawRectBlock)drawRectBlock DEPRECATED_ATTRIBUTE;

@end
