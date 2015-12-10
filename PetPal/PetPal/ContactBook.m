//
//  ContactBook.m
//  PetPal
//
//  Created by Miguel Conde on 12/10/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import "ContactBook.h"

@implementation ContactBook

@synthesize myContacts;

+(instancetype) sharedContacts
{
    static ContactBook *sharedContacts;
    if (!sharedContacts)
    {
        sharedContacts = [[self alloc] initPrivate];
    }
    return sharedContacts;
    
}

-(instancetype) init
{
    [NSException raise: @"Singleton" format: @"use + [ContactBook sharedContacts]"];
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
        [self loadAllContact];
    }
    return self;
}

-(void) loadAllContact
{
    if (!self.myContacts)
    {
        
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        NSEntityDescription *e = [NSEntityDescription entityForName: @"MyContact" inManagedObjectContext:self.context];
        request.entity = e;
        NSSortDescriptor *sd = [NSSortDescriptor sortDescriptorWithKey: @"lastName" ascending: YES selector:@selector(caseInsensitiveCompare:)];
        request.sortDescriptors = @[sd];
        NSError *error;
        NSArray *result = [self.context executeFetchRequest: request error: &error];
        if (!result)
        {
            [NSException raise: @"Fetch failed" format: @"Reason: %@", [error description]];
        }
        
        self.myContacts = [[NSMutableArray alloc] initWithArray: result];
    }
}

-(MyContact *) addContactWitFirstName: (NSString *) firstName lastName: (NSString *) lastName email: (NSString *) contactEmail association: (NSString *) userAssociation phoneNumber: (NSString*) phoneNumber
{
    MyContact *contact = [NSEntityDescription insertNewObjectForEntityForName: @"MyContact" inManagedObjectContext: self.context];
    contact.firstName = firstName;
    contact.lastName = lastName;
    contact.emailAddress = contactEmail;
    contact.association = userAssociation;
    contact.phoneNumber = phoneNumber;
    
    [self.myContacts addObject: contact];
    return contact;

    
}

-(NSString *) archivePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories firstObject];
    return [documentDirectory stringByAppendingPathComponent: @"store.data"];
}

-(void) removeContact:(MyContact *)aContact
{
    [self.myContacts removeObjectIdenticalTo: aContact];
    [self.context deleteObject: aContact];
    
}

-(NSInteger) contacts
{
    return [myContacts count];
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
