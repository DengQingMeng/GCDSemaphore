//
//  Person.h
//  BlockTest
//
//  Created by AndyDeng on 2018/7/23.
//  Copyright © 2018年 AndyDeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
@interface Person : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) Student *student;
@end
