//
//  GPCrystallBall.h
//  CrystallBall
//
//  Created by Luis Mendoza on 5/25/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GPCrystallBall : NSObject

@property (strong, nonatomic) NSArray *predictions;

- (NSString*) randomPrediction;

@end
