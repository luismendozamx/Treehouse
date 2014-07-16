//
//  GPViewController.h
//  CrystallBall
//
//  Created by Luis Mendoza on 5/25/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GPCrystallBall;

@interface GPViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *prdLabel;
@property (strong, nonatomic) GPCrystallBall *ball;
@property (strong, nonatomic) NSArray *color;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;


- (IBAction)buttonPressed;
- (void) makePrediction;

@end
