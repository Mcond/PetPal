//
//  FoodDataViewController.m
//  PetPalV1
//
//  Created by Curtis Cox on 11/12/15.
//  Copyright (c) 2015 Curtis Cox. All rights reserved.
//

#import "FoodDataViewController.h"
#import <Parse/Parse.h>
#import "FoodList.h"

@interface FoodDataViewController ()

@end

@implementation FoodDataViewController
@synthesize brandName, FlavorName, caloriesPerServing, servingSize, univPriceCode, ServingUnit, myFoodList, pickedServingUnit, sizeLables, typeLables, foodType, pickedType;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    sizeLables = [[NSArray alloc] initWithObjects:@"cups", @"ounces", @"grams", @"pieces", @"pounds", nil];
    typeLables = [[NSArray alloc] initWithObjects:@"Cat", @"Dog", nil];
    pickedServingUnit = [sizeLables objectAtIndex:0];
    pickedType = [typeLables objectAtIndex:0];
    myFoodList = [FoodList defaultFoodList];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)pressedAddToDatabase:(id)sender {
    
    PFObject *food = [PFObject objectWithClassName:@"food"];
    food[@"type"] = pickedType;
    food[@"brandName"] = [brandName text];
    food[@"flavorName"] = [FlavorName text];
    food[@"servingSize"] = [servingSize text];
    food[@"caolriesPerServing"] = [caloriesPerServing text];
    food[@"uPC"] = [univPriceCode text];
    food[@"servingUnit"] = pickedServingUnit;
    [food saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSString *title = [[NSString alloc] initWithFormat:
                               @"Parse Database"];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                            message:@"Food saved to database."
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];

        } else {
            NSString *title = [[NSString alloc] initWithFormat:
                               @"Parse Database"];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                            message:@"Could not save to database.\nTry again."
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
    }];
}

- (IBAction)pressedAddToMyFood:(id)sender {
    PFObject *food = [PFObject objectWithClassName:@"food"];
    food[@"type"] = pickedType;
    food[@"brandName"] = [brandName text];
    food[@"flavorName"] = [FlavorName text];
    food[@"servingSize"] = [servingSize text];
    food[@"caolriesPerServing"] = [caloriesPerServing text];
    food[@"uPC"] = [univPriceCode text];
    food[@"servingUnit"] = pickedServingUnit;
    [myFoodList addFoodType:food];
}

- (IBAction)pressedUpdateinMyFood:(id)sender {
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component{
    if(pickerView == ServingUnit){
    return 5;
    }
    if (pickerView == foodType) {
        return 2;
    }
    else
        return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    if (pickerView == ServingUnit) {
        return [sizeLables objectAtIndex:row];
    }
    else if (pickerView == foodType){
        return [typeLables objectAtIndex:row];
    }
    else
        return @"";
}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component{
    if(pickerView == ServingUnit){
        pickedServingUnit = [sizeLables objectAtIndex:row];
    }
    if (pickerView == foodType) {
        pickedType = [typeLables objectAtIndex:row];
    }
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    if ([brandName isFirstResponder])
        [brandName resignFirstResponder];
    if ([FlavorName isFirstResponder])
        [FlavorName resignFirstResponder];
    if ([univPriceCode isFirstResponder])
        [univPriceCode resignFirstResponder];
    if ([servingSize isFirstResponder])
        [servingSize resignFirstResponder];
    if ([caloriesPerServing isFirstResponder])
        [caloriesPerServing resignFirstResponder];

    return YES;
}

// UITextFieldDelegate protocol method called when
// touches occur outside of a UITextField that is
// being edited or its keyboard
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if ([brandName isFirstResponder])
        [brandName resignFirstResponder];
    if ([FlavorName isFirstResponder])
        [FlavorName resignFirstResponder];
    if ([univPriceCode isFirstResponder])
        [univPriceCode resignFirstResponder];
    if ([servingSize isFirstResponder])
        [servingSize resignFirstResponder];
    if ([caloriesPerServing isFirstResponder])
        [caloriesPerServing resignFirstResponder];

    
    [super touchesBegan:touches withEvent:event];
}


@end
