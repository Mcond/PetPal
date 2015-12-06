//
//  HealthTabViewController.m
//  PetPal
//
//  Created by Curtis Cox on 12/5/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import "HealthTabViewController.h"

@interface HealthTabViewController ()

@end

@implementation HealthTabViewController


//override init to set tabBarItem.title
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"Health";
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

- (IBAction)pressedReminders:(id)sender {
}

- (IBAction)pressedVaccines:(id)sender {
}

- (IBAction)pressedFTHControl:(id)sender {
}

- (IBAction)pressedContactVet:(id)sender {
}
@end
