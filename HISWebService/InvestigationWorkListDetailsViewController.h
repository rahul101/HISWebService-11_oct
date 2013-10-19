//
//  InvestigationWorkListDetailsViewController.h
//  HISWebService
//
//  Created by Rahul Sharma on 17/07/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebService.h"
#import <MessageUI/MessageUI.h>

@interface InvestigationWorkListDetailsViewController : UIViewController<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate,UIWebViewDelegate,UITextFieldDelegate,UIDocumentInteractionControllerDelegate,MFMessageComposeViewControllerDelegate,MFMailComposeViewControllerDelegate>
{
   
    WebService *WebService;
    NSMutableArray *WorkListDetails;
    UIScrollView *scrollview;
    UITableView *table_WorkList;
      UITableView *table_WorkListTest;
    NSMutableArray *WorkListView;
    NSString *IsSampleReceived;
    NSString *IsTestCompleted;
    NSString *ReportNo;
    NSString *string;
    UIButton *AllBtn;
    UIWebView  *webView ;
    CALayer *imageLayer;
//    NSString *Case_Id;
//    NSString *Investigation_Id;
//    NSString *Test_Id;
    NSMutableArray *OutSource;
    NSMutableArray *InvestigationList;
     NSMutableArray *AllDetails;
    NSString *testID;
    NSMutableArray *listDetailOutsource;
    UIView  *view1;
    UIButton  *Detail;
    UIButton  *Outsource;
    UIButton  *close1;
    NSMutableArray *AllDescriptions;
    NSMutableArray *Description;
    UITableView *table_outsource;
    NSMutableArray *AllLaboratories;
    NSMutableArray *SingleDescription;
    UIButton *bttn;
    UIScrollView *_scroll;
    
    UIButton  *EmailSms;
    UIButton   *ViewReport;
    UIButton *DeliverReport;
    NSString *InvestigationId;
    
    NSMutableArray *testdate;
    UITextField *textField;
    IBOutlet UIView *ViewPage;
    UIBarButtonItem *Setting;
    UIBarButtonItem  *print1;
    NSMutableArray *arr;
}
@property(strong,nonatomic)WebService *WebService;
@property(strong,nonatomic)NSMutableArray *WorkListDetails;
- (void)onCustomAccessoryTapped:(UIButton *)sender;
- (void)onCustomAccessoryTapped1:(UIButton *)sender;
-(void)CallServiceDetail:(NSString *)Str;
-(IBAction)AllButtons:(id)sender;
-(void)close;
-(IBAction)selectforemail:(UIButton*)sender;

-(IBAction)btnpress:(UITapGestureRecognizer *)reconizer;
-(UIImage *)imageFromWebView:(UIWebView *)view;
-(void)Outsourcebtn;

@end
