//
//  Reminder.h
//  PetPal
//
//  Created by Ekaterina Gumnova on 12/8/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Reminder : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSDate * reminderDate;
@property (nonatomic, retain) NSString * details;

-(NSString *) description;
-(NSComparisonResult) compareDates: (id) element;



@end
