//
//  ViewController.m
//  Example
//
//  Created by sunboshi on 2018/7/5.
//  Copyright © 2018年 sunobshi.tech. All rights reserved.
//

#import "ViewController.h"
#import "UserRequest.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UserRequest *req = [[UserRequest alloc] init];
    req.username = @"octocat";
    __weak typeof(self) weakself = self;
    [req getWithSuccess:^(OPDataResponse *responseObject) {
        NSLog(@"%@", responseObject.data);
        UserModel *user = responseObject.data;
        dispatch_async(dispatch_get_main_queue(), ^{
            weakself.nameLabel.text = user.login;
        });
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
