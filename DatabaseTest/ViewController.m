//
//  ViewController.m
//  DatabaseTest
//
//  Created by Oscar David Gallon Rosero on 3/1/16.
//  Copyright © 2016 Oscar David Gallon Rosero. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dbManager = [[DBManager alloc] initDatabase];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)getInfo:(id)sender{
    NSString *query = @"select * from contacts";
    NSArray *myArray = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
    NSArray *single = [[NSArray alloc]initWithArray:(NSArray*)[myArray objectAtIndex:0]];
    
    NSLog(@"first person name %@", [[myArray objectAtIndex:0] objectAtIndex:1]);
    
}

- (IBAction)saveInfo:(id)sender{
    // Prepare the query string.
    NSString *query =
    [NSString stringWithFormat:@"INSERT INTO CONTACTS (name,phonenumber) VALUES('%@','%@')",@"oscar",@"3104206878"];
    
     [self.dbManager executeQuery:query];
    
   
    // If the query was successfully executed then pop the view controller.
    if (self.dbManager.affectedRows != 0) {
        NSLog(@"Query was executed successfully. Affected rows = %d", self.dbManager.affectedRows);
        
        // Pop the view controller.
        [self.navigationController popViewControllerAnimated:YES];
    }
    else{
        NSLog(@"Could not execute the query.");
    }
}

@end
