//
//  PatientGraphDetailViewController.m
//  HISWebService
//
//  Created by Rahul Sharma on 20/06/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import "PatientGraphDetailViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "SBJson.h"
@interface PatientGraphDetailViewController ()

@end

@implementation PatientGraphDetailViewController
@synthesize CaseID,InvestigationID,TestID,Patient_Code,WebService=_WebService;
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
   // Shared *sh=[Shared sharedUser];
//    view1=[[UIView alloc]initWithFrame:CGRectMake(0,0,320,40)];
//    view1.backgroundColor=[UIColor whiteColor];
//    [view1 setIsAccessibilityElement:YES];
//    view1.userInteractionEnabled=YES;
//    view1.autoresizingMask = UIViewAutoresizingFlexibleWidth ;
//    
//    view1.layer.borderColor = [UIColor grayColor].CGColor;
//    view1.layer.borderWidth = 2.0f;
//    [self.view addSubview:view1];
//    
    
//    scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0,0,320,540)];
//    
//    [scrollview setContentSize:CGSizeMake(320, 1200)];
//    
//    scrollview.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
//    scrollview.autoresizesSubviews = YES;
//    
//    scrollview.scrollEnabled = YES;
//    
//    scrollview.directionalLockEnabled = YES;
//    
//    scrollview.showsVerticalScrollIndicator = YES;
//    
//    scrollview.showsHorizontalScrollIndicator = YES;
//    
//    scrollview.autoresizesSubviews = YES;
//    scrollview.backgroundColor=[UIColor whiteColor];
//    [self.view addSubview:scrollview];
//    
//    
//    
//    scrollview.scrollsToTop=YES;
    
    
    self.WebService->case_id=CaseID;
    self.WebService->investigation_id=InvestigationID;
    self.WebService->test_id=TestID;
    self.WebService->patientcode=Patient_Code;
    [self.WebService CallServicePatienReportGraphDetails:@"http://192.168.1.202:81/PatientModule/PatientService.asmx/GetPatientTestRangeData" Object:NULL Handler:NULL];
    
    NSLog(@"report is %@",self.WebService->ptr1);
    
    //    NSMutableArray *advisd =(NSMutableArray *)([self.WebService->ptr1 valueForKey:@"AdviseDate"]);
    //    NSLog(@"report is %@",advisd);
    //    NSArray *arr=[NSSet setWithArray:[self.WebService->ptr1 valueForKey:@"AdviseDate"]];
    //     NSLog(@"report is %@",arr);
    
    NSMutableArray *date=[[NSMutableArray alloc]init];
    NSMutableArray *name=[[NSMutableArray alloc]init];
    NSMutableArray *value=[[NSMutableArray alloc]init];
    NSString *div=@"";
    NSString *jqry=@"";
    for (int i= 0 ; i < self.WebService->ptr1.count ; i++)
    {
        //   NSString *str=[[[self.WebService->ptr1 objectAtIndex:i] valueForKey:@"AdviseDate"] stringByReplacingOccurrencesOfString:@"-" withString:@"/"];
        //        NSLog(@"str %@",str);
        
        if ([[[self.WebService->ptr1 objectAtIndex:i] valueForKey:@"Description"] isEqualToString:@"INTERPRETATION"] || [[[self.WebService->ptr1 objectAtIndex:i] valueForKey:@"ResultType"] isEqualToString:@"Comment"]) {
            
            
            NSLog(@"enter");
        }
        
        else
        {
            if(![date containsObject:[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:i] valueForKey:@"AdviseDate"]]])
            {
                
                [date addObject:[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:i] valueForKey:@"AdviseDate"]]];
                
            }
            if(![name containsObject:[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:i] valueForKey:@"Description"]]])
            {
                
                [name addObject:[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:i] valueForKey:@"Description"]]];
                
            }
            
            //                    if(![value containsObject:[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:i] valueForKey:@"ResultValue"]]])
            //                        {
            //
            
            //
            //            }
            NSString *null= [NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:i] valueForKey:@"ResultValue"] ];
            NSLog(@"null %@",null);
            if ([null isEqualToString:@"<null>"]) {
                
                
                
                [value addObject:@""];
            }
            else
            {
                [value addObject:[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:i] valueForKey:@"ResultValue"]]];
                
                
            }
            
            NSLog(@" case id %@ ",[[self.WebService->ptr1 objectAtIndex:i] valueForKey:@"CaseId"]);
            NSLog(@" case id %@ ",CaseID);
            
           if([[[self.WebService->ptr1 objectAtIndex:i] valueForKey:@"CaseId"] isEqualToString:CaseID])
            {
                div =[div stringByAppendingString:[self getdiv:[[self.WebService->ptr1 objectAtIndex:i] valueForKey:@"Description"] andid:[NSString stringWithFormat:@"%d",i]]] ;
                NSLog(@"str %@",div);
                
                
                jqry=[jqry stringByAppendingString:[self getjquery:[NSString stringWithFormat:@"%d",i] andval:[[self.WebService->ptr1 objectAtIndex:i] valueForKey:@"ResultValue"] andlow:[[self.WebService->ptr1 objectAtIndex:i] valueForKey:@"CriticalLow"] andrangfrm:[[self.WebService->ptr1 objectAtIndex:i] valueForKey:@"RangeFrom"] andrngto:[[self.WebService->ptr1 objectAtIndex:i] valueForKey:@"RangeTo"] andhigh:[[self.WebService->ptr1 objectAtIndex:i] valueForKey:@"CriticalHigh"]] ];
                
                
                
                NSLog(@"str %@",div);
                NSLog(@"jqy %@",jqry);
                
            }
            
            
            //SBJsonParser *prsr=[[SBJsonParser alloc]init];
            
            
            //NSLog(@"des %@",Description);
        }
        
    }
    
    
    //    for (int i=0; i<self.WebService->ptr1.count; i++) {
    //
    //        if ([[[self.WebService->ptr1 objectAtIndex:i] valueForKey:@"Description"] isEqualToString:@"INTERPRETATION"] || [[[self.WebService->ptr1 objectAtIndex:i] valueForKey:@"ResultType"] isEqualToString:@"Comment"]) {
    //
    //
    //            NSLog(@"enter");
    //        }
    //
    //        else
    //        {
    //
    //
    //        }
    //
    //
    //
    //
    //    }
    
    NSLog(@"date %@",date);
    NSLog(@"name %@",name);
    
    //    for (int i=0; i<date.count; i++) {
    //        NSLog(@"date %@",[date objectAtIndex:i]);
    //
    //        for (int j=0; j<name.count; j++) {
    //
    //            NSLog(@"date %@",[name objectAtIndex:j]);
    //
    //            [value addObject:[[self.WebService->ptr1 objectAtIndex:j]valueForKey:@"ResultValue"]];
    //
    //
    //        }
    //
    //
    //
    //    }
    NSLog(@"value %@",value);
    
    
    data1=[[[[[[[[[[[[[[[[[@"<!DOCTYPE html><html><head><title></title>"stringByAppendingString:@"<link href='kendo.common.min.css' rel='stylesheet'/><link href='kendo.dataviz.metro.min.css' rel='stylesheet'/>"]stringByAppendingString:@"<link href='kendo.metro.min.css' rel='stylesheet'/><script src='jquery-1.9.1.js'></script><script src='kendo.all.min.js'>"]stringByAppendingString:@"</script></head><body><div id='example' class='k-content'>"]stringByAppendingString:@"<div class='chart-wrapper'<div id ='compareChart'></div><br /><br /><table class='history'>"]stringByAppendingString:div]stringByAppendingString:@"</table></div>"]stringByAppendingString:@"<script>function createChart(){"]stringByAppendingString:jqry]stringByAppendingString:@"} function createCompareChart() {"]stringByAppendingString:[self getjquerycompare:date andName:name andValue:value]]stringByAppendingString:@"}"]stringByAppendingString:@"$(document).ready(function(){setTimeout(function(){createChart(); createCompareChart();$('#example').bind('kendo:skinChange',"]stringByAppendingString:@"function(e){createChart(); createCompareChart();});}, 100);});"]stringByAppendingString:@"</script>"]stringByAppendingString:@"<style scoped> .history{border-collapse: collapse;width: 100%;}.history td.chart{width: 430px;}.history .k-chart{height: 65px;width: 400px;}"]stringByAppendingString:@".history td.item{line-height: 65px;width: 20px;text-align: right;padding-bottom: 22px;}.chart-wrapper{width: 450px;height: 350px;}</style>"]stringByAppendingString:@"</div></body></html>"];
    
    
    
    
    
    
    //    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    //    NSString *htmlString = [NSString stringWithContentsOfFile:filePath];
    //    if (htmlString) {
    //        [webView loadHTMLString:htmlString baseURL:baseURL];
    //    }
    //
    //    [self.view addSubview:webView];
    
    
    webView = [[UIWebView alloc]initWithFrame:CGRectMake(0,0,320,self.view.frame.size.height)];
    //webView = [[UIWebView alloc] initWithFrame:self.view.frame];
      webView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    // webView.autoresizesSubviews = YES;
    [webView.scrollView setShowsHorizontalScrollIndicator:YES];
    webView.delegate=self;
    [webView.scrollView setScrollEnabled:YES];
    
    //make the background transparent
    // [webView setBackgroundColor:[UIColor clearColor]];
    webView.backgroundColor=[UIColor grayColor];
    [self.view addSubview:webView];
    CALayer  *imageLayer = webView.layer;
    [imageLayer setCornerRadius:02];
    [imageLayer setBorderWidth:1];
    imageLayer.borderColor=[[UIColor grayColor] CGColor];
    
    // NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    //NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html" inDirectory:nil];
    // NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    // [webView loadHTMLString:htmlString baseURL:nil];
    
    
    //  NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"sample" ofType:@"html" inDirectory:@"html_files"];
    
    // NSData *htmlData = [NSData dataWithContentsOfFile:data];
    //NSLog(@"ns data %@",htmlData);
    //    webView = [UIWebView alloc] init];
    //[webView loadData:htmlData MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:[NSURL URLWithString:@""]];
    
    
    NSString *path =[[[NSBundle mainBundle] bundlePath] stringByAppendingString:@"/htdocs/"];
    // [webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]]];
    NSURL *url=  [NSURL fileURLWithPath:path];
    
    NSData* data11=[data1 dataUsingEncoding:NSUTF8StringEncoding];
    
    [webView loadData:data11 MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:url];
    
    
    
    //[webView loadHTMLString:htmlFile baseURL:nil];
    NSLog(@"data %@",data1);
    NSLog(@"date %@",date);
    //    NSLog(@"name %@",name);
