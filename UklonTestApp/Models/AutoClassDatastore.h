//
//  AutoClassDatastore.h
//  UklonTestApp
//
//  Created by Andrew on 28.04.2018.
//  Copyright © 2018 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AutoClassDatastore : NSObject

+ (instancetype)shared;

- (NSArray *)getAutoclasses;

@end
