//
//  ViewController.h
//  DatabaseTest
//
//  Created by Oscar David Gallon Rosero on 3/1/16.
//  Copyright © 2016 Oscar David Gallon Rosero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"

@interface ViewController : UIViewController
@property (nonatomic, strong) DBManager *dbManager;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *button;
@property (weak, nonatomic) IBOutlet UIButton *Dos;

-(IBAction)getInfo:(id)sender;

- (IBAction)saveInfo:(id)sender;
@end

