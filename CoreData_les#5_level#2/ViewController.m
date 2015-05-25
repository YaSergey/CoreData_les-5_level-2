//
//  ViewController.m
//  CoreData_les#5_level#2
//
//  Created by Sergey Yasnetsky on 24.05.15.
//  Copyright (c) 2015 Sergey Yasnetsky. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"


@interface ViewController ()

@property (nonatomic, strong) NSArray * arrayEvents;
- (IBAction)newAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

//    self.arrayEvents  = [[NSArray alloc] initWithObjects:@"AAA", nil];
    
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// метед перезагрузки экрана перед его появлением
- (void) viewWillAppear:(BOOL)animated {

   
    CoreDataWrater * core = [CoreDataWrater new];
    
    self.arrayEvents = [core getData:@"UserProfile" Key:@"userName"];
    
    NSLog(@"core= %@", [core getData:@"UserProfile" Key:@"userName"]);
    
    [self.tableView reloadData];


}

#pragma mark UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.arrayEvents.count;
    

}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    NSString * idintifier = @"Cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier: idintifier];
    cell.textLabel.text = [self.arrayEvents objectAtIndex:indexPath.row];
    
    return cell;
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    DetailViewController * detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Detail"];
    
    detail.isNew = NO;
    detail.value = [self.arrayEvents objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:detail animated:YES];
    

}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {

}


- (void) reloadTableView {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
    });
}


- (IBAction)newAction:(id)sender {
    
    DetailViewController * detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Detail"];
    
    detail.isNew = YES;
    
    [self.navigationController pushViewController:detail animated:YES];
    
//    [self reloadTableView];
}
@end
