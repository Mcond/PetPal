//
//  Reminder.m
//  PetPal
//
//  Created by Ekaterina Gumnova on 12/8/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import "Reminder.h"


@implementation Reminder

@dynamic title;
@dynamic reminderDate;
@dynamic details;

-(NSString *) description
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateStyle = NSDateIntervalFormatterMediumStyle;
    dateFormatter.timeStyle = NSDateIntervalFormatterShortStyle;
    NSString *result = [self.title stringByAppendingFormat:@": %@", [dateFormatter stringFromDate: self.reminderDate]];
    return result;
}

-(NSComparisonResult) compareDates: (id) element
{
    return [self.reminderDate compare: [element reminderDate]];
}

//-(NSComparisonResult) compareNames:(id)element
//{
//    return [lName localizedCaseInsensitiveCompare: [element lName]];
//}



@end
