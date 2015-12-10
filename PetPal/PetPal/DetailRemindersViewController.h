//
//  DetailRemindersViewController.h
//  PetPal
//
//  Created by Ekaterina Gumnova on 12/8/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Calendar.h"

@interface DetailRemindersViewController : UIViewController

@property (nonatomic, strong) Reminder *theReminder;
@property (weak, nonatomic) IBOutlet UITextField *titleView;
@property (weak, nonatomic) IBOutlet UITextView *details;
@property (weak, nonatomic) IBOutlet UIDatePicker *reminderDate;

- (IBAction)setReminder:(id)sender;
- (IBAction)deleteReminder:(id)sender;


@end
