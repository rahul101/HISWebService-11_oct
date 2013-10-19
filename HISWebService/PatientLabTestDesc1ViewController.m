//
//  PatientLabTestDesc1ViewController.m
//  HISWebService
//
//  Created by Rahul Sharma on 09/05/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import "PatientLabTestDesc1ViewController.h"
#import "PatientLabDetailsViewController.h"
#import "PatientReportViewController.h"
#import "PatientGraphDetailViewController.h"
#import "PatientReportPdfViewController.h"
#import "AppDelegate.h"
@interface PatientLabTestDesc1ViewController ()

@end

@implementation PatientLabTestDesc1ViewController
@synthesize WebService=_WebService;
@synthesize desc,dictionary;
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
    
 //  self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth ;
 //  self.view.autoresizesSubviews = YES;

    self.WebService=[[WebService alloc]init];
    
    ScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0,0,320,540)];
    ScrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth ;
    ScrollView.autoresizesSubviews = YES;
    
    [ScrollView setContentSize:CGSizeMake(320, 800)];
    
    ScrollView.scrollEnabled = YES;
    
    ScrollView.directionalLockEnabled = YES;
    
    ScrollView.showsVerticalScrollIndicator = YES;
    
    ScrollView.showsHorizontalScrollIndicator = NO;
    
    ScrollView.autoresizesSubviews = YES;
    ScrollView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:ScrollView];
    
   ScrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth ;
   ScrollView.autoresizesSubviews = YES;


    NSLog(@"patcode=%@",dictionary);
    
    NSString *Test_complete=[NSString stringWithFormat:@"%@",[dictionary valueForKey:@"IsTestCompleted"]];
    NSLog( @"testcomplete is %@",Test_complete);
    
    Case_Id=[NSString stringWithFormat:@"%@",[dictionary valueForKey:@"CaseId"]];
    NSLog( @"case id is %@",Case_Id);

    Investigation_Id=[NSString stringWithFormat:@"%@",[dictionary valueForKey:@"InvestigationId"]];
    NSLog( @"investigation id is %@",Investigation_Id);

    Test_Id=[NSString stringWithFormat:@"%@",[dictionary valueForKey:@"TestID"]];
    NSLog( @"Test id is %@",Test_Id);

    PatientCode=[NSString stringWithFormat:@"%@",[dictionary valueForKey:@"PatientCode"]];
    NSLog( @"Test id is %@",PatientCode);

    
       
    
     UILabel *PatientAdviceDate=[[UILabel alloc]initWithFrame:CGRectMake(10,10,140,30)];
     PatientAdviceDate.font = [UIFont systemFontOfSize:12.0];
     PatientAdviceDate.backgroundColor=[UIColor whiteColor];
     [PatientAdviceDate setText:@"Advised Date :"];
     [ScrollView addSubview:PatientAdviceDate];
    
    UILabel *PatientAdviceDateVal=[[UILabel alloc]initWithFrame:CGRectMake(150,10,170,30)];
    PatientAdviceDateVal.font = [UIFont boldSystemFontOfSize:15.0];
    PatientAdviceDateVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceDescription:@"AdviseDate"];
  
    NSDateFormatter  *dateFormatter = [[NSDateFormatter alloc] init];
   
    [dateFormatter setAMSymbol:@"AM"];
    [dateFormatter setPMSymbol:@"PM"];
    [dateFormatter setDateFormat:@"dd-MM-yyyy hh:mm:ss a"];
    NSDate  *myDate = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@",s2]];
    NSLog(@"%@", [dateFormatter stringFromDate:myDate]);
    
    NSDateFormatter  *anotherDateFormatter = [[NSDateFormatter alloc] init];
    [anotherDateFormatter setDateFormat:@"dd/MM/yyyy HH:mm:ss"];
    NSLog(@"%@", [anotherDateFormatter stringFromDate:myDate]);
    
    PatientAdviceDateVal.text =[anotherDateFormatter stringFromDate:myDate];
    NSLog(@"item is %@",PatientAdviceDateVal.text);
    [ScrollView addSubview:PatientAdviceDateVal];
    
    UILabel *PatientAdviceDrName=[[UILabel alloc]initWithFrame:CGRectMake(10,50,170,30)];
    PatientAdviceDrName.font = [UIFont systemFontOfSize:12.0];
    PatientAdviceDrName.backgroundColor=[UIColor whiteColor];
    [PatientAdviceDrName setText:@"Advised Doctor Name:"];
    [ScrollView addSubview:PatientAdviceDrName];
    
    UILabel *PatientAdviceDrNameVal=[[UILabel alloc]initWithFrame:CGRectMake(150,50,170,30)];
    PatientAdviceDrNameVal.font = [UIFont boldSystemFontOfSize:15.0];
    PatientAdviceDrNameVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceDescription:@"AdvisedDoctor"];
    if([s2 isEqualToString:@"<null>"])
    {
         PatientAdviceDrNameVal.text = @"";
    }
    else
    {
         PatientAdviceDrNameVal.text = [NSString stringWithFormat:@"%@",s2];
    }
     NSLog(@"item is %@",PatientAdviceDrNameVal.text);
    [ScrollView addSubview:PatientAdviceDrNameVal];
    
      
    UILabel *PatientSampleRecived=[[UILabel alloc]initWithFrame:CGRectMake(10,90,140,30)];
    PatientSampleRecived.font = [UIFont systemFontOfSize:12.0];
    PatientSampleRecived.backgroundColor=[UIColor whiteColor];
    [PatientSampleRecived setText:@"Sample Recived:"];
    [ScrollView addSubview:PatientSampleRecived];

    
    
    UILabel *PatientSampleRecivedVal=[[UILabel alloc]initWithFrame:CGRectMake(150,90,170,30)];
    PatientSampleRecivedVal.font = [UIFont boldSystemFontOfSize:15.0];
    PatientSampleRecivedVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceDescription:@"IsSampleReceived"];

    if([s2 integerValue]==1)
    {
        
        PatientSampleRecivedVal.text = @"YES";

    }
    else
    {
        PatientSampleRecivedVal.text = @"Not Received";
    }
    
  //PatientSampleRecivedVal.text = [NSString stringWithFormat:@"%@",s2];
    NSLog(@"item is %@",PatientSampleRecivedVal.text);
    [ScrollView addSubview:PatientSampleRecivedVal];
    
    
    
    
    
    UILabel *PatientSpecimen=[[UILabel alloc]initWithFrame:CGRectMake(10,130,140,30)];
    PatientSpecimen.font = [UIFont systemFontOfSize:12.0];
    PatientSpecimen.backgroundColor=[UIColor whiteColor];
    [PatientSpecimen setText:@"Specimen:"];
    [ScrollView addSubview:PatientSpecimen];
    
    
    
    
    UILabel *PatientSpecimenVal=[[UILabel alloc]initWithFrame:CGRectMake(150,130,170,30)];
    PatientSpecimenVal.font = [UIFont boldSystemFontOfSize:15.0];
    PatientSpecimenVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceDescription:@"Specimen"];
    if([s2 isEqualToString:@"<null>"])
    {
         PatientSpecimenVal.text =@"";
    }
    else
    {
    PatientSpecimenVal.text = [NSString stringWithFormat:@"%@",s2];
    }
    NSLog(@"item is %@",PatientSpecimenVal.text);
    [ScrollView addSubview:PatientSpecimenVal];
    
       
    
    UILabel *PatientLabNo=[[UILabel alloc]initWithFrame:CGRectMake(10,170,140,30)];
    PatientLabNo.font = [UIFont systemFontOfSize:12.0];
    PatientLabNo.backgroundColor=[UIColor whiteColor];
    [PatientLabNo setText:@"Lab No:"];
    [ScrollView addSubview:PatientLabNo];

    
    UILabel *PatientLabNoVal=[[UILabel alloc]initWithFrame:CGRectMake(150,170,170,30)];
    PatientLabNoVal.font = [UIFont boldSystemFontOfSize:15.0];
    PatientLabNoVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceDescription:@"LabNo"];
     if([s2 isEqualToString:@"<null>"])
     {
         PatientLabNoVal.text = @"";
     }
    else
    {
         PatientLabNoVal.text = [NSString stringWithFormat:@"%@",s2];
    }
   
    NSLog(@"item is %@",PatientLabNoVal.text);
    [ScrollView addSubview:PatientLabNoVal];
    
    
    
    UILabel *PatientReportNo=[[UILabel alloc]initWithFrame:CGRectMake(10,210,140,30)];
    PatientReportNo.font = [UIFont systemFontOfSize:12.0];
    PatientReportNo.backgroundColor=[UIColor whiteColor];
    [PatientReportNo setText:@"Report No:"];
    [ScrollView addSubview:PatientReportNo];
    

    UILabel *PatientReportNoVal=[[UILabel alloc]initWithFrame:CGRectMake(150,210,170,30)];
    PatientReportNoVal.font = [UIFont boldSystemFontOfSize:15.0];
    PatientReportNoVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceDescription:@"ReportNo"];
     if([s2 isEqualToString:@"<null>"])
     {
         PatientReportNoVal.text = @"";

     }
    else
    {
        PatientReportNoVal.text = [NSString stringWithFormat:@"%@",s2];

    }
    NSLog(@"item is %@",PatientReportNoVal.text);
    [ScrollView addSubview:PatientReportNoVal];
    
    
    
    
    UILabel *PatientDateofReport=[[UILabel alloc]initWithFrame:CGRectMake(10,250,140,30)];
    PatientDateofReport.font = [UIFont systemFontOfSize:12.0];
    PatientDateofReport.backgroundColor=[UIColor whiteColor];
    [PatientDateofReport setText:@"Date of Report:"];
    [ScrollView addSubview:PatientDateofReport];
    
    
    UILabel *PatientDateofReportVal=[[UILabel alloc]initWithFrame:CGRectMake(150,250,170,30)];
    PatientDateofReportVal.font = [UIFont boldSystemFontOfSize:15.0];
    PatientDateofReportVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceDescription:@"DateOfReport"];
    if([s2 isEqualToString:@"<null>"])
    {
         PatientDateofReportVal.text = @"";
    }
    else
    {
        NSDateFormatter  *dateFormatter = [[NSDateFormatter alloc] init];
        
        [dateFormatter setAMSymbol:@"AM"];
        [dateFormatter setPMSymbol:@"PM"];
        [dateFormatter setDateFormat:@"dd-MM-yyyy hh:mm:ss a"];
        NSDate  *myDate = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@",s2]];
        NSLog(@"%@", [dateFormatter stringFromDate:myDate]);
        
        NSDateFormatter  *anotherDateFormatter = [[NSDateFormatter alloc] init];
        [anotherDateFormatter setDateFormat:@"dd/MM/yyyy HH:mm:ss"];
        NSLog(@"%@", [anotherDateFormatter stringFromDate:myDate]);
        
          PatientDateofReportVal.text =[anotherDateFormatter stringFromDate:myDate];
       // PatientDateofReportVal.text = [NSString stringWithFormat:@"%@",s2];

    }
    NSLog(@"item is %@",PatientDateofReportVal.text);
    [ScrollView addSubview:PatientDateofReportVal];
    
    
    
    UILabel *PatientTestCompleted=[[UILabel alloc]initWithFrame:CGRectMake(10,290,140,30)];
    PatientTestCompleted.font = [UIFont systemFontOfSize:12.0];
    PatientTestCompleted.backgroundColor=[UIColor whiteColor];
    [PatientTestCompleted setText:@"Test Completed:"];
    [ScrollView addSubview:PatientTestCompleted];
    

    UILabel *PatientTestCompletedVal=[[UILabel alloc]initWithFrame:CGRectMake(150,290,170,30)];
    PatientTestCompletedVal.font=[UIFont boldSystemFontOfSize:15.0];
    PatientTestCompletedVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceDescription:@"IsTestCompleted"];
    
    NSLog(@"s2 =%@",s2);
    if([s2 isEqualToString:@"<null>"])
    {
    PatientTestCompletedVal.text = @"Pending";
    }
    else
    {
    PatientTestCompletedVal.text = @"YES";
    }
    NSLog(@"item is %@",PatientTestCompletedVal.text);
    [ScrollView addSubview:PatientTestCompletedVal];

       

    
    
    if(![Test_complete isEqualToString:@"<null>"])
    {
        
        ViewReport=[[UIButton alloc]initWithFrame:CGRectMake(10,330,120,40)];
        ViewReport.backgroundColor=[UIColor colorWithRed:49/256. green:128/256. blue:231/256. alpha:1];

        [ViewReport setTitle:@"View Report" forState:UIControlStateNormal];
        ViewReport.titleLabel.font=[UIFont boldSystemFontOfSize:15.0];
        [ViewReport addTarget:self action:@selector(CallServiceViewReport) forControlEvents:UIControlEventTouchUpInside];
        [ScrollView addSubview:ViewReport];
        
        ViewDetail=[[UIButton alloc]initWithFrame:CGRectMake(150,330,150,40)];
        ViewDetail.backgroundColor=[UIColor colorWithRed:49/256. green:128/256. blue:231/256. alpha:1];
        
        [ViewDetail setTitle:@"View Graph Detail" forState:UIControlStateNormal];
        ViewDetail.titleLabel.font=[UIFont boldSystemFontOfSize:15.0];
        [ViewDetail addTarget:self action:@selector(CallServiceViewGraphDetail) forControlEvents:UIControlEventTouchUpInside];
        [ScrollView addSubview:ViewDetail];

        ViewReportPDF=[[UIButton alloc]initWithFrame:CGRectMake(10,380,150,40)];
        ViewReportPDF.backgroundColor=[UIColor colorWithRed:49/256. green:128/256. blue:231/256. alpha:1];
        
        [ViewReportPDF setTitle:@"View Report Pdf" forState:UIControlStateNormal];
        ViewReportPDF.titleLabel.font=[UIFont boldSystemFontOfSize:15.0];
        [ViewReportPDF addTarget:self action:@selector(CallServiceViewReportPdf) forControlEvents:UIControlEventTouchUpInside];
        [ScrollView addSubview:ViewReportPDF];
        

//        self.WebService->case_id=Case_Id;
//        self.WebService->investigation_id=Investigation_Id;
//        self.WebService->test_id=Test_Id;
//        [self.WebService CallServiceGetpatienttestReport:@"http://192.168.1.202:81/LaboratoryModule/LISService.asmx/GetpatienttestReport" Object:NULL Handler:NULL];
//        
//        NSLog(@"data is %@",self.WebService->byteArray);
//
        
        
      /*  NSLog(@"case id is %@",self.WebService->case_id=Case_Id);
        NSLog(@"investigation is %@",self.WebService->investigation_id=Investigation_Id);
        NSLog(@"test id is %@",self.WebService->test_id=Test_Id);
        
        
        [self.WebService CallServicePatienReportDetails:@"http://192.168.1.202:81/LaboratoryModule/LISService.asmx/GetpatienttestDetails" Object:NULL Handler:NULL];*/
        
      //  NSLog(@"patient report is %@",self.WebService->ptr1);
        
        
        
        
                 
    }
    // Do any additional setup after loading the view from its nib.
}

