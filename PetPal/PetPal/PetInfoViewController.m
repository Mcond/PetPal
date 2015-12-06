//
//  PetInfoViewController.m
//  PetPal
//
//  Created by Ekaterina Gumnova on 12/4/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import "PetInfoViewController.h"

@interface PetInfoViewController ()

@end

@implementation PetInfoViewController

//-(instancetype) initWithStyle:(UITableViewStyle)style
//{
//    self = [super initWithStyle:<#style#>];
//    if (self)
//        self.tabBarItem.title = @"PetInfo";
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass: [UITableViewCell class] forCellReuseIdentifier: @"UITableViewCell"];
    
    self.navigationItem.title = @"My Pets";
    UIBarButtonItem *add = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemAdd target: self action: @selector (addNewPet:)];
    self.navigationItem.rightBarButtonItem = add;
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

-(void) viewWillDisappear:(BOOL)animated
{
    BOOL success = [[MyZoo sharedZoo] saveChanges];
    if (success)
    {
        NSLog(@"Saved");
    }
    else
    {
        NSLog(@"Not Saved");
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) addNewPet:(id)sender
{
    MyPet *newPet = [[MyZoo sharedZoo] addPetWithName: @"" birthDate: [NSDate date] weight: 0.0 breed: @"" type: @"DOG" looseWeight: YES obeseProne: YES andNeutered: YES];
    DetailPetInfoViewController *detailInfoView = [[DetailPetInfoViewController alloc] init];
    detailInfoView.aPet = newPet;
    [self.navigationController pushViewController: detailInfoView animated: YES];
    

    
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[MyZoo sharedZoo] allPets];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    MyPet *pet = [MyZoo sharedZoo].myPets[indexPath.row];
    cell.textLabel.text = pet.name;
    
    // Configure the cell...
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //create & push DetailPetInfoViewController *dpivc onto nav controller's stack
    //give detail view controller a pointer to the pet object in row
    DetailPetInfoViewController *detailInfoView = [[DetailPetInfoViewController alloc] init];
    detailInfoView.aPet = [MyZoo sharedZoo].myPets[indexPath.row];
    [self.navigationController pushViewController: detailInfoView animated: YES];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
