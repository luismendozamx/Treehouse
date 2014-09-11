//
//  GPTableViewController.m
//  BlogReader
//
//  Created by Luis Mendoza on 5/26/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import "GPTableViewController.h"
#import "GPBlogPost.h"
#import "GPWebViewController.h"

@interface GPTableViewController ()

@end

@implementation GPTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //NSURL *blogUrl = [NSURL URLWithString:@"http://blog.teamtreehouse.com/api/get_recent_summary/"];
    NSURL *blogUrl = [NSURL URLWithString:@"http://blog.elsupuesto.com/api/get_recent_posts/?count=20"];
    
    NSData *json = [NSData dataWithContentsOfURL:blogUrl];
    
    NSError *error = nil;
    
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:json options:0 error:&error];
    
    //self.blogPosts = [jsonDictionary objectForKey:@"posts"];
    
    self.blogPosts = [NSMutableArray array];
    NSArray *blogPostArray = [jsonDictionary objectForKey:@"posts"]; //All blog posts
    
    for (NSDictionary *bpDictionary in blogPostArray) {
        GPBlogPost *blogPost = [GPBlogPost blogPostWithTitle:[bpDictionary objectForKey:@"title"]];
        blogPost.author = [[bpDictionary objectForKey:@"author"] objectForKey:@"name"];
        //blogPost.thumbnail = [bpDictionary objectForKey:@"thumbnail"];
        blogPost.date = [bpDictionary objectForKey:@"date"];
        blogPost.url = [NSURL URLWithString:[bpDictionary objectForKey:@"url"]];
        [self.blogPosts addObject:blogPost];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return self.blogPosts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    GPBlogPost *blogPost =[self.blogPosts objectAtIndex:indexPath.row];
    //NSLog(@"%@", authorDictionary);
    
    if ([blogPost.thumbnail isKindOfClass:[NSString class]]){
        NSData *imageData = [NSData dataWithContentsOfURL:blogPost.thumbnailURL];
        UIImage *image = [UIImage imageWithData:imageData];
        cell.imageView.image = image;
    }else{
        
    }
    
    cell.textLabel.text = blogPost.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"By %@, on %@", blogPost.author, [blogPost formattedDate]];
    
    return cell;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"showBlogPost"]){
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        GPBlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
        [segue.destinationViewController setBlogPostUrl: blogPost.url];
        
    }else{
        NSLog(@"NO");
    }
}

/*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Obtener el url del arreglo en el table view y luego con el objecto singleton (único) abrir en safari.
    GPBlogPost *blogPost =[self.blogPosts objectAtIndex:indexPath.row];
    UIApplication *application = [UIApplication sharedApplication];
    [application openURL:blogPost.url];
}*/

@end