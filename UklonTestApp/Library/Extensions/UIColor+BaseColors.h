//
//  UIColor+BaseColors.h
//  UklonTestApp
//
//  Created by Andrew on 28.04.2018.
//  Copyright © 2018 Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (BaseColors)

+ (UIColor *)blueUklonColor;
+ (UIColor *)yellowUklonColor;
+ (UIColor *)grayBackUklonColor;
+ (UIColor *)grayTextUklonColor;

+ (UIColor *)colorFromHexString:(NSString *)hexString;

@end
