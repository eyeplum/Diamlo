//
//  DBLAddCareerViewController.m
//  Diamlo
//
//  Created by eyeplum on 5/19/13.
//  Copyright (c) 2013 eyeplum. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "DBLAddCareerViewController.h"
#import "DBLAppDelegate.h"


@interface DBLAddCareerViewController ()

@property (strong, nonatomic) IBOutlet UITextField *battleTag;
- (IBAction)addCareer:(id)sender;
- (IBAction)cancel:(id)sender;

@end

@implementation DBLAddCareerViewController

- (IBAction)addCareer:(id)sender {
    DBLAppDelegate *appDelegate = (DBLAppDelegate *) [[UIApplication sharedApplication] delegate];

    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Career"];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"lastUpdated" ascending:YES]];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"battleTag == %@", [NSString stringWithFormat:@"%@", self.battleTag.text]];
    [appDelegate.managedObjectContext executeFetchRequest:fetchRequest error:nil];

    NSLog(@"Fetching BattleTag: %@", self.battleTag.text);

    [self cancel:self];
}


- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
