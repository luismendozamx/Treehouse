//
//  GPViewController.m
//  CrystallBall
//
//  Created by Luis Mendoza on 5/25/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import "GPViewController.h"
#import "GPCrystallBall.h"
#import <AudioToolbox/AudioToolbox.h>

@interface GPViewController (){
    SystemSoundID sound;
}

@end

@implementation GPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.ball = [[GPCrystallBall alloc] init];
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"crystal_ball" ofType:@"mp3"];
    NSURL *soundURL = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID(CFBridgingRetain(soundURL), &sound);
    
    self.backgroundImage.animationImages = [[NSArray alloc] initWithObjects:
                                            [UIImage imageNamed:@"CB00001"],
                                            [UIImage imageNamed:@"CB00002"],
                                            [UIImage imageNamed:@"CB00003"],
                                            [UIImage imageNamed:@"CB00004"],
                                            [UIImage imageNamed:@"CB00005"],
                                            [UIImage imageNamed:@"CB00006"],
                                            [UIImage imageNamed:@"CB00007"],
                                            [UIImage imageNamed:@"CB00008"],
                                            [UIImage imageNamed:@"CB00009"],
                                            [UIImage imageNamed:@"CB00010"],
                                            [UIImage imageNamed:@"CB00011"],
                                            [UIImage imageNamed:@"CB00012"],
                                            [UIImage imageNamed:@"CB00013"],
                                            [UIImage imageNamed:@"CB00014"],
                                            [UIImage imageNamed:@"CB00015"],
                                            [UIImage imageNamed:@"CB00016"],
                                            [UIImage imageNamed:@"CB00017"],
                                            [UIImage imageNamed:@"CB00018"],
                                            [UIImage imageNamed:@"CB00019"],
                                            [UIImage imageNamed:@"CB00020"],
                                            [UIImage imageNamed:@"CB00021"],
                                            [UIImage imageNamed:@"CB00022"],
                                            [UIImage imageNamed:@"CB00023"],
                                            [UIImage imageNamed:@"CB00024"],
                                            [UIImage imageNamed:@"CB00025"],
                                            [UIImage imageNamed:@"CB00026"],
                                            [UIImage imageNamed:@"CB00027"],
                                            [UIImage imageNamed:@"CB00028"],
                                            [UIImage imageNamed:@"CB00029"],
                                            [UIImage imageNamed:@"CB00030"],
                                            [UIImage imageNamed:@"CB00031"],
                                            [UIImage imageNamed:@"CB00032"],
                                            [UIImage imageNamed:@"CB00033"],
                                            [UIImage imageNamed:@"CB00034"],
                                            [UIImage imageNamed:@"CB00035"],
                                            [UIImage imageNamed:@"CB00036"],
                                            [UIImage imageNamed:@"CB00037"],
                                            [UIImage imageNamed:@"CB00038"],
                                            [UIImage imageNamed:@"CB00039"],
                                            [UIImage imageNamed:@"CB00040"],
                                            [UIImage imageNamed:@"CB00041"],
                                            [UIImage imageNamed:@"CB00042"],
                                            [UIImage imageNamed:@"CB00043"],
                                            [UIImage imageNamed:@"CB00044"],
                                            [UIImage imageNamed:@"CB00045"],
                                            [UIImage imageNamed:@"CB00046"],
                                            [UIImage imageNamed:@"CB00047"],
                                            [UIImage imageNamed:@"CB00048"],
                                            [UIImage imageNamed:@"CB00049"],
                                            [UIImage imageNamed:@"CB00050"],
                                            [UIImage imageNamed:@"CB00051"],
                                            [UIImage imageNamed:@"CB00052"],
                                            [UIImage imageNamed:@"CB00053"],
                                            [UIImage imageNamed:@"CB00054"],
                                            [UIImage imageNamed:@"CB00055"],
                                            [UIImage imageNamed:@"CB00056"],
                                            [UIImage imageNamed:@"CB00057"],
                                            [UIImage imageNamed:@"CB00058"],
                                            [UIImage imageNamed:@"CB00059"],
                                            [UIImage imageNamed:@"CB00060"],nil];
    self.backgroundImage.animationDuration = 1.5f;
    self.backgroundImage.animationRepeatCount = 1;
    
    /*
    UIImage *img = [UIImage imageNamed:@"background"];
    UIImageView *backgroundView = [[UIImageView alloc] initWithImage:img];
    [self.view insertSubview:backgroundView atIndex:0]; */
    
    /*self.color = [[NSArray alloc] initWithObjects:[UIColor redColor], [UIColor greenColor], [UIColor blueColor], [UIColor purpleColor], [UIColor grayColor], nil]; */
}

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) makePrediction{
    self.prdLabel.text = nil;
    self.prdLabel.alpha = 0;
    self.prdLabel.text = [self.ball randomPrediction];
    [self.backgroundImage startAnimating];
    AudioServicesPlaySystemSound(sound);
    [UIView animateWithDuration:3.5 animations:^{
        self.prdLabel.alpha = 1.0;
    }];

}

-(void) animationDidStart:(CAAnimation *)anim{
    NSLog(@"Animation Started");
}

- (IBAction)buttonPressed {
    [self makePrediction];
    
    //int random2 = arc4random_uniform([self.color count]);
    //self.prdLabel.textColor = [self.color objectAtIndex:random2];
}

- (void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    NSLog(@"Motion Began");
    self.prdLabel.text = nil;
}

- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    if(motion == UIEventSubtypeMotionShake){
        [self makePrediction];
    }
}

- (void) motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    NSLog(@"Motion Cancelled");
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    self.prdLabel.text = nil;
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self makePrediction];
}


@end
