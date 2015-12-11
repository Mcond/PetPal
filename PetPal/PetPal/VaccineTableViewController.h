//
//  VaccineTableViewController.h
//  PetPal
//
//  Created by Curtis Cox on 12/6/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HealthLog;

@interface VaccineTableViewController : UITableViewController
@property (strong, nonatomic) HealthLog *thisLog;

@end
