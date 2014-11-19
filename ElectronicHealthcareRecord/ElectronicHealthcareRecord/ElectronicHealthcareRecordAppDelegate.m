//
//  ElectronicHealthcareRecordAppDelegate.m
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 11/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import "ElectronicHealthcareRecordAppDelegate.h"

@implementation ElectronicHealthcareRecordAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    UIStoryboard *welcome=[UIStoryboard storyboardWithName:@"Appointments" bundle:nil];
//    UIViewController *initialvc=[welcome instantiateInitialViewController];
//    self.window.rootViewController=initialvc;
    // Override point for customization after application launch.
    
    
//    UINavigationBar navigationBarAppearace = UINavigationBar.appearance()
//    
//    navigationBarAppearace.tintColor = uicolorFromHex(0xffffff)
//    navigationBarAppearace.barTintColor = uicolorFromHex(0x33d685)
//    
//    // change navigation item title color
  //  navigationBarAppearace.titleTextAttributes =[NSForegroundColorAttributeName:UIColor.whiteColor()]
   
    // [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.2 green:0.839 blue:0.522 alpha:1]] ;
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
