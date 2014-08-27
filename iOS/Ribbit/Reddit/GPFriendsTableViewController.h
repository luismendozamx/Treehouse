//
//  GPFriendsTableViewController.h
//  Reddit
//
//  Created by Luis Mendoza on 8/2/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface GPFriendsTableViewController : UITableViewController

@property (strong, nonatomic) PFRelation *friendsRelation;
@property (strong, nonatomic) NSArray *friends;

@end
