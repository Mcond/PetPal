//
//  FoodTabViewController.m
//  PetPal
//
//  Created by Curtis Cox on 12/5/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import "FoodTabViewController.h"
#import "SearchFoodDatabaseViewController.h"
#import "EnterFoodGivenViewController.h"

@interface FoodTabViewController ()

@end

@implementation FoodTabViewController

//override init to set NavigationItem.title
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.navigationItem.title = @"Food";
    }
    return self;
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

//UITabBarControllerDelegate method
- (BOOL) tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    return true;
}

- (IBAction)pressedManageFoods:(id)sender {
    SearchFoodDatabaseViewController *sFDVC = [[SearchFoodDatabaseViewController alloc]init];
    [self.navigationController pushViewController:sFDVC animated:YES];
}

- (IBAction)pressedEnterFoodGiven:(id)sender {
    EnterFoodGivenViewController *eFGVC = [[EnterFoodGivenViewController alloc]init];
    [self.navigationController pushViewController:eFGVC animated:YES];
}
@end
