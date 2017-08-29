//
//  PSToolTip.h
//  tooltip
//
//  Created by Prateek Sujaina on 24/07/17.
//  Copyright © 2017 prateek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PSToolTip : NSObject

+ (void)showTooltipWithMessage:(NSString*)message sender:(UIView*)sender;

+ (void)hideTooltip;

+ (void)setBubbleColor:(UIColor*)color;

+ (void)setTextColor:(UIColor *)color;

+ (void)setTextFont:(UIFont *)font;

+ (void)setMaxCardWidth:(CGFloat)width;

@end
