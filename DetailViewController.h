//
//  DetailViewController.h
//  CoreData_les#5_level#2
//
//  Created by Sergey Yasnetsky on 24.05.15.
//  Copyright (c) 2015 Sergey Yasnetsky. All rights reserved.
//

#import "ViewController.h"



@interface DetailViewController : ViewController <UITextFieldDelegate>

@property (nonatomic, assign) BOOL isNew;
@property (nonatomic, strong) NSString * value;


@end
