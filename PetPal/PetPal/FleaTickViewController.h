//  PROGRAMMER:     Curtis Cox
//  PANTHERID:      5001361
//  GROUP:          F
//  CLASS:          COP 465501 TR 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Group Project
//  DUE:            Thursday 12/10/15
//
//  FleaTickViewController.h
//  PetPal
//
//  Created by Curtis Cox on 12/6/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyZoo;
@class MyPet;
@class FleaTickLog;

@interface FleaTickViewController : UIViewController<UITabBarControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate>
@property (strong, nonatomic) NSArray *fleaTickLabelsDog, *fleaTickLabelsCat;
@property (weak, nonatomic) NSString *pickedTreatment;
@property (strong, nonatomic) MyZoo *thisZoo;
@property (weak, nonatomic) MyPet *pickedPet;
@property (weak, nonatomic) FleaTickLog *thisLog;
@property  (weak, nonatomic) NSDate *pickedDate;
@property (weak, nonatomic) IBOutlet UIPickerView *pickPet;
@property (weak, nonatomic) IBOutlet UIPickerView *pickTreatment;
@property (weak, nonatomic) IBOutlet UIDatePicker *pickDate;
- (IBAction)pressedRecord:(id)sender;

@end
