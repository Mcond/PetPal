//  PROGRAMMER:     Curtis Cox
//  PANTHERID:      5001361
//  GROUP:          F
//  CLASS:          COP 465501 TR 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Group Project
//  DUE:            Thursday 12/10/15
//
//  FoodList.m
//  PetPalV1
//
//  Created by Curtis Cox on 11/12/15.
//  Copyright (c) 2015 Curtis Cox. All rights reserved.
//

#import "FoodList.h"
#import "FoodType.h"
#import <UIKit/UIKit.h>

@implementation FoodList

@synthesize myFoodList;

+(instancetype)defaultFoodList
{
    static FoodList *defaultFoodList = nil;
    
    if (!defaultFoodList) {
        defaultFoodList = [[FoodList alloc]initPrivate];
    }
    return defaultFoodList;
}

- (instancetype)init
{
    [NSException raise: @"Singleton" format: @"use + [FoodList defaultFoodList]"];
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
        [self loadMyFood];
    }
    return self;
}

-(void)addFoodType:(FoodType *)newFood atIndex:(NSInteger) index
{
    FoodType *contextNewFood = [NSEntityDescription insertNewObjectForEntityForName:@"FoodType" inManagedObjectContext:self.context];
    contextNewFood.foodName = newFood.foodName;
    contextNewFood.calPerServig = newFood.calPerServig;
    contextNewFood.servingSize = newFood.servingSize;
    contextNewFood.servingUnit = newFood.servingUnit;
    [myFoodList insertObject:contextNewFood atIndex:index];
    [self saveChanges];
}

-(void)addFoodType:(FoodType*) newFood
{
    FoodType *contextNewFood = [NSEntityDescription insertNewObjectForEntityForName:@"FoodType" inManagedObjectContext:self.context];
    contextNewFood.foodName = newFood.foodName;
    contextNewFood.calPerServig = newFood.calPerServig;
    contextNewFood.servingSize = newFood.servingSize;
    contextNewFood.servingUnit = newFood.servingUnit;
    [myFoodList insertObject:contextNewFood atIndex:0];
    NSString *title = [[NSString alloc] initWithFormat:
                       @"My Food"];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:@"Food saved to database."
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    [self saveChanges];
}

-(void) removeFood: (FoodType *) deleteFood
{
    NSManagedObject *tobeDeleted = [self.myFoodList objectAtIndex:[self.myFoodList indexOfObjectIdenticalTo:deleteFood]];
    [self.myFoodList removeObjectIdenticalTo: deleteFood];
    [self.context deleteObject:tobeDeleted];
    [self saveChanges];
    
}

//return path that will be used to save data
-(NSString *) archivePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories firstObject];
    return [documentDirectory stringByAppendingPathComponent: @"store.data"];
}

//fetch all of the Pet instances in zoo.data
-(void) loadMyFood
{
    if (!self.myFoodList)
    {
        
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        NSEntityDescription *e = [NSEntityDescription entityForName: @"FoodType" inManagedObjectContext:self.context];
        request.entity = e;
        NSSortDescriptor *sd = [NSSortDescriptor sortDescriptorWithKey:@"foodName" ascending: YES];
        request.sortDescriptors = @[sd];
        NSError *error;
        NSArray *result = [self.context executeFetchRequest: request error: &error];
        if (!result)
        {
            [NSException raise: @"Fetch failed" format: @"Reason: %@", [error description]];
        }
        
        self.myFoodList = [[NSMutableArray alloc] initWithArray: result];
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

@end
