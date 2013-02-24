//
//  DBLItemDeailViewController.h
//  Diamlo
//
//  Created by eyeplum on 9/20/12.
//  Copyright (c) 2012 eyeplum. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DBLItemDeailViewController : UIViewController
@property (strong, nonatomic) NSString *tooltipParams;
@property (strong, nonatomic) NSDictionary *item;
@property (strong, nonatomic) IBOutlet UIImageView *itemImage;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *itemLevel;
@property (strong, nonatomic) IBOutlet UILabel *requiredLevel;
@property (strong, nonatomic) IBOutlet UILabel *dps;
@property (strong, nonatomic) IBOutlet UILabel *attacksPerSecond;
@end