//
//  GPSignUpViewController.h
//  Reddit
//
//  Created by Luis Mendoza on 7/17/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GPSignUpViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *userNameField;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;
@property (strong, nonatomic) IBOutlet UITextField *emailField;

- (IBAction)signUpButton:(id)sender;


@end
