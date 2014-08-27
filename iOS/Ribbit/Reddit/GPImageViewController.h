//
//  GPImageViewController.h
//  Ribbit
//
//  Created by Luis Mendoza on 8/19/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface GPImageViewController : UIViewController

@property (nonatomic, strong) PFObject *message;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end
