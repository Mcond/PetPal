//  PROGRAMMER:     Curtis Cox
//  PANTHERID:      5001361
//  GROUP:          F
//  CLASS:          COP 465501 TR 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Group Project
//  DUE:            Thursday 12/10/15
//
//  HealthRecord.m
//  PetPal
//
//  Created by Curtis Cox on 12/6/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import "HealthRecord.h"

@implementation HealthRecord
@synthesize petName, vaccineName, recordType, dateAdministered;

//Create a HealthRecord object 
-(instancetype)initWithPetName:(NSString*)pet vaccineName:(NSString*)vaccine type:(NSString*)theType andDate:(NSDate*)date
{
    self = [super init];
    petName = [[NSString alloc]initWithString:pet];
    vaccineName = [[NSString alloc]initWithString:vaccine];
    recordType = [[NSString alloc]initWithString:theType];
    dateAdministered = [[NSDate alloc]init];
    dateAdministered = date;
    
    return self;
}


@end
