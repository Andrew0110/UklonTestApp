//
//  AutoClass.h
//  UklonTestApp
//
//  Created by Andrew on 28.04.2018.
//  Copyright © 2018 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ARItemProtocol.h"

@interface AutoClass : NSObject <ARItemProtocol>

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *imageName;

- (instancetype)initWithTitle:(NSString *)title imageName:(NSString *)imageName;

@end
