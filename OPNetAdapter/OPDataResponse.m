//
//  OPDataResponse.m
//  OPNetAdapter
//
//  Created by sunboshi on 2018/7/5.
//  Copyright © 2018年 sunobshi.tech. All rights reserved.
//

#import "OPDataResponse.h"

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
                // TODO: Write your own parser. 这里需要根据自己服务端的数据进行处理
                if (OPDataResponseTypeDefault == responseType) {
                    self.data = response;
                }
                else if (OPDataResponseTypeList == responseType) {
                    self.data = response;
                }
                else if (OPDataResponseTypePage == responseType) {
                    self.data = response;
                }
                self.error = error;
            }
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

- (NSString *)description {
    NSMutableString *desc = [NSMutableString stringWithFormat:@"-------- %@ --------\n", NSStringFromClass([self class])];
    [desc appendFormat:@"code: %ld\n", self.code];
    [desc appendFormat:@"msg : %@\n", self.msg.length == 0 ? @"" : self.msg];
    [desc appendFormat:@"err : %@\n", self.error == nil ? @"" : self.error];
    [desc appendFormat:@"data: %@\n", self.data == nil ? @"" : self.data];
    [desc appendString:@"--------------------\n"];
    return desc;
}

- (NSString *)debugDescription {
    return [self description];
}

@end
