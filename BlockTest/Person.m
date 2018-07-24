//
//  Person.m
//  BlockTest
//
//  Created by AndyDeng on 2018/7/23.
//  Copyright © 2018年 AndyDeng. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)init
{
    self = [super init];
    if (self) {
        _student = [[Student alloc] init];
    }
    return self;
}

- (void)setValue:(id)value forKey:(NSString *)key {
    
}
@end
