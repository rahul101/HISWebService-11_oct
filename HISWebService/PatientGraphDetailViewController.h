//
//  PatientGraphDetailViewController.h
//  HISWebService
//
//  Created by Rahul Sharma on 20/06/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebService.h"
@interface PatientGraphDetailViewController : UIViewController<UIDocumentInteractionControllerDelegate,UIWebViewDelegate>
{
    WebService *WebService;
    
    NSString *CaseID;
    NSString *InvestigationID;
    NSString  *TestID;
    NSString *Patient_Code;
    NSMutableArray *GraphDetail;
    NSString *Result_val;
    UIScrollView *scrollview;
    UIView *view1;
    UIWebView *webView;
       NSString *data1;
}
@property(nonatomic,strong)WebService *WebService;
@property(nonatomic,strong)NSString *CaseID;
@property(nonatomic,strong)NSString *InvestigationID;
@property(nonatomic,strong)NSString *TestID;
@property(nonatomic,strong)NSString *Patient_Code;
-(void)CallServiceGraphDetails:(NSString*)Str;
-(NSString*)getdiv:(NSString*)desc andid:(NSString*)idd;

-(NSString*)getjquery:(NSString*)desc andval:(NSString*)value andlow:(NSString*)low andrangfrm:(NSString*)rngfr andrngto:(NSString*)rnfto andhigh:(NSString*)high;

-(NSString*)getjquerycompare:(NSMutableArray*)date andName:(NSMutableArray*)name andValue:(NSMutableArray*)value;
@end
