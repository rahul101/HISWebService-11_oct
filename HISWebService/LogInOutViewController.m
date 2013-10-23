//
//  LogInOutViewController.m
//  HISWebService
//
//  Created by Rahul Sharma on 06/05/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import "LogInOutViewController.h"
#import "PatientLabDetailsViewController.h"

#import "AllCategoryViewController.h"
#import "SBJsonParser.h"
#import "Shared.h"
#import <QuartzCore/QuartzCore.h>
@interface LogInOutViewController ()

@end

@implementation LogInOutViewController
 @synthesize  WebService =_WebService;
@synthesize UserName1,UserPassword,LocationId;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    activity.hidden=YES;
    self.WebService = [[WebService alloc] init];
    UserName1.text=@"cloudchowk";
    UserPassword.text=@"chowk@123";
    remember=@"false";
    
    CheckMark=[[UIButton alloc]initWithFrame:CGRectMake(10,280,30,30)];
   // CheckMark.backgroundColor=[UIColor grayColor];
    [CheckMark setImage:[UIImage imageNamed:@"imagesCheck"]forState:UIControlStateSelected];
    [CheckMark setImage:[UIImage imageNamed:@""]forState:UIControlStateNormal];

    [CheckMark addTarget:self action:@selector(CheckButton:)forControlEvents:UIControlEventTouchUpInside];
    CheckMark.tag=4;
    CALayer *imageLayer = CheckMark.layer;
    [imageLayer setCornerRadius:05];
    [imageLayer setBorderWidth:1];
    imageLayer.borderColor=[[UIColor lightGrayColor] CGColor];
    [self.view addSubview:CheckMark];
    
