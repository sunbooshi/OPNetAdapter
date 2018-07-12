//
//  UserModel.h
//  Example
//
//  Created by sunboshi on 2018/7/12.
//  Copyright © 2018年 sunobshi.tech. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface UserModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy) NSString *login;
@property (nonatomic, strong) NSNumber *Id;
@property (nonatomic, copy) NSString *node_id;
@property (nonatomic, copy) NSString *avatar_url;
@property (nonatomic, copy) NSString *gravatar_id;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *html_url;
@property (nonatomic, copy) NSString *followers_url;
@property (nonatomic, copy) NSString *following_url;
@property (nonatomic, copy) NSString *gists_url;
@property (nonatomic, copy) NSString *starred_url;
@property (nonatomic, copy) NSString *subscriptions_url;
@property (nonatomic, copy) NSString *organizations_url;
@property (nonatomic, copy) NSString *repos_url;
@property (nonatomic, copy) NSString *events_url;
@property (nonatomic, copy) NSString *received_events_url;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, assign) BOOL site_admin;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *company;
@property (nonatomic, copy) NSString *blog;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *hireable;
@property (nonatomic, copy) NSString *bio;
@property (nonatomic, strong) NSNumber *public_repos;
@property (nonatomic, strong) NSNumber *public_gists;
@property (nonatomic, strong) NSNumber *followers;
@property (nonatomic, strong) NSNumber *following;
@property (nonatomic, copy) NSString *created_at;
@property (nonatomic, copy) NSString *updated_at;

@end
