//
//  GPEditFriendsTableViewController.h
//  Reddit
//
//  Created by Luis Mendoza on 8/2/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface GPEditFriendsTableViewController : UITableViewController
@property (nonatomic, strong) NSArray *allUsers;
@property (nonatomic, strong) PFUser *currentUser;
@property (nonatomic, strong) NSMutableArray *friends;

-(BOOL) isFriend:(PFUser *)user;

@end
