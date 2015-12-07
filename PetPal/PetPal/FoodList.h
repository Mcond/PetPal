//
//  FoodList.h
//  PetPalV1
//
//  Created by Curtis Cox on 11/12/15.
//  Copyright (c) 2015 Curtis Cox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@class FoodType;

@interface FoodList : NSObject

@property(strong, nonatomic)NSMutableArray *myFoodList;
@property (nonatomic, strong) NSManagedObjectContext *context;
@property (nonatomic, strong) NSManagedObjectModel *model;


+(instancetype)defaultFoodList;
-(void)addFoodType:(FoodType*) newFood;
-(BOOL) saveChanges;

@end
