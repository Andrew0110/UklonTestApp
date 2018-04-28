//
//  ARHorizontalSelectorView.h
//  UklonTestApp
//
//  Created by Andrew on 28.04.2018.
//  Copyright © 2018 Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ARItemProtocol.h"

@protocol ARSelectorDelegate;

@interface ARHorizontalSelectorView : UIView

@property (nonatomic, weak) id<ARSelectorDelegate> delegate;

@property (nonatomic) NSArray<id<ARItemProtocol>> *items;

@property (nonatomic) UIColor *underlineColor;
@property (nonatomic) UIColor *underlineSelectedColor;
@property (nonatomic) UIColor *imageColor;
@property (nonatomic) UIColor *imageSelectedColor;

@end


@protocol ARSelectorDelegate <NSObject>

@optional
- (void)selectorView:(ARHorizontalSelectorView *)selectorView didSelectItemAtIndex:(NSInteger)index;

@end
