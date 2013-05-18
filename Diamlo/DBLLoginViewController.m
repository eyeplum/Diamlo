//
//  DBLLoginViewController.m
//  Diamlo
//
//  Created by eyeplum on 9/19/12.
//  Copyright (c) 2012 eyeplum. All rights reserved.
//

#import "DBLLoginViewController.h"
#import "DBLAppDelegate.h"
#import "DBLViewController.h"

@interface DBLLoginViewController ()

@end

@implementation DBLLoginViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // ...
}

@end
