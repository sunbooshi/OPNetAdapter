//
//  OPDataRequestConfig.m
//  OPNetAdapter
//
//  Created by sunboshi on 2018/8/15.
//  Copyright © 2018年 sunobshi.tech. All rights reserved.
//

#import "OPDataRequestConfig.h"

@interface OPDataRequestConfig()

@property (nonatomic, assign) OPDataRequestConfigEnv environment;

@end

@implementation OPDataRequestConfig

- (instancetype)init {
    self = [super init];
    if (self) {
        self.environment = OPDataRequestConfigEnvDev;
    }
    return self;
}

+ (instancetype)defaultConfig {
    static dispatch_once_t onceToken;
    static OPDataRequestConfig *defaultConfig;
    dispatch_once(&onceToken, ^{
        defaultConfig = [[OPDataRequestConfig alloc] init];
    });
    
    return defaultConfig;
}

+ (void)setEnv:(OPDataRequestConfigEnv)env {
    [OPDataRequestConfig defaultConfig].environment = env;
}

+ (OPDataRequestConfigEnv)env {
    return [OPDataRequestConfig defaultConfig].environment;
}

@end
