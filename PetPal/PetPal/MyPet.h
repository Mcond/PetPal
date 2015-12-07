//
//  MyPet.h
//  PetPal
//
//  Created by Ekaterina Gumnova on 12/1/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>


@interface MyPet : NSManagedObject

@property (nonatomic, retain) NSDate * birthDate;
@property (nonatomic, retain) NSString * breed;
@property (nonatomic)float consumedCalories;
@property (nonatomic, retain) NSDate * updateDate;
@property (nonatomic, retain) NSString * name;
@property (nonatomic) float remainingCalories;
@property (nonatomic) float targetCalories;
@property (nonatomic) float weight;
@property (nonatomic) BOOL neutered;
@property (nonatomic) BOOL needToLooseWeight;
@property (nonatomic) BOOL obeseProne;
@property (nonatomic, retain) NSString * petType;
@property (nonatomic, retain) UIImage *image;

-(float) calculateTargetCalories;


@end
