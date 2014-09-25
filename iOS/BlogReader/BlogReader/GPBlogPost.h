//
//  GPBlogPost.h
//  BlogReader
//
//  Created by Luis Mendoza on 5/27/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GPBlogPost : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *author;
@property (strong, nonatomic) NSString *thumbnail;
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSURL *url;

- (id) initWithTitle: (NSString *) title;
+ (id) blogPostWithTitle: (NSString *) title;
- (NSURL *) thumbnailURL;
- (NSString *) formattedDate;

@end
