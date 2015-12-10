//  PROGRAMMER:     Curtis Cox
//  PANTHERID:      5001361
//  GROUP:          F
//  CLASS:          COP 465501 TR 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Group Project
//  DUE:            Thursday 12/10/15
//
//  QueryResultsTableViewController.m
//  PetPal
//
//  Created by Curtis Cox on 12/5/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import "QueryResultsTableViewController.h"
#import "FoodDataViewController.h"
#import <Parse/Parse.h>
#import "TableViewCellStyleValue2.h"

@interface QueryResultsTableViewController ()

@end

@implementation QueryResultsTableViewController
@synthesize queryResults;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[TableViewCellStyleValue2 class] forCellReuseIdentifier:@"queryResultCell"];
    
    self.navigationItem.title = @"Search Results";
    UIBarButtonItem *addButon = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewFood)];
    self.navigationItem.rightBarButtonItem = addButon;
    self.tableView.rowHeight = 100;
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [queryResults count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"queryResultCell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"queryResultCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    // Configure the cell.
    PFObject *food = [queryResults objectAtIndex:[indexPath row]];
    cell.textLabel.text = [food objectForKey:@"brandName"];
    cell.detailTextLabel.text = [food objectForKey:@"flavorName"];
    
    return cell;
}

#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    FoodDataViewController *fDVC = [[FoodDataViewController alloc] initWithNibName:@"FoodDataViewController" bundle:nil];
    
    // Pass the selected object to the new view controller.
    fDVC.importedFood = [queryResults objectAtIndex:[indexPath row]];
    
    
    // Push the view controller.
    [self.navigationController pushViewController:fDVC animated:YES];
}

@end
