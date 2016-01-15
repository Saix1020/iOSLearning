//
//  LoginVC.m
//  MyWorxTasks
//
//  Created by saix on 16/1/14.
//  Copyright © 2016年 citrix. All rights reserved.
//

#import "LoginVC.h"
#import "AppDelegate.h"
#import "TaskListVC.h"
#import "MBProgressHUD.h"
#import "UIButton+LLBootstrap.h"

@interface LoginVC ()
@property (strong, nonatomic) UINavigationController* messageNavigationController;

@end


@implementation LoginVC


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *lockImage = [[UIImage imageNamed:@"ic_lock_36pt"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIImage *userImage = [[UIImage imageNamed:@"ic_person_36pt"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.passwordImage setImage:lockImage];
    [self.userImage setImage:userImage];
    
    self.passwordField.keyboardType = UIKeyboardTypeASCIICapable;
    self.passwordField.secureTextEntry = YES;
    
    [self.loginButton bs_configureAsPrimaryStyle];
    //self.loginButton.enabled = NO;
    
//    self.refreshControl = [[UIRefreshControl alloc] init];
//    [self.refreshControl addTarget:self action:nil forControlEvents:nil];
    
}
- (IBAction)login:(id)sender
{
    // simulate login...
    [self.view endEditing:YES];
    
    MBProgressHUD *hud = [[MBProgressHUD alloc] init];
    
    [hud setLabelText:NSLocalizedString(@"Please Wait", nil)];
    [hud setDetailsLabelText:NSLocalizedString(@"My WorxTasks is login ....", nil)];
    [self.view.window addSubview:hud];
    [hud show:YES];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       [NSThread sleepForTimeInterval:2];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view.window animated:YES];
            AppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
            [self presentViewController:appDelegate.tabBarController animated:YES completion:nil];
        });
    });
}

@end
