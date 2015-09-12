//
//  UserViewController.m
//  MyXmppDemo
//
//  Created by lmy on 14-8-27.
//  Copyright (c) 2014年 lmy. All rights reserved.
//

#import "UserViewController.h"

@interface UserViewController ()

@end

@implementation UserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = @"UserViewController";
    NSLog(@"UserViewController viewWillAppear");
    
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"UserViewController viewDidAppear");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor blueColor];
    NSLog(@"UserViewController viewDidLoad");
    [self performSelector:@selector(pushLoginVC) withObject:nil afterDelay:5];
    // Do any additional setup after loading the view.
}
-(void)pushLoginVC
{
    UINavigationController *rootNAV = (UINavigationController *)[[[[UIApplication sharedApplication] delegate] window] rootViewController];
    LoginViewController * logVC = [[LoginViewController alloc] init];
    [rootNAV pushViewController:logVC animated:YES];
//    [self.navigationController pushViewController:logVC animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dealloc
{
    NSLog(@"UserViewController dealloc");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
