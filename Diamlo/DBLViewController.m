//
//  DBLViewController.m
//  Diamlo
//
//  Created by eyeplum on 9/17/12.
//  Copyright (c) 2012 eyeplum. All rights reserved.
//

#import "DBLViewController.h"
#import "DBLAppDelegate.h"
#import "DBLHeroViewController.h"

#define NameLabel 901
#define LevelLabel 902
#define ClassLabel 903
#define HardcoreLabel 904
#define DeadLabel 905

@interface DBLViewController ()

@property (strong) NSArray *heros;
@property (strong) NSDictionary *displayMapping;
@property (strong) NSDictionary *career;

@end

@implementation DBLViewController


#pragma mark - View Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];


}

- (void)viewDidDisappear:(BOOL)animated
{
    NSIndexPath *selected = [self.heroTable indexPathForSelectedRow];
    if (selected) [self.heroTable deselectRowAtIndexPath:selected animated:true];
    
    [super viewDidDisappear:animated];
}

- (IBAction)careerTapped:(UIBarButtonItem *)sender {
    
}

#pragma mark - Prepare For Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ViewHeroDetail"]) {
        DBLHeroViewController *vc = [segue destinationViewController];
        vc.battleTag = self.battleTag;
        
        NSIndexPath *path = [self.heroTable indexPathForSelectedRow];
        vc.heroID = [NSString stringWithFormat:@"%@", [[self.heros objectAtIndex:path.row] objectForKey:@"id"]];
    }
//    else if ([[segue identifier] isEqualToString:@"ModalCareer"]) {
//        DBLCareerViewController *vc = [segue destinationViewController];
//        vc.career = self.career;
//    }
}


#pragma mark - UITableView Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.heros count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ProfileCell = @"Profile Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ProfileCell];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ProfileCell];
    }
    
    if (cell.selected) {
        cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_bg_selected.png"]];
    } else {
        cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_bg.png"]];
    }
    
    NSString *name = [NSString stringWithFormat:@"%@", [[self.heros objectAtIndex:indexPath.row] objectForKey:@"name"]];
    NSString *level = [NSString stringWithFormat:@"Level %@", [[self.heros objectAtIndex:indexPath.row] objectForKey:@"level"]];
    NSString *class = [NSString stringWithFormat:@"%@", [[self.heros objectAtIndex:indexPath.row] objectForKey:@"class"]];
    NSString *hardCore = [NSString stringWithFormat:@"%@", [[self.heros objectAtIndex:indexPath.row] objectForKey:@"hardcore"]];
    NSString *dead = [NSString stringWithFormat:@"%@", [[self.heros objectAtIndex:indexPath.row] objectForKey:@"dead"]];
    
    [(UITextField *)[cell viewWithTag:NameLabel] setText:name];
    [(UITextField *)[cell viewWithTag:LevelLabel] setText:level];
    [(UITextField *)[cell viewWithTag:ClassLabel] setText:[[self.displayMapping objectForKey:@"class"] objectForKey:class]];
    [(UITextField *)[cell viewWithTag:HardcoreLabel] setText:[[self.displayMapping objectForKey:@"hardcore"] objectForKey:hardCore]];
    [(UITextField *)[cell viewWithTag:DeadLabel] setText:[[self.displayMapping objectForKey:@"dead"] objectForKey:dead]];
    
    return cell;
}


#pragma mark - UITableView Delegate Methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_bg_selected.png"]];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Hello");
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_bg.png"]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 105;
}

@end
