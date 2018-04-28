//
//  AutoClassDatastore.m
//  UklonTestApp
//
//  Created by Andrew on 28.04.2018.
//  Copyright © 2018 Andrew. All rights reserved.
//

#import "AutoClassDatastore.h"
#import "AutoClass.h"

@implementation AutoClassDatastore

+ (instancetype)shared {
    static AutoClassDatastore *shared = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [AutoClassDatastore new];
    });
    
    return shared;
}

- (NSArray *)getAutoclasses {
    return @[[[AutoClass alloc] initWithTitle:@"Стандарт" imageName:@"ic_car_standart"],
                [[AutoClass alloc] initWithTitle:@"Комфорт" imageName:@"ic_car_comfort"],
                [[AutoClass alloc] initWithTitle:@"Бизнес" imageName:@"ic_car_business"],
                [[AutoClass alloc] initWithTitle:@"Универсал" imageName:@"ic_car_universal"],
                [[AutoClass alloc] initWithTitle:@"Микроавтобус" imageName:@"ic_car_bus"]
             ];
}

@end
