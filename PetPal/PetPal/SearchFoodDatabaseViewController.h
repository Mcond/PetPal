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
