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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
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


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [thisFoodList removeFood:[thisFoodList.myFoodList objectAtIndex:[indexPath row]]];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        [self addNewFood];
    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    FoodType *food = [thisFoodList.myFoodList objectAtIndex:[fromIndexPath row]];
    if ([fromIndexPath row] > [toIndexPath row]) {
        [thisFoodList removeFood:food];
        [thisFoodList addFoodType:food atIndex:[toIndexPath row]];
    }
    else
    {
        [thisFoodList removeFood:food];
        [thisFoodList addFoodType:food atIndex:([toIndexPath row] - 1)];
        
    }
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}


/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
