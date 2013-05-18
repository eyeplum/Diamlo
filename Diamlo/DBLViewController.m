//
//  DBLViewController.m
//  Diamlo
//
//  Created by eyeplum on 9/17/12.
//  Copyright (c) 2012 eyeplum. All rights reserved.
//

#import "DBLViewController.h"
#import "DBLAppDelegate.h"
#import "Hero.h"
#import "Career.h"


static NSString *ProfileCell = @"Profile Cell";

@interface DBLViewController () <NSFetchedResultsControllerDelegate, UITableViewDelegate, UITableViewDataSource>
@property (strong) NSFetchedResultsController *fetchedResultsController;
@end

@implementation DBLViewController


#pragma mark - View Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];

    DBLAppDelegate *appDelegate = (DBLAppDelegate *) [[UIApplication sharedApplication] delegate];

    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Career"];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"battleTag" ascending:NO]];

    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                                        managedObjectContext:appDelegate.managedObjectContext
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:@"career"];
    self.fetchedResultsController.delegate = self;
    [self.fetchedResultsController performFetch:nil];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.heroTable reloadData];
}


#pragma mark - Prepare For Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // ...
}


#pragma mark - UITableView Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.fetchedResultsController sections][(NSUInteger) section] numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ProfileCell];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_bg.png"]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    Career *career = [self.fetchedResultsController objectAtIndexPath:indexPath];

    cell.textLabel.text = career.battleTag;
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.backgroundColor = [UIColor clearColor];

    cell.detailTextLabel.text = [[NSDate dateWithTimeIntervalSince1970:[career.lastUpdated doubleValue]] description];
    cell.detailTextLabel.textColor = [UIColor darkGrayColor];
    cell.detailTextLabel.backgroundColor = [UIColor clearColor];
    cell.detailTextLabel.shadowOffset = CGSizeMake(0, 1);
    cell.detailTextLabel.shadowColor = [UIColor blackColor];

    return cell;
}


#pragma mark - UITableView Delegate Methods
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 105;
}

@end
