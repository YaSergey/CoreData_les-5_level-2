//
//  ImageViewController.m
//  CoreData_les#5_level#2
//
//  Created by Sergey Yasnetsky on 24.05.15.
//  Copyright (c) 2015 Sergey Yasnetsky. All rights reserved.
//

#import "ImageViewController.h"
#import "CoreDataWrater.h"


@interface ImageViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)saveImage:(id)sender;

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.imageView.image = [UIImage imageNamed:@"blueEyes.jpg"];
    
//    NSData * imageData = UIImagePNGRepresentation(self.imageView.image);
    
//    NSLog(@"imageData %@", imageData);
    

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

- (IBAction)saveImage:(id)sender {
    
    NSData * imageData = UIImagePNGRepresentation(self.imageView.image);

    NSDictionary * dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"Sergey", @"name", @"30", @"age", imageData, @"image", nil];

    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:dict];
    
    CoreDataWrater * core = [CoreDataWrater new];
    [core saveNSData:@"Person" Value:data Key:@"data"];
    
}
@end
