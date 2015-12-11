//
//  DetailRemindersViewController.m
//  PetPal
//
//  Created by Ekaterina Gumnova on 12/8/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import "DetailRemindersViewController.h"

@interface DetailRemindersViewController ()

@end

@implementation DetailRemindersViewController
@synthesize theReminder;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.reminderDate.minimumDate = [NSDate date];
    // Do any additional setup after loading the view from its nib.
}
-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationItem.title = self.theReminder.title;
    self.titleView.text = self.theReminder.title;
    self.details.text = self.theReminder.details;
    self.reminderDate.date = self.theReminder.reminderDate;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}




- (IBAction)setReminder:(id)sender
{
    //clear the first responder
    [self.view endEditing: YES];
    
    self.theReminder.title = self.titleView.text;
    self.theReminder.details = self.details.text;
    self.theReminder.reminderDate = self.reminderDate.date;
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)deleteReminder:(id)sender
{
    [[Calendar sharedCalendar] deleteReminder: self.theReminder];
    [self.navigationController popViewControllerAnimated:YES];
    
}


@end
