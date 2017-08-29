//
//  PSToolTip.m
//  tooltip
//
//  Created by Prateek Sujaina on 24/07/17.
//  Copyright © 2017 prateek. All rights reserved.
//

#import "PSToolTip.h"
#import "PSTooltipView.h"
#import "Constants.h"

@implementation PSToolTip

static PSTooltipView *tooltipView = nil;

+ (void)showTooltipWithMessage:(NSString*)message sender:(UIView*)sender
{
    if (sender == nil) {
        return;
    }
    
    if (tooltipView == nil) {
        CGRect rect = CGRectMake(0, 0, tooltip_width, tooltip_height);
        rect = [sender.superview convertRect:rect toView:sender.window];
        tooltipView = [[PSTooltipView alloc] initWithFrame:rect];
    }
    
    [sender.window addSubview:tooltipView];

    CGRect rect = [[sender superview] convertRect:sender.frame toView:sender.window];
    [tooltipView showFromRect:rect
                      message:message];
}

+ (void)hideTooltip
{
    if (tooltipView) {
        [tooltipView removeFromSuperview];
    }
}

+ (void)setBubbleColor:(UIColor*)color
{
    if (tooltipView) {
        [tooltipView.appearance setBubbleColor:color];
    }
}

+ (void)setTextColor:(UIColor *)color
{
    if (tooltipView) {
        [tooltipView.appearance setTextColor:color];
    }
}

+ (void)setTextFont:(UIFont *)font
{
    if (tooltipView) {
        [tooltipView.appearance setTextFont:font];
    }
}

+ (void)setMaxCardWidth:(CGFloat)width
{
    if (tooltipView) {
        [tooltipView.appearance setMaxCardWidth:width];
    }
}

@end
