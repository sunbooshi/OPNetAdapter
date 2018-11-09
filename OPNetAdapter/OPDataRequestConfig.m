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
@property (nonatomic, assign) BOOL proxyEnable;
@property (nonatomic, copy) NSString *proxyHost;
@property (nonatomic, assign) NSInteger proxyPort;

@end

@implementation OPDataRequestConfig

- (instancetype)init {
    self = [super init];
    if (self) {
        self.environment = OPDataRequestConfigEnvDev;
        self.proxyEnable = NO;
    }
    return self;
}

+ (instancetype)defaultConfig {
    static dispatch_once_t onceToken;
    static OPDataRequestConfig *defaultConfig;
    dispatch_once(&onceToken, ^{
        defaultConfig = [[self.class alloc] init];
    });
    
    return defaultConfig;
}

+ (void)setEnv:(OPDataRequestConfigEnv)env {
    [OPDataRequestConfig defaultConfig].environment = env;
}

+ (OPDataRequestConfigEnv)env {
    return [OPDataRequestConfig defaultConfig].environment;
}

+ (BOOL)isDev {
    return [OPDataRequestConfig env] == OPDataRequestConfigEnvDev;
}

+ (BOOL)isTest {
    return [OPDataRequestConfig env] == OPDataRequestConfigEnvTest;
}

+ (BOOL)isPre {
    return [OPDataRequestConfig env] == OPDataRequestConfigEnvPre;
}

+ (BOOL)isProd {
    return [OPDataRequestConfig env] == OPDataRequestConfigEnvProd;
}

+ (void)setHttpProxyEnable:(BOOL)enable {
    [OPDataRequestConfig defaultConfig].proxyEnable = enable;
}

+ (void)setHttpProxy:(NSString *)host port:(NSInteger)port {
    [OPDataRequestConfig defaultConfig].proxyHost = host;
    [OPDataRequestConfig defaultConfig].proxyPort = port;
}

+ (NSDictionary *)connectionProxyDictionary {
    if (![OPDataRequestConfig defaultConfig].proxyEnable) {
        return nil;
    }
    
    NSString *host = [OPDataRequestConfig defaultConfig].proxyHost;
    NSInteger port = [OPDataRequestConfig defaultConfig].proxyPort;
    if (host == nil || host.length == 0) {
        return nil;
    }
    
    if (port <= 0) {
        return nil;
    }
    
    return @{
             (NSString *)kCFNetworkProxiesHTTPEnable: @(YES),
             (NSString *)kCFNetworkProxiesHTTPProxy: host,
             (NSString *)kCFNetworkProxiesHTTPPort: @(port)
             };
}


@end
