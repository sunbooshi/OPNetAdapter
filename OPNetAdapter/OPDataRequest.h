//
//  OPDataRequest.h
//  OPNetAdapter
//
//  Created by sunboshi on 2018/7/5.
//  Copyright © 2018年 sunobshi.tech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OPDataResponse.h"
#import <AFNetworking/AFNetworking.h>
#define OPQueryParameters
#define OPUriParameters
#define OPFormParameters

#define OPGetRequest    /** Get 请求 */
#define OPPostRequest   /** Post请求 */
#define OPPutRequest    /** Put 请求 */
#define OPDeleteRequest /** Delete请求 */

@interface OPDataRequest : NSObject

/**
 *  Request domain.
 */
@property (nonatomic, copy) NSString *domain;

/**
 *  Request path
 */
@property (nonatomic, copy) NSString *path;

/**
 *  Request params
 */
@property (nonatomic, strong) NSDictionary *params;

+ (instancetype)reqeust;

- (NSDictionary *)parametersMap;
- (NSDictionary *)buildParameters;
- (NSDictionary *)headerVaules;

- (NSSet *)acceptableContentTypes;

- (void)prepareForRequest;
- (void)readyForRequest;

- (void)getWithSuccess:(void (^)(OPDataResponse *responseObject))success
                failure:(void (^)(NSError *error))failure;

- (void)postWithSuccess:(void (^)(OPDataResponse * responseObject))success
                failure:(void (^)(NSError *error))failure;

- (void)putWithSuccess:(void (^)(OPDataResponse * responseObject))success
                failure:(void (^)(NSError *error))failure;

- (void)deleteWithSuccess:(void (^)(OPDataResponse * responseObject))success
                failure:(void (^)(NSError *error))failure;


- (OPDataResponse *)getResponseParser:(id)response;
- (OPDataResponse *)postResponseParser:(id)response;
- (OPDataResponse *)putResponseParser:(id)response;
- (OPDataResponse *)deleteResponseParser:(id)response;

@end
