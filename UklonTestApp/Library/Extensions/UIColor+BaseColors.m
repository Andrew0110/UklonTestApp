//
//  UIColor+BaseColors.m
//  UklonTestApp
//
//  Created by Andrew on 28.04.2018.
//  Copyright © 2018 Andrew. All rights reserved.
//

#import "UIColor+BaseColors.h"

@implementation UIColor (BaseColors)

+ (UIColor *)blueUklonColor {
    return [UIColor colorWithRed:73/255. green:192/255. blue:235/255. alpha:1.0];
}

+ (UIColor *)yellowUklonColor {
    return [UIColor colorWithRed:254/255. green:208/255. blue:0/255. alpha:1.0];
}

+ (UIColor *)grayBackUklonColor{
    return [UIColor colorWithRed:69/255. green:71/255. blue:84/255. alpha:1.0];
}

+ (UIColor *)grayTextUklonColor{
    return [UIColor colorWithRed:156/255. green:156/255. blue:156/255. alpha:1.0];
}

+ (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

@end
