//
//  WorklistDetailViewController.h
//  HISWebService
//
//  Created by Rahul Sharma on 18/09/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FPPopoverController.h"
#import "WebService.h"

@interface WorklistDetailViewController : UIViewController
{
    
      CALayer *imageLayer;
       FPPopoverController *popover;
     WebService *WebService;
    NSMutableArray *Branchesarr;
//    UIButton *Test;
//    UIButton *Due;
//    UIButton *Delivery;
//    UIButton *Checked;
//    UIButton *Printed;
//    UIButton *Deliverd;
//    UIButton *Simple;
//    UIButton *Cancelled;
//    UIButton *Branches;
//    
//    UIButton *AllButton;
    int btntag;
}
@property (nonatomic, strong) FPPopoverController *popover;
@property (nonatomic, strong) WebService *WebService;
-(IBAction)SelectButton:(id)sender;
-(void)GetCommentDetails:(NSString*)indexpath;
-(void)settext:(NSString*)string;

@end
