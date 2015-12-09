//  PROGRAMMER:     Curtis Cox
//  PANTHERID:      5001361
//  GROUP:          F
//  CLASS:          COP 465501 TR 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Group Project
//  DUE:            Thursday 12/10/15
//
//  SearchFoodDatabaseViewController.h
//  PetPal
//
//  Created by Curtis Cox on 12/4/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Parse;

@interface SearchFoodDatabaseViewController : UIViewController<UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *foodType;
@property (weak, nonatomic) IBOutlet UITextField *brandName;
@property (weak, nonatomic) IBOutlet UITextField *flavorName;
@property (weak, nonatomic) IBOutlet UITextField *univPriceCode;
@property (weak, nonatomic) NSString *pickedType, *selectedBrand, *selectedFlavor, *selectedUPC;
@property (strong, nonatomic) NSArray *typeLables;
- (IBAction)pressedSearch:(id)sender;

@end
