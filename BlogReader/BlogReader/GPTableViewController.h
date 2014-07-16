//
//  GPTableViewController.h
//  BlogReader
//
//  Created by Luis Mendoza on 5/26/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPBlogPost.h"

@interface GPTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *blogPosts;
@property (nonatomic, strong) GPBlogPost *post;

@end
