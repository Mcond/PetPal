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
#import "MyFoodsTableViewController.h"

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

//UITabBarControllerDelegate method
- (BOOL) tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    return true;
}

- (IBAction)pressedSearchDatabase:(id)sender {
    SearchFoodDatabaseViewController *sFDVC = [[SearchFoodDatabaseViewController alloc]init];
    [self.navigationController pushViewController:sFDVC animated:YES];
}

- (IBAction)pressedEnterFoodGiven:(id)sender {
    EnterFoodGivenViewController *eFGVC = [[EnterFoodGivenViewController alloc]init];
    [self.navigationController pushViewController:eFGVC animated:YES];
}


@end