-(void)CallServiceViewReport
{
    PatientReportViewController *PatientReport=[[PatientReportViewController alloc]init];
    
    PatientReport.CaseID=[NSString stringWithFormat:@"%@",Case_Id];
    PatientReport.InvestigationID=[NSString stringWithFormat:@"%@",Investigation_Id];
    PatientReport.TestID=[NSString stringWithFormat:@"%@",Test_Id];
    
    [self.navigationController pushViewController:PatientReport animated:YES];
    
     
}
-(void)CallServiceViewGraphDetail
{
   PatientGraphDetailViewController *PatientReport=[[PatientGraphDetailViewController alloc]init];
    
    PatientReport.CaseID=[NSString stringWithFormat:@"%@",Case_Id];
    PatientReport.InvestigationID=[NSString stringWithFormat:@"%@",Investigation_Id];
    PatientReport.TestID=[NSString stringWithFormat:@"%@",Test_Id];
    PatientReport.Patient_Code=[NSString stringWithFormat:@"%@",PatientCode];
    [self.navigationController pushViewController:PatientReport animated:YES];
    
}
-(void)CallServiceViewReportPdf
{
    ViewDetail.userInteractionEnabled=NO;
    ViewReport.userInteractionEnabled=NO;
    UIActivityIndicatorView *myIndicator = [[UIActivityIndicatorView alloc]
                                            initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    // Position the spinner
    [myIndicator setCenter:CGPointMake(70.0, 20.0)];
    
    // Add to button
    [ViewReportPDF addSubview:myIndicator];
    
    if([myIndicator isAnimating])
        [myIndicator stopAnimating];
    else
        [myIndicator startAnimating];

    
    self.WebService->case_id=Case_Id;
//    self.WebService->investigation_id=Investigation_Id;
//    self.WebService->test_id=Test_Id;
   // self.WebService->case_id=[[WorkListView objectAtIndex:0]valueForKey:@"caseid"];
    
    NSMutableArray *testdate=[[NSMutableArray alloc]init];
    
    NSDictionary *dict=[NSDictionary dictionaryWithObjectsAndKeys:Investigation_Id,@"InvestigationId",Test_Id,@"TestId", nil];
   
                  [testdate addObject:dict];
   
    
    NSLog(@"arr %@",self.WebService->Detail_AdviseInvestigation=(NSMutableArray*)testdate);
    
    
    
    [self.WebService CallServiceGetpatienttestReport:@"http://192.168.1.202:81/LaboratoryModule/LISService.asmx/GetpatienttestReport" Object:NULL Handler:NULL];
    
    NSLog(@"data is %@",self.WebService->byteArray);
    

//     ViewReportPDF.backgroundColor=[UIColor colorWithRed:100/256. green:150/256. blue:255/256. alpha:1];
//    PatientReportPdfViewController *ReportPdf=[[PatientReportPdfViewController alloc]init];
//    ReportPdf.CaseID=[NSString stringWithFormat:@"%@",Case_Id];
//    ReportPdf.InvestigationID=[NSString stringWithFormat:@"%@",Investigation_Id];
//    ReportPdf.TestID=[NSString stringWithFormat:@"%@",Test_Id];
//    
    
       //    NSData *myFile = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"your_url"]];
    //    [myFile writeToFile:[NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath], @"abcd.pdf"] atomically:YES];
    
    
    // NSData *pdfData = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:tempString]]
    
    
    NSMutableData *data2 = [[NSMutableData alloc] initWithCapacity:self.WebService->byteArray.count];
    for (NSNumber *byteVal in self.WebService->byteArray)
    {
        Byte b = (Byte)(byteVal.intValue);
        [data2 appendBytes:&b length:1];
        
        
        // NSLog(@"data %@",data2);
    }

  //  [self.navigationController pushViewController:ReportPdf animated:YES];

    if([myIndicator isAnimating])
    {
        [myIndicator stopAnimating];
        myIndicator.hidden=YES;
        
    }
    
    NSString *resourceToPath = [[NSString alloc]initWithString:[[[[NSBundle mainBundle]resourcePath]stringByDeletingLastPathComponent]stringByAppendingPathComponent:@"Documents"]];
   NSString *fileName = [resourceToPath stringByAppendingPathComponent:@"Patient Report.pdf"];
    NSLog(@"file %@",fileName);
    [data2 writeToFile:fileName atomically:YES];

    NSArray  *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    NSString *pdfFilePath =[documentsDir stringByAppendingPathComponent:@"Patient Report.pdf"];// your yourPdfFile file here
    NSLog(@"pdf file %@",pdfFilePath);
    NSURL *url = [NSURL fileURLWithPath:pdfFilePath];
    //  UIDocumentInteractionController *docController = [UIDocumentInteractionController interactionControllerWithURL:url];
    //
    //   docController.delegate = self;
    //  [docController retain];
    // docController is released when dismissed (autorelease in the delegate method)
    
//    NSArray *paths1 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *basePath = ([paths1 count] > 0) ? [paths1 objectAtIndex:0] : nil;
//    
//    NSLog(@"base path %@",basePath);
//    
    if (url)
    {
        // Initialize Document Interaction Controller
        UIDocumentInteractionController    * documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:url];
        documentInteractionController.name=@"Patient Report";
        
        // Configure Document Interaction Controller
        [documentInteractionController setDelegate:self];
        
        // Preview PDF
        [documentInteractionController presentPreviewAnimated:YES];
    }
    ViewDetail.userInteractionEnabled=YES;
    ViewReport.userInteractionEnabled=YES;
}
- (UIViewController *) documentInteractionControllerViewControllerForPreview: (UIDocumentInteractionController *) controller
{
   // Use the rootViewController here so that the preview is pushed onto the navbar stack
   AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
   return appDelegate.window.rootViewController;
    
}

//- (UIViewController *) documentInteractionControllerViewControllerForPreview: (UIDocumentInteractionController *) controller
//{
//    return self;
//}
-(void)CallServiceDescription:(NSString *)Str
{
    s2 =[NSString stringWithFormat:@"%@",[dictionary valueForKey:Str]];
    NSLog(@"%@", s2);

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
