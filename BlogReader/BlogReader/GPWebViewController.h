//
//  GPWebViewController.h
//  BlogReader
//
//  Created by Luis Mendoza on 7/16/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GPWebViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) NSURL *blogPostUrl;

@end
