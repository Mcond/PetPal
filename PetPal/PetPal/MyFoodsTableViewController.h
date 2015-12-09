//  PROGRAMMER:     Curtis Cox
//  PANTHERID:      5001361
//  GROUP:          F
//  CLASS:          COP 465501 TR 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Group Project
//  DUE:            Thursday 12/10/15
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
