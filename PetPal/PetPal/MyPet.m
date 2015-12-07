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
@dynamic image;


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
-(float) calculateTargetCalories
{
    float weightKg, rer, der;//weigh in kg; Resting Energy Requirement; Daily Energy Requirement
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier: NSCalendarIdentifierGregorian];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setYear: 1];
    NSDate *checkDate = [gregorian dateByAddingComponents: offsetComponents toDate: self.birthDate options:0];
    weightKg = self.weight * 0.453592;
    rer = 70 * weightKg;
    //Feline
    if ([self.petType isEqualToString: @"CAT"])
    {
        if ([checkDate compare:[NSDate date]] == NSOrderedDescending)//Growing kittens
            
        {
            der = 2.5 * rer;
            
        }
        else//Adult cats
        {
            if (self.obeseProne)
            {
                der = rer;
            }
            else if (self.needToLooseWeight)
            {
                der = 0.8 * rer;
            }
            else if (self.neutered)
            {
                der = 1.2 * rer;
            }
            else
            {
                der = 1.4 * rer;
            }
            
        }
        
        
    }
    //Canine
    else
    {
        if ([checkDate compare:[NSDate date]] == NSOrderedDescending)
        {
            NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
            [offsetComponents setMonth:4];
            checkDate = [gregorian dateByAddingComponents: offsetComponents toDate: self.birthDate options:0];
            NSLog(@"%@", checkDate);
            if([checkDate compare:[NSDate date]] == NSOrderedDescending)//up to 4 months
            {
                der = 3 * rer;
            }
            else//4 months & older
            {
                der = 2 * rer;
            }
            
        }
        else//Adult dogs
        {
            if (self.obeseProne)
            {
                der = 1.4 * rer;
            }
            else if (self.needToLooseWeight)
            {
                der = rer;
            }
            else if (self.neutered)
            {
                der = 1.6 * rer;
            }
            else
            {
                der = 1.8 * rer;
            }
            
        }
        
        
    }
    
    NSLog(@"%@", checkDate);
    return der;
    
    
}




@end
