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

#define NameLabel 901
#define LevelLabel 902
#define ClassLabel 903
#define HardcoreLabel 904
#define DeadLabel 905

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
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Hero"];
    fetchRequest.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"level" ascending:NO]];
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                                        managedObjectContext:appDelegate.managedObjectContext
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:@"heros"];
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

    Hero *hero = [self.fetchedResultsController objectAtIndexPath:indexPath];

    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = hero.name;

    cell.detailTextLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.backgroundColor = [UIColor clearColor];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Lv.%@", hero.level];

    return cell;
}


#pragma mark - UITableView Delegate Methods
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 105;
}

@end
