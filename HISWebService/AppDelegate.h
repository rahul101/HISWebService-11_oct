//
//  AppDelegate.h
//  HISWebService
//
//  Created by Rahul Sharma on 06/05/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WebService;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    IBOutlet UINavigationController *nanigation;
   
}
@property (strong, nonatomic)WebService *web;
@property (strong, nonatomic)NSMutableArray *checkmark;
@property (strong, nonatomic)IBOutlet UIWindow *window;
@property (strong, nonatomic)UINavigationController *nanigation;;
@end
