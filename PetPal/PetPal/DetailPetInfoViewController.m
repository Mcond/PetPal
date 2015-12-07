//
//  DetailPetInfoViewController.m
//  PetPal
//
//  Created by Ekaterina Gumnova on 12/5/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import "DetailPetInfoViewController.h"

@interface DetailPetInfoViewController ()



@end

@implementation DetailPetInfoViewController
@synthesize pickerData_0, pickerData_1;
@synthesize petType, needToLooseWeight, obeseProne, neutered, name, birthDate, weight, breed;
@synthesize aPet;




- (void)viewDidLoad
{
    [super viewDidLoad];
   
    self.pickerData_0 = [[NSArray alloc] initWithObjects: @"YES", @"NO", nil];
    self.pickerData_1 = [[NSArray alloc] initWithObjects: @"DOG", @"CAT", nil];
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //set the title
    self.navigationItem.title = self.aPet.name;
    
    self.name.text = self.aPet.name;
    self.weight.text = [NSString stringWithFormat: @"%.2f", self.aPet.weight];
    self.breed.text = self.aPet.breed;
    self.birthDate.date = self.aPet.birthDate;
    
    if ([self.aPet.petType isEqualToString: @"CAT"])
        [self.petType selectRow:1 inComponent:0 animated:YES];
    if (!self.aPet.neutered)
        [self.neutered selectRow: 1 inComponent: 0 animated: YES];
    if (!self.aPet.needToLooseWeight)
        [self.needToLooseWeight selectRow: 1 inComponent: 0 animated: YES];
    if (!self.aPet.obeseProne)
        [self.obeseProne selectRow: 1 inComponent: 0 animated: YES];
    if (self.aPet.image)
        self.imageView.image = self.aPet.image;

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//PickerViews methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 2;
}
-(NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView.tag == 1)
        return [pickerData_1 objectAtIndex: row];
    return [pickerData_0 objectAtIndex: row];
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveChanges:(id)sender
{
    //clear the first responder
    [self.view endEditing: YES];
    self.aPet.name = self.name.text;
    self.aPet.breed = self.breed.text;
    self.aPet.weight = [self.weight.text floatValue];
    self.aPet.birthDate = self.birthDate.date;
    self.aPet.petType = [self pickerView: petType titleForRow: [petType selectedRowInComponent:0] forComponent: 0];
    
    if ([[self pickerView: needToLooseWeight titleForRow: [needToLooseWeight selectedRowInComponent:0] forComponent: 0] isEqualToString: @"YES"])
        self.aPet.needToLooseWeight = YES;
    else self.aPet.needToLooseWeight = NO;
    
    if ([[self pickerView: obeseProne titleForRow: [obeseProne selectedRowInComponent:0] forComponent: 0] isEqualToString: @"YES"])
        self.aPet.obeseProne = YES;
    else self.aPet.obeseProne = NO;
    
    if ([[self pickerView: neutered titleForRow: [neutered selectedRowInComponent:0] forComponent: 0] isEqualToString: @"YES"])
        self.aPet.neutered = YES;
    else self.aPet.neutered = NO;
    self.aPet.targetCalories = [self.aPet calculateTargetCalories];
    NSLog(@"%f", self.aPet.targetCalories);

    
}

- (IBAction)removePet:(id)sender
{
    [[MyZoo sharedZoo] removePet: self.aPet];
    [self.navigationController popViewControllerAnimated: YES];
}


- (IBAction)takePicture:(id)sender
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    else imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.delegate = self;
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"Save Changes" message:@"Do you want to save changes?" preferredStyle: UIAlertControllerStyleAlert];
    UIAlertAction *save = [UIAlertAction actionWithTitle: @"SAVE" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self saveChanges: self];
        [alert dismissViewControllerAnimated: YES completion: nil];
        [self presentViewController: imagePicker animated: YES completion: NULL];
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle: @"CANCEL" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [alert dismissViewControllerAnimated: YES completion:nil];
        [self presentViewController: imagePicker animated: YES completion: NULL];
    }];
    [alert addAction: save];
    [alert addAction: cancel];
    [self presentViewController: alert animated: YES completion: nil];
    
    
}
-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    self.imageView.image = info[UIImagePickerControllerOriginalImage];
    self.aPet.image = info[UIImagePickerControllerOriginalImage];
    [self dismissViewControllerAnimated: YES completion: NULL];
    
}





- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
