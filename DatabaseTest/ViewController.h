//
//  ViewController.h
//  DatabaseTest
//
//  Created by Oscar David Gallon Rosero on 3/1/16.
//  Copyright © 2016 Oscar David Gallon Rosero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"
#import "ContacsManager.h"

@interface ViewController : UIViewController 
@property (nonatomic, strong) NSMutableArray *contacts;
@property (nonatomic, strong) DBManager *dbManager;
@property (nonatomic, strong) ContacsManager *contacsManager;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *button;
@property (weak, nonatomic) IBOutlet UIButton *Dos;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UILabel *resultsLabel;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
-(IBAction)getInfo:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;

- (IBAction)saveInfo:(id)sender;

-(NSInteger) tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section;
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;
-(UITableViewCell *)tableView:(UITableView*) tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath;
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
@end

