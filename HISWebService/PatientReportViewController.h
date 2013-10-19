//
//  PatientReportViewController.h
//  HISWebService
//
//  Created by Rahul Sharma on 30/05/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebService.h"

@interface PatientReportViewController : UIViewController<UITextViewDelegate,UIWebViewDelegate>
{
    WebService *WebService;
    NSString *Resultval;
    UIScrollView *ScrollView;
    NSString *html_data;
    IBOutlet UITextView *TextView;
    NSString *string;
    UILabel *TextView1;
    UIImageView *line;
    UIImage *line_symbol;
    int i;
    int y;
    UIWebView *webView ;
    NSUInteger characterCount;
    BOOL finished;
    int contentHeight;
    
}
@property(strong,nonatomic)IBOutlet UITextView *TextView;
@property(nonatomic,strong)WebService *WebService;
@property(nonatomic,strong)NSString *CaseID;
@property(nonatomic,strong)NSString *InvestigationID;
@property(nonatomic,strong)NSString *TestID;
//- (NSString *)flattenHTML:(NSString *)html;
-(void)CallServiceReport:(NSString *)Str;
- (void)createWebViewWithHTML;

@end
