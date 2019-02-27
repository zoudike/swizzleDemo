//
//  PQPerson.m
//  swizzleDemo
//
//  Created by wenpq on 2019/2/27.
//  Copyright © 2019年 wenpq. All rights reserved.
//

#import "PQPerson.h"

@implementation PQPerson

+ (void)load {
    NSLog(@"wenpq...本类加载");
}

- (void)work {
    NSLog(@"wenpq...正在工作");
}

@end
