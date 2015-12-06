//
//  FoodType.m
//  PetPalV1
//
//  Created by Curtis Cox on 11/12/15.
//  Copyright (c) 2015 Curtis Cox. All rights reserved.
//

#import "FoodType.h"

@implementation FoodType

@synthesize servingSize, servingUnit, calPerServig, foodName;

-(void) encodeWithCoder:(NSCoder *) encoder
{
    [encoder encodeObject: foodName forKey: @"foodName"];
    [encoder encodeObject: servingUnit forKey:@"servUnit"];
    [encoder encodeObject: servingSize forKey:@"servSize"];
    [encoder encodeObject: calPerServig forKey: @"calPerServ"];
}

-(id) initWithCoder:(NSCoder *) decoder
{
    foodName = [decoder decodeObjectForKey: @"foodName"];
    servingUnit = [decoder decodeObjectForKey: @"servUnit"];
    servingSize = [decoder decodeObjectForKey: @"servSize"];
    calPerServig = [decoder decodeObjectForKey: @"calPerServ"];
    
    return self;
}

@end
