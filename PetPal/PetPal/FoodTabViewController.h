//
//  FoodTabViewController.h
//  PetPal
//
//  Created by Curtis Cox on 12/5/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodTabViewController : UIViewController<UITabBarControllerDelegate>
- (IBAction)pressedSearchDatabase:(id)sender;

- (IBAction)pressedEnterFoodGiven:(id)sender;
- (IBAction)pressedManageMyFoods:(id)sender;

@end
