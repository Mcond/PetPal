//
//  FleaTickTableViewController.m
//  PetPal
//
//  Created by Curtis Cox on 12/6/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import "FleaTickTableViewController.h"
#import "FleaTickViewController.h"
#import "TableViewCellStyleValue2.h"
#import "FleaTickLog.h"
#import "HealthRecord.h"


@interface FleaTickTableViewController ()

@end

@implementation FleaTickTableViewController
@synthesize thisLog;


- (void)viewDidLoad {
    [super viewDidLoad];
    thisLog = [FleaTickLog defaultFleaTickLog];
    [self.tableView registerClass:[TableViewCellStyleValue2 class] forCellReuseIdentifier:@"fleaTickCell"];
    
    self.navigationItem.title = @"Pest Treatment History";
    UIBarButtonItem *addButon = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewTreatment)];
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

-(void)addNewTreatment
{
    FleaTickViewController *fTVC = [[FleaTickViewController alloc]init];
    fTVC.thisLog = thisLog;
    [self.navigationController pushViewController:fTVC animated:YES];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fleaTickCell" forIndexPath:indexPath];
    
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
