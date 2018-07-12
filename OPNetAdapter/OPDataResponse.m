
//
//  OPDataResponse.m
//  OPNetAdapter
//
//  Created by sunguanglei on 15/5/19.
//  Copyright (c) 2015年 sunix. All rights reserved.
//

#import "OPDataResponse.h"
#import "Mantle.h"

@implementation OPDataResponse

- (instancetype)initWithResponse:(id)response
{
    return [self initWithResponse:response dataModleClass:nil responseType:OPDataResponseTypeDefault];
}

- (instancetype)initWithResponse:(id)response dataModleClass:(Class)dataModelClass responseType:(OPDataResponseType)responseType
{
    self = [super init];
    if (self) {
        @try {
            self.code = [response[@"code"] integerValue];
            self.msg = response[@"msg"];
            if (nil == dataModelClass) {
                self.data = response[@"data"];
            }
            else {
                NSError *error = nil;
                if (OPDataResponseTypeDefault == responseType) {
                    //这儿需要做些特殊处理  如果出现这种情况 {"code":1,"data":"","msg":"暂无符合条件的查询结果"}  data 是一个字符串的情况
                    
                    self.data = [MTLJSONAdapter modelOfClass:dataModelClass fromJSONDictionary:response[@"data"] error:&error];
                 
                    
                }
                else if (OPDataResponseTypeList == responseType) {
                    self.data = [MTLJSONAdapter modelsOfClass:dataModelClass fromJSONArray:response[@"data"] error:&error];
                }
                else if (OPDataResponseTypePage == responseType) {
                    NSDictionary *pageData = response[@"data"];
                    self.data = [MTLJSONAdapter modelsOfClass:dataModelClass fromJSONArray:pageData[@"list"] error:&error];
                    self.extraData = [self extraPageInfo:pageData];
                }
                self.error = error;
            }
        }
        @catch (NSException *exception) {
            self.error = [NSError errorWithDomain:@"cn.sunix.opnetadapter" code:1001 userInfo:@{NSLocalizedDescriptionKey:@"Response data format error.", NSLocalizedFailureReasonErrorKey:@"Response data format error."}];
        }
        @finally {
            //
        }
    }
    return self;
}

- (NSDictionary *)extraPageInfo:(NSDictionary *)pageData
{
    NSMutableDictionary *pageInfo = [NSMutableDictionary dictionaryWithDictionary:pageData];
    if (pageInfo[@"list"]) {
        [pageInfo removeObjectForKey:@"list"];
    }
    return [NSDictionary dictionaryWithDictionary:pageInfo];
}

@end
