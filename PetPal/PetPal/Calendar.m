//
//  Calendar.m
//  PetPal
//
//  Created by Ekaterina Gumnova on 12/8/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import "Calendar.h"

@implementation Calendar
@synthesize myReminders;

+(instancetype) sharedCalendar
{
    static Calendar *sharedCalendar;
    if (!sharedCalendar)
    {
        sharedCalendar = [[self alloc] initPrivate];
    }
    return sharedCalendar;
    
}

-(instancetype) init
{
    [NSException raise: @"Singleton" format: @"use + [Calendar sharedCalendar]"];
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
        [self loadAllReminders];
    }
    return self;
}

//fetch all of the Reminder instances in source.data
-(void) loadAllReminders
{
    if (!self.myReminders)
    {
        
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        NSEntityDescription *e = [NSEntityDescription entityForName: @"Reminder" inManagedObjectContext:self.context];
        request.entity = e;
        NSSortDescriptor *sd = [NSSortDescriptor sortDescriptorWithKey: @"reminderDate" ascending: YES selector:@selector(compare:)];
        request.sortDescriptors = @[sd];
        NSError *error;
        NSArray *result = [self.context executeFetchRequest: request error: &error];
        if (!result)
        {
            [NSException raise: @"Fetch failed" format: @"Reason: %@", [error description]];
        }
        
        self.myReminders = [[NSMutableArray alloc] initWithArray: result];
    }
}


//return path that will be used to save data
-(NSString *) archivePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories firstObject];
    return [documentDirectory stringByAppendingPathComponent: @"store.data"];
}


-(BOOL) saveChanges
{
    NSError *error;
    BOOL successful = [self.context save: &error];
    if (!successful)
        NSLog(@"Error saving: %@", [error description]);
    return successful;
}

-(NSInteger) allReminders
{
    return [myReminders count];
}

-(Reminder *) addReminderWithTitle: (NSString *) theTitle description: (NSString *) theDescription andDate: (NSDate *) theDate
{
    Reminder *newReminder = [NSEntityDescription insertNewObjectForEntityForName: @"Reminder" inManagedObjectContext: self.context];
    newReminder.title = theTitle;
    newReminder.details = theDescription;
    newReminder.reminderDate = theDate;
    [self.myReminders addObject: newReminder];
    return newReminder;
    
}

-(void) deleteReminder: (Reminder *) aReminder
{
    [self.myReminders removeObjectIdenticalTo: aReminder];
    [self.context deleteObject: aReminder];
}

-(void) sortReminders
{
    [myReminders sortUsingSelector: @selector(compareDates:)];
}



@end
