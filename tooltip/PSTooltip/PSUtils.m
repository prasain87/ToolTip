//
//  PSUtils.m
//  tooltip
//
//  Created by Prateek Sujaina on 24/07/17.
//  Copyright © 2017 prateek. All rights reserved.
//

#import "PSUtils.h"

@implementation PSUtils

static NSLock *lockFormatter;
static NSDateFormatter *formatter;

+ (void)initialize
{
    if (self == [PSUtils class]) {
        lockFormatter = [[NSLock alloc] init];
        formatter = [[NSDateFormatter alloc] init];
    }
}

+ (NSString*)dateStringFromDate:(NSDate*)date format:(NSString*)dateFormat
{
    [lockFormatter lock];
    [formatter setDateFormat:dateFormat];
    NSString *str = [formatter stringFromDate:date];
    [lockFormatter unlock];
    
    return str;
}

@end
