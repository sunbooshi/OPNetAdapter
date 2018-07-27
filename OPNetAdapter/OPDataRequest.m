//
//  OPDataRequest.m
//  OPNetAdapter
//
//  Created by sunboshi on 2018/7/5.
//  Copyright © 2018年 sunobshi.tech. All rights reserved.
//

#import "OPDataRequest.h"

#define OPRequstTimeoutInterval 180.0

@implementation OPDataRequest

+ (instancetype)reqeust
{
    return [[[self class] alloc] init];
}

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.timeout = OPRequstTimeoutInterval;
    }
    
    return self;
}

- (NSDictionary *)parametersMap
{
    return nil;
}

- (NSDictionary *)buildParameters
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    NSDictionary *maps = [self parametersMap];
    for (NSString *key in maps.allKeys) {
        id val = [self valueForKey:key];
        if (val) {
            if ([val isKindOfClass:[NSArray class]]
                || [val isKindOfClass:[NSDictionary class]]) {
                NSData *jsonData = [NSJSONSerialization dataWithJSONObject:val options:0 error:nil];
                if (jsonData) {
                    NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
                    [params setObject:jsonStr forKey:maps[key]];
                }
                else {
                    NSLog(@"[ERR] val to json error: %@", val);
                }
            }
            else {
                [params setObject:val forKey:maps[key]];
            }
        }
    }
    return [NSDictionary dictionaryWithDictionary:params];
}

- (NSDictionary *)headerVaules
{
    return nil;
}

- (NSSet *)acceptableContentTypes
{
    
    return [NSSet setWithObjects:@"application/json",@"text/plain", @"text/html", nil];
}

- (void)prepareForRequest
{
    
}

- (void)readyForRequest
{
    
}

- (NSString *)url
{
    NSAssert(self.domain != nil , @"Domain can't be nil.");
    NSAssert(self.path != nil, @"Path can't be nil.");
    
    NSString *encodedUrl = [self.path stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSString *url = [NSString stringWithFormat:@"%@%@", self.domain, encodedUrl];
    return url;
}

- (AFHTTPSessionManager *)manger
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [self acceptableContentTypes];
    NSDictionary *headers = [self headerVaules];
    for (NSString *filed in [headers allKeys]) {
        [manager.requestSerializer setValue:headers[filed] forHTTPHeaderField:filed];
    }
    
    return manager;
}

- (nullable NSURLSessionDataTask *)getWithSuccess:(void (^)(OPDataResponse *responseObject))success
               failure:(void (^)(NSError *error))failure
{
    [self prepareForRequest];
    NSString *url = [self url];
    
    
    self.params = [self buildParameters];
    
    AFHTTPSessionManager *manager = [self manger];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = self.timeout;
    
    
    [self readyForRequest];

    return [manager GET:url parameters:self.params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) success([self getResponseParser:responseObject]);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) failure(error);
    }];
}

- (nullable NSURLSessionDataTask *)postWithSuccess:(void (^)(OPDataResponse *responseObject))success
                failure:(void (^)(NSError *error))failure
{
    [self prepareForRequest];
    
    NSString *url = [self url];
    
    self.params = [self buildParameters];
    
    AFHTTPSessionManager *manager = [self manger];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = self.timeout;
    
    
    [self readyForRequest];
    
    return [manager POST:url parameters:self.params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) success([self getResponseParser:responseObject]);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) failure(error);
    }];
}

- (nullable NSURLSessionDataTask *)putWithSuccess:(void (^)(OPDataResponse *responseObject))success
               failure:(void (^)(NSError *error))failure
{
    [self prepareForRequest];
    
    NSString *url = [self url];
    
    self.params = [self buildParameters];
    
    AFHTTPSessionManager *manager = [self manger];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = self.timeout;
    
    
    [self readyForRequest];
    
    return [manager PUT:url parameters:self.params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) success([self getResponseParser:responseObject]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) failure(error);
    }];
}

- (nullable NSURLSessionDataTask *)deleteWithSuccess:(void (^)(OPDataResponse *responseObject))success
                  failure:(void (^)(NSError *error))failure
{
    [self prepareForRequest];
    
    NSString *url = [self url];
    
    self.params = [self buildParameters];
    
    
    AFHTTPSessionManager *manager = [self manger];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = self.timeout;
    
    
    [self readyForRequest];
    
    return [manager DELETE:url parameters:self.params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) success([self getResponseParser:responseObject]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) failure(error);
        
    }];
}


- (OPDataResponse *)getResponseParser:(id)response
{
    return [[OPDataResponse alloc] initWithResponse:response];
}

- (OPDataResponse *)postResponseParser:(id)response
{
    return [[OPDataResponse alloc] initWithResponse:response];
}

- (OPDataResponse *)putResponseParser:(id)response
{
    return [[OPDataResponse alloc] initWithResponse:response];
}

- (OPDataResponse *)deleteResponseParser:(id)response
{
    return [[OPDataResponse alloc] initWithResponse:response];
}

@end
