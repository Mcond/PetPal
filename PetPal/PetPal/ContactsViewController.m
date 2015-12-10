//
//  ContactsViewController.m
//  PetPal
//
//  Created by Miguel Conde on 12/08/15.
//  Copyright (c) 2015 Miguel Conde. All rights reserved.
//


#import "ContactsViewController.h"

@interface ContactsViewController ()

@end

@implementation ContactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass: [UITableViewCell class] forCellReuseIdentifier: @"UITableViewCell"];
    
    //set the tital to my contacts
    self.navigationItem.title = @"My Contacts";
    //Create an add button and associate the method addContact to it
    UIBarButtonItem *add = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemAdd target: self action: @selector (addContact:)];
    self.navigationItem.rightBarButtonItem = add;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //Reload the cells with update information
    [self.tableView reloadData];
}

//Method to add a new contact
-(IBAction) addContact:(id)sender
{
    //create an init Contact with empty params
    MyContact *newContact = [[ContactBook sharedContacts] addContactWitFirstName: @"" lastName:@"" email:@"" association:@"" phoneNumber:@""];
    
    //init the Contact view controller
    ContactInfoViewController *ContactInfoView = [[ContactInfoViewController alloc] init];
    
    //Set the contact to this new contact
    //used to fill out the text fields and image field
    ContactInfoView.contact = newContact;
    
    //Transition to contactinfo View with animation
    [self.navigationController pushViewController: ContactInfoView animated: YES];
}


#pragma mark - Table view data source

//Get the total number of contacts
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[ContactBook sharedContacts] contacts];
}

//Used to set the cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    MyContact *contact = [ContactBook sharedContacts].myContacts[indexPath.row];
    
    //String that will be used to represent the contact information to the user
    NSString *contactInfo = @"";
    
    contactInfo = [contactInfo stringByAppendingString:contact.firstName];
    contactInfo = [contactInfo stringByAppendingString: @" "];
    contactInfo = [contactInfo stringByAppendingString:contact.lastName];
    contactInfo = [contactInfo stringByAppendingString:@"         "];
    contactInfo = [contactInfo stringByAppendingString:contact.association];
    contactInfo = [contactInfo stringByAppendingString:@"         "];
    contactInfo = [contactInfo stringByAppendingString:contact.phoneNumber];
    
    //set cell image and contact info
    cell.imageView.image = contact.image;
    cell.textLabel.text = contactInfo;
    
    // Configure the cell...
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //create & push COntactInfoViewController *dpivc onto nav controller's stack
    //give detail view controller a pointer to the pet object in row
    ContactInfoViewController *contactInfo = [[ContactInfoViewController alloc] init];
    contactInfo.contact = [ContactBook sharedContacts].myContacts[indexPath.row];
    [self.navigationController pushViewController: contactInfo animated: YES];
}

/*
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
 
 // Configure the cell...
 
 return cell;
 }
 */

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Table view delegate
 
 // In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
 // Navigation logic may go here, for example:
 // Create the next view controller.
 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
 
 // Pass the selected object to the new view controller.
 
 // Push the view controller.
 [self.navigationController pushViewController:detailViewController animated:YES];
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
