//
//  DBLViewController.h
//  Diamlo
//
//  Created by eyeplum on 9/17/12.
//  Copyright (c) 2012 eyeplum. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DBLViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITableView *heroTable;
@property (strong, nonatomic) IBOutlet UILabel *lastPlayed;
@property (strong, nonatomic) NSString *battleTag;
- (IBAction)careerTapped:(UIBarButtonItem *)sender;

@end
