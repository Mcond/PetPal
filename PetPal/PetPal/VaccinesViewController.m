//
//  VaccinesViewController.m
//  PetPal
//
//  Created by Curtis Cox on 12/6/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import "VaccinesViewController.h"
#import "MyPet.h"
#import "MyZoo.h"
#import "HealthRecord.h"
#import "HealthLog.h"

@interface VaccinesViewController ()

@end

@implementation VaccinesViewController
@synthesize vaccineLabelsCat, vaccineLabelsDog, pickedPet, pickedVaccine, pickDate, pickPet, pickVaccine, thisZoo, thisLog;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"Add Vaccine";
    thisZoo = [MyZoo sharedZoo];
    pickedPet = [thisZoo.myPets objectAtIndex:0];
    vaccineLabelsDog = [[NSArray alloc]initWithObjects:@"Canine Distemper", @"Measles", @"Parvovirus", @"Hepatitis", @"Rabies", @"CAV-2", @"Parainfluenza", @"Bordetella", @"Leptospirosis", @"Coronavirus", @"Lyme", nil];
    vaccineLabelsCat = [[NSArray alloc]initWithObjects:@"Panleukopenia", @"Rhinotracheitis", @"Calicivirus", @"Rabies", @"Feline Leukemia", @"Chlamydophila", @"Feline Infectious Peritonitis", @"Bordetella", @"Giardia", @"Feline Immunodeficiency Virus", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//UITabBarControllerDelegate method
- (BOOL) tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    return true;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component{
    if(pickerView == pickPet){
        return [thisZoo.myPets count];
    }
    else if (pickerView == pickVaccine) {
        if ([pickedPet.petType isEqualToString:@"DOG"])
            return [vaccineLabelsDog count];
        else
            return [vaccineLabelsCat count];
    }
    else
        return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    if (pickerView == pickPet) {
        return [[thisZoo.myPets objectAtIndex:row] name];
    }
    else if (pickerView == pickVaccine){
        if ([pickedPet.petType isEqualToString:@"DOG"])
            return [vaccineLabelsDog objectAtIndex:row];
        else
            return [vaccineLabelsCat objectAtIndex:row];

    }
    else
        return @"";
}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component{
    if(pickerView == pickPet){
        pickedPet = [thisZoo.myPets objectAtIndex:row];
    }
    if (pickerView == pickVaccine) {
        if ([pickedPet.petType isEqualToString:@"DOG"])
            pickedVaccine = [vaccineLabelsDog objectAtIndex:row];
        else
            pickedVaccine = [vaccineLabelsCat objectAtIndex:row];

    }
}


- (IBAction)pressedRecord:(id)sender {
    HealthRecord *newRecord = [[HealthRecord alloc] initWithPetName:[pickedPet name] vaccineName:pickedVaccine type:@"Vaccine" andDate:[NSDate date]];
    [thisLog addMyLogObject:newRecord];
    NSString *title = [[NSString alloc] initWithFormat:
                       @"Save Vaccine"];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:@"Vaccine saved to database."
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}
@end
