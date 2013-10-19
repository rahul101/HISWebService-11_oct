//
//  LogInOutViewController.h
//  HISWebService
//
//  Created by Rahul Sharma on 06/05/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebService.h"
#import "AppDelegate.h"

@interface LogInOutViewController : UIViewController
{
    WebService *WebService;
IBOutlet  UITextField *UserName1;
IBOutlet UITextField *UserPassword;
NSString *username1;
NSString *password1 ;
NSMutableDictionary *dictionnary;
    IBOutlet UILabel *label;
  // @public BOOL userLoggedIn;
   // AppDelegate *myDelegate;
    NSString *ur;
    NSString *pd;
    NSString  *userid;
    NSString  *userpwd;
    UIAlertView *alert;
    IBOutlet UIActivityIndicatorView *activity;
    IBOutlet UIButton *checkbutton;
    NSString *remember;
    UIButton *CheckMark;
}
@property(nonatomic,strong)WebService *WebService;
@property(nonatomic,strong)NSString *LocationId;
@property(nonatomic,strong)IBOutlet  UITextField *UserName1;
@property(nonatomic,strong)IBOutlet  UITextField *UserPassword;
//@property(nonatomic) BOOL userLoggedIn;
-(IBAction)SubmitLogin:(id)sender;
-(IBAction)logOutbtn:(id)sender;
-(void)CheckButton:(id)sender;


@end
