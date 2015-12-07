//
//  FleaTickViewController.m
//  PetPal
//
//  Created by Curtis Cox on 12/6/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import "FleaTickViewController.h"
#import "MyPet.h"
#import "MyZoo.h"
#import "HealthRecord.h"
#import "FleaTickLog.h"

@interface FleaTickViewController ()

@end

@implementation FleaTickViewController
@synthesize fleaTickLabelsCat, fleaTickLabelsDog, pickedPet, pickedTreatment, pickDate, pickPet, pickTreatment, thisZoo, thisLog, pickedDate;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"Add Treatment";
    thisZoo = [MyZoo sharedZoo];
    pickedPet = [thisZoo.myPets objectAtIndex:0];
    fleaTickLabelsDog = [[NSArray alloc]initWithObjects:@"Activyl", @"Activyl Tick Plus", @"Advantage Multi", @"Bravecto", @"Comfortis", @"Fiproguard", @"Fiproguard Max", @"Flea5X Plus", @"Frontline Plus", @"Frontline Tritak", @"Heartgard", @"Heartgard Plus", @"Interceptor", @"Iverhart", @"Iverhart Max", @"K9 Advantix II", @"NexGard", @"Parastar", @"Parastar Plus", @"PetArmor", @"Sentinel", @"Sentinel Spectrum", @"Seresto", @"Trifexis", nil];
    fleaTickLabelsCat = [[NSArray alloc]initWithObjects:@"Advantage II", @"Cheristin", @"EasySpot", @"Heartgard", @"Interceptor", @"Revolution", nil];
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
    else if (pickerView == pickTreatment) {
        if ([pickedPet.petType isEqualToString:@"DOG"])
            return [fleaTickLabelsDog count];
        else
            return [fleaTickLabelsCat count];
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
    else if (pickerView == pickTreatment){
        if ([pickedPet.petType isEqualToString:@"DOG"])
            return [fleaTickLabelsDog objectAtIndex:row];
        else
            return [fleaTickLabelsCat objectAtIndex:row];
        
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
    if (pickerView == pickTreatment) {
        if ([pickedPet.petType isEqualToString:@"DOG"])
            pickedTreatment = [fleaTickLabelsDog objectAtIndex:row];
        else
            pickedTreatment = [fleaTickLabelsCat objectAtIndex:row];
        
    }
}


- (IBAction)pressedRecord:(id)sender {
    HealthRecord *newRecord = [[HealthRecord alloc] initWithPetName:[pickedPet name] vaccineName:pickedTreatment type:@"FleaTick" andDate:pickDate.date];
    [thisLog addMyLogObject:newRecord];
    NSString *title = [[NSString alloc] initWithFormat:
                       @"Save Treatment"];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:@"Treatment saved to database."
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}
@end

