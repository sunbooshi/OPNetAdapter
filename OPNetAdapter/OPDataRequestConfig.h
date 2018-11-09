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
    OPDataRequestConfigEnvProd
} OPDataRequestConfigEnv;

@interface OPDataRequestConfig : NSObject

+ (instancetype)defaultConfig;
+ (void)setEnv:(OPDataRequestConfigEnv)env;
+ (OPDataRequestConfigEnv)env;
+ (BOOL)isDev;
+ (BOOL)isTest;
+ (BOOL)isPre;
+ (BOOL)isProd;
+ (void)setHttpProxyEnable:(BOOL)enable;
+ (void)setHttpProxy:(NSString *)host port:(NSInteger)port;
+ (NSDictionary *)connectionProxyDictionary;

@end