//    int y=10;
////    [self CallServiceGraphDetails:@"AdviseDate"];
//    for (int i=0; i<(self.WebService->ptr1).count; i++)
//    {
//        UILabel *Date=[[UILabel alloc]initWithFrame:CGRectMake(05,y,80,20)];
//        Date.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
//
//        Date.font = [UIFont systemFontOfSize:10.0];
//        Date.backgroundColor=[UIColor whiteColor];
//       // [self CallServiceGraphDetails:@"AdviseDate"];
//
//        [Date setText:[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:i]valueForKey:@"AdviseDate"]]] ;
//        NSLog(@"date is %@",Date);
//        [scrollview addSubview:Date];
//        
//        UILabel *Description=[[UILabel alloc]initWithFrame:CGRectMake(70,y,100,20)];
//          Description.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
//        Description.font = [UIFont systemFontOfSize:10.0];
//        Description.backgroundColor=[UIColor whiteColor];
//    
//        
//        [Description setText:[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:i]valueForKey:@"Description"]]] ;
//         NSLog(@"date is %@",Description);
//        [scrollview addSubview:Description];
//
//        UILabel *Serial=[[UILabel alloc]initWithFrame:CGRectMake(170,y,80,20)];
//        Serial.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
//
//        Serial.font = [UIFont systemFontOfSize:10.0];
//        Serial.backgroundColor=[UIColor whiteColor];
//        
//        
//        [Serial setText:[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:i]valueForKey:@"CaseCode"]]] ;
//        NSLog(@"date is %@",Serial);
//        [scrollview addSubview:Serial];
//
//        UILabel *Result=[[UILabel alloc]initWithFrame:CGRectMake(270,y,80,20)];
//        Result.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
//
//        Result.font = [UIFont systemFontOfSize:10.0];
//        Result.backgroundColor=[UIColor whiteColor];
//        
//        NSLog(@"val is %@",[[self.WebService->ptr1 objectAtIndex:i]valueForKey:@"ResultValue"]);
//        
//         if([[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:i]valueForKey:@"ResultValue"]]isEqualToString:@"<null>"])
//         {
//             
//             Result.text=@"";
//         }
//        else
//        {
//            [Result setText:[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:i]valueForKey:@"ResultValue"]]] ;
//        }
//        
//        NSLog(@"date is %@",Result);
//        [scrollview addSubview:Result];
//
//            
//        y=y+20;
//        
////        Result_val=[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:i]valueForKey:Str]];
////        NSLog(@"%@", Result_val);
////        GraphDetail=(NSMutableArray*)Result_val;
////        NSLog(@"%@", GraphDetail);
//        
//    }
//
//
//    
    
    //GraphDetail=(NSMutableArray*)self.WebService->ptr1;
    
    // Do any additional setup after loading the view from its nib.
}

