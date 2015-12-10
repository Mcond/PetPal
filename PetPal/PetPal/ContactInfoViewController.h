//
//  ContactInfoViewController.h
//  PetPal
//
//  Created by Miguel Conde on 12/10/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactBook.h"

@interface ContactInfoViewController : UIViewController <UIPickerViewDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *emailAddress;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *association;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic, strong) MyContact *contact;

- (IBAction)saveChanges:(id)sender;

- (IBAction)deleteContact:(id)sender;

- (IBAction)takePicture:(id)sender;

@end
