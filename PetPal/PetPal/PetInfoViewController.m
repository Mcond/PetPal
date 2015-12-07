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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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


@end
