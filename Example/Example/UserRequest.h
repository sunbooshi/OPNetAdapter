//
//  UserRequest.h
//  Example
//
//  Created by sunboshi on 2018/7/12.
//  Copyright © 2018年 sunobshi.tech. All rights reserved.
//

#import "OPDataRequest.h"
#import "UserModel.h"

@interface UserRequest : OPDataRequest

@property (nonatomic, copy) NSString *username;

@end
