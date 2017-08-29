//
//  PSTooltipView.h
//  tooltip
//
//  Created by Prateek Sujaina on 24/07/17.
//  Copyright © 2017 prateek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSTooltipAppearance.h"

@interface PSTooltipView : UIView

//@property (nonatomic, strong) UIColor *bubbleColor;
//@property (nonatomic, strong) UIColor *textColor;
//@property (nonatomic, strong) UIFont *textFont;
//@property (nonatomic) CGFloat maxCardWidth;

@property (nonatomic, strong) PSTooltipAppearance *appearance;

-(void)setTextWithDate:(NSDate*)date;

//-(void)setPointerAt:(CGPoint)point;

-(void)showFromRect:(CGRect)rect message:(NSString*)message;

-(void)hide;

-(void)translateWithPoint:(CGPoint)point;

-(void)setMessage:(NSString*)message;

@end
