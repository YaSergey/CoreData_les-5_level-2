//
//  DetailViewController.m
//  CoreData_les#5_level#2
//
//  Created by Sergey Yasnetsky on 24.05.15.
//  Copyright (c) 2015 Sergey Yasnetsky. All rights reserved.
//

#import "DetailViewController.h"
#import "CoreDataWrater.h"


@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!self.isNew) {
        
        self.textField.text = self.value;

    }
    


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//  
- (BOOL)textFieldShouldReturn:(UITextField *)textField {

    
    CoreDataWrater * core = [CoreDataWrater new];
    [core saveData:@"Person" Value:textField.text For_Key:@"name"];
    
    
    ViewController * reloadTable = [ViewController new];
    [reloadTable reloadTableView ];
    
    return YES;

}

//
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
