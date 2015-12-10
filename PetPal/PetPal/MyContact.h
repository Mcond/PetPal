//
//  MyContact.h
//  PetPal
//
//  Created by Miguel Conde on 12/08/15.
//  Copyright (c) 2015 Miguel Conde. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>

//The managed Object MyContact
@interface MyContact : NSManagedObject

@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * emailAddress;
@property (nonatomic, retain) NSString * association;
@property (nonatomic, retain) NSString * phoneNumber;
@property (nonatomic, retain) UIImage *image;


@end
