//
//  OPDataRequestConfig.h
//  OPNetAdapter
//
//  Created by sunboshi on 2018/8/15.
//  Copyright © 2018年 sunobshi.tech. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    OPDataRequestConfigEnvDev,
    OPDataRequestConfigEnvTest,
    OPDataRequestConfigEnvPre,
    OPDataRequestConfigEnvPro
} OPDataRequestConfigEnv;

@interface OPDataRequestConfig : NSObject

+ (instancetype)defaultConfig;
+ (void)setEnv:(OPDataRequestConfigEnv)env;
+ (OPDataRequestConfigEnv)env;

@end
