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

//initialize the date updated to the date object is created
//consumedCalories & remaining calories are set to 0
-(void) awakeFromInsert
{
    [super awakeFromInsert];
    self.updateDate = [NSDate date];
    self.consumedCalories = [NSNumber numberWithFloat: 0.0];
    self.remainingCalories =[NSNumber numberWithFloat: 0.0];
}



@end
