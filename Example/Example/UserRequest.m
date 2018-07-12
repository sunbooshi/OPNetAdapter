//
//  UserRequest.m
//  Example
//
//  Created by sunboshi on 2018/7/12.
//  Copyright © 2018年 sunobshi.tech. All rights reserved.
//

#import "UserRequest.h"
#import "GithubResponse.h"

@implementation UserRequest

- (void)prepareForRequest {
    NSAssert(self.username != nil, @"username cant be nil");
    self.domain = @"https://api.github.com";
    self.path = [NSString stringWithFormat:@"/users/%@", self.username];
}

- (OPDataResponse *)getResponseParser:(id)response {
     return [[GithubResponse alloc] initWithResponse:response dataModleClass:[UserModel class] responseType:OPDataResponseTypeDefault];
}

@end
