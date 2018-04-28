//
//  ARSelectorCell.h
//  UklonTestApp
//
//  Created by Andrew on 28.04.2018.
//  Copyright © 2018 Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ARItemProtocol.h"


@interface ARSelectorCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *underline;

- (void)configureWithItem:(id<ARItemProtocol>)item;
- (void)setImageColor:(UIColor *)imageColor underlineColor:(UIColor *)underlineColor;

@end
