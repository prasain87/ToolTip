//
//  ViewController.m
//  tooltip
//
//  Created by Prateek Sujaina on 24/07/17.
//  Copyright © 2017 prateek. All rights reserved.
//

#import "ViewController.h"
#import "PSToolTip.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button6;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchUP:(UIButton*)sender {
    [PSToolTip hideTooltip];
}

- (IBAction)touchDown:(UIButton*)sender {
    if ([sender isEqual:self.button1]) {
        [PSToolTip setBubbleColor:[UIColor greenColor]];
    } else if ([sender isEqual:self.button2]) {
        [PSToolTip setBubbleColor:[UIColor yellowColor]];
    } else if ([sender isEqual:self.button3]) {
        [PSToolTip setBubbleColor:[UIColor orangeColor]];
    } else if ([sender isEqual:self.button4]) {
        [PSToolTip setBubbleColor:[UIColor magentaColor]];
    } else if ([sender isEqual:self.button5]) {
        [PSToolTip setBubbleColor:[UIColor blueColor]];
    }
    [PSToolTip showTooltipWithMessage:@"Shana is a Google Play Console expert and author of this help page. Leave her feedback below about the page." sender:sender];
}

@end
