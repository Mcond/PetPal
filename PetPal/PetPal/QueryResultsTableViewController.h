//
//  QueryResultsTableViewController.h
//  PetPal
//
//  Created by Curtis Cox on 12/5/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Parse;

@interface QueryResultsTableViewController : UITableViewController
@property (strong, nonatomic) NSArray *queryResults;

@end
