//
//  ARSelectorCell.m
//  UklonTestApp
//
//  Created by Andrew on 28.04.2018.
//  Copyright © 2018 Andrew. All rights reserved.
//

#import "ARSelectorCell.h"

@implementation ARSelectorCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)configureWithItem:(id<ARItemProtocol>)item {
    self.imageView.image = [[UIImage imageNamed:item.imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.titleLabel.text = item.title;
}

- (void)setImageColor:(UIColor *)imageColor underlineColor:(UIColor *)underlineColor {
    self.imageView.tintColor = imageColor;
    self.titleLabel.textColor = imageColor;
    self.underline.backgroundColor = underlineColor;
}

@end
