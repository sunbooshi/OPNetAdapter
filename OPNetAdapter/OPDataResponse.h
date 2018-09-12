//
//  OPDataResponse.h
//  OPNetAdapter
//
//  Created by sunboshi on 2018/7/5.
//  Copyright © 2018年 sunobshi.tech. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    OPDataResponseTypeDefault,
    OPDataResponseTypeList,
    OPDataResponseTypePage,
} OPDataResponseType;

@interface OPDataResponse : NSObject

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, copy)   NSString  *msg;
@property (nonatomic, strong) NSError   *error;
@property (nonatomic, strong) id data;
@property (nonatomic, strong) NSDictionary *extraData;

- (instancetype)initWithResponse:(id)response;
- (instancetype)initWithResponse:(id)response
                  dataModleClass:(Class)dataModelClass
                    responseType:(OPDataResponseType)responseType;

@end
