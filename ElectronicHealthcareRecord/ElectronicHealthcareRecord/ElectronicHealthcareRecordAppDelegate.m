//
//  ElectronicHealthcareRecordAppDelegate.m
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 11/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import "ElectronicHealthcareRecordAppDelegate.h"
#import "NSDate+DP.h"
@implementation ElectronicHealthcareRecordAppDelegate
@synthesize event;
@synthesize ListOfAppointments;
@synthesize ListOfAppointmentsForDoctor;
@synthesize ListOfappointment_status;
@synthesize ListOfHolidays;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    ListOfAppointmentsForDoctor= [[NSMutableArray alloc]init];
    ListOfAppointments= [[NSMutableArray alloc]init];
    ListOfappointment_status=[[NSMutableDictionary alloc]init];
    ListOfHolidays= [[NSMutableArray alloc]init];
    [ListOfHolidays addObject:@"2014-12-24"];
    [ListOfHolidays addObject:@"2014-12-25"];
    [ListOfHolidays addObject:@"2014-12-26"];
    [ListOfHolidays addObject:@"2014-12-27"];
    NSDate *date = [[NSDate date] dateByAddingYears:0 months:0 days:0];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSArray *index=@[@"Available",@"Waiting",@"Full"];
      NSArray *name=@[@"Allen",@"Joe",@"John"];
    // NSLog(@"%@", [formatter stringFromDate:[NSDate date]]);
    for (int i = 0; i < 10; i++)
    {
        if (arc4random() % 2 > 0)
        {
            
            event = [[DPCalendarEvent alloc] initWithTitle:@"Appointment" startTime:date endTime:[date dateByAddingYears:0 months:0 days:0] description:@"" colorIndex:2];
            [ListOfAppointments addObject:event];
            
        }
        else
        {
            event = [[DPCalendarEvent alloc] initWithTitle:[name objectAtIndex:i%3] startTime:date endTime:[date dateByAddingYears:0 months:0 days:0] description:@"" colorIndex:2];
            [ListOfAppointmentsForDoctor addObject:event];

        }
        
        ;
        [ListOfappointment_status setValue:[index objectAtIndex:i%3] forKey:[formatter stringFromDate:date]];
        date = [date dateByAddingYears:0 months:0 days:2];
    }
    //NSLog(@"ListOfappointment_status %@",ListOfappointment_status);
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
