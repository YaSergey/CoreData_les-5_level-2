//
//  NewDetailViewController.m
//  CoreData_les#5_level#2
//
//  Created by Sergey Yasnetsky on 24.05.15.
//  Copyright (c) 2015 Sergey Yasnetsky. All rights reserved.
//

#import "NewDetailViewController.h"
#import "CoreDataWrater.h"


@interface NewDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)showImage:(id)sender;

@end

@implementation NewDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)showImage:(id)sender {

    CoreDataWrater * core = [CoreDataWrater new];
    NSData * data = [core get_NSData:@"Person" Key:@"data"];
    
    NSDictionary * dict = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    NSLog(@"name %@ age %@", [dict valueForKey:@"name"], [dict valueForKey:@"age"]);
    
    UIImage * image = [UIImage imageWithData:[dict valueForKey:@"image"]];
    
    self.imageView.image = image;
    

}
@end
