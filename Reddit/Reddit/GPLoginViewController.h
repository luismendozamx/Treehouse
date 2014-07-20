//
//  GPLoginViewController.h
//  Reddit
//
//  Created by Luis Mendoza on 7/17/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GPLoginViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *usernameField;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;
- (IBAction)login:(id)sender;

@end
