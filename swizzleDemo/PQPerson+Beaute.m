//
//  PQPerson+Beaute.m
//  swizzleDemo
//
//  Created by wenpq on 2019/2/27.
//  Copyright © 2019年 wenpq. All rights reserved.
//

#import "PQPerson+Beaute.h"
#import <objc/runtime.h>

@implementation PQPerson (Beaute)

+ (void)load {
    NSLog(@"wenpq...分类加载");
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originMethod = class_getInstanceMethod([self class], @selector(work));
        Method newMethod = class_getInstanceMethod([self class], @selector(swizzle_work));
        BOOL addSuccess = class_addMethod([self class], @selector(swizzle_work), method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
        // 如果方法存在，也会添加失败
        if (addSuccess) {
            //用刚add的新方法replace旧方法
            class_replaceMethod([self class], @selector(work), method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
        } else {
            method_exchangeImplementations(originMethod, newMethod);
        }
    });
}

- (void)swizzle_work {
    NSLog(@"wenpq...分类work");
    [self swizzle_work];//调用原来的方法
}



@end
