//
//  PSUtils.h
//  tooltip
//
//  Created by Prateek Sujaina on 24/07/17.
//  Copyright © 2017 prateek. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString* const Date_Formate_DD_MM_YYYY = @"dd/MM/yyyy";
static NSString* const Date_Formate_DD_MM_YYYY_hmmss = @"dd/MM/yyyy h:mm:ss";
static NSString* const Date_Formate_YYYY_MM_DD_HH_MM_SS = @"yyyy-MM-dd'T'HH:mm:ssZ";//2016-10-10T03:48:45.000Z
static NSString* const Date_Formate_YYYY_MM_DD_HH_MM_SS1 = @"yyyy-MM-dd HH:mm:ssZ";
static NSString* const Date_Formate_YYYY_MM_DD_HH_mm_ssz = @"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";//@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
static NSString* const Date_Formate_YYYYMMDDTHHmmssz = @"yyyyMMdd'T'HHmmss'Z'";
static NSString* const Date_Formate_HH_mm_a = @"HH:mm a";
static NSString* const Date_Formate_HH_a = @"HH a";
static NSString* const Date_Formate_h_mm_a = @"h:mm a";
static NSString* const Date_Formate_h_a = @"h a";
static NSString* const Date_Formate_MMM_dd_h_a = @"MMM dd, h a";
static NSString* const Date_Formate_EEE_HH_a = @"EEE HH a";
static NSString* const Date_Formate_EEE_HH_mm_a = @"EEE HH:mm a";
static NSString* const Date_Formate_EEE_HH_mm_a2 = @"EEE   HH:mm a";
static NSString* const Date_Formate_MMM_d_YYYY = @"MMM d, yyyy";
static NSString* const Date_Formate_MMMM = @"MMMM";
static NSString* const Date_Formate_MMMM_yyyy = @"MMMM yyyy";
static NSString* const Date_Formate_MMM_d_YYYY_HH_mm_a = @"MMM d, yyyy   h:mm a";
static NSString* const Date_Formate_dd_MMM_YYYY = @"dd MMMM yyyy";
static NSString* const Date_Formate_MMMM_dd = @"MMMM dd";
static NSString* const Date_Formate_MMM_dd = @"MMM dd";
static NSString* const Date_Formate_yyyymmdd = @"yyyyMMdd";
static NSString* const Date_Formate_MMM_dd_HH_mm_a = @"MMM dd, HH:mm a";
static NSString* const Date_Formate_MMM_dd_h_mm_a = @"MMM dd, h:mm a";
static NSString* const Date_Formate_MMM_d_YYYY_h_mm_a = @"MMM d, yyyy h:mm a";
static NSString* const Date_Formate_MM_dd_YYYY = @"MM/dd/yyyy";

@interface PSUtils : NSObject

+ (NSString*)dateStringFromDate:(NSDate*)date format:(NSString*)dateFormat;

@end
