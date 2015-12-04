//
//  FoodList.h
//  PetPalV1
//
//  Created by Curtis Cox on 11/12/15.
//  Copyright (c) 2015 Curtis Cox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface FoodList : NSObject

@property(strong, nonatomic)NSMutableArray *myFoodList;

+(instancetype)defaultFoodList;
-(void)addFoodType:(PFObject*) newFood;

@end
