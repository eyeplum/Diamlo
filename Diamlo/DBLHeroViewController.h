//
//  DBLHeroViewController.h
//  Diamlo
//
//  Created by eyeplum on 9/19/12.
//  Copyright (c) 2012 eyeplum. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DBLHeroViewController : UIViewController

@property (strong, nonatomic) NSString *battleTag;
@property (strong, nonatomic) NSString *heroID;
@property (strong, nonatomic) IBOutlet UIImageView *head;
@property (strong, nonatomic) IBOutlet UIImageView *shoulders;
@property (strong, nonatomic) IBOutlet UIImageView *torso;
@property (strong, nonatomic) IBOutlet UIImageView *feet;
@property (strong, nonatomic) IBOutlet UIImageView *hands;
@property (strong, nonatomic) IBOutlet UIImageView *legs;
@property (strong, nonatomic) IBOutlet UIImageView *bracers;
@property (strong, nonatomic) IBOutlet UIImageView *mainHand;
@property (strong, nonatomic) IBOutlet UIImageView *offHand;
@property (strong, nonatomic) IBOutlet UIImageView *waist;
@property (strong, nonatomic) IBOutlet UIImageView *rightFinger;
@property (strong, nonatomic) IBOutlet UIImageView *leftFinger;
@property (strong, nonatomic) IBOutlet UIImageView *neck;

@end