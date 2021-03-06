//
//  ESAppDelegate.m
//  Entries
//
//  Created by Joshua Howland on 5/30/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "ESAppDelegate.h"
#import "Entry.h"

@implementation ESAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
   
    NSArray * entriesFromDefaults = [self retrieveEntriesFromDefaults];
    NSMutableArray * mutableEntreiesFromDefaults = [NSMutableArray arrayWithArray:entriesFromDefaults];
    
    NSMutableDictionary * entryDictionary = [NSMutableDictionary dictionary];
    [entryDictionary setValue:@"Our First Entry" forKey:@"title"];
    [entryDictionary setValue:@"This Would Be The Text" forKey:@"text"];
    [entryDictionary setValue:[NSDate date] forKey:@"timeStamp"];
    
    Entry * entry = [[Entry alloc] initWithDictionary:entryDictionary];
    
    [mutableEntreiesFromDefaults addObject:entry];
    
    [self storeEntriesToDefaults:mutableEntreiesFromDefaults];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (NSArray *)retrieveEntriesFromDefaults {
    NSArray * entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:@"entries"];
    
    NSMutableArray * mutableEntries = [NSMutableArray array];
    for (NSDictionary * entryDictionary in entryDictionaries) {
        Entry *entry = [[Entry alloc] initWithDictionary:entryDictionary];
        [mutableEntries addObject:entry];
    }
    return mutableEntries;
}

-(void)storeEntriesToDefaults: (NSArray *)entries {
    NSMutableArray *mutableEntryDictionaries = [NSMutableArray array];
    
    for (Entry *entry in entries) {
        NSDictionary *entryDictionary = [entry entryDictionary];
        [mutableEntryDictionaries addObject:entryDictionary];
        
    }
    [[NSUserDefaults standardUserDefaults] setObject:mutableEntryDictionaries forKey:@"entries"];
    [[NSUserDefaults standardUserDefaults] synchronize];
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
