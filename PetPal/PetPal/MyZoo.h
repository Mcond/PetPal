//
//  MyZoo.h
//  PetPal
//
//  Created by Ekaterina Gumnova on 12/1/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyPet.h"

@interface MyZoo : NSObject

@property (nonatomic, copy) NSMutableArray *myPets;
@property (nonatomic, strong) NSManagedObjectContext *context;
@property (nonatomic, strong) NSManagedObjectModel *model;

+(instancetype) sharedZoo;
-(MyPet *) addPetWithName: (NSString *) theName breed: (NSString *) theBreed birthDate: (NSDate *) theBirthDate weight: (NSNumber *) theWeight andTargetCalories: (NSNumber *) targetCalories;
-(void) removePet: (MyPet *) aPet;
-(NSString *) archivePath;
-(BOOL) saveChanges;

@end
