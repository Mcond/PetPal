//
//  MyPet.h
//  PetPal
//
//  Created by Ekaterina Gumnova on 12/1/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MyPet : NSManagedObject

@property (nonatomic, retain) NSDate * birthDate;
@property (nonatomic, retain) NSString * breed;
@property (nonatomic, retain) NSNumber * consumedCalories;
@property (nonatomic, retain) NSDate * updateDate;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * remainingCalories;
@property (nonatomic, retain) NSNumber * targetCalories;
@property (nonatomic, retain) NSNumber * weight;

@end
