//
//  PatientReportViewController.m
//  HISWebService
//
//  Created by Rahul Sharma on 30/05/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import "PatientReportViewController.h"
#import <QuartzCore/QuartzCore.h>
#define khight 60


@interface PatientReportViewController ()

@end

@implementation PatientReportViewController
@synthesize WebService=_WebService;
@synthesize CaseID,InvestigationID,TestID,TextView;

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
    self.WebService=[[WebService alloc]init];
    
    // CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    // ScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, screenSize.height)];
    // CGFloat scrollViewHeight = 0.0f;
    //    for (UIView* view in ScrollView.subviews)
    //    {
    //        scrollViewHeight += view.frame.size.height;
    //    }
    
    //[ScrollView setContentSize:(CGSizeMake(320, scrollViewHeight))];
    //[UIScrollView setContentSize:CGSizeMake(320, heightOfAllSubViews + heightOfVerticalSpaces)];
    ScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0,0,320,560)];
    ScrollView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    ScrollView.autoresizesSubviews = YES;
    
  //[ScrollView setContentSize:CGSizeMake(1000, 2000)];
    
    ScrollView.scrollEnabled = YES;
    
    ScrollView.directionalLockEnabled = YES;
    
    ScrollView.showsVerticalScrollIndicator = YES;
    
    ScrollView.showsHorizontalScrollIndicator =YES;
    
    // ScrollView.autoresizesSubviews = YES;
    ScrollView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:ScrollView];
    
    NSLog(@"case id is %@",self.WebService->case_id=CaseID);
    NSLog(@"investigation is %@",self.WebService->investigation_id=InvestigationID);
    NSLog(@"test id is %@",self.WebService->test_id=TestID);
    
    
    [self.WebService CallServicePatienReportDetails:@"http://192.168.1.202:81/LaboratoryModule/LISService.asmx/GetpatienttestDetails" Object:NULL Handler:NULL];
    
    NSLog(@"patient report is %@",self.WebService->ptr1);
    
   
    
    UILabel *SNo =[[UILabel alloc]initWithFrame:CGRectMake(10,20,100,20)];
    SNo.font = [UIFont systemFontOfSize:12.0];
    SNo.backgroundColor=[UIColor whiteColor];
    [SNo setText:@"S.No.:"];
    [ScrollView addSubview:SNo];
    
    
    UILabel *SNoVal=[[UILabel alloc]initWithFrame:CGRectMake(120,20,120,20)];
    SNoVal.font = [UIFont boldSystemFontOfSize:12.0];
    SNoVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceReport:@"CaseCode"];
    SNoVal.text = [NSString stringWithFormat:@"%@",string];
    NSLog(@"item is %@",SNoVal.text);
    [ScrollView addSubview:SNoVal];
    
    
    
    UILabel *PatientCode =[[UILabel alloc]initWithFrame:CGRectMake(10,20,100,20)];
    PatientCode.font = [UIFont systemFontOfSize:12.0];
    PatientCode.backgroundColor=[UIColor whiteColor];
    [PatientCode setText:@"Patient Code:"];
    [ScrollView addSubview:PatientCode];
    
    
    UILabel *PatientCodeVal=[[UILabel alloc]initWithFrame:CGRectMake(120,20,120,20)];
    PatientCodeVal.font = [UIFont boldSystemFontOfSize:12.0];
    PatientCodeVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceReport:@"PatientCode"];
    PatientCodeVal.text = [NSString stringWithFormat:@"%@",string];
    NSLog(@"item is %@",PatientCodeVal.text);
    [ScrollView addSubview:PatientCodeVal];
    
    UILabel *PatientName =[[UILabel alloc]initWithFrame:CGRectMake(10,50,100,20)];
    PatientName.font = [UIFont systemFontOfSize:12.0];
    PatientName.backgroundColor=[UIColor whiteColor];
    [PatientName setText:@"Patient Name:"];
    [ScrollView addSubview:PatientName];
    
    
    UILabel *PatientNameVal=[[UILabel alloc]initWithFrame:CGRectMake(120,50,120,20)];
    PatientNameVal.font = [UIFont boldSystemFontOfSize:12.0];
    PatientNameVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceReport:@"PatientName"];
    PatientNameVal.text = [NSString stringWithFormat:@"%@",string];
    NSLog(@"item is %@",PatientNameVal.text);
    [ScrollView addSubview:PatientNameVal];
    
    UILabel *Gender =[[UILabel alloc]initWithFrame:CGRectMake(10,80,100,20)];
    Gender.font = [UIFont systemFontOfSize:12.0];
    Gender.backgroundColor=[UIColor whiteColor];
    [Gender setText:@"Gender:"];
    [ScrollView addSubview:Gender];
    
    
    UILabel *GenderVal=[[UILabel alloc]initWithFrame:CGRectMake(120,80,120,20)];
    GenderVal.font = [UIFont boldSystemFontOfSize:12.0];
    GenderVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceReport:@"Sex"];
    GenderVal.text = [NSString stringWithFormat:@"%@",string];
    NSLog(@"item is %@",GenderVal.text);
    [ScrollView addSubview:GenderVal];
    
    
    UILabel *Age =[[UILabel alloc]initWithFrame:CGRectMake(10,110,100,20)];
    Age.font = [UIFont systemFontOfSize:12.0];
    Age.backgroundColor=[UIColor whiteColor];
    [Age setText:@"Age:"];
    [ScrollView addSubview:Age];
    
    
    UILabel *AgeVal=[[UILabel alloc]initWithFrame:CGRectMake(120,110,120,20)];
    AgeVal.font = [UIFont boldSystemFontOfSize:12.0];
    AgeVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceReport:@"Age"];
    AgeVal.text = [NSString stringWithFormat:@"%@",string];
    NSLog(@"item is %@",AgeVal.text);
    [ScrollView addSubview:AgeVal];
    
    
    
    UILabel *AdviceDr =[[UILabel alloc]initWithFrame:CGRectMake(10,140,100,20)];
    AdviceDr.font = [UIFont systemFontOfSize:12.0];
    AdviceDr.backgroundColor=[UIColor whiteColor];
    [AdviceDr setText:@"Advised Doctor:"];
    [ScrollView addSubview:AdviceDr];
    
    
    UILabel *AdviceDrVal=[[UILabel alloc]initWithFrame:CGRectMake(120,140,120,20)];
    AdviceDrVal.font = [UIFont boldSystemFontOfSize:12.0];
    AdviceDrVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceReport:@"AdvisedDoctor"];
    if([string isEqualToString:@"<null>"])
    {
        AdviceDrVal.text = @"";
    }
    else
    {
        AdviceDrVal.text = [NSString stringWithFormat:@"%@",string];
    }
    
    NSLog(@"item is %@",AdviceDrVal.text);
    [ScrollView addSubview:AdviceDrVal];
    
    UILabel *AdviceDate =[[UILabel alloc]initWithFrame:CGRectMake(10,170,100,20)];
    AdviceDate.font = [UIFont systemFontOfSize:12.0];
    AdviceDate.backgroundColor=[UIColor whiteColor];
    [AdviceDate setText:@"Advise Date:"];
    [ScrollView addSubview:AdviceDate];
    
    
    UILabel *AdviceDateVal=[[UILabel alloc]initWithFrame:CGRectMake(120,170,120,20)];
    AdviceDateVal.font = [UIFont boldSystemFontOfSize:12.0];
    AdviceDateVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceReport:@"AdviseDate"];
    
    NSDateFormatter  *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
    NSDate  *myDate = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@",string]];
    NSLog(@"%@", [dateFormatter stringFromDate:myDate]);
    
    NSDateFormatter  *anotherDateFormatter = [[NSDateFormatter alloc] init];
    [anotherDateFormatter setDateFormat:@"dd/MM/yyyy HH:mm:ss"];
    NSLog(@"%@", [anotherDateFormatter stringFromDate:myDate]);
    AdviceDateVal.text =  [anotherDateFormatter stringFromDate:myDate];
    // NSLog(@"item is %@",PatientDobVal.text);
    [ScrollView addSubview:AdviceDateVal];
    
    
    //  AdviceDateVal.text = [NSString stringWithFormat:@"%@",string];
    //NSLog(@"item is %@",AdviceDateVal.text);
    // [ScrollView addSubview:AdviceDateVal];
    
    
    UILabel *MOD =[[UILabel alloc]initWithFrame:CGRectMake(10,200,100,20)];
    MOD.font = [UIFont systemFontOfSize:12.0];
    MOD.backgroundColor=[UIColor whiteColor];
    [MOD setText:@"Mode Of Delivery:"];
    [ScrollView addSubview:MOD];
    
    
    //
    //    UILabel *MODVal=[[UILabel alloc]initWithFrame:CGRectMake(120,170,120,20)];
    //    MODVal.font = [UIFont boldSystemFontOfSize:12.0];
    //    MODVal.backgroundColor=[UIColor whiteColor];
    //    [self CallServiceReport:@"AdviseDate"];
    //    MODVal.text = [NSString stringWithFormat:@"%@",string];
    //    NSLog(@"item is %@",MODVal.text);
    //    [ScrollView addSubview:MODVal];
    
    UILabel *PatientReportNo=[[UILabel alloc]initWithFrame:CGRectMake(10,230,120,30)];
    PatientReportNo.font = [UIFont systemFontOfSize:12.0];
    PatientReportNo.backgroundColor=[UIColor whiteColor];
    [PatientReportNo setText:@"Report No:"];
    [ScrollView addSubview:PatientReportNo];
    
    
    UILabel *PatientReportNoVal=[[UILabel alloc]initWithFrame:CGRectMake(120,230,170,30)];
    PatientReportNoVal.font = [UIFont boldSystemFontOfSize:12.0];
    PatientReportNoVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceReport:@"ReportNo"];
    if([string isEqualToString:@"<null>"])
    {
        PatientReportNoVal.text = @"";
        
    }
    else
    {
        PatientReportNoVal.text = [NSString stringWithFormat:@"%@",string];
        
    }
    NSLog(@"item is %@",PatientReportNoVal.text);
    [ScrollView addSubview:PatientReportNoVal];
    
    UILabel *PatientLabNo=[[UILabel alloc]initWithFrame:CGRectMake(10,260,120,30)];
    PatientLabNo.font = [UIFont systemFontOfSize:12.0];
    PatientLabNo.backgroundColor=[UIColor whiteColor];
    [PatientLabNo setText:@"Lab No:"];
    [ScrollView addSubview:PatientLabNo];
    
    
    UILabel *PatientLabNoVal=[[UILabel alloc]initWithFrame:CGRectMake(120,260,170,30)];
    PatientLabNoVal.font = [UIFont boldSystemFontOfSize:15.0];
    PatientLabNoVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceReport:@"LabNo"];
    if([string isEqualToString:@"<null>"])
    {
        PatientLabNoVal.text = @"";
    }
    else
    {
        PatientLabNoVal.text = [NSString stringWithFormat:@"%@",string];
    }
    
    NSLog(@"item is %@",PatientLabNoVal.text);
    [ScrollView addSubview:PatientLabNoVal];
    
    UILabel *PatientSpecimen=[[UILabel alloc]initWithFrame:CGRectMake(10,290,100,30)];
    PatientSpecimen.font = [UIFont systemFontOfSize:12.0];
    PatientSpecimen.backgroundColor=[UIColor whiteColor];
    [PatientSpecimen setText:@"Specimen:"];
    [ScrollView addSubview:PatientSpecimen];
    
    
    UILabel *PatientSpecimenVal=[[UILabel alloc]initWithFrame:CGRectMake(120,290,150,30)];
    PatientSpecimenVal.font = [UIFont boldSystemFontOfSize:12.0];
    PatientSpecimenVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceReport:@"Specimen"];
    if([string isEqualToString:@"<null>"])
    {
        PatientSpecimenVal.text =@"";
    }
    else
    {
        PatientSpecimenVal.text = [NSString stringWithFormat:@"%@",string];
    }
    NSLog(@"item is %@",PatientSpecimenVal.text);
    [ScrollView addSubview:PatientSpecimenVal];
    
    line=[[UIImageView alloc]initWithFrame:CGRectMake(0,330,320,10)];
    line.autoresizingMask = UIViewAutoresizingFlexibleWidth ;
    line.autoresizesSubviews = YES;
    
    line_symbol=[UIImage imageNamed:@"horizontal-line.png"];
    line.image=line_symbol;
    [ScrollView addSubview:line];
    
    
    UILabel *SecondryCategory =[[UILabel alloc]initWithFrame:CGRectMake(110,340,170,20)];
    SecondryCategory.font = [UIFont boldSystemFontOfSize:12.0];
    SecondryCategory.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    //  SecondryCategory.autoresizesSubviews = YES;
    
    SecondryCategory.backgroundColor=[UIColor whiteColor];
    //  [SecondryCategory setText:@"Mode Of Delivery:"];
    [self CallServiceReport:@"SecondryCategory"];
    SecondryCategory.text = [NSString stringWithFormat:@"%@",string];
    
    [ScrollView addSubview:SecondryCategory];
    
    line=[[UIImageView alloc]initWithFrame:CGRectMake(0,370,320,10)];
    line.autoresizingMask = UIViewAutoresizingFlexibleWidth ;
    line.autoresizesSubviews = YES;
    
    line_symbol=[UIImage imageNamed:@"horizontal-line.png"];
    line.image=line_symbol;
    [ScrollView addSubview:line];
    
    
    UILabel *test =[[UILabel alloc]initWithFrame:CGRectMake(10,380,80,20)];
    test.font = [UIFont boldSystemFontOfSize:10.0];
    test.backgroundColor=[UIColor whiteColor];
    //  [SecondryCategory setText:@"Mode Of Delivery:"];
    
    test.text = @"TEST";
    
    [ScrollView addSubview:test];
    
    
    
    UILabel *RangVal =[[UILabel alloc]initWithFrame:CGRectMake(120,380,110,20)];
    RangVal.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    RangVal.font = [UIFont boldSystemFontOfSize:10.0];
    RangVal.backgroundColor=[UIColor whiteColor];
    //  [SecondryCategory setText:@"Mode Of Delivery:"];
    
    RangVal.text = @"RANGE VALUE";
    
    [ScrollView addSubview:RangVal];
    
    UILabel *Patientvalue =[[UILabel alloc]initWithFrame:CGRectMake(240,380,350,20)];
    Patientvalue.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    Patientvalue.font = [UIFont boldSystemFontOfSize:10.0];
    Patientvalue.backgroundColor=[UIColor whiteColor];
    //  [SecondryCategory setText:@"Mode Of Delivery:"];
    
    Patientvalue.text = @"PATIENT VALUE";
    
    [ScrollView addSubview:Patientvalue];
    
    
    line=[[UIImageView alloc]initWithFrame:CGRectMake(0,410,320,10)];
    line.autoresizingMask = UIViewAutoresizingFlexibleWidth ;
    line.autoresizesSubviews = YES;
    
    line_symbol=[UIImage imageNamed:@"horizontal-line.png"];
    line.image=line_symbol;
    [ScrollView addSubview:line];
    
    
    UILabel *TestName =[[UILabel alloc]initWithFrame:CGRectMake(10,420,130,20)];
    TestName.font = [UIFont boldSystemFontOfSize:12.0];
    TestName.backgroundColor=[UIColor whiteColor];
    //  [SecondryCategory setText:@"Mode Of Delivery:"];
    [self CallServiceReport:@"TestName"];
    TestName.text = [NSString stringWithFormat:@"%@",string];
    
    [ScrollView addSubview:TestName];
    
    
    y=440;
    
    for( i=0;i<(self.WebService->ptr1).count;i++)
    {
        
        UILabel *Description =[[UILabel alloc]initWithFrame:CGRectMake(10,y,130,20)];
        Description.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        Description.font = [UIFont systemFontOfSize:10.0];
        Description.backgroundColor=[UIColor whiteColor];
        //  [SecondryCategory setText:@"Mode Of Delivery:"];
        [self CallServiceReport:@"Description"];
        Description.text = [NSString stringWithFormat:@"%@",string];
        
        [ScrollView addSubview:Description];
        
        UILabel *RangeValue =[[UILabel alloc]initWithFrame:CGRectMake(130,y,110,20)];
        RangeValue.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        
        RangeValue.font = [UIFont systemFontOfSize:10.0];
        RangeValue.backgroundColor=[UIColor whiteColor];
        //  [SecondryCategory setText:@"Mode Of Delivery:"];
        [self CallServiceReport:@"RangeValue"];
        
        
        RangeValue.text = [NSString stringWithFormat:@"%@",string];
        
        [ScrollView addSubview:RangeValue];
        
        NSString *ResulType=[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:i]valueForKey:@"ResultType"]];
        
        
        if([ResulType isEqualToString:@"Numerical"] )
        {
            // int y1=380;
            UILabel *ResultValue =[[UILabel alloc]initWithFrame:CGRectMake(260,y,110,20)];
            ResultValue.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
            
            ResultValue.font = [UIFont systemFontOfSize:10.0];
            ResultValue.backgroundColor=[UIColor whiteColor];
            //  [SecondryCategory setText:@"Mode Of Delivery:"];
            [self CallServiceReport:@"ResultValue"];
            ResultValue.text = [NSString stringWithFormat:@"%@",string];
            
            [ScrollView addSubview:ResultValue];
            
            // y1=y1+30;
        }
        else
        {
            
            [self createWebViewWithHTML];
            
            //            ScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0,y+30,320,800)];
            //            CGRect fr =ScrollView.frame;
            //
            //            fr.size = CGSizeMake(webView.frame.size.width,y);
            //            webView.frame = fr;
            //
            //            NSLog(@"y is %f",webView.frame.size.height);
            //
            
            //            CGRect newFrame = ScrollView.frame;
            //            newFrame.size.width = webView.frame.size.width;
            //            webView.frame = newFrame;
            //            NSLog(@"y is %f",    newFrame.size.width);
            
            y=y+250;
            NSLog(@"y is %d",y);
            
        }
        y=y+30;
        
    }
    
    // Do any additional setup after loading the view from its nib.
}
- (void)createWebViewWithHTML
{
    //create the string
    
    
    
    NSMutableString *html = [NSMutableString stringWithString: @"<html><head><title></title></head><body style=\"background:transparent;\">"];
    
    //continue building the string
    
    [html appendString:[[self.WebService->ptr1 objectAtIndex:i]valueForKey:@"ResultValue"]];
    [html appendString:@"</body></html>"];
    
    // int length = [[webView stringByEvaluatingJavaScriptFromString:html] integerValue];
    //  NSLog(@"length is %d",length);
    
    //     characterCount = [html length];
    //
    //    NSLog(@"cha count is %d",characterCount);
    //
    
    //  float contentHeight = [html floatValue];
    
    //NSLog(@"hight is %f",contentHeight);
    
    
    // ScrollView.contentSize = CGSizeMake(ScrollView.frame.size.width, contentHeight + webView.frame.origin.y);
    
    
    
    //CGRect fr = ScrollView.frame;
    //fr.size = CGSizeMake(webView.frame.size.width, contentHeight);
    //webView.frame = fr;
    
    
    //instantiate the web view
    // UIWebView *webView = [[UIWebView alloc] initWithFrame:ScrollView.frame];
    webView = [[UIWebView alloc]initWithFrame:CGRectMake(5,y+30,310,200)];
    webView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight) ;
    webView.autoresizesSubviews = YES;
    webView.delegate=self;
    CALayer   *imageLayer = webView.layer;
    [imageLayer setCornerRadius:02];
    [imageLayer setBorderWidth:1];
    imageLayer.borderColor=[[UIColor blackColor] CGColor];
    [webView setOpaque:NO];  //  [webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight;"];
    [webView setBackgroundColor:[UIColor grayColor]];
    
    // webViewb.delegate=self;
    NSLog(@"vlaue od v is %@",webView);
    
    //  webView.scrollView.scrollEnabled =NO;
    
    
    // webView.scrollView.bounces = YES;
    
    
    
    //make the background transparent
    [webView setBackgroundColor:[UIColor clearColor]];
    
    //pass the string to the webview
    
    [webView loadHTMLString:[html description]baseURL:nil];
    //  NSLog(@"web view is %f",webView.scrollView.contentSize.width);
    [webView sizeThatFits:CGSizeZero];
    //  NSLog(@"web view is %@",webView);
    //  NSString* script  = @"document.body.innerHTML";
    //  NSString* content = [webView stringByEvaluatingJavaScriptFromString:script];
    // NSLog(@"web view is %@",content);
    //add it to the subview
    
    // CGFloat contentHeight = webView.scrollView.contentSize.height;
    
    [ScrollView addSubview:webView];
    
    NSLog(@"height: %@", [webView stringByEvaluatingJavaScriptFromString: @"document.body.offsetHeight"]);
    
    NSLog(@"y is %f",webView.frame.origin.y);
    
    //  NSString *heightString = [webView stringByEvaluatingJavaScriptFromString:@"document.getElementById("body").offsetHeight;"];
    ///NSLog(@"web content is %@ high",heightString);
    
    //  float h;
    
    //   h = [heightString floatValue] +12.0f; // convert from string to float plus some extra points because calculation is sometimes one line short
    
    
    
    // [self webViewDidFinishLoad:webView];
    
    
    // CGFloat contentHeight = webView.scrollView.contentSize.height;
    // NSLog(@"content %f",contentHeight);
    
    //    NSLog(@"height: %d", [[webView stringByEvaluatingJavaScriptFromString: @"document.body.offsetHeight"] intValue]);
    //    NSLog(@"Body height: %@", [webView stringByEvaluatingJavaScriptFromString: @"document.body.offsetHeight"]);
    //    NSLog(@"Doc height: %@", [webView stringByEvaluatingJavaScriptFromString: @"document.height"]);
    //    NSString * javaScript = [NSString stringWithFormat:@"document.getElementById('%@').clientHeight", html];
    //    NSLog(@"Div height: %@",[webView stringByEvaluatingJavaScriptFromString:javaScript]);
}
//- (void) webViewDidStartLoad:(UIWebView *)webView
//{
//    NSLog(@"webViewDidStartLoad");
//
//}

//- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType {
//    NSURL *url = [request URL];
//    if (navigationType == UIWebViewNavigationTypeOther)
//    {
//        if ([[url scheme] isEqualToString:@"ready"])
//        {
//            float contentHeight = [html_data floatValue];
//            ScrollView.contentSize = CGSizeMake(ScrollView.frame.size.width, contentHeight + webView.frame.origin.y);
//
//            CGRect fr = ScrollView.frame;
//            fr.size = CGSizeMake(webView.frame.size.width, contentHeight);
//           webView.frame = fr;
//
//            return NO;
//        }
//
//        return YES;
//    }
//}
//-(void)webViewDidFinishLoad:(UIWebView *)webView{
//
////    if (webView!=bioWebView)return;
//
//
//
//    float h;
//
//
//
//  //  NSLog(@"web view is %f high", webView.frame.size.height);
//
//    NSString *heightString = [webView stringByEvaluatingJavaScriptFromString:@"document.getElementById("body").offsetHeight;"];
//
//    NSLog(@"web content is %@ high",heightString);
//
//
//
//    h = [heightString floatValue] +12.0f; // convert from string to float plus some extra points because calculation is sometimes one line short
//
//
//    bioWebView.frame = CGRectMake(bioWebView.frame.origin.x, bioWebView.frame.origin.y, bioWebView.frame.size.width, h);
//
//
//
//    // get bottom of text field
//
//    h = bioWebView.frame.origin.y + h + 70; // extra 70 pixels for UIButton at bottom and padding.
//
//    [scrollView setContentSize:CGSizeMake(320, h)];
//
//
//}