//    //if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
//    
//  // self.view.autoresizesSubviews = YES;
//  //self.view.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
////    
////    [UserName1 setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
////   UserName1.autoresizesSubviews = YES;
////
////    [UserPassword setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
////    UserName1.autoresizesSubviews = YES;
////
////   NSString *reguser=_usereg.text;
// //   NSString *regpd=_pwsrdreg.text;
//    //   username1 = UserName.text;
//    //  password1 = UserPassword.text;
//
////    userid=[[NSUserDefaults standardUserDefaults]stringForKey:@"UserName1"];
//   // userpwd=[[NSUserDefaults standardUserDefaults]stringForKey:@"UserPassword"];
//
//  //  NSLog(@"userid %@",userid);
//  //  NSLog(@"userpass %@",userpwd);
//    
//   /* NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
//    [user setObject:username1 forKey :@"UserName"];
//    [user setObject:password1 forKey :@"UserPassword"];
//    [[NSUserDefaults standardUserDefaults]synchronize];
//    ur =[user objectForKey:@"UserName"];
//    pd=[user objectForKey:@"UserPassword"];
//    NSLog(@"usernme %@",ur);
//    NSLog(@"passwrd %@",pd);*/
//
//  //  myDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
//    
// //   userLoggedIn = YES;
//
    // Do any additional setup after loading the view from its nib.
}
-(void)CheckButton:(id)sender
{
    UIButton *btn=(UIButton*)sender;
    
    if(btn.selected)
    {
         remember=@"false";
         btn.selected=NO;
        
    }
    else
    {
        remember=@"true";
        btn.selected=YES;
        
    }
    
}
-(IBAction)SubmitLogin:(id)sender
{
    activity.hidden=NO;
    if([activity isAnimating])
        [activity stopAnimating];
    else
        [activity startAnimating];

 //   username1 = UserName1.text;
     username1=UserName1.text;
     password1 =UserPassword.text;
    
    NSLog(@"user is %@",username1);
    NSLog(@"user is %@",self.WebService->use=username1);
    NSLog(@"user is %@",self.WebService->rember=remember);
     
// password1 = UserPassword.text;
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    if (![defaults objectForKey:@"UserName"]) {
//        
//        //Load Login View if no username is found
//        NSLog(@"No username found");
//      //  LoginViewController *loginView = [[LoginViewController alloc] init];
//       // [self presentViewController:loginView animated:YES completion:nil];
//    }
//    
//    else {
//        
//        NSString *savedUsername = [defaults stringForKey:@"UserName"];
//        NSLog(@"Username found: %@", savedUsername);
//        
//    }
    
    NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
    [user setObject:username1 forKey :@"UserName1"];
    [user setObject:password1 forKey :@"UserPassword"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    ur =[user objectForKey:@"UserName1"];
    pd=[user objectForKey:@"UserPassword"];
    NSLog(@"usernme %@",ur);
    NSLog(@"passwrd %@",pd);

    NSLog(@"user is %@",self.WebService->pass=password1);
   // [self.Credential LogIn:username1  and:password1];
    [self.WebService CallService:@"http://192.168.1.202:81/CredentialsModule/CredentialService.asmx/LogInUser"];
    
       
    NSDictionary *location = [NSJSONSerialization JSONObjectWithData:[self.WebService.ptr dataUsingEncoding:NSUTF8StringEncoding]
                                                             options:NSJSONReadingMutableContainers error:nil];
      NSLog(@"location id is %@",location);
    
    
    
    Shared *shared=[Shared sharedUser];
    
    shared.LocationId=[NSString stringWithFormat:@"%@",[location valueForKey:@"LocationId"]];
    shared.ApplicationId=[NSString stringWithFormat:@"%@",[location valueForKey:@"ApplicationId"]];
    NSUserDefaults *locationid=[NSUserDefaults standardUserDefaults];
    [locationid setObject:shared.LocationId forKey:@"branch"];
    [locationid synchronize];
    
    NSUserDefaults *applicationid=[NSUserDefaults standardUserDefaults];
    [applicationid setObject:shared.ApplicationId forKey:@"ApplicationId"];
    [applicationid synchronize];

    
     shared.BranchID=[NSString stringWithFormat:@"%@",[location valueForKey:@"BranchId"]];
    
    NSLog(@"location id is %@", shared.LocationId);
    
    NSLog(@"location id is %@",  shared.ApplicationId);
    
    if([activity isAnimating])
    {
        [activity stopAnimating];
        activity.hidden=YES;
        
    }
    NSString *account_chk=[self.WebService.data_dic valueForKey:@"ExceptionType"];
   // NSLog(@"mess %@",mess);
   NSLog(@"account %@",account_chk);
    
    if ([account_chk isEqualToString:@"MedChowk.MedChowkEntities.UserAlreadyLoggedInException"]) {
       alert = [[UIAlertView alloc] initWithTitle:@"Check" message:@"User Already Login" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
       [alert show];
       }
  else if ([account_chk isEqualToString:@"System.NullReferenceException"]||[account_chk isEqualToString:@"MedChowk.MedChowkEntities.InvalidCredentialsException"])
        {
            alert = [[UIAlertView alloc] initWithTitle:@"Check" message:@"You are not registered user please sign up!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
           [alert show];
            
          }
    else
     {
            AllCategoryViewController *CategoryViewController=[[AllCategoryViewController alloc]init];
            CategoryViewController.loc=[NSString stringWithFormat:@"%@",LocationId];
            [self.navigationController pushViewController:CategoryViewController animated:YES];
            
            }
    
    
    
//    if ([shared.LocationId isEqualToString:@"(null)"])
//    {
//        
//        NSLog(@"useralready logedin");
//        alert = [[UIAlertView alloc] initWithTitle:@"Check" message:@"User Already Login" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
//        
//        [alert show];
//    }
//    else
//    {
//        
//        AllCategoryViewController *CategoryViewController=[[AllCategoryViewController alloc]init];
//        CategoryViewController.loc=[NSString stringWithFormat:@"%@",LocationId];
//        [self.navigationController pushViewController:CategoryViewController animated:YES];
//
//    }
//   
 /* if([userid isEqualToString:username1] && [userpwd isEqualToString:password1])
    {
        
alert = [[UIAlertView alloc] initWithTitle:userid message:@"User Already Login" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Reset", nil];
                        
        [alert show];

        
    }*/
      
//    NSLog(@"login %@",self.WebService.ptr);
//    
//    NSMutableArray *arr=(NSMutableArray*)self.WebService.ptr;
//    NSLog(@"login %@",arr);
//
//    
//    @try
//    {
//        // do something
//        NSLog(@"login %@",self.WebService.ptr);
//     NSLog(@"%hu", [self.WebService.ptr characterAtIndex:0] );
//     
//        
//    
//    }
//    @catch (NSException *exception)
//    {
//        NSLog(@"excaption");
//        // error happened! do something about the error state
//    }
//    @finally
//    {
//        // do something to keep the program still running properly
//    }
//    
 //   NSString *str= [NSString stringWithFormat:@"%@",[[arr objectAtIndex:0]valueForKey:@"UserName"]];
  //  NSLog(@"str is %@",str);
//    if([username1 isEqual:@"admin"] && [password1 isEqualToString:@"Password!1"])
//    {
//        PatientLabDetailsViewController *PVC=[[PatientLabDetailsViewController alloc]init];
//        [self.navigationController pushViewController:PVC animated:YES];
    
      
     

//        
//    }
//    else
//    {
//     alert = [[UIAlertView alloc] initWithTitle:@"Check" message:@"Incorrect UserName and Password" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Reset", nil];
//        
//        
//        [alert show];
//              //label.text=@"Incorrect UserName and Password";
//    }
  //  UserName.text=@"";
   // UserPassword.text=@"";
    
}


//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    if (buttonIndex == 0)
//    {
//        //cancel clicked ...do your action
//    }
//    else if (buttonIndex == 1)
//    {
//        UserName1.text=@"ankitdemo";
//        UserPassword.text=@"ankit@123";
//    }
//}
-(IBAction)logOutbtn:(id)sender
{
    
    
    remember=@"false";
    CheckMark.selected=NO;
    
   // [CheckMark setImage:[UIImage imageNamed:@""]forState:UIControlStateNormal];
    // str1=@"{}";
    //self.WebService->str2=str1;
    [self.WebService logoutCallServiceCallService:@"http://192.168.1.202:81/CredentialsModule/CredentialService.asmx/LogOut" Object:NULL Handler:NULL];
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    [defaults removeObjectForKey:@"UserName1"];
//    [defaults removeObjectForKey:@"UserPassword"];
//      //  [defaults synchronize];
//    [[NSUserDefaults standardUserDefaults]synchronize];
//    ur =[defaults objectForKey:@"UserName1"];
//    pd=[defaults objectForKey:@"UserPassword"];
//    NSLog(@"usernme %@",ur);
//    NSLog(@"passwrd %@",pd);

    // http://192.168.1.202:81/CredentialsModule/CredentialService.asmx/GetLastName
    // http://192.168.1.202:81/CredentialsModule/CredentialService.asmx/LogOut
}

/*- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        return UIInterfaceOrientationMaskAll;
    } else {

        return UIInterfaceOrientationMaskLandscape;
    }
}
// iOS6
- (BOOL) shouldAutorotate
{

    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        return UIInterfaceOrientationMaskAll;
    } else {

        return UIInterfaceOrientationMaskLandscape;
    }
   // return ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad);
}*/


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

/*- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    
    if (toInterfaceOrientation==UIInterfaceOrientationLandscapeRight)
    {
      //  [self.nav pushViewController:rightLVC animated:NO];
    }
    if (toInterfaceOrientation==UIInterfaceOrientationLandscapeLeft)
    {
       // [self.nav pushViewController:leftLVC animated:NO];
    }
}*/

//- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
//{
//    
//    if (toInterfaceOrientation==UIInterfaceOrientationPortrait) {
//        [self.nav popViewControllerAnimated:NO];
//    }
//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
//{
//    return YES;
//    // Or you can use the following return statement:
//    //return (interfaceOrientation == UIInterfaceOrientationLandscape);
//}
//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
//{
//	return (toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
//}
//
//- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
//{
//	NSLog(@"hello");
//    
//    //[self.view setContentSize:CGSizeMake(CGRectGetWidth(self.view.bounds), CGRectGetHeight(coreTextView.frame) + 40)];
//}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
