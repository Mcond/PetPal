//
//  SearchFoodDatabaseViewController.m
//  PetPal
//
//  Created by Curtis Cox on 12/4/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import "SearchFoodDatabaseViewController.h"
#import "QueryResultsTableViewController.h"
#import "FoodDataViewController.h"
#import <Parse/Parse.h>

@interface SearchFoodDatabaseViewController ()


@end

@implementation SearchFoodDatabaseViewController
@synthesize typeLables, brandName, flavorName, univPriceCode, pickedType, foodType, selectedBrand, selectedFlavor, selectedUPC;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"Search Food Database";
    UIBarButtonItem *addButon = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewFood)];
    self.navigationItem.rightBarButtonItem = addButon;
    
    typeLables = [[NSArray alloc] initWithObjects:@"Cat", @"Dog", nil];
    pickedType = [typeLables objectAtIndex:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addNewFood{
    FoodDataViewController *fDVC = [[FoodDataViewController alloc]init];
    [self.navigationController pushViewController:fDVC animated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)pressedSearch:(id)sender {
    selectedUPC = [univPriceCode text];
    selectedFlavor = [flavorName text];
    selectedBrand = [brandName text];
    PFQuery *brandSelected = [PFQuery queryWithClassName:@"food"];
    if ([selectedBrand isEqualToString:@""])
        [brandSelected whereKey:@"brandName" equalTo:selectedBrand];
    else
        [brandSelected whereKey:@"brandName" matchesRegex:selectedBrand modifiers:@"i"];
    PFQuery *flavorSelected = [PFQuery queryWithClassName:@"food"];
    if ([selectedFlavor isEqualToString:@""])
        [flavorSelected whereKey:@"flavorName" equalTo:selectedFlavor];
    else
        [flavorSelected whereKey:@"flavorName" matchesRegex:selectedFlavor modifiers:@"i"];
    PFQuery *uPCSelected = [PFQuery queryWithClassName:@"food"];
    [uPCSelected whereKey:@"uPC" equalTo:selectedUPC];
     PFQuery *orQuery = [PFQuery orQueryWithSubqueries:@[brandSelected, flavorSelected, uPCSelected]];
    [orQuery whereKey:@"type" equalTo:pickedType];
    QueryResultsTableViewController *qRVC = [[QueryResultsTableViewController alloc]init];
    qRVC.queryResults = [orQuery findObjects];
    [self.navigationController pushViewController:qRVC animated:YES];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component{
    return [typeLables count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    return [typeLables objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component{
    pickedType = [typeLables objectAtIndex:row];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    if ([brandName isFirstResponder])
    {
        selectedBrand = [brandName text];
        [brandName resignFirstResponder];
    }
    if ([flavorName isFirstResponder])
    {
        selectedFlavor = [flavorName text];
        [flavorName resignFirstResponder];
    }
    if ([univPriceCode isFirstResponder])
    {
        selectedUPC = [univPriceCode text];
        [univPriceCode resignFirstResponder];
    }
    return YES;
}

// UITextFieldDelegate protocol method called when
// touches occur outside of a UITextField that is
// being edited or its keyboard
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if ([brandName isFirstResponder])
    {
        [brandName resignFirstResponder];
        selectedBrand = [brandName text];
    }
    if ([flavorName isFirstResponder])
    {
        [flavorName resignFirstResponder];
        selectedFlavor = [flavorName text];
    }
    if ([univPriceCode isFirstResponder])
    {
        [univPriceCode resignFirstResponder];
        selectedUPC = [univPriceCode text];
    }
    [super touchesBegan:touches withEvent:event];
}


@end
