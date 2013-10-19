//
//  AppDelegate.m
//  HISWebService
//
//  Created by Rahul Sharma on 06/05/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import "AppDelegate.h"
#import "AllCategoryViewController.h"

@implementation AppDelegate
@synthesize nanigation,web,checkmark;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  //  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    self.web=[[WebService alloc]init];
    [self.web authentication:@"http://192.168.1.202:81/CredentialsModule/CredentialService.asmx/IsUserAuthenticated"];
    NSString *chk= [self.web.data_dic valueForKey:@"d"];
    if ([chk isEqualToString:@"true"]) {
        AllCategoryViewController *all=[[AllCategoryViewController alloc]init];
        [self.window setRootViewController:nanigation];
      
        [self.nanigation pushViewController:all animated:YES];
        //[self.window setRootViewController:arr];
        // [self.nanigation setViewControllers:[[NSUserDefaults standardUserDefaults]valueForKey:@"all"]];
    }
    else
    {
        // [self.window addSubview:nanigation.view];
        [self.window setRootViewController:nanigation];
        // [self.window addSubview:nanigation.view];
    }
      [self.window makeKeyAndVisible];
    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
    checkmark=[[NSMutableArray alloc]init];
    
        return YES;
}
void uncaughtExceptionHandler(NSException *exception)
{
    NSLog(@"CRASH: %@", exception);
    NSLog(@"Stack Trace: %@", [exception callStackSymbols]);
    // Internal error reporting
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
    
//    NSArray *arr=[nanigation viewControllers] ;
//    
//    NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
//    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:[arr objectAtIndex:1]];
//    NSLog(@"data %@",data);
//    [user setObject:data forKey:@"all"];
//    [user synchronize];
    
    
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
//    NSArray *arr=[nanigation viewControllers] ;
//    
//    NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
//    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:[arr objectAtIndex:1]];
//    NSLog(@"data %@",data);
//    [user setObject:data forKey:@"all"];
//    [user synchronize];
}

@end
