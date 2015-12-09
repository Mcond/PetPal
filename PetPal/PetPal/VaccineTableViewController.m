//  PROGRAMMER:     Curtis Cox
//  PANTHERID:      5001361
//  GROUP:          F
//  CLASS:          COP 465501 TR 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Group Project
//  DUE:            Thursday 12/10/15
//
//  VaccineTableViewController.m
//  PetPal
//
//  Created by Curtis Cox on 12/6/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import "VaccineTableViewController.h"
#import "VaccinesViewController.h"
#import "TableViewCellStyleValue2.h"
#import "HealthLog.h"
#import "HealthRecord.h"

@interface VaccineTableViewController ()

@end

@implementation VaccineTableViewController
@synthesize thisLog;


- (void)viewDidLoad {
    [super viewDidLoad];
    thisLog = [HealthLog defaultHealthLog];
    [self.tableView registerClass:[TableViewCellStyleValue2 class] forCellReuseIdentifier:@"vaccineCell"];
    
    self.navigationItem.title = @"Vaccine History";
    UIBarButtonItem *addButon = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewVaccine)];
    self.navigationItem.rightBarButtonItem = addButon;
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addNewVaccine
{
    VaccinesViewController *vVC = [[VaccinesViewController alloc]init];
    vVC.thisLog = thisLog;
    [self.navigationController pushViewController:vVC animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [thisLog.myLog count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"vaccineCell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    NSString *formattedDate = [dateFormatter stringFromDate: [[thisLog.myLog objectAtIndex:[indexPath row]] dateAdministered]];
    cell.textLabel.text = [[thisLog.myLog objectAtIndex:[indexPath row]] petName];
    NSString *detailText = [NSString stringWithFormat:@"%@ - %@", [[thisLog.myLog objectAtIndex:[indexPath row]] vaccineName], formattedDate];
    cell.detailTextLabel.text = detailText;
    return cell;
}

@end
