//
//  AppDelegate.m
//  empty
//
//  Created by echo on 13. 4. 4..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [GMSServices provideAPIKey:@"AIzaSyA_bMr43CvaHdUg0hDwX9-sq6CrHU74W9A"];
    /*
    Person *Namse = [[Person alloc]init];
    Namse.s_ID = @"skatpgus";
    Namse.s_Name = @"남세현";
    Namse.i_Picture = [UIImage imageNamed:@"Namse.jpg"];
     
    Person *Minhwa = [[Person alloc]init];
    Minhwa.s_ID = @"rlaalsghk";
    Minhwa.s_Name = @"김민화";
    Minhwa.i_Picture = [UIImage imageNamed:@"Minhwa.jpg"];
     
    Person *Yenarae = [[Person alloc]init];
    Yenarae.s_ID = @"Yenarae";
    Yenarae.s_Name = @"김예나래";
    Yenarae.i_Picture = [UIImage imageNamed:@"Yenarae.jpg"];
    */
    
    
    // Override point for customization after application launch.
    //MainViewController *MVC = [[MainViewController alloc] init];
    //UINavigationController *UINC = [[UINavigationController alloc] initWithRootViewController:MVC];
    //[self.window addSubview:UINC.view];
    //[self.window makeKeyAndVisible];
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
