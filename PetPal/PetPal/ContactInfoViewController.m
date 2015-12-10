//
//  ContactInfoViewController.m
//  PetPal
//
//  Created by Miguel Conde on 12/10/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import "ContactInfoViewController.h"

@interface ContactInfoViewController ()

@end

@implementation ContactInfoViewController

@synthesize firstName, lastName, emailAddress, phoneNumber, association, contact;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //set the title
    self.navigationItem.title = @"Contact Info";
    
    self.firstName.text = contact.firstName;
    self.lastName.text = contact.lastName;
    self.emailAddress.text = contact.emailAddress;
    self.association.text = contact.association;
    self.phoneNumber.text = contact.association;

    if (self.contact.image)
        self.imageView.image = self.contact.image;
    
    
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    self.imageView.image = info[UIImagePickerControllerOriginalImage];
    self.contact.image = info[UIImagePickerControllerOriginalImage];
    [self dismissViewControllerAnimated: YES completion: NULL];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (IBAction)saveChanges:(id)sender
{
    //clear the first responder
    [self.view endEditing: YES];
    self.contact.firstName = self.firstName.text;
    self.contact.lastName = self.lastName.text;
    self.contact.emailAddress = self.emailAddress.text;
    self.contact.association = self.association.text;
    self.contact.phoneNumber = self.phoneNumber.text;
    
    
}

- (IBAction)takePicture:(id)sender
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    else imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.delegate = self;
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"Save Changes" message:@"Do you want to save changes?" preferredStyle: UIAlertControllerStyleAlert];
    UIAlertAction *save = [UIAlertAction actionWithTitle: @"SAVE" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self saveChanges: self];
        [alert dismissViewControllerAnimated: YES completion: nil];
        [self presentViewController: imagePicker animated: YES completion: NULL];
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle: @"CANCEL" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [alert dismissViewControllerAnimated: YES completion:nil];
        [self presentViewController: imagePicker animated: YES completion: NULL];
    }];
    [alert addAction: save];
    [alert addAction: cancel];
    [self presentViewController: alert animated: YES completion: nil];
    
    
}

- (IBAction)deleteContact:(id)sender
{
    [[ContactBook sharedContacts] removeContact: self.contact];
    [self.navigationController popViewControllerAnimated: YES];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
