//
//  UserModel.m
//  Example
//
//  Created by sunboshi on 2018/7/12.
//  Copyright © 2018年 sunobshi.tech. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"login" : @"login",
             @"Id" : @"id",
             @"node_id" : @"node_id",
             @"avatar_url" : @"avatar_url",
             @"gravatar_id" : @"gravatar_id",
             @"url" : @"url",
             @"html_url" : @"html_url",
             @"followers_url" : @"followers_url",
             @"following_url" : @"following_url",
             @"gists_url" : @"gists_url",
             @"starred_url" : @"starred_url",
             @"subscriptions_url" : @"subscriptions_url",
             @"organizations_url" : @"organizations_url",
             @"repos_url" : @"repos_url",
             @"events_url" : @"events_url",
             @"received_events_url" : @"received_events_url",
             @"type" : @"type",
             @"site_admin" : @"site_admin",
             @"name" : @"name",
             @"company" : @"company",
             @"blog" : @"blog",
             @"location" : @"location",
             @"email" : @"email",
             @"hireable" : @"hireable",
             @"bio" : @"bio",
             @"public_repos" : @"public_repos",
             @"public_gists" : @"public_gists",
             @"followers" : @"followers",
             @"following" : @"following",
             @"created_at" : @"created_at",
             @"updated_at" : @"updated_at"
             };
}

@end
