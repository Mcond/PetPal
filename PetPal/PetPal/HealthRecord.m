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
