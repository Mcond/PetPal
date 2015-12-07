//
//  MyZoo.m
//  PetPal
//
//  Created by Ekaterina Gumnova on 12/1/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import "MyZoo.h"

@implementation MyZoo

@synthesize myPets;

+(instancetype) sharedZoo
{
    static MyZoo *sharedZoo;
    if (!sharedZoo)
    {
        sharedZoo = [[self alloc] initPrivate];
    }
    return sharedZoo;
    
}

-(instancetype) init
{
    [NSException raise: @"Singleton" format: @"use + [MyZoo sharedZoo]"];
    return nil;
}

-(instancetype) initPrivate
{
    self = [super init];
    if (self)
    {
        //read in PetInfo.xcdatamodeld
        _model = [NSManagedObjectModel mergedModelFromBundles: nil];
        NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: _model];
        //get the path to the SQLite file
        NSString *path = self.archivePath;
        NSURL *storeURL = [NSURL fileURLWithPath: path];
        NSError *error;
        if (![psc addPersistentStoreWithType: NSSQLiteStoreType configuration: nil URL: storeURL options: nil error: &error])
        {
            [NSException raise: @"Open Failure" format: @"%@", [error description]];
        }
        //create the managed object context
        _context = [[NSManagedObjectContext alloc] init];
        _context.persistentStoreCoordinator = psc;
        [self loadAllPets];
    }
    return self;
}

-(MyPet *) addPetWithName: (NSString *) theName birthDate: (NSDate *) theBirthDate weight: (float) theWeight breed: (NSString *) theBreed type: (NSString*) theType looseWeight: (BOOL) looseWeight obeseProne: (BOOL) obeseProne andNeutered: (BOOL) neutered
{
    MyPet *aPet = [NSEntityDescription insertNewObjectForEntityForName: @"MyPet" inManagedObjectContext: self.context];
    aPet.name = theName;
    aPet.birthDate = theBirthDate;
    aPet.weight = theWeight;
    aPet.breed = theBreed;
    aPet.petType = theType;
    aPet.needToLooseWeight = looseWeight;
    aPet.obeseProne = obeseProne;
    aPet.neutered = neutered;

    [self.myPets addObject: aPet];
    return aPet;

}

-(void) removePet: (MyPet *) aPet
{
    [self.myPets removeObjectIdenticalTo: aPet];
    [self.context deleteObject: aPet];
    
}

//return path that will be used to save data
-(NSString *) archivePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories firstObject];
    return [documentDirectory stringByAppendingPathComponent: @"store.data"];
}

//fetch all of the Pet instances in zoo.data
-(void) loadAllPets
{
    if (!self.myPets)
    {
        
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        NSEntityDescription *e = [NSEntityDescription entityForName: @"MyPet" inManagedObjectContext:self.context];
        request.entity = e;
        NSSortDescriptor *sd = [NSSortDescriptor sortDescriptorWithKey: @"name" ascending: YES selector:@selector(caseInsensitiveCompare:)];
        request.sortDescriptors = @[sd];
        NSError *error;
        NSArray *result = [self.context executeFetchRequest: request error: &error];
        if (!result)
        {
            [NSException raise: @"Fetch failed" format: @"Reason: %@", [error description]];
        }
        
        self.myPets = [[NSMutableArray alloc] initWithArray: result];
    }
}

-(BOOL) saveChanges
{
    NSError *error;
    BOOL successful = [self.context save: &error];
    if (!successful)
        NSLog(@"Error saving: %@", [error description]);
    return successful;
}

-(NSInteger) allPets
{
    return [myPets count];
}




@end
