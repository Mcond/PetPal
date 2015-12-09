//  PROGRAMMER:     Curtis Cox
//  PANTHERID:      5001361
//  GROUP:          F
//  CLASS:          COP 465501 TR 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Group Project
//  DUE:            Thursday 12/10/15
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

//Method call by navbar + button
//pushes a FoodDataViewController
-(void)addNewFood{
    FoodDataViewController *fDVC = [[FoodDataViewController alloc]init];
    [self.navigationController pushViewController:fDVC animated:YES];
}

//Searches the global food database for foods matching the search criteria
//Search is case insensitive and searches for and match of the strings
//except UPS which must be an exact match
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

//UIPickerViewDataSourceDelegate methods:

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

//UIPickerViewDelegate method
- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component{
    pickedType = [typeLables objectAtIndex:row];
}

//UITextFieldDelegate Method
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
