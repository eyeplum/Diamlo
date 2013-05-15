//
//  DBLItemDeailViewController.m
//  Diamlo
//
//  Created by eyeplum on 9/20/12.
//  Copyright (c) 2012 eyeplum. All rights reserved.
//

#import "DBLItemDeailViewController.h"
#import "DBLAppDelegate.h"
#import "UIImageView+AFNetworking.h"

@interface DBLItemDeailViewController ()
@property (strong, nonatomic) NSDictionary *colorMap;
@end

@implementation DBLItemDeailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.colorMap = @{ @"yellow" : [UIColor colorWithRed:0.873 green:0.872 blue:0.002 alpha:1.000],
                       @"blue"   : [UIColor colorWithRed:0.081 green:0.214 blue:1.000 alpha:1.000],
                       @"white"  : [UIColor whiteColor],
                       @"gray"   : [UIColor colorWithWhite:0.576 alpha:1.000],
                       @"orange" : [UIColor colorWithRed:0.655 green:0.418 blue:0.001 alpha:1.000],
                       @"green"  : [UIColor colorWithRed:0.002 green:0.833 blue:0.004 alpha:1.000] };
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reloadItemDetail
{
    NSString *imageURLString = [NSString stringWithFormat:@"http://us.media.blizzard.com/d3/icons/items/large/%@.png",
                                [self.item objectForKey:@"icon"]];
    [self.itemImage setImageWithURL:[NSURL URLWithString:imageURLString]];
    
    self.name.text = [self.item objectForKey:@"name"];
    self.name.textColor = [self.colorMap objectForKey:[self.item objectForKey:@"displayColor"]];
    self.itemLevel.text = [NSString stringWithFormat:@"Item Level: %@", [self.item objectForKey:@"itemLevel"]];
    self.requiredLevel.text = [NSString stringWithFormat:@"Required Level: %@", [self.item objectForKey:@"requiredLevel"]];
    
    if ([self.title isEqualToString:@"Main Hand"] || [self.title isEqualToString:@"Off Hand"]) {
        self.dps.text = [NSString stringWithFormat:@"DPS: %.2f", [[[self.item objectForKey:@"dps"] objectForKey:@"max"] doubleValue]];
        self.attacksPerSecond.text = [NSString stringWithFormat:@"Attack Speed: %.2f", [[[self.item objectForKey:@"attacksPerSecond"] objectForKey:@"max"] doubleValue]];
    } else {
        // TODO: Change displayed attributs according to item type...
    }
}

@end
