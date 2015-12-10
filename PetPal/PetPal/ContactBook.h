//
//  ContactBook.h
//  PetPal
//
//  Created by Miguel Conde on 12/10/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyContact.h"

@interface ContactBook : NSObject

@property (nonatomic) NSMutableArray *myContacts;
@property (nonatomic, strong) NSManagedObjectContext *context;
@property (nonatomic, strong) NSManagedObjectModel *model;

+(instancetype) sharedContacts;

-(MyContact *) addContactWitFirstName: (NSString *) firstName lastName: (NSString *) lastName email: (NSString *) contactEmail association: (NSString *) userAssociation phoneNumber: (NSString*) phoneNumber;


-(NSString *) archivePath;
-(BOOL) saveChanges;
-(NSInteger) contacts;
-(void) removeContact: (MyContact *) aContact;

@end
