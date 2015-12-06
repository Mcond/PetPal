//
//  MyPet.m
//  PetPal
//
//  Created by Ekaterina Gumnova on 12/1/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import "MyPet.h"


@implementation MyPet

@dynamic birthDate;
@dynamic breed;
@dynamic consumedCalories;
@dynamic updateDate;
@dynamic name;
@dynamic remainingCalories;
@dynamic targetCalories;
@dynamic weight;
@dynamic neutered;
@dynamic needToLooseWeight;
@dynamic obeseProne;
@dynamic petType;


//initialize the date updated to the date object is created
//consumedCalories & remaining calories are set to 0
-(void) awakeFromInsert
{
    [super awakeFromInsert];
    //temporarilyt set to 0.0
    self.targetCalories = 0.0;
    self.updateDate = [NSDate date];
    self.consumedCalories = 0.0;
    self.remainingCalories = 0.0;
}



@end
