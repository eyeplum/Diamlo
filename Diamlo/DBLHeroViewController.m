//
//  DBLHeroViewController.m
//  Diamlo
//
//  Created by eyeplum on 9/19/12.
//  Copyright (c) 2012 eyeplum. All rights reserved.
//

#import "DBLHeroViewController.h"
#import "DBLAppDelegate.h"
#import "DBLItemDeailViewController.h"
#import "UIImageView+AFNetworking.h"

@interface DBLHeroViewController ()

@property (strong, nonatomic) NSDictionary *hero;
@property (strong, nonatomic) NSArray *items;
@property (strong, nonatomic) NSDictionary *itemImages;
@property (strong, nonatomic) NSDictionary *itemNameMap;

@end

@implementation DBLHeroViewController

#pragma mark - View Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.items = @[@"head", @"shoulders", @"torso", @"feet", @"hands", @"legs", @"bracers", @"mainHand", @"offHand", @"waist", @"rightFinger", @"leftFinger", @"neck"];
    self.itemNameMap = @{@"head":@"Head", @"shoulders":@"Shoulders", @"torso":@"Torso", @"feet":@"Feet", @"hands":@"Hands", @"legs":@"Legs", @"bracers":@"Bracers", @"mainHand":@"Main Hand", @"offHand":@"Off Hand", @"waist":@"Waist", @"rightFinger":@"Right Finger", @"leftFinger":@"Left Finger", @"neck":@"Neck"};
    self.itemImages = @{@"head":self.head, @"shoulders":self.shoulders, @"torso":self.torso, @"feet":self.feet, @"hands":self.hands, @"legs":self.legs, @"bracers":self.bracers, @"mainHand":self.mainHand, @"offHand":self.offHand, @"waist":self.waist, @"rightFinger":self.rightFinger, @"leftFinger":self.leftFinger, @"neck":self.neck};
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Hero Loader
- (void)reloadHeroProfile
{
    self.title = [self.hero objectForKey:@"name"];
   
    
    for (NSString *item in self.items) {
         NSString *imageURLString = [NSString stringWithFormat:@"http://us.media.blizzard.com/d3/icons/items/large/%@.png", [[[self.hero objectForKey:@"items"] objectForKey:item] objectForKey:@"icon"]];
        
        UIImageView *itemImage = [self.itemImages objectForKey:item];
        [itemImage setImageWithURL:[NSURL URLWithString:imageURLString]];
                
        UIButton *itemButton = [UIButton buttonWithType:UIButtonTypeCustom];
        itemButton.frame = itemImage.frame;
        itemButton.tag = [self.items indexOfObject:item];
        [itemButton addTarget:self action:@selector(itemPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:itemButton];
    }
}

#pragma mark - Perform Segue
- (void)itemPressed:(UIButton *)sender
{
    [self performSegueWithIdentifier:@"ViewItemDetail" sender:sender];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ViewItemDetail"]) {
        DBLItemDeailViewController *vc = [segue destinationViewController];
        NSString *itemKind = [self.items objectAtIndex:[(UIButton *)sender tag]];
        vc.title = [self.itemNameMap objectForKey:itemKind];
        vc.tooltipParams = [[[self.hero objectForKey:@"items"] objectForKey:itemKind] objectForKey:@"tooltipParams"];
    }
}

@end
