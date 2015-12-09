//  PROGRAMMER:     Curtis Cox
//  PANTHERID:      5001361
//  GROUP:          F
//  CLASS:          COP 465501 TR 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Group Project
//  DUE:            Thursday 12/10/15
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
    pickedPet = [[thisZoo myPets] objectAtIndex:0];
    pickedFood = [[thisFoodList myFoodList] objectAtIndex:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    if (pickedPet != nil) {
        NSCalendar *thisCalendar = [NSCalendar currentCalendar];
        if (![thisCalendar isDateInToday:pickedPet.updateDate]) {
            NSDate *thisDay = [NSDate date];
            pickedPet.updateDate = thisDay;
            pickedPet.remainingCalories = pickedPet.targetCalories;
        }
        calLabel.text = [NSString stringWithFormat:@"%d", (int)[pickedPet remainingCalories]];
        targetCalLabel.text = [NSString stringWithFormat:@"%d", (int)[pickedPet targetCalories]];
    }
    if (pickedFood != nil) {
        sizeLabel.text = [pickedFood servingUnit];
    }

}

- (IBAction)pressedConfirm:(id)sender {
    if ((pickedPet != nil) && (pickedFood != nil)){
        calories = [[enterSize text] doubleValue] * [[pickedFood calPerServig]doubleValue];
        calInServingLabel.text = [NSString stringWithFormat:@"%d", (int)calories];
        caloriesLeft = [pickedPet remainingCalories] - calories;
        calLeftAfterServingLable.text = [NSString stringWithFormat:@"%d", (int)caloriesLeft];
        pickedPet.remainingCalories = (int)caloriesLeft;
        calLabel.text = [NSString stringWithFormat:@"%d", (int)[pickedPet remainingCalories]];
        [[MyZoo sharedZoo] saveChanges];
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
            calLabel.text = [NSString stringWithFormat:@"%d", (int)[pickedPet remainingCalories]];
            targetCalLabel.text = [NSString stringWithFormat:@"%d", (int)[pickedPet targetCalories]];
        }
    }
    if (pickerView == pickFood) {
        pickedFood = [[thisFoodList myFoodList] objectAtIndex:row];
        sizeLabel.text = [pickedFood servingUnit];
    }
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    if ([enterSize isFirstResponder])
        [enterSize resignFirstResponder];
    if (pickedFood != nil) {
        calories = [[enterSize text] doubleValue] * [[pickedFood calPerServig]doubleValue];
        calInServingLabel.text = [NSString stringWithFormat:@"%d", (int)calories];
        if (pickedPet != nil) {
            caloriesLeft = [pickedPet remainingCalories] - calories;
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
            caloriesLeft = [pickedPet remainingCalories] - calories;
            calLeftAfterServingLable.text = [NSString stringWithFormat:@"%d", (int)caloriesLeft];
        }
    }
    [super touchesBegan:touches withEvent:event];
}


@end
