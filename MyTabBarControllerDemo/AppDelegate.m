//
//  AppDelegate.m
//  MyTabBarControllerDemo
//
//  Created by lmy on 14-9-3.
//  Copyright (c) 2014年 lmy. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    MyTabViewController * rootVC = [[MyTabViewController alloc] init];
    
    
    //  ******  MyTabViewController以vcArray方式传入VC  Begin ******  //
    
   rootVC.bottomDic = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[NSArray arrayWithObjects:@"mainTab.png",@"searchTab.png",@"classTab.png",@"carTab.png", nil],[NSArray arrayWithObjects:@"mainSecTab.png",@"searchSecTab.png",@"classSecTab.png",@"carSecTab.png", nil],[NSArray arrayWithObjects:@"啵币商城",@"搜索",@"品类",@"购物车", nil], nil] forKeys:[NSArray arrayWithObjects:NormalImage,SelectedImage,ItemTitle, nil]];
    
    rootVC.vcArray = [NSArray arrayWithObjects:@"RootViewController",@"FriendsViewController",@"MessageViewController",@"UserViewController", nil];
    UINavigationController * rootNAV = [[UINavigationController alloc] initWithRootViewController:rootVC];
    rootNAV.navigationBar.backgroundColor = [UIColor greenColor];
    [rootNAV setNavigationBarHidden:YES];
    self.window.rootViewController  = rootNAV;
    
    
    //  ******  MyTabViewController以vcArray方式传入VC  End ******  //
    
    
    
    
    //  ******  MyTabViewController以globalVCAry方式传入VC  Begin ******  //
    
    
    //    RootViewController * rVC = [[RootViewController alloc] init];
    //    FriendsViewController * friVC = [[FriendsViewController alloc] init];
    //    MessageViewController * mesVC = [[MessageViewController alloc] init];
    //    UserViewController * userVC = [[UserViewController alloc] init];
    //    rootVC.globalVCAry = [NSArray arrayWithObjects:rVC,friVC ,mesVC,userVC,nil];
    //    self.window.rootViewController  = rootVC;
    
    //  ******  MyTabViewController以globalVCAry方式传入VC  End ******  //
    
    
    //  ****** 系统tabBarController Begin ******  //
    
    
    //    UITabBarController * tabBarController = [[UITabBarController alloc]init];
    //    tabBarController.tabBar.frame = CGRectMake(0,[[UIScreen mainScreen] bounds].size.height-44 , 320, 49);
    //
    //    RootViewController *v1 = [[RootViewController alloc]init];
    //    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:v1];
    //    nav1.tabBarItem.title = @"首页";
    //    [v1.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"mainTab.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"mainSecTab.png"]];
    //
    //    FriendsViewController *v2 = [[FriendsViewController alloc]init];
    //    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:v2];
    //    nav2.tabBarItem.title = @"搜索";
    //    [v2.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"searchTab.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"searchSecTab.png"]];
    //
    //
    //    MessageViewController *v3 = [[MessageViewController alloc]init];
    //    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:v3];
    //     nav3.tabBarItem.title = @"品类";
    //    [v3.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"classTab.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"classSecTab.png"]];
    //
    //    UserViewController *v4 = [[UserViewController alloc]init];
    //    UINavigationController *nav4 = [[UINavigationController alloc]initWithRootViewController:v4];
    //    nav4.tabBarItem.title = @"购物车";
    //    [v4.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"carTab.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"carSecTab.png"]];
    //
    //    tabBarController.viewControllers = [NSArray arrayWithObjects:nav1,nav2,nav3,nav4, nil];
    //
    //    self.window.rootViewController  = tabBarController;
    
    
    //  ******  系统tabBarController  End ******  //
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
