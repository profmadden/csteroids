//
//  SplashViewController.m
//  csteroids
//
//  Created by Patrick Madden on 2/17/19.
//  Copyright © 2019 SUNY Binghamton. All rights reserved.
//

#import "SplashViewController.h"

@interface SplashViewController ()

@end

@implementation SplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)backToFirstVC:(UIStoryboardSegue *)segue
{
    NSLog(@"Back at the main screen.");
}

@end
