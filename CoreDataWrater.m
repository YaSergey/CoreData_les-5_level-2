//
//  CoreDataWrater.m
//  CoreData_les#5_level#2
//
//  Created by Sergey Yasnetsky on 24.05.15.
//  Copyright (c) 2015 Sergey Yasnetsky. All rights reserved.
//

#import "CoreDataWrater.h"
#import "AppDelegate.h"

@implementation CoreDataWrater


- (NSManagedObjectContext *) managedObjectContext {

    NSManagedObjectContext * context = nil;
    
    id delegate = [[UIApplication sharedApplication] delegate];
    
    if ([delegate performSelector:@selector(managedObjectContext)]) {
       
        context = [delegate managedObjectContext];
    
    }
    return context;
}

- (void) saveData: (NSString * ) entryName Value: (NSString *) name For_Key : (NSString *) key {

    NSManagedObject * newName = [NSEntityDescription insertNewObjectForEntityForName:entryName inManagedObjectContext:[self managedObjectContext]];
    
    [newName setValue:name forKey:key];
    
    NSError * error = nil;
    
    if (![[self managedObjectContext]save:&error]) {
        NSLog(@"Error = %@", error);
        
    }
}

// метод возращает массив с введенными значениями и добавляет его в коредату

- (NSArray *) getData: (NSString * ) entityName Key: (NSString *) key {

    NSMutableArray * array = [[NSMutableArray alloc] init];

    NSFetchRequest * requestData = [[NSFetchRequest alloc]init];
    
    NSEntityDescription * entityData = [NSEntityDescription entityForName:entityName inManagedObjectContext:[self managedObjectContext]];

    [requestData setEntity:entityData];
    
    NSError * error = nil;
    
    NSArray * arrayData = [[self managedObjectContext] executeFetchRequest:requestData error:&error];
    
    for (NSManagedObject * obj in arrayData) {
        
        NSString * value = [obj valueForKey:key];
        
        [array addObject: value];
        
    }
    
    return array;
}


// сохранение изображение в CoreData

- (void) saveNSData: (NSString *) imageFileName Value: (NSData *) data Key: (NSString *) key {

    NSManagedObject * newName = [NSEntityDescription
                                 insertNewObjectForEntityForName:imageFileName inManagedObjectContext:[self managedObjectContext]];
    
    [newName setValue:data forKey:key];
    
    NSError * error = nil;
    
    if (![[self managedObjectContext]save:&error]) {
        NSLog(@"Error = %@", error);
    
        }

}


- (NSData *) get_NSData: (NSString * ) entityName Key: (NSString *) key {
    
    NSData * data = [[NSData alloc] init];
    
    NSFetchRequest * requestData = [[NSFetchRequest alloc]init];
    
    NSEntityDescription * entityData = [NSEntityDescription entityForName:entityName inManagedObjectContext:[self managedObjectContext]];
    
    [requestData setEntity:entityData];
    
    NSError * error = nil;
    
    NSArray * arrayData = [[self managedObjectContext] executeFetchRequest:
                           
                           
    requestData error:&error];
    
    for (NSManagedObject * obj in arrayData) {
        data = [obj valueForKey:key];
        
//        [array addObject: value];
        
    }
    
    return data;
    
}


//  удаление всех данных

- (void) deleteAllData: (NSString *) entityName {

    NSFetchRequest * requestData = [[NSFetchRequest alloc]init];
    
    NSEntityDescription * entityData = [NSEntityDescription entityForName:entityName inManagedObjectContext:[self managedObjectContext]];
    
    [requestData setEntity:entityData];
    
    NSError * error = nil;
    
    NSArray * arrayData = [[self managedObjectContext] executeFetchRequest:
                           
                           
                           requestData error:&error];
    
    for (NSManagedObject * obj in arrayData) {
        
        [[self managedObjectContext] deleteObject: obj];
        }

}
@end