- (void)webViewDidFinishLoad:(UIWebView *)webView1
{
//    CGRect frame = webView1.frame;
//    frame.size.height = 1;
//    webView1.frame = frame;
//    CGSize fittingSize = [webView1 sizeThatFits:CGSizeZero];
//    frame.size = fittingSize;
//    webView1.frame = frame;
//    
//    //    CGRect frame1=ScrollView.frame;
//    //
//    //    frame1.size.height=fittingSize.height;
//    //   // ScrollView.frame=frame1;
//    //   // [ScrollView setContentSize:CGSizeMake(310,frame1.size.height+2000)];
//    
//    //    float sizeOfContent = 0;
//    //    UIView *lLast = [ScrollView.subviews lastObject];
//    //    NSInteger wd = lLast.frame.origin.y;
//    //    NSInteger ht = lLast.frame.size.height;
//    //
//    //    sizeOfContent = wd+ht;
//    //
//    //    ScrollView.contentSize = CGSizeMake(ScrollView.frame.size.width, sizeOfContent);
//    
//    float sizeOfContent = 0;
//    UIView *lLast = [ScrollView.subviews lastObject];
//    NSInteger wd = lLast.frame.origin.y;
//    NSInteger ht = lLast.frame.size.height;
//    
//    sizeOfContent = wd+ht;
//    
//    //ScrollView.contentSize = CGSizeMake(ScrollView.frame.size.width, sizeOfContent+100);
//    NSLog(@"string %@",NSStringFromCGSize((ScrollView.contentSize)));
//    
//    NSLog(@"WEBsize: %f,", ScrollView.frame.size.height);
//    NSLog(@"WEBsize: %f, %f", fittingSize.width, fittingSize.height);
//
    
   CGFloat scrollViewHeight = 0.0f;
   for (UIView* view in ScrollView.subviews)
   {
            scrollViewHeight += view.frame.size.height;
    }
    
   [ScrollView setContentSize:(CGSizeMake(320, scrollViewHeight-700))];
    NSLog(@"WEBsize: %@,", NSStringFromCGSize(ScrollView.contentSize));
    NSLog(@"WEBsize: %f,", ScrollView.frame.size.height);
    
    
    //    NSLog(@"height: %@", [webView stringByEvaluatingJavaScriptFromString: @"document.body.offsetHeight"]);
    //    contentHeight =webView.scrollView.contentSize.height;
    //    NSLog(@"content hight is %d",contentHeight);
    //
    //    finished=TRUE;
    
    //NSLog(@"web view is %f",contentHeight);
    
    // ....
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    if(fromInterfaceOrientation == UIInterfaceOrientationPortrait)
    {
        
        [webView stringByEvaluatingJavaScriptFromString:@"rotate(0)"];
        
    }
    else
    {
        [webView stringByEvaluatingJavaScriptFromString:@"rotate(1)"];
    }
}


-(void)CallServiceReport:(NSString *)Str
{
    
    string=[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:i]valueForKey:Str]];
    NSLog(@"%@", string);
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
