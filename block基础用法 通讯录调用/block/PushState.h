//
//  PushState.h
//  block
//
//  Created by 宋学谦 on 2017/1/22.
//  Copyright © 2017年 Song Xueqian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PushState : NSObject

+ (PushState *)PushStateManage;
@property (nonatomic, strong)NSString *stateString;

@end
