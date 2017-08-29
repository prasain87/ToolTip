//
//  PSTooltipAppearance.h
//  tooltip
//
//  Created by Prateek Sujaina on 28/07/17.
//  Copyright © 2017 prateek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PSTooltipAppearance : NSObject

@property (nonatomic, strong) UIView *toolTipView;

/**
 background color of the tool-tip
 */
@property (nonatomic, strong) UIColor *bubbleColor;

/**
 text color
 */
@property (nonatomic, strong) UIColor *textColor;

/**
 text font
 */
@property (nonatomic, strong) UIFont *textFont;

/**
 maximum width of the bubble or tool-tip
 */
@property (nonatomic) CGFloat maxCardWidth;

@end
