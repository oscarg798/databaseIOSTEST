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

NSArray *myArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.contacsManager = [[ContacsManager alloc] init];
    self.contacts =  [self.contacsManager retreivePhoneContacts];
    self.tableView.delegate = self;
    
    self.dbManager = [[DBManager alloc] initDatabase];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)getInfo:(id)sender{
    NSString *query = @"select * from contacts";
    NSString *text;
     myArray = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
    /**for(NSArray* contact in myArray){
     text = [NSString stringWithFormat:@"Nombre: %@, telefono: %@ \n", [contact objectAtIndex:1], [contact objectAtIndex:2]];
     
     [self.resultsLabel setText:[[self.resultsLabel text]stringByAppendingString:text]];
     }**/
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = 50;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.dataSource =self;
    
    [self.tableView reloadData];
    
    [self.view addSubview:self.tableView];
    
    NSLog(@"first person name %@", [[myArray objectAtIndex:0] objectAtIndex:1]);
    
}

- (IBAction)saveInfo:(id)sender{
    // Prepare the query string.
    
    for(NSDictionary *json in self.contacts){
         
        NSString *name = (NSString*)[json objectForKey:@"firstName"];
        NSString *lastNAme =(NSString*)[json objectForKey:@"lastName"];
        NSString *phoneNumbeR =(NSString*)[json objectForKey:@"phone"];
        NSString *identifier = (NSString *)[json objectForKey:@"identifier"];
        NSString *query =
        [NSString stringWithFormat:@"INSERT INTO CONTACTS (id, name, phonenumber) VALUES('%@','%@ %@','%@')",identifier, name, lastNAme,phoneNumbeR];
        
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
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [myArray count];
    
}

-(NSInteger) tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section{
    return [myArray count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    // The header for the section is the region name -- get this from the region at the section index.
    NSString *name = [[myArray objectAtIndex:section] objectAtIndex:1];
    return name;
}


-(UITableViewCell *)tableView:(UITableView*) tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    static NSString * simpleTableIdentifier = @"SimpleTableItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if(cell ==nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:simpleTableIdentifier];
    }
    cell.textLabel.text = [[myArray objectAtIndex:indexPath.row] objectAtIndex:1];
    return cell;
}

@end
