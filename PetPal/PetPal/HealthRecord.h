//
//  HealthRecord.h
//  PetPal
//
//  Created by Curtis Cox on 12/6/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HealthRecord : NSObject
@property (strong, nonatomic) NSString *petName, *vaccineName, *recordType;
@property (strong, nonatomic) NSDate *dateAdministered;

-(instancetype)initWithPetName:(NSString*)pet vaccineName:(NSString*)vaccine type:(NSString*)theType andDate:(NSDate*)date;

@end
