//
//  FoodDataViewController.h
//  PetPalV1
//
//  Created by Curtis Cox on 11/12/15.
//  Copyright (c) 2015 Curtis Cox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@class FoodList;

@interface FoodDataViewController : UIViewController<UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *brandName;
@property (weak, nonatomic) IBOutlet UITextField *FlavorName;
@property (weak, nonatomic) IBOutlet UITextField *servingSize;
@property (weak, nonatomic) IBOutlet UIPickerView *ServingUnit;
@property (weak, nonatomic) IBOutlet UITextField *caloriesPerServing;
@property (weak, nonatomic) IBOutlet UITextField *univPriceCode;
@property(strong, nonatomic) FoodList *myFoodList;
@property(weak, nonatomic) NSString *pickedServingUnit, *pickedType;
@property(strong, nonatomic) NSArray *sizeLables, *typeLables;
@property (strong, nonatomic) PFObject *importedFood;
@property (weak, nonatomic) IBOutlet UIPickerView *foodType;


- (IBAction)pressedAddToDatabase:(id)sender;
- (IBAction)pressedAddToMyFood:(id)sender;
- (IBAction)pressedManageMyFood:(id)sender;


@end
