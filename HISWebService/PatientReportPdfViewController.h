//
//  PatientReportPdfViewController.h
//  HISWebService
//
//  Created by Rahul Sharma on 17/07/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebService.h"
#import <MessageUI/MessageUI.h>

@interface PatientReportPdfViewController : UIViewController<UIActionSheetDelegate,MFMailComposeViewControllerDelegate,UIDocumentInteractionControllerDelegate>
{
    WebService *WebService;
    UIScrollView *ScrollView;
  //  NSMutableArray *byteArray;
    UIActivityIndicatorView *activity;
    NSString *fileName;
   // UIWebView *webView1;
}
@property(nonatomic,strong)WebService *WebService;
@property(nonatomic,strong)NSString *CaseID;
@property(nonatomic,strong)NSString *InvestigationID;
@property(nonatomic,strong)NSString *TestID;
-(void)sharebtn;
-(IBAction)openMail:(id)sender;
-(void)show_Button;
@end
