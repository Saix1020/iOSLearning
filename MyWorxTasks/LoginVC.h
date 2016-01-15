//
//  LoginVC.h
//  MyWorxTasks
//
//  Created by saix on 16/1/14.
//  Copyright © 2016年 citrix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginVC : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UIImageView *passwordImage;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UITextField *userField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end
