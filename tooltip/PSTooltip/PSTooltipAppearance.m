//
//  PSTooltipAppearance.m
//  tooltip
//
//  Created by Prateek Sujaina on 28/07/17.
//  Copyright © 2017 prateek. All rights reserved.
//

#import "PSTooltipAppearance.h"
#import "Constants.h"

static UIColor * preferred_bubble_color;
static UIColor * preferred_text_color;
static UIFont * preferred_font;

@implementation PSTooltipAppearance

+ (void)initialize
{
    if (self == [PSTooltipAppearance class]) {
        preferred_bubble_color = [UIColor redColor];
        preferred_text_color = [UIColor whiteColor];
        preferred_font = [UIFont fontWithName:@"San Francisco" size:17];
    }
}

- (UIColor *)bubbleColor
{
    if (_bubbleColor) {
        return _bubbleColor;
    }
    return preferred_bubble_color;
}

- (UIColor *)textColor
{
    if (_textColor) {
        return _textColor;
    }
    return preferred_text_color;
}

- (UIFont *)textFont
{
    if (_textFont) {
        return _textFont;
    }
    return preferred_font;
}

- (CGFloat)maxCardWidth
{
    if (_maxCardWidth == 0) {
        return preferred_max_width;
    }
    return _maxCardWidth;
}

@end
