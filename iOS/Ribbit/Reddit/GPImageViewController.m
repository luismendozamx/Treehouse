//
//  GPImageViewController.m
//  Ribbit
//
//  Created by Luis Mendoza on 8/19/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import "GPImageViewController.h"

@interface GPImageViewController ()

@end

@implementation GPImageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    PFFile *imageFile = [self.message objectForKey:@"file"];
    NSURL *imageFileUrl = [[NSURL alloc] initWithString:imageFile.url];
    NSData *imageData = [NSData dataWithContentsOfURL:imageFileUrl];
    self.imageView.image = [UIImage imageWithData:imageData];
    
    NSString *senderName = [self.message objectForKey:@"senderName"];
    NSString *title = [NSString stringWithFormat:@"Sent from %@", senderName];
    
    self.navigationItem.title = title;
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    if([self respondsToSelector:@selector(timeout)]){
        [NSTimer scheduledTimerWithTimeInterval:6 target:self selector:@selector(timeout) userInfo:nil repeats:NO];
    }else{
        NSLog(@"Method missing");
    }
}

- (void)timeout{
    [self.navigationController popViewControllerAnimated:YES];
}



@end
