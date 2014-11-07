//
//  GPInboxTableViewController.m
//  Reddit
//
//  Created by Luis Mendoza on 7/16/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import "GPInboxTableViewController.h"
#import "GPImageViewController.h"

@interface GPInboxTableViewController ()

@end

@implementation GPInboxTableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.moviePlayer = [[MPMoviePlayerController alloc] init];
    
    PFUser *currentUser = [PFUser currentUser];
    if(currentUser){
        NSLog(@"Current User Name: %@", currentUser.username);
        NSLog(@"Current User Email: %@", currentUser.email);
    }else{
        [self performSegueWithIdentifier:@"showLogin" sender:self];
    }
    
    /*PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    testObject[@"foo"] = @"bar";
    [testObject saveInBackground];*/
}


- (IBAction)logOut:(id)sender {
    PFUser *currentUser = [PFUser currentUser];
    if(currentUser){
        [PFUser logOut];
        [self performSegueWithIdentifier:@"showLogin" sender:self];
    }
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showLogin"]){
        [segue.destinationViewController setHidesBottomBarWhenPushed:YES];
    }
    if ([segue.identifier isEqualToString:@"showImage"]){
        [segue.destinationViewController setHidesBottomBarWhenPushed:YES];
        GPImageViewController *imageViewController = (GPImageViewController *) segue.destinationViewController;
        imageViewController.message = self.selectedMessage;
    }
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    PFUser *currentUser = [PFUser currentUser];
    
    if(currentUser){
        PFQuery *query = [PFQuery queryWithClassName:@"Message"];
        [query whereKey:@"recepientIds" equalTo:[[PFUser currentUser] objectId]];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (error){
                NSLog(@"Error: %@ %@", error, [error userInfo]);
            }else{
                self.messages = objects;
                [self.tableView reloadData];
            }
        }];
    }
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.messages.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    PFObject *message = [self.messages objectAtIndex:indexPath.row];
    cell.textLabel.text = [message objectForKey:@"senderName"];
    
    NSString *fileType = [message objectForKey:@"fileType"];
    if ([fileType isEqualToString:@"image"]){
        cell.imageView.image = [UIImage imageNamed:@"icon_image"];
    }else{
        cell.imageView.image = [UIImage imageNamed:@"icon_video"];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.selectedMessage = [self.messages objectAtIndex:indexPath.row];
    
    NSString *fileType = [self.selectedMessage objectForKey:@"fileType"];
    if ([fileType isEqualToString:@"image"]){
        [self performSegueWithIdentifier:@"showImage" sender:self];
    }else{
        PFFile *videoFile = [self.selectedMessage objectForKey:@"file"];
        NSURL *fileUrl = [NSURL URLWithString:videoFile.url];
        self.moviePlayer.contentURL = fileUrl;
        [self.moviePlayer prepareToPlay];
        [self.moviePlayer thumbnailImageAtTime:0 timeOption:MPMovieTimeOptionNearestKeyFrame];
        
        [self.view addSubview:self.moviePlayer.view];
        [self.moviePlayer setFullscreen:YES animated:YES];
    }
    
    //Delete
    NSMutableArray *recepientIds = [NSMutableArray arrayWithArray:[self.selectedMessage objectForKey:@"recepientIds"]];
    
    if([recepientIds count] == 1){
        //delete from backend
        [self.selectedMessage deleteInBackground];
    }else{
        //remove and save it
        [recepientIds removeObject:[[PFUser currentUser] objectId]];
        [self.selectedMessage saveInBackground];
    }
}

@end
