//  PROGRAMMER:     Curtis Cox
//  PANTHERID:      5001361
//  GROUP:          F
//  CLASS:          COP 465501 TR 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Group Project
//  DUE:            Thursday 12/10/15
//
//  HealthLog.m
//  PetPal
//
//  Created by Curtis Cox on 12/6/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import "HealthLog.h"
#import "HealthRecord.h"


@implementation HealthLog
@synthesize myLog;


+(instancetype)defaultHealthLog
{
    static HealthLog *defaultLog = nil;
    
    if (!defaultLog) {
        defaultLog = [[HealthLog alloc]initPrivate];
    }
    return defaultLog;
}

- (instancetype)init
{
    [NSException raise: @"Singleton" format: @"use + [HealthLog defaultHealthLog]"];
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
        [self loadMyHealthLog];
    }
    return self;
}


-(void)addMyLogObject:(HealthRecord *) theRecord
{
    HealthRecord *contextNewHealthRecord = [NSEntityDescription insertNewObjectForEntityForName:@"VaccineRecord" inManagedObjectContext:self.context];
    contextNewHealthRecord.petName = theRecord.petName;
    contextNewHealthRecord.vaccineName = theRecord.vaccineName;
    contextNewHealthRecord.recordType = theRecord.recordType;
    contextNewHealthRecord.dateAdministered = theRecord.dateAdministered;
    [myLog insertObject:contextNewHealthRecord atIndex:0];
    [self saveChanges];
}

-(void) removeRecord: (HealthRecord *) deleteRecord
{
    NSManagedObject *tobeDeleted = [self.myLog objectAtIndex:[self.myLog indexOfObjectIdenticalTo:deleteRecord]];
    [self.myLog removeObjectIdenticalTo: deleteRecord];
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
-(void) loadMyHealthLog
{
    if (!self.myLog)
    {
        
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        NSEntityDescription *e = [NSEntityDescription entityForName: @"VaccineRecord" inManagedObjectContext:self.context];
        request.entity = e;
        NSSortDescriptor *sd = [NSSortDescriptor sortDescriptorWithKey:@"dateAdministered" ascending: NO];
        request.sortDescriptors = @[sd];
        NSError *error;
        NSArray *result = [self.context executeFetchRequest: request error: &error];
        if (!result)
        {
            [NSException raise: @"Fetch failed" format: @"Reason: %@", [error description]];
        }
        
        self.myLog = [[NSMutableArray alloc] initWithArray: result];
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
