//  PROGRAMMER:     Curtis Cox
//  PANTHERID:      5001361
//  GROUP:          F
//  CLASS:          COP 465501 TR 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Group Project
//  DUE:            Thursday 12/10/15
//
//  EnterFoodGivenViewController.h
//  PetPal
//
//  Created by Curtis Cox on 12/5/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FoodList;
@class FoodType;
@class MyZoo;
@class MyPet;

@interface EnterFoodGivenViewController : UIViewController<UITabBarControllerDelegate,UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *pickPet;
@property (weak, nonatomic) IBOutlet UIPickerView *pickFood;
@property (weak, nonatomic) IBOutlet UILabel *sizeLabel;
@property (weak, nonatomic) IBOutlet UILabel *calLabel;
@property (weak, nonatomic) IBOutlet UILabel *targetCalLabel;
@property (weak, nonatomic) IBOutlet UITextField *enterSize;
@property (weak, nonatomic) IBOutlet UILabel *calInServingLabel;
@property (weak, nonatomic) IBOutlet UILabel *calLeftAfterServingLable;
@property (weak, nonatomic) FoodList *thisFoodList;
@property (weak, nonatomic) FoodType *pickedFood;
@property (weak, nonatomic) MyZoo *thisZoo;
@property (weak, nonatomic) MyPet *thisPet;
@property (weak, nonatomic) MyPet *pickedPet;
- (IBAction)pressedConfirm:(id)sender;

@end
