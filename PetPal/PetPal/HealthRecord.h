//  PROGRAMMER:     Curtis Cox
//  PANTHERID:      5001361
//  GROUP:          F
//  CLASS:          COP 465501 TR 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Group Project
//  DUE:            Thursday 12/10/15
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
