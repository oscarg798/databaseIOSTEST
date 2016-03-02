//
//  DBManager.h
//  DatabaseTest
//
//  Created by Oscar David Gallon Rosero on 3/1/16.
//  Copyright © 2016 Oscar David Gallon Rosero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DBManager : NSObject

/**Variable para tener el directorio de la base de datos**/
@property (nonatomic, strong) NSString *documentsDirectory;

/**Variable para tener el nombre del archivo de la base de datos**/
@property (nonatomic, strong) NSString *databaseFilename;

/**Array de objectos, se obtinen de db**/
@property (nonatomic, strong) NSMutableArray *arrResults;

@property (nonatomic, strong) NSMutableArray *arrColumnNames;

@property (nonatomic) int affectedRows;

@property (nonatomic) long long lastInsertedRowID;
-(void)copyDatabaseIntoDocumentsDirectory;

-(instancetype)initDatabase;

-(void)runQuery:(const char *)query isQueryExecutable:(BOOL)queryExecutable;

-(NSArray *)loadDataFromDB:(NSString *)query;

-(void)executeQuery:(NSString *)query;



@end
