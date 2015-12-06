//
//  EnterFoodGivenViewController.m
//  PetPal
//
//  Created by Curtis Cox on 12/5/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import "EnterFoodGivenViewController.h"
#import "FoodList.h"
#import "FoodType.h"
#import "MyPet.h"
#import "MyZoo.h"

@interface EnterFoodGivenViewController ()

@end

@implementation EnterFoodGivenViewController
{
    double calories, caloriesLeft;
}
@synthesize pickFood, pickPet, sizeLabel, calLabel, enterSize, thisFoodList, thisPet, thisZoo, pickedPet, pickedFood, targetCalLabel, calInServingLabel, calLeftAfterServingLable;

//override init to set NavigationItem.title
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.navigationItem.title = @"Enter Food Given";
        thisFoodList = [FoodList defaultFoodList];
        thisZoo = [MyZoo sharedZoo];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)pressedConfirm:(id)sender {
    if ((pickedPet != nil) && (pickedFood != nil)){
        calories = [[enterSize text] doubleValue] * [[pickedFood calPerServig]doubleValue];
        calInServingLabel.text = [NSString stringWithFormat:@"%d", (int)calories];
        caloriesLeft = [pickedPet remainingCalories] - calories;
        calLeftAfterServingLable.text = [NSString stringWithFormat:@"%d", (int)caloriesLeft];
        pickedPet.remainingCalories = (int)caloriesLeft;
        calLabel.text = [NSString stringWithFormat:@"%d", (int)[pickedPet remainingCalories]];
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component{
    if(pickerView == pickPet){
        return [[thisZoo myPets] count];
    }
    if (pickerView == pickFood) {
        return [[thisFoodList myFoodList] count];
    }
    else
        return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    if (pickerView == pickPet) {
        return [[[thisZoo myPets]objectAtIndex:row] name];
    }
    else if (pickerView == pickFood){
        return [[[thisFoodList myFoodList]objectAtIndex:row] foodName];
    }
    else
        return @"";
}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component{
    if(pickerView == pickPet){
        pickedPet = [[thisZoo myPets] objectAtIndex:row];
        
        if (pickedPet != nil) {
            NSDate *thisDay = [NSDate date];
            bool sameDate = [thisDay isEqualToDate:pickedPet.updateDate];
            if (!sameDate) {
                pickedPet.updateDate = thisDay;
                pickedPet.remainingCalories = pickedPet.targetCalories;
            }
            calLabel.text = [NSString stringWithFormat:@"%@", [pickedPet remainingCalories]];
            targetCalLabel.text = [NSString stringWithFormat:@"%@", [pickedPet targetCalories]];
        }
    }
    if (pickerView == pickFood) {
        pickedFood = [[thisFoodList myFoodList] objectAtIndex:row];
        sizeLabel.text = [pickedFood servingUnit];
    }
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [enterSize resignFirstResponder];
    if (pickedFood != nil) {
        calories = [[enterSize text] doubleValue] * [[pickedFood calPerServig]doubleValue];
        calInServingLabel.text = [NSString stringWithFormat:@"%d", (int)calories];
        if (pickedPet != nil) {
            caloriesLeft = [[pickedPet remainingCalories] doubleValue] - calories;
            calLeftAfterServingLable.text = [NSString stringWithFormat:@"%d", (int)caloriesLeft];
        }
    }
    return YES;
}

// UITextFieldDelegate protocol method called when
// touches occur outside of a UITextField that is
// being edited or its keyboard
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [enterSize resignFirstResponder];
    if (pickedFood != nil) {
        calories = [[enterSize text] doubleValue] * [[pickedFood calPerServig]doubleValue];
        calInServingLabel.text = [NSString stringWithFormat:@"%d", (int)calories];
        if (pickedPet != nil) {
            caloriesLeft = [[pickedPet remainingCalories] doubleValue] - calories;
            calLeftAfterServingLable.text = [NSString stringWithFormat:@"%d", (int)caloriesLeft];
        }
    }
    [super touchesBegan:touches withEvent:event];
}


@end
