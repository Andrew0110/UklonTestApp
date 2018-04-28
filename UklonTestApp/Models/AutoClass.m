//
//  AutoClass.m
//  UklonTestApp
//
//  Created by Andrew on 28.04.2018.
//  Copyright © 2018 Andrew. All rights reserved.
//

#import "AutoClass.h"

@implementation AutoClass

-(instancetype)initWithTitle:(NSString *)title imageName:(NSString *)imageName {
    self = [super init];
    
    if (self) {
        _title = title;
        _imageName = imageName;
    }
    
    return self;
}

@end
