//
//  GPCrystallBall.m
//  CrystallBall
//
//  Created by Luis Mendoza on 5/25/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import "GPCrystallBall.h"

@implementation GPCrystallBall

- (NSArray*) predictions{
    if(_predictions == nil){
        _predictions = [[NSArray alloc] initWithObjects: @"Yes", @"No", @"Maybe", @"Perhaps", @"Defenitly no", @"Almost Certain", @"Trully not", @"Maybe later", nil];
    }
    return _predictions;
}

- (NSString*) randomPrediction{
    int random = arc4random_uniform([self.predictions count]);
    NSLog(@"%@", [self.predictions objectAtIndex:random]);
    return  [self.predictions objectAtIndex:random];
}

@end
