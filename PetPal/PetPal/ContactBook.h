//
//  ContactBook.h
//  PetPal
//
//  Created by Miguel Conde on 12/08/15.
//  Copyright (c) 2015 Miguel Conde. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "MyContact.h"

//This class in in charge of performing CRUD operations for MyContact
@interface ContactBook : NSObject


@property (nonatomic) NSMutableArray *myContacts;
@property (nonatomic, strong) NSManagedObjectContext *context;
@property (nonatomic, strong) NSManagedObjectModel *model;

//Shared instance of Contact book
+(instancetype) sharedContacts;

//Method to Create a new Contact
-(MyContact *) addContactWitFirstName: (NSString *) firstName lastName: (NSString *) lastName email: (NSString *) contactEmail association: (NSString *) userAssociation phoneNumber: (NSString*) phoneNumber;


-(NSString *) archivePath;
-(BOOL) saveChanges;
-(NSInteger) contacts;
-(void) removeContact: (MyContact *) aContact;

@end
