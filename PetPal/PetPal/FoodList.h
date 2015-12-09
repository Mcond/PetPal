//  PROGRAMMER:     Curtis Cox
//  PANTHERID:      5001361
//  GROUP:          F
//  CLASS:          COP 465501 TR 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Group Project
//  DUE:            Thursday 12/10/15
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
-(void)addFoodType:(FoodType *)newFood atIndex:(NSInteger) index;
-(void) removeFood: (FoodType *) deleteFood;
-(BOOL) saveChanges;

@end
