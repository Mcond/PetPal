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

@property (nonatomic) NSMutableArray *myPets;
@property (nonatomic, strong) NSManagedObjectContext *context;
@property (nonatomic, strong) NSManagedObjectModel *model;

+(instancetype) sharedZoo;
-(MyPet *) addPetWithName: (NSString *) theName birthDate: (NSDate *) theBirthDate weight: (float) theWeight breed: (NSString *) theBreed type: (NSString*) theType looseWeight: (BOOL) looseWeight obeseProne: (BOOL) obeseProne andNeutered: (BOOL) neutered;

-(void) removePet: (MyPet *) aPet;
-(NSString *) archivePath;
-(BOOL) saveChanges;
-(NSInteger) allPets;

@end