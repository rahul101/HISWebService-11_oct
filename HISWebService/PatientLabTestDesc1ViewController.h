//
//  PatientLabTestDesc1ViewController.h
//  HISWebService
//
//  Created by Rahul Sharma on 09/05/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebService.h"


@interface PatientLabTestDesc1ViewController : UIViewController<UIDocumentInteractionControllerDelegate>
{
    WebService *WebService;
    NSString *desc;
        NSString *s2;
    NSMutableArray *Description;
    NSDictionary *dictionary;
   
    NSString *Case_Id;
    NSString *Investigation_Id;
    NSString *Test_Id;
       NSString *PatientCode;
    UIScrollView *ScrollView;
    UIButton *ViewReportPDF;
    UIButton *ViewReport;
    UIButton *ViewDetail;
    
}
@property(nonatomic,strong)WebService *WebService;
@property(nonatomic,strong)NSDictionary *dictionary;

@property(nonatomic,strong)NSString *desc;
-(void)CallServiceDescription:(NSString*)Str;
-(void)CallServiceViewReport;
-(void)CallServiceViewGraphDetail;
-(void)CallServiceViewReportPdf;
@end
