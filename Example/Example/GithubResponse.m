//
//  GithubResponse.m
//  Example
//
//  Created by sunboshi on 2018/7/12.
//  Copyright © 2018年 sunobshi.tech. All rights reserved.
//

#import "GithubResponse.h"

@implementation GithubResponse

- (instancetype)initWithResponse:(id)response dataModleClass:(Class)dataModelClass responseType:(OPDataResponseType)responseType {
    self = [super init];
    if (self) {
        @try {
            NSError *error = nil;
            if (OPDataResponseTypeDefault == responseType) {
                //这儿需要做些特殊处理  如果出现这种情况 {"code":1,"data":"","msg":"暂无符合条件的查询结果"}  data 是一个字符串的情况
                self.data = [MTLJSONAdapter modelOfClass:dataModelClass fromJSONDictionary:response error:&error];
            }
            else if (OPDataResponseTypeList == responseType) {
                self.data = [MTLJSONAdapter modelsOfClass:dataModelClass fromJSONArray:response error:&error];
            }
            else if (OPDataResponseTypePage == responseType) {
                NSDictionary *pageData = response;
                self.data = [MTLJSONAdapter modelsOfClass:dataModelClass fromJSONArray:pageData[@"list"] error:&error];
//                    self.extraData = [self extraPageInfo:pageData];
            }
            self.error = error;
        }
        @catch (NSException *exception) {
            self.error = [NSError errorWithDomain:@"tech.sunboshi.opnetadapter" code:1001 userInfo:@{NSLocalizedDescriptionKey:@"Response data format error.", NSLocalizedFailureReasonErrorKey:@"Response data format error."}];
        }
        @finally {
            //
        }
    }
    return self;
}

@end
