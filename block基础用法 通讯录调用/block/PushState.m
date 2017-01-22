//
//  PushState.m
//  block
//
//  Created by 宋学谦 on 2017/1/22.
//  Copyright © 2017年 Song Xueqian. All rights reserved.
//

#import "PushState.h"
static PushState *state = nil;
@implementation PushState

+ (PushState *)PushStateManage{
    static dispatch_once_t *once;
    dispatch_once(&once, ^{
        state = [[PushState alloc] init];
    });
    return state;
}

@end
