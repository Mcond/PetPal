//
//  RemindersViewController.m
//  PetPal
//
//  Created by Ekaterina Gumnova on 12/8/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import "RemindersViewController.h"

@interface RemindersViewController ()

@end

@implementation RemindersViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass: [UITableViewCell class] forCellReuseIdentifier: @"UITableViewCell"];
    
    self.navigationItem.title = @"Reminders";
    UIBarButtonItem *add = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemAdd target: self action: @selector (addNewReminder:)];
    self.navigationItem.rightBarButtonItem = add;

}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[Calendar sharedCalendar] sortReminders];
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[Calendar sharedCalendar] allReminders];
}


-(IBAction) addNewReminder:(id)sender
{
    Reminder *newReminder = [[Calendar sharedCalendar] addReminderWithTitle: @"" description:@"" andDate:[NSDate date]];
    DetailRemindersViewController *detailReminderView = [[DetailRemindersViewController alloc] init];
    detailReminderView.theReminder = newReminder;
    [self.navigationController pushViewController: detailReminderView animated: YES];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    Reminder *aReminder = [Calendar sharedCalendar].myReminders[indexPath.row];
    cell.textLabel.text = [aReminder description];
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //create & push DetailRemindersViewController *drvc onto nav controller's stack
    //give detail view controller a pointer to the remindder object in row
    DetailRemindersViewController *detailReminderView = [[DetailRemindersViewController alloc] init];
    detailReminderView.theReminder = [Calendar sharedCalendar].myReminders[indexPath.row];
    [self.navigationController pushViewController: detailReminderView animated: YES];
}


@end
