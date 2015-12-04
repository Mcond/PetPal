//
//  FoodList.m
//  PetPalV1
//
//  Created by Curtis Cox on 11/12/15.
//  Copyright (c) 2015 Curtis Cox. All rights reserved.
//

#import "FoodList.h"
#import <Parse/Parse.h>

@implementation FoodList

@synthesize myFoodList;

+(instancetype)defaultFoodList
{
    static FoodList *defaultFoodList = nil;
    
    if (!defaultFoodList) {
        defaultFoodList = [[FoodList alloc]init];
    }
    return defaultFoodList;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        myFoodList = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)addFoodType:(PFObject*) newFood
{
    [myFoodList insertObject:newFood atIndex:0];
    NSString *title = [[NSString alloc] initWithFormat:
                       @"My Food"];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:@"Food saved to database."
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}
@end
