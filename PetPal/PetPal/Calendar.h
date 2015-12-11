//
//  Calendar.h
//  PetPal
//
//  Created by Ekaterina Gumnova on 12/8/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reminder.h"


@interface Calendar : NSObject

@property (nonatomic) NSMutableArray *myReminders;
@property (nonatomic, strong) NSManagedObjectContext *context;
@property (nonatomic, strong) NSManagedObjectModel *model;

+(instancetype) sharedCalendar;
-(NSString *) archivePath;
-(BOOL) saveChanges;
-(NSInteger) allReminders;
-(Reminder *) addReminderWithTitle: (NSString *) theTitle description: (NSString *) theDescription andDate: (NSDate *) theDate;
-(void) deleteReminder: (Reminder *) aReminder;
-(void) sortReminders;


@end
