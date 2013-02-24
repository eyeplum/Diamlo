//
//  DBLLoginViewController.h
//  Diamlo
//
//  Created by eyeplum on 9/19/12.
//  Copyright (c) 2012 eyeplum. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DBLLoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *battleTag;
@property (weak, nonatomic) IBOutlet UITextField *battleTagNum;
- (IBAction)setSampleBattleTag:(UIButton *)sender;

@end
