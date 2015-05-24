//
//  CoreDataWrater.h
//  CoreData_les#5_level#2
//
//  Created by Sergey Yasnetsky on 24.05.15.
//  Copyright (c) 2015 Sergey Yasnetsky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreDataWrater : NSObject



- (void) saveData: (NSString * ) entryName Value: (NSString *) name For_Key : (NSString *) key;

- (NSArray *) getData: (NSString * ) entityName Key: (NSString *) key;

- (void) saveNSData: (NSString *) imageFileName Value: (NSData *) dataValue Key: (NSString *) key;

- (NSData *) get_NSData: (NSString * ) entityName Key: (NSString *) key;

@end