-(void)createPDFfromUIView:(UIView*)aView saveToDocumentsWithFileName:(NSString*)aFilename
{
    // Creates a mutable data object for updating with binary data, like a byte array
    NSMutableData *pdfData = [NSMutableData data];
    
    // Points the pdf converter to the mutable data object and to the UIView to be converted
    UIGraphicsBeginPDFContextToData(pdfData, aView.bounds, nil);
    UIGraphicsBeginPDFPage();
    CGContextRef pdfContext = UIGraphicsGetCurrentContext();
    
    
    // draws rect to the view and thus this is captured by UIGraphicsBeginPDFContextToData
    
    [aView.layer renderInContext:pdfContext];
    
    // remove PDF rendering context
    UIGraphicsEndPDFContext();
    
    // Retrieves the document directories from the iOS device
    NSArray* documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    
    NSString* documentDirectory = [documentDirectories objectAtIndex:0];
    NSString* documentDirectoryFilename = [documentDirectory stringByAppendingPathComponent:aFilename];
    
    // instructs the mutable data object to write its context to a file on disk
    [pdfData writeToFile:documentDirectoryFilename atomically:YES];
    NSLog(@"documentDirectoryFileName: %@",documentDirectoryFilename);
}
-(NSString*)getdiv:(NSString*)desc andid:(NSString*)idd
{
    
    NSString *str=[[[[@"<tr><td><b>" stringByAppendingString:desc]stringByAppendingString:@"</b></td></tr><tr><td class='chart'><div id='chart-" ] stringByAppendingString:idd]stringByAppendingString:@"'></div></td></tr>"];
    
    NSLog(@"str %@",str);
    return str;
}
-(NSString*)getjquery:(NSString*)desc andval:(NSString*)value andlow:(NSString*)low andrangfrm:(NSString*)rngfr andrngto:(NSString*)rnfto andhigh:(NSString*)high
{
    NSString *min=low;
    NSString *max=high;
    if ([value floatValue]>[high floatValue]) {
        
        max=[[NSString stringWithFormat:@"%f", [value floatValue]+5.0  ]stringByAppendingString:@""];
    }
    else
    {
        max=[[NSString stringWithFormat:@"%f", [high floatValue]+5.0  ]stringByAppendingString:@""];
    }
    
    if ([low floatValue]>[value floatValue] && [value floatValue]<5) {
        
        min=@"0";
    }
    
    if (([low floatValue]>[value floatValue] && [value floatValue]>5)) {
        min=[[NSString stringWithFormat:@"%f", [value floatValue]-5.0  ]stringByAppendingString:@""];
    }
    NSLog(@"low %@",low);
    desc=[desc stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSLog(@"desc %@",[@"123 " stringByAppendingString:[NSString stringWithFormat:@"%@",low]]);
    
    
    
    
    NSString *data=[[[[[[[[[[[[[[[[[[[[@"$('#chart-" stringByAppendingString:desc]stringByAppendingString:@"').kendoChart({legend:{visible: true}, series: [{type: 'bullet', data: [[0, "]stringByAppendingString:value]stringByAppendingString:@"]]}],chartArea:{margin:{left: 0}}, categoryAxis:{majorGridLines:{visible: false},majorTicks:{visible: false}}, valueAxis: [{plotBands: [{from:"]stringByAppendingString:[NSString stringWithFormat:@"%@",low]]stringByAppendingString:@", to:"]stringByAppendingString:[NSString stringWithFormat:@"%@",rngfr]]stringByAppendingString:@", color: 'orange', opacity: .5},{from:"]stringByAppendingString:[NSString stringWithFormat:@"%@",rngfr]]stringByAppendingString:@", to:"]stringByAppendingString:[NSString stringWithFormat:@"%@",rnfto]]stringByAppendingString:@", color: 'green', opacity: 1.0},{from: "] stringByAppendingString:[NSString stringWithFormat:@"%@",rnfto]]stringByAppendingString:@", to:"]stringByAppendingString:[NSString stringWithFormat:@"%@",high]]stringByAppendingString:@", color: 'orange', opacity: 0.5}],majorGridLines:{visible: false}, min:"]stringByAppendingString:[NSString stringWithFormat:@"%@",min]]stringByAppendingString:@", max:"]stringByAppendingString:[NSString stringWithFormat:@"%@",max]]stringByAppendingString:@", minorTicks:{visible: true}}],tooltip:{visible: true, shared: true, template: 'Result Value: #=value.target #'}});"];
    
    NSLog(@"Jquery Data %@", data);
    return data;
    
}
-(NSString*)getjquerycompare:(NSMutableArray*)date andName:(NSMutableArray*)name andValue:(NSMutableArray*)value
{
    
    
    int i=0;
    NSLog(@"i val%d",i);
    
    NSLog(@"date %@",[date objectAtIndex:i]);
    NSLog(@"date %@",date);
    NSLog(@"name %@",name);
    NSLog(@"value %@",value);
    NSLog(@"value count %d",value.count);
    NSLog(@"name count %d",name.count);
    
    int count=value.count/name.count;
    NSLog(@"count %d",count);
    NSMutableArray *newlist=[[NSMutableArray alloc]init];
    //    for (int i=0; i<date.count; i++) {
    //        NSString *text=[[@"'" stringByAppendingString:[date objectAtIndex:i]]stringByAppendingString:@"'"];
    //        [newlist addObject:text];
    //
    //    }
    NSLog(@"list %@",newlist);
    NSString *series=@"";
    for(int i=0;i<name.count;i++) {
        // Log.i("count*i count", "" + count*i + count) ;
        
        
        series=[[[series stringByAppendingString:@"{name:'"]stringByAppendingString:[name objectAtIndex:i]]stringByAppendingString:@"', data: ["];
        
        NSLog(@"series 1 %@",series);
        
        for (int j=0; j<count; j++) {
            series=[[series stringByAppendingString:[value objectAtIndex:i + name.count*j]]stringByAppendingString:@","] ;
            NSLog(@"series 2 %@",series);
        }
        series=[series stringByAppendingString:@"]},"];
        NSLog(@"series 3 %@",series);
        
    }
    NSLog(@"series 4 %@",series);
    //=@"";
    //  for (int i=0; i<newlist.count; i++)
    
    NSString* json = [date JSONRepresentation];
    //[webView stringByEvaluatingJavaScriptFromString:json];
    
    
    NSString * data=[[[[[[[[[@"$('#compareChart').kendoChart({title: {text: 'Comparison Chart'},"stringByAppendingString:@"legend: {position: 'bottom'},chartArea: {background: ''},seriesDefaults: {type: 'line'},"]stringByAppendingString:@"series: ["]stringByAppendingString:series]stringByAppendingString:@"],"]stringByAppendingString:@"valueAxis: { labels: { format: '{0}' }, line: { visible: false },axisCrossingValue: 0},"]stringByAppendingString:@" categoryAxis: { categories: "]stringByAppendingString:[NSString stringWithFormat:@"%@",json]]stringByAppendingString:@", majorGridLines: { visible: false }},"]stringByAppendingString:@"tooltip: {  visible: true, format: '{0}',  template: '#= series.name #: #= value #'  } });"];
    NSLog(@"data %@",data);
    i=i+1;
    
    return  data;
    
}

-(void)CallServiceGraphDetails:(NSString *)Str
{
    for (int i=0; i<(self.WebService->ptr1).count; i++)
    {
//        Result_val=[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:i]valueForKey:Str]];
//        NSLog(@"%@", Result_val);
//        GraphDetail=(NSMutableArray*)Result_val;
//         NSLog(@"%@", GraphDetail);
        
    }
//    Result_val=[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:0]valueForKey:Str]];
//    NSLog(@"%@", Result_val);

    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
