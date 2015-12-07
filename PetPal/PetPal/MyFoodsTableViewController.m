//
//  MyFoodsTableViewController.m
//  PetPal
//
//  Created by Curtis Cox on 12/7/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import "MyFoodsTableViewController.h"
#import "FoodDataViewController.h"
#import "TableViewCellStyleValue2.h"
#import "FoodList.h"
#import "FoodType.h"

@interface MyFoodsTableViewController ()

@end

@implementation MyFoodsTableViewController
@synthesize thisFoodList;

- (void)viewDidLoad {
    [super viewDidLoad];
    thisFoodList = [FoodList defaultFoodList];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"myFoodCell"];
    
    self.navigationItem.title = @"My Food List";
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

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
    return [thisFoodList.myFoodList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myFoodCell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"queryResultCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    // Configure the cell...
    FoodType *food = [thisFoodList.myFoodList objectAtIndex:[indexPath row]];
    cell.textLabel.text = [food foodName];
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [thisFoodList removeFood:[thisFoodList.myFoodList objectAtIndex:[indexPath row]]];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    FoodType *food = [thisFoodList.myFoodList objectAtIndex:[fromIndexPath row]];
    FoodType *aFood = [[FoodType alloc]init];
    aFood.foodName = food.foodName;
    aFood.servingSize = food.servingSize;
    aFood.servingUnit = food.servingUnit;
    aFood.calPerServig = food.calPerServig;
    if ([fromIndexPath row] < [toIndexPath row]) {
        [thisFoodList removeFood:food];
        [thisFoodList addFoodType:aFood atIndex:[toIndexPath row]];
    }
    else
    {
        [thisFoodList removeFood:food];
        [thisFoodList addFoodType:aFood atIndex:[toIndexPath row]];
        
    }
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

@end
