//
//  PSTooltipView.m
//  tooltip
//
//  Created by Prateek Sujaina on 24/07/17.
//  Copyright © 2017 prateek. All rights reserved.
//

#import "PSTooltipView.h"
#import "PSUtils.h"
#import "Constants.h"

@interface PSTooltipView ()

@property (nonatomic, strong) CATextLayer *textLayer;
@property (nonatomic, strong) CALayer *bubbleLayer;
@property (nonatomic, strong) CAShapeLayer *arrowLayer;

@property (nonatomic, strong) NSMutableDictionary *attributes;

@end

@implementation PSTooltipView
{
    CGPoint initialPosition;
}

static UIColor * preferred_bubble_color;
static UIColor * preferred_text_color;
static UIFont * preferred_font;

+ (void)initialize
{
    if (self == [PSTooltipView class]) {
        preferred_bubble_color = [UIColor redColor];
        preferred_text_color = [UIColor whiteColor];
        preferred_font = [UIFont fontWithName:@"San Francisco" size:17];
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.appearance = [[PSTooltipAppearance alloc] init];
        self.appearance.toolTipView = self;
        
        self.attributes = [NSMutableDictionary new];
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
        [style setLineBreakMode:NSLineBreakByWordWrapping];
        [self.attributes setValue:style forKey:NSParagraphStyleAttributeName];
        
        
        self.textLayer = [CATextLayer new];
        [self.textLayer setWrapped:YES];
        self.textLayer.frame = CGRectMake(text_left_right_margin, text_top_margin,
                                          CGRectGetWidth(self.frame),
                                          font_height);
        self.textLayer.alignmentMode = kCAAlignmentCenter;
        [self.layer addSublayer:self.textLayer];
        
        
        self.bubbleLayer = [CALayer new];
        self.bubbleLayer.frame = CGRectMake(0, 0,
                                            CGRectGetWidth(self.frame),
                                            tooltip_height - arrow_height);
        self.bubbleLayer.cornerRadius = corner_radius;
        [self.layer insertSublayer:self.bubbleLayer below:self.textLayer];
        
        self.arrowLayer = [CAShapeLayer new];
        self.arrowLayer.frame = CGRectMake(arrow_left_right_margin,
                                           tooltip_height - arrow_height,
                                           arrow_width,
                                           arrow_height);
        
        UIBezierPath *bPath = [UIBezierPath bezierPath];
        [bPath moveToPoint:CGPointMake(0, 0)];
        [bPath addLineToPoint:CGPointMake(CGRectGetWidth(self.arrowLayer.frame), 0)];
        [bPath addLineToPoint:CGPointMake(CGRectGetWidth(self.arrowLayer.frame)/2, CGRectGetHeight(self.arrowLayer.frame))];
        [bPath addLineToPoint:CGPointMake(0, 0)];
        self.arrowLayer.path = bPath.CGPath;
        
        [self.layer addSublayer:self.arrowLayer];
        
        [self setHidden:YES];
        
    }
    return self;
}

-(void)setTextWithDate:(NSDate*)date
{
    NSString *dateString = [PSUtils dateStringFromDate:date format:Date_Formate_EEE_HH_mm_a];
    
    [self setMessage:dateString];
}

-(void)setMessage:(NSString*)message
{
    if (message == nil || message.length == 0) {
        return;
    }
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:message attributes:self.attributes];    
    [self.textLayer setString:str];
}

-(void)layoutSublayersOfLayer:(CALayer *)layer
{
    [super layoutSublayersOfLayer:layer];
    
    if (layer == self.layer) {
        //NSLog(@"root layer");
        
        CGFloat newH = CGRectGetHeight(layer.frame);
        
        CGRect rect = self.bubbleLayer.frame;
        
        rect.size.width = CGRectGetWidth(layer.frame);
        rect.size.height = newH - arrow_height;
        self.bubbleLayer.frame = rect;
        
        rect = self.textLayer.frame;
        
        rect.size.width = CGRectGetWidth(layer.frame) - 2*text_left_right_margin;
        rect.size.height = newH - arrow_height;
        rect.origin.x = text_left_right_margin;
        rect.origin.y = text_top_margin/2;
        self.textLayer.frame = rect;
        
        rect = self.arrowLayer.frame;
        rect.origin.y = newH-arrow_height;
        self.arrowLayer.frame = rect;
    }
}

-(void)showFromRect:(CGRect)rect message:(NSString*)message
{
    [self.attributes setValue:self.appearance.textFont forKeyPath:NSFontAttributeName];
    [self.attributes setValue:self.appearance.textColor forKey:NSForegroundColorAttributeName];
    self.bubbleLayer.backgroundColor = self.appearance.bubbleColor.CGColor;
    self.arrowLayer.fillColor = self.appearance.bubbleColor.CGColor;

    CGRect r = [message boundingRectWithSize:CGSizeMake(self.appearance.maxCardWidth, 0)
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:self.attributes context:nil];
    CGSize size = r.size;
    
    CGFloat h = size.height + text_top_margin + arrow_height;
    size.height = h;
    
    CGRect frm = self.frame;
    frm.size.width = size.width + 2*text_left_right_margin;
    frm.size.height = size.height;
    
    frm.origin.y = rect.origin.y - ((CGRectGetHeight(frm) + tooltip_margin));
    frm.origin.x = rect.origin.x - ((arrow_left_right_margin + arrow_width/2) - rect.size.width/2);
    
    CGPoint arrowPosition = self.arrowLayer.position;
    
    if (frm.origin.x + CGRectGetWidth(frm) > CGRectGetWidth(self.window.frame)) {
        frm.origin.x = CGRectGetWidth(self.window.frame) - CGRectGetWidth(frm);
        arrowPosition.x = (rect.origin.x - frm.origin.x) + CGRectGetWidth(rect)/2;
    } else {
        arrowPosition.x = arrow_left_right_margin;
    }
    
    self.arrowLayer.position = arrowPosition;
    initialPosition = frm.origin;
    self.frame = frm;
    
    [self setMessage:message];
    [self setHidden:NO];
}

-(void)hide
{
    initialPosition = CGPointZero;
    [self setHidden:YES];
}

-(void)translateWithPoint:(CGPoint)point
{
    if (!self.isHidden) {
        CGRect rect = self.frame;
        
        if (initialPosition.x + point.x + CGRectGetWidth(rect) > CGRectGetWidth(self.window.frame)) {
            CGPoint position = self.arrowLayer.position;
            position.x = arrow_left_right_margin + (initialPosition.x + point.x - rect.origin.x);
            self.arrowLayer.position = position;
        } else {
            rect.origin.x = initialPosition.x + point.x;
        }
        
        self.frame = rect;
    }
}

@end
