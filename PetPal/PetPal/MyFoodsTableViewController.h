//
//  MyFoodsTableViewController.h
//  PetPal
//
//  Created by Curtis Cox on 12/7/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FoodList;

@interface MyFoodsTableViewController : UITableViewController
@property (weak, nonatomic) FoodList *thisFoodList;

@end
