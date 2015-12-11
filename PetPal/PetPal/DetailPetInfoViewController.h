//
//  DetailPetInfoViewController.h
//  PetPal
//
//  Created by Ekaterina Gumnova on 12/5/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyZoo.h"

@interface DetailPetInfoViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (nonatomic, retain) NSArray *pickerData_0, *pickerData_1;
@property (weak, nonatomic) IBOutlet UIPickerView *petType;
@property (weak, nonatomic) IBOutlet UIPickerView *needToLooseWeight;
@property (weak, nonatomic) IBOutlet UIPickerView *obeseProne;
@property (weak, nonatomic) IBOutlet UIPickerView *neutered;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UIDatePicker *birthDate;
@property (weak, nonatomic) IBOutlet UITextField *weight;
@property (weak, nonatomic) IBOutlet UITextField *breed;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic, strong) MyPet *aPet;
- (IBAction)saveChanges:(id)sender;

- (IBAction)removePet:(id)sender;

- (IBAction)takePicture:(id)sender;


@end
