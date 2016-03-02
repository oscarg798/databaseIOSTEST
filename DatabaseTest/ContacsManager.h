//
//  ContacsManager.h
//  DatabaseTest
//
//  Created by oscar.gallon on 2/03/16.
//  Copyright © 2016 Oscar David Gallon Rosero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Contacts/Contacts.h>

@interface ContacsManager : NSObject
@property (nonatomic, strong) NSMutableArray* contactsRetreived;
@property (nonatomic,strong) NSDictionary *jsonDictionary;

- (NSMutableArray*) retreivePhoneContacts;
- (void) contactScan;
- (void)parseContactWithContact :(CNContact* )contact;
- (NSMutableArray *)parseAddressWithContac: (CNContact *)contact;
@end
