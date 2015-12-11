//
//  ContactInfoViewController.h
//  PetPal
//
//  Created by Miguel Conde on 12/09/15.
//  Copyright (c) 2015 Miguel Conde. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "ContactBook.h"

//This Controller is in charge of the view that allows the user to edit the contact infromation
@interface ContactInfoViewController : UIViewController <UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *emailAddress;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *association;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic, strong) MyContact *contact;

//edit contact info
- (IBAction)saveChanges:(id)sender;

//remove a contact
- (IBAction)deleteContact:(id)sender;

//associate picture with contact
- (IBAction)takePicture:(id)sender;

@end
