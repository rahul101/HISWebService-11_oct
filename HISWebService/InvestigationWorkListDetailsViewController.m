//
//  InvestigationWorkListDetailsViewController.m
//  HISWebService
//
//  Created by Rahul Sharma on 17/07/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import "InvestigationWorkListDetailsViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "PatientReportPdfViewController.h"
#import "InvestigationWorkListReportGenerateViewController.h"
#import "PatientLabDetailsViewController.h"
#import "AdviseInvestigationViewController.h"
#import "AppDelegate.h"
#import "NSString+HTML.h"

@interface InvestigationWorkListDetailsViewController ()

@end

@implementation InvestigationWorkListDetailsViewController
@synthesize WorkListDetails,WebService=_WebService;

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
    //ViewPage.hidden=NO;

    self.WebService=[[WebService alloc]init];
    testdate=[[NSMutableArray alloc]init];
    scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0,10,320,568)];
    [scrollview setContentSize:CGSizeMake(320,1000)];
    scrollview.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight) ;
    scrollview.autoresizesSubviews = YES;
    scrollview.scrollEnabled = YES;
    scrollview.delegate = self;
    scrollview.directionalLockEnabled = YES;
    scrollview.showsVerticalScrollIndicator = YES;
    scrollview.showsHorizontalScrollIndicator = YES;
    scrollview.autoresizesSubviews = YES;
    scrollview.backgroundColor=[UIColor whiteColor];
   [self.view addSubview:scrollview];
    
    [self.view addSubview:ViewPage];
    ViewPage.hidden=YES;
    
    NSLog(@"worklist %@",WorkListDetails);
    
    UILabel *PatientCode =[[UILabel alloc]initWithFrame:CGRectMake(10,20,140,30)];
    PatientCode.font = [UIFont systemFontOfSize:12.0];
    PatientCode.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    PatientCode.backgroundColor=[UIColor whiteColor];
    [PatientCode setText:@"Patient Code:"];
    [scrollview addSubview:PatientCode];
    
    UILabel *PatientCodeVal=[[UILabel alloc]initWithFrame:CGRectMake(150,20,120,30)];
    PatientCodeVal.font = [UIFont boldSystemFontOfSize:12.0];
    PatientCodeVal.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    
    PatientCodeVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceDetail:@"PatientCode"];
    PatientCodeVal.text = [NSString stringWithFormat:@"%@",string];
    NSLog(@"item is %@",PatientCodeVal.text);
    [scrollview addSubview:PatientCodeVal];
    
    UILabel *PatientName =[[UILabel alloc]initWithFrame:CGRectMake(10,60,140,30)];
    PatientName.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    
    PatientName.font = [UIFont systemFontOfSize:12.0];
    PatientName.backgroundColor=[UIColor whiteColor];
    [PatientName setText:@"Patient Name:"];
    [scrollview addSubview:PatientName];
    
    UILabel *PatientNameVal=[[UILabel alloc]initWithFrame:CGRectMake(150,60,140,30)];
    PatientNameVal.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    
    PatientNameVal.font = [UIFont boldSystemFontOfSize:12.0];
    PatientNameVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceDetail:@"PatientName"];
    PatientNameVal.text = [NSString stringWithFormat:@"%@",string];
    NSLog(@"item is %@",PatientNameVal.text);
    [scrollview addSubview:PatientNameVal];
    
    UILabel *AdviceDr =[[UILabel alloc]initWithFrame:CGRectMake(10,100,140,30)];
    AdviceDr.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    
    AdviceDr.font = [UIFont systemFontOfSize:12.0];
    AdviceDr.backgroundColor=[UIColor whiteColor];
    [AdviceDr setText:@"Advised By:"];
    [scrollview addSubview:AdviceDr];
    
    
    UILabel *AdviceDrVal=[[UILabel alloc]initWithFrame:CGRectMake(150,100,140,30)];
    AdviceDrVal.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    
    AdviceDrVal.font = [UIFont boldSystemFontOfSize:12.0];
    AdviceDrVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceDetail:@"AdvisedDoctor"];
    if([string isEqualToString:@"<null>"])
    {
        AdviceDrVal.text = @"";
    }
    else
    {
        AdviceDrVal.text = [NSString stringWithFormat:@"%@",string];
    }
    
    NSLog(@"item is %@",AdviceDrVal.text);
    [scrollview addSubview:AdviceDrVal];
    
    UILabel *AdviceDate =[[UILabel alloc]initWithFrame:CGRectMake(10,140,140,30)];
    AdviceDate.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    
    AdviceDate.font = [UIFont systemFontOfSize:12.0];
    AdviceDate.backgroundColor=[UIColor whiteColor];
    [AdviceDate setText:@"Advise Date:"];
    [scrollview addSubview:AdviceDate];
    
    UILabel *AdviceDateVal=[[UILabel alloc]initWithFrame:CGRectMake(150,140,140,30)];
    AdviceDateVal.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    
    AdviceDateVal.font = [UIFont boldSystemFontOfSize:12.0];
    AdviceDateVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceDetail:@"Dt"];
    
    AdviceDateVal.text = [NSString stringWithFormat:@"%@",string];
    [scrollview addSubview:AdviceDateVal];
    
    
    UILabel *SNo =[[UILabel alloc]initWithFrame:CGRectMake(10,180,100,30)];
    SNo.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    
    SNo.font = [UIFont systemFontOfSize:12.0];
    SNo.backgroundColor=[UIColor whiteColor];
    [SNo setText:@"S.No.:"];
    [scrollview addSubview:SNo];
    
    
    UILabel *SNoVal=[[UILabel alloc]initWithFrame:CGRectMake(150,180,140,30)];
    SNoVal.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    SNoVal.font = [UIFont boldSystemFontOfSize:12.0];
    SNoVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceDetail:@"SrNo"];
    SNoVal.text = [NSString stringWithFormat:@"%@",string];
    NSLog(@"item is %@",SNoVal.text);
    [scrollview addSubview:SNoVal];
    
    UILabel *Gender =[[UILabel alloc]initWithFrame:CGRectMake(10,220,100,30)];
    Gender.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    
    Gender.font = [UIFont systemFontOfSize:12.0];
    Gender.backgroundColor=[UIColor whiteColor];
    [Gender setText:@"Gender:"];
    [scrollview addSubview:Gender];
    
    
    UILabel *GenderVal=[[UILabel alloc]initWithFrame:CGRectMake(150,220,140,30)];
    GenderVal.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    
    GenderVal.font = [UIFont boldSystemFontOfSize:12.0];
    GenderVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceDetail:@"Sex"];
    GenderVal.text = [NSString stringWithFormat:@"%@",string];
    NSLog(@"item is %@",GenderVal.text);
    [scrollview addSubview:GenderVal];
    
    
    UILabel *Age =[[UILabel alloc]initWithFrame:CGRectMake(10,260,140,30)];
    Age.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    
    Age.font = [UIFont systemFontOfSize:12.0];
    Age.backgroundColor=[UIColor whiteColor];
    [Age setText:@"Age:"];
    [scrollview addSubview:Age];
    
    
    UILabel *AgeVal=[[UILabel alloc]initWithFrame:CGRectMake(150,260,140,30)];
    AgeVal.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    
    AgeVal.font = [UIFont boldSystemFontOfSize:12.0];
    AgeVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceDetail:@"Age"];
    AgeVal.text = [NSString stringWithFormat:@"%@",string];
    NSLog(@"item is %@",AgeVal.text);
    [scrollview addSubview:AgeVal];
    
    UILabel *status =[[UILabel alloc]initWithFrame:CGRectMake(10,300,140,30)];
    status.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    
    status.font = [UIFont systemFontOfSize:12.0];
    status.backgroundColor=[UIColor whiteColor];
    [status setText:@"Status:"];
    [scrollview addSubview:status];
    
    UILabel *statusVal=[[UILabel alloc]initWithFrame:CGRectMake(150,300,140,30)];
    statusVal.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    
    statusVal.font = [UIFont boldSystemFontOfSize:12.0];
    statusVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceDetail:@"IsPartial"];
    NSString *ispartial=[NSString stringWithFormat:@"%@",string];
    NSLog(@"ispartial %@",ispartial);
    
    [self CallServiceDetail:@"IsCompleted"];
    NSString *IsCompleted=[NSString stringWithFormat:@"%@",string];
    NSLog(@"iscomplet %@",IsCompleted);
    
    [self CallServiceDetail:@"IsInCompleted"];
    NSString *IsInCompleted=[NSString stringWithFormat:@"%@",string];
    NSLog(@"isincomplet %@",IsInCompleted);
    if([ispartial isEqualToString:@"false"]&&[IsCompleted isEqualToString:@"true"]&&[IsInCompleted isEqualToString:@"false"])
    {
        statusVal.text = @"Complete";
        
    }
    else if([ispartial isEqualToString:@"true"]&&[IsCompleted isEqualToString:@"false"]&&[IsInCompleted isEqualToString:@"false"])
    {
        statusVal.text = @"Partially Complete";
        
    }
    else
    {
        statusVal.text = @"InComplete";
        
    }
    NSLog(@"item is %@",statusVal.text);
    [scrollview addSubview:statusVal];
    
    UILabel *urgent =[[UILabel alloc]initWithFrame:CGRectMake(10,340,140,30)];
    urgent.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    
    urgent.font = [UIFont systemFontOfSize:12.0];
    urgent.backgroundColor=[UIColor whiteColor];
    [urgent setText:@"IsUrgent:"];
    [scrollview addSubview:urgent];
    
    
    UILabel *UrgentVal=[[UILabel alloc]initWithFrame:CGRectMake(150,340,140,30)];
    UrgentVal.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    
    UrgentVal.font = [UIFont boldSystemFontOfSize:12.0];
    UrgentVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceDetail:@"Urgent"];
    if([string isEqualToString:@"0"])
    {
        UrgentVal.text =@"No";
    }
    else
    {
        UrgentVal.text =@"Yes";
    }
    NSLog(@"item is %@",UrgentVal.text);
    [scrollview addSubview:UrgentVal];
    
    UILabel *modeOfdelivery =[[UILabel alloc]initWithFrame:CGRectMake(10,380,140,30)];
    modeOfdelivery.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    
    modeOfdelivery.font = [UIFont systemFontOfSize:12.0];
    modeOfdelivery.backgroundColor=[UIColor whiteColor];
    [modeOfdelivery setText:@"Mode Of Delivery:"];
    [scrollview addSubview:modeOfdelivery];
    
    UILabel *modeOfdeliveryVal=[[UILabel alloc]initWithFrame:CGRectMake(150,380,140,30)];
    modeOfdeliveryVal.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    
    modeOfdeliveryVal.font = [UIFont boldSystemFontOfSize:12.0];
    modeOfdeliveryVal.backgroundColor=[UIColor whiteColor];
    NSString *mode=[NSString stringWithFormat:@"%@",[[WorkListDetails objectAtIndex:0 ]valueForKey:@"Report"]];
    if([mode isEqualToString:@"5"])
    {
        modeOfdeliveryVal.text=@"Self";
    }
    else if ([mode isEqualToString:@"4"])
    {
        modeOfdeliveryVal.text=@"Courier";
    }
    else if ([mode isEqualToString:@"3"])
    {
        modeOfdeliveryVal.text=@"Hospital/Doctor";
    }
    else if ([mode isEqualToString:@"2"])
    {
        modeOfdeliveryVal.text=@"Email";
    }
    else if ([mode isEqualToString:@"1"])
    {
        modeOfdeliveryVal.text=@"Direct/By Hand";
    }
    //[self CallServiceDetail:@"Age"];
    // modeOfdeliveryVal.text = [NSString stringWithFormat:@"%@",string];
    NSLog(@"item is %@",modeOfdeliveryVal.text);
    [scrollview addSubview:modeOfdeliveryVal];
    
    self.WebService->case_id=[NSString stringWithFormat:@"%@",[[WorkListDetails objectAtIndex:0]valueForKey:@"caseid"]];
    NSLog(@"cade %@",self.WebService->case_id);
    [self.WebService CallServiceInvestigationBindDetails:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/BindDetails" Object:NULL Handler:NULL];
    
    NSLog(@"data is %@",self.WebService->data1);
    
    WorkListView=(NSMutableArray*)self.WebService->data1;
    // [WorkListView addObject:self.WebService->data1];
    
    NSLog(@"WorkListView is %@",WorkListView);
    
    _scroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 430, 320, 200)];
    [_scroll setContentSize:CGSizeMake(630,100)];
    _scroll.bounces=NO;
 //   _scroll.backgroundColor=[UIColor brownColor];
    [scrollview addSubview:_scroll];

    
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(1,1,630,50)];
    lable.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    lable.font = [UIFont systemFontOfSize:10.0];
    // lable.backgroundColor=[UIColor grayColor];
    lable.backgroundColor=[UIColor colorWithRed:245/256. green:245/256. blue:245/256. alpha:1];
    [_scroll addSubview:lable];
    
    UILabel *lable_Labno=[[UILabel alloc]initWithFrame:CGRectMake(1,10,80,30)];
    lable_Labno.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    lable_Labno.font = [UIFont systemFontOfSize:12.0];
    lable_Labno.textAlignment = NSTextAlignmentCenter;
    // lable.backgroundColor=[UIColor grayColor];
    lable_Labno.text=@"Lab No";
    lable_Labno.backgroundColor=[UIColor colorWithRed:200/256. green:200/256. blue:200/256. alpha:1];
    [lable addSubview:lable_Labno];
    
    UILabel *lable_Testname=[[UILabel alloc]initWithFrame:CGRectMake(90,10,140,30)];
    lable_Testname.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    lable_Testname.textAlignment = NSTextAlignmentCenter;
    lable_Testname.font = [UIFont systemFontOfSize:12.0];
    // lable.backgroundColor=[UIColor grayColor];
    lable_Testname.backgroundColor=[UIColor colorWithRed:200/256. green:200/256. blue:200/256. alpha:1];
    lable_Testname.text=@"Test Name";
    [lable addSubview:lable_Testname];
    
    UILabel *lable_reportno=[[UILabel alloc]initWithFrame:CGRectMake(250,10,110,30)];
    lable_reportno.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    lable_reportno.textAlignment = NSTextAlignmentCenter;
    lable_reportno.font = [UIFont systemFontOfSize:12.0];
    // lable.backgroundColor=[UIColor grayColor];
    lable_reportno.backgroundColor=[UIColor colorWithRed:200/256. green:200/256. blue:200/256. alpha:1];
    lable_reportno.text=@"Report No";
    [lable addSubview:lable_reportno];
//    
//    UILabel *lable_advisedate=[[UILabel alloc]initWithFrame:CGRectMake(340,10,120,30)];
//    lable_advisedate.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
//    lable_advisedate.textAlignment = NSTextAlignmentCenter;
//    lable_advisedate.font = [UIFont systemFontOfSize:12.0];
//    // lable.backgroundColor=[UIColor grayColor];
//    lable_advisedate.backgroundColor=[UIColor colorWithRed:200/256. green:200/256. blue:200/256. alpha:1];
//    lable_advisedate.text=@"Advise Date";
//    [lable addSubview:lable_advisedate];
    
    UILabel *lable_reportstatus=[[UILabel alloc]initWithFrame:CGRectMake(370,10,80,30)];
    lable_reportstatus.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    lable_reportstatus.textAlignment = NSTextAlignmentCenter;
    lable_reportstatus.font = [UIFont systemFontOfSize:12.0];
    // lable.backgroundColor=[UIColor grayColor];
    lable_reportstatus.backgroundColor=[UIColor colorWithRed:200/256. green:200/256. blue:200/256. alpha:1];
    lable_reportstatus.text=@"Report Status";
    [lable addSubview:lable_reportstatus];
    
    UILabel *Lable_sample=[[UILabel alloc]initWithFrame:CGRectMake(460,10,100,30)];
    Lable_sample.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    Lable_sample.textAlignment = NSTextAlignmentCenter;
    Lable_sample.font = [UIFont systemFontOfSize:12.0];
    // lable.backgroundColor=[UIColor grayColor];
    Lable_sample.backgroundColor=[UIColor colorWithRed:200/256. green:200/256. blue:200/256. alpha:1];
    Lable_sample.text=@"Sample";
    [lable addSubview:Lable_sample];
    
//    UILabel *Lable_PanelCompany=[[UILabel alloc]initWithFrame:CGRectMake(650,10,100,30)];
//    Lable_PanelCompany.textAlignment = NSTextAlignmentCenter;
//    Lable_PanelCompany.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
//    Lable_PanelCompany.font = [UIFont systemFontOfSize:12.0];
//    // lable.backgroundColor=[UIColor grayColor];
//    Lable_PanelCompany.backgroundColor=[UIColor colorWithRed:200/256. green:200/256. blue:200/256. alpha:1];
//    Lable_PanelCompany.text=@"Panel Company";
//    [lable addSubview:Lable_PanelCompany];
    
    UILabel *Lable_Check=[[UILabel alloc]initWithFrame:CGRectMake(570,10,55,30)];
    Lable_Check.textAlignment = NSTextAlignmentCenter;
    Lable_Check.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    Lable_Check.font = [UIFont systemFontOfSize:12.0];
    // lable.backgroundColor=[UIColor grayColor];
    Lable_Check.backgroundColor=[UIColor colorWithRed:200/256. green:200/256. blue:200/256. alpha:1];
    Lable_Check.text=@"Checked";
    [lable addSubview:Lable_Check];
      //_scroll.hidden=YES;
    
    table_WorkList=[[UITableView alloc]initWithFrame:CGRectMake(1,52,700,130)style:UITableViewStylePlain];
    table_WorkList.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin |UIViewAutoresizingFlexibleRightMargin;
    table_WorkList.delegate=self;
    table_WorkList.dataSource=self;
    table_WorkList.layer.borderWidth = 2.0;
    table_WorkList.layer.borderColor = [UIColor grayColor].CGColor;
    [_scroll addSubview:table_WorkList];
    
    UIButton  *Receipt=[[UIButton alloc]initWithFrame:CGRectMake(10,640,140,50)];
    Receipt.tag=1;
    Receipt.titleLabel.font=[UIFont boldSystemFontOfSize:12.0];
    Receipt.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
    [Receipt setTitle:@"View Receipt" forState:UIControlStateNormal];
    [Receipt addTarget:self action:@selector(AllButtons:)forControlEvents:UIControlEventTouchUpInside];
    [scrollview addSubview:Receipt];
    
    UIButton *LabDetail=[[UIButton alloc]initWithFrame:CGRectMake(160,640,150,50)];
    LabDetail.tag=2;
       LabDetail.titleLabel.font=[UIFont boldSystemFontOfSize:12.0];
    LabDetail.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
    [LabDetail setTitle:@"Lab Details" forState:UIControlStateNormal];
    [LabDetail addTarget:self action:@selector(AllButtons:)forControlEvents:UIControlEventTouchUpInside];
    [scrollview addSubview:LabDetail];
    
    UIButton *ConfirmSample=[[UIButton alloc]initWithFrame:CGRectMake(10,700,140,50)];
    ConfirmSample.tag=3;
       ConfirmSample.titleLabel.font=[UIFont boldSystemFontOfSize:12.0];
    [ConfirmSample setTitle:@"Confirm All Sample" forState:UIControlStateNormal];
    
    for(int i=0;i<WorkListView.count;i++)
    {
        IsSampleReceived=[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:i]valueForKey:@"IsSampleReceived"]];
        NSLog(@"IsSampleReceived %@",IsSampleReceived);
        IsTestCompleted=[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:i]valueForKey:@"IsTestCompleted"]];
        NSLog(@"IsTestCompleted %@",IsTestCompleted);
        ReportNo=[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:i]valueForKey:@"ReportNo"]];
        NSLog(@"ReportNo %@",ReportNo);
        NSString *IsOutsourced  =[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:i]valueForKey:@"IsOutsourced"]];
        NSString *IsCancelled  =[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:i]valueForKey:@"IsCancelled"]];
        if([IsSampleReceived isEqualToString:@"0"]&&[IsTestCompleted isEqualToString:@"<null>"] &&[ReportNo isEqualToString:@""]&&[IsOutsourced isEqualToString:@"<null>"]&&[IsCancelled isEqualToString:@"<null>"])
        {
            ConfirmSample.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
            [ConfirmSample addTarget:self action:@selector(AllButtons:)forControlEvents:UIControlEventTouchUpInside];
            break;
        }
        ConfirmSample.backgroundColor=[UIColor colorWithRed:128/256. green:128/256. blue:128/256. alpha:1];
    }
    [scrollview addSubview:ConfirmSample];
    
    UIButton *ResultValue=[[UIButton alloc]initWithFrame:CGRectMake(160,700,150,50)];
    ResultValue.tag=4;
    ResultValue.titleLabel.font=[UIFont boldSystemFontOfSize:12.0];
    ResultValue.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
    [ResultValue setTitle:@"Results Value" forState:UIControlStateNormal];
   // [ResultValue addTarget:self action:@selector(AllButtons:)forControlEvents:UIControlEventTouchUpInside];
    [scrollview addSubview:ResultValue];
    
    for(int i=0;i<WorkListView.count;i++)
    {
        IsSampleReceived=[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:i]valueForKey:@"IsSampleReceived"]];
        NSLog(@"IsSampleReceived %@",IsSampleReceived);
        IsTestCompleted=[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:i]valueForKey:@"IsTestCompleted"]];
        NSLog(@"IsTestCompleted %@",IsTestCompleted);
        ReportNo=[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:i]valueForKey:@"ReportNo"]];
        NSLog(@"ReportNo %@",ReportNo);
        if(![IsSampleReceived isEqualToString:@"1"]&&[IsTestCompleted isEqualToString:@"<null>"])
        {
            ResultValue.backgroundColor=[UIColor colorWithRed:128/256. green:128/256. blue:128/256. alpha:1];
            
        }
        else
        {
            ResultValue.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
            [ResultValue addTarget:self action:@selector(AllButtons:)forControlEvents:UIControlEventTouchUpInside];
            break;
        }
    }
    
    UIButton *AddCancel=[[UIButton alloc]initWithFrame:CGRectMake(10,760,140,50)];
    AddCancel.tag=5;
    AddCancel.titleLabel.font=[UIFont boldSystemFontOfSize:12.0];

    AddCancel.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
    [AddCancel setTitle:@"Add/Cancel Test" forState:UIControlStateNormal];
    [AddCancel addTarget:self action:@selector(AllButtons:)forControlEvents:UIControlEventTouchUpInside];
    [scrollview addSubview:AddCancel];
    
    UIButton *Bookingslip=[[UIButton alloc]initWithFrame:CGRectMake(160,760,150,50)];
    Bookingslip.tag=6;
    Bookingslip.titleLabel.font=[UIFont boldSystemFontOfSize:12.0];

    Bookingslip.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
    [Bookingslip setTitle:@"Booking Slip" forState:UIControlStateNormal];
    //[outsource addTarget:self action:@selector(AllButtons:)forControlEvents:UIControlEventTouchUpInside];
    Bookingslip.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
    [Bookingslip addTarget:self action:@selector(AllButtons:)forControlEvents:UIControlEventTouchUpInside];

    [scrollview addSubview:Bookingslip];
    
  
      
    EmailSms=[[UIButton alloc]initWithFrame:CGRectMake(10,820,140,50)];
    EmailSms.tag=7;
    EmailSms.titleLabel.font=[UIFont boldSystemFontOfSize:12.0];
    
   // EmailSms.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
    [EmailSms setTitle:@"Email/Sms" forState:UIControlStateNormal];
    //[outsource addTarget:self action:@selector(AllButtons:)forControlEvents:UIControlEventTouchUpInside];
    [scrollview addSubview:EmailSms];
    
    ViewReport=[[UIButton alloc]initWithFrame:CGRectMake(160,820,150,50)];
    ViewReport.tag=8;
    ViewReport.titleLabel.font=[UIFont boldSystemFontOfSize:12.0];
    
   // outsource.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
    [ViewReport setTitle:@"ViewReport" forState:UIControlStateNormal];
    //[outsource addTarget:self action:@selector(AllButtons:)forControlEvents:UIControlEventTouchUpInside];
    [scrollview addSubview:ViewReport];
    
    DeliverReport=[[UIButton alloc]initWithFrame:CGRectMake(10,880,140,50)];
    DeliverReport.tag=9;
    DeliverReport.titleLabel.font=[UIFont boldSystemFontOfSize:12.0];
    
  //  outsource.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
    [DeliverReport setTitle:@"Deliver Reports" forState:UIControlStateNormal];
    //[outsource addTarget:self action:@selector(AllButtons:)forControlEvents:UIControlEventTouchUpInside];
    [scrollview addSubview:DeliverReport];
    EmailSms.backgroundColor=[UIColor colorWithRed:128/256. green:128/256. blue:128/256. alpha:1];
    ViewReport.backgroundColor=[UIColor colorWithRed:128/256. green:128/256. blue:128/256. alpha:1];
    DeliverReport.backgroundColor=[UIColor colorWithRed:128/256. green:128/256. blue:128/256. alpha:1];
    
//    for(int i=0;i<WorkListView.count;i++)
//    {
//        IsSampleReceived=[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:i]valueForKey:@"IsSampleReceived"]];
//        NSLog(@"IsSampleReceived %@",IsSampleReceived);
//        IsTestCompleted=[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:i]valueForKey:@"IsTestCompleted"]];
//        NSLog(@"IsTestCompleted %@",IsTestCompleted);
////        ReportNo=[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:i]valueForKey:@"ReportNo"]];
////        NSLog(@"ReportNo %@",ReportNo);
//        if([IsSampleReceived isEqualToString:@"1"]&&[IsTestCompleted isEqualToString:@"1"])
//        {
//            EmailSms.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
//            [EmailSms addTarget:self action:@selector(AllButtons:)forControlEvents:UIControlEventTouchUpInside];
//            ViewReport.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
//            [ViewReport addTarget:self action:@selector(AllButtons:)forControlEvents:UIControlEventTouchUpInside];
//
//            DeliverReport.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
//            [DeliverReport addTarget:self action:@selector(AllButtons:)forControlEvents:UIControlEventTouchUpInside];
//
//            break;
//
//          
//            
//        }
//        else
//        {
//              EmailSms.backgroundColor=[UIColor colorWithRed:128/256. green:128/256. blue:128/256. alpha:1];
//            ViewReport.backgroundColor=[UIColor colorWithRed:128/256. green:128/256. blue:128/256. alpha:1];
//
//            DeliverReport.backgroundColor=[UIColor colorWithRed:128/256. green:128/256. blue:128/256. alpha:1];
//
//            
//            
//        }
//    }

    
    
        // Do any additional setup after loading the view from its nib.
}
-(void)CallServiceDetail:(NSString *)Str
{
    
    string=[NSString stringWithFormat:@"%@",[[WorkListDetails objectAtIndex:0]valueForKey:Str]];
    NSLog(@"%@", string);
    
}
-(void)Previouspage:(UIBarButtonItem*)sender
{
    
    switch (sender.tag)
    {
        case 1:
        {
            ViewPage.hidden=YES;
            self.navigationItem.rightBarButtonItems=nil;
            self.navigationItem.hidesBackButton=NO;
            break;
        }
        case 2:
        {
            
            UIPrintInteractionController *printout=[UIPrintInteractionController sharedPrintController];
            UIPrintInfo *printinfo=[UIPrintInfo printInfo];
            printinfo.outputType=UIPrintInfoOutputGeneral;
            printout.printInfo=printinfo;
            printout.showsPageRange=YES;
           // UIViewPrintFormatter *printformat=[webView viewPrintFormatter];
         
            printinfo.duplex=UIPrintInfoDuplexLongEdge;
            printout.printFormatter=[webView viewPrintFormatter];
            [printout presentAnimated:YES completionHandler:completionHandler];
            
            break;
        }
     
        default:
            break;
    }
    
   }
void (^completionHandler)(UIPrintInteractionController *, BOOL, NSError *) =

^(UIPrintInteractionController *printController, BOOL completed, NSError *error)

{

if (!completed && error)

{

NSLog(@"Printing could not complete because of error: %@", error);

}

};

-(IBAction)AllButtons:(id)sender
{
    switch (((UIButton*)sender).tag)
    {
        case 1:
        {
            ViewPage.hidden=NO;
            self.navigationItem.hidesBackButton=YES;
            
            Setting=[[UIBarButtonItem alloc]initWithTitle:@"Close" style:UIBarButtonItemStyleBordered target:self action:@selector(Previouspage:)];
            Setting.tag=1;
            
            self.navigationItem.rightBarButtonItem=Setting;
            
            print1=[[UIBarButtonItem alloc]initWithTitle:@"Print" style:UIBarButtonItemStyleBordered target:self action:@selector(Previouspage:)];
            print1.tag=2;
            
             arr=[[NSMutableArray alloc]initWithObjects:Setting,print1,nil] ;
            
            self.navigationItem.rightBarButtonItems=arr;

           NSString  *Case_Id=[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:0] valueForKey:@"caseid"]];
           self.WebService->case_id=Case_Id;
           
            NSMutableDictionary *dictionary=[[NSMutableDictionary alloc]init];
            
            [dictionary setObject:Case_Id forKey:@"CaseId"];
            
         [self.WebService CallServiceGetpatientReceipt:@"http://192.168.1.202:81/LaboratoryModule/LISInvestigationWorklistService.asmx/GetpatientReceiptService" Object:NULL Handler:NULL];
          NSLog(@"web %@",self.WebService.ptr);
          
          NSString *html = [NSString stringWithFormat:@"%@",self.WebService.ptr];

          NSLog(@"html %@",html);
            
         //instantiate the web view
         webView = [[UIWebView alloc]initWithFrame:CGRectMake(0,64,320,600)];
         //webView = [[UIWebView alloc] initWithFrame:self.view.frame];
         webView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
         webView.autoresizesSubviews = YES;
         webView.scalesPageToFit=YES;
         webView.delegate=self;
         
         //make the background transparent
         [webView setBackgroundColor:[UIColor clearColor]];
         
         imageLayer = webView.layer;
         [imageLayer setCornerRadius:02];
         [imageLayer setBorderWidth:1];
         imageLayer.borderColor=[[UIColor grayColor] CGColor];
         
         //pass the string to the webview
         
         // [webView loadRequest:request];
         [webView loadHTMLString:html  baseURL:nil];
         
         //add it to the subview
         [ViewPage addSubview:webView];
       
           
            break;
        }
        case 2:
        {
            
            PatientLabDetailsViewController *PatientLab=[[PatientLabDetailsViewController alloc]init];
            PatientLab.Patientid=[NSString stringWithFormat:@"%@",[[WorkListDetails objectAtIndex:0]valueForKey:@"PatientId"]];
            NSLog(@"code %@",PatientLab.Patientid);
            [self.navigationController pushViewController:PatientLab animated:YES];
            
        }
        case 3:
        {
            NSMutableArray *CompletTest=[[NSMutableArray alloc]init];
            NSString  *Case_Id=[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:0] valueForKey:@"caseid"]];
            for(int i=0;i<WorkListView.count;i++)
            {
                NSString  *Investigation_Id=[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:i]valueForKey:@"InvestigationId"]];
                NSString  *Test_Id=[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:i]valueForKey:@"testID"]];
                ReportNo=[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:i]valueForKey:@"ReportNo"]];
                NSString  *AdviseDr_Id=[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:i]valueForKey:@"AdvisedDoctorId"]];
                if([AdviseDr_Id isEqualToString:@"<null>"])
                {
                    
                    AdviseDr_Id=(NSString*)[NSNull null];
                }
                
                NSLog(@"dr id %@",AdviseDr_Id);
                
                NSString  *lab_No=[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:i]valueForKey:@"LabNo"]];
                
                if([[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:i] valueForKey:@"IsSampleReceived"]]isEqualToString:@"0"])
                {
                    NSDictionary *dict=[[NSDictionary alloc]initWithObjectsAndKeys:Investigation_Id,@"InvestigationId",AdviseDr_Id,@"AdvisedDoctorId",ReportNo,@"ReportNo",Test_Id,@"TestId",lab_No,@"LabNo", nil];
                    [CompletTest addObject:dict];
                    
                }
            }
            self.WebService->Detail_AdviseInvestigation=(NSMutableArray*)CompletTest;
            self.WebService->case_id=Case_Id;
            
            [self.WebService CallServiceConfirmAllSamples:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/ConfirmAllSamples" Object:NULL Handler:NULL];
            
            if([self.WebService.ptr isEqualToString:@"<null>"])
            {
                
                [self viewDidLoad];
            }
            break;
        }
        case 4:
        {
            InvestigationWorkListReportGenerateViewController *investigation=[[InvestigationWorkListReportGenerateViewController alloc]init];
            investigation.CaseID=[NSString stringWithFormat:@"%@",[[WorkListDetails objectAtIndex:0]valueForKey:@"caseid"]];
            investigation.Dictionay_Worklist=(NSMutableArray*)WorkListDetails;
            
            [self.navigationController pushViewController:investigation animated:YES];
            
            /*     self.WebService->case_id=[NSString stringWithFormat:@"%@",[[WorkListDetails objectAtIndex:0]valueForKey:@"caseid"]];
             [self.WebService CallServiceSetPatientResultValue:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/SetPatientResultValue" Object:NULL Handler:NULL];
             
             NSLog(@"result %@",self.WebService->ptr1);
             NSMutableArray *AllTestValues=(NSMutableArray*)self.WebService->ptr1;
             
             Description=[[NSMutableArray alloc]init];
             Description1=[[NSMutableArray alloc]init];
             
             for (int i= 0 ; i < AllTestValues.count ; i++)
             {
             if(![Description containsObject:[NSString stringWithFormat:@"%@",[[AllTestValues objectAtIndex:i] valueForKey:@"Name"]]])
             {
             [Description addObject:[NSString stringWithFormat:@"%@",[[AllTestValues objectAtIndex:i] valueForKey:@"Name"]]];
             
             [Description1 addObject:[NSString stringWithFormat:@"%@ \n%@ \n%@",[[AllTestValues objectAtIndex:i] valueForKey:@"PrimaryCategoryName"],[[AllTestValues objectAtIndex:i] valueForKey:@"SecondaryCategoryName"],[[AllTestValues objectAtIndex:i] valueForKey:@"Name"]]];
             
             }
             
             NSLog(@"des %@",Description);
             }
             
             AllDescriptions =[[NSMutableArray alloc]init];
             
             for(int i=0;i<Description.count;i++)
             {
             NSString *desc=[NSString stringWithFormat:@"%@",[Description objectAtIndex:i]];
             NSLog(@"desc %@",desc);
             NSMutableArray *descDetail =[[NSMutableArray alloc]init];
             for (int j=0;j<AllTestValues.count; j++)
             {
             if([ desc isEqualToString:[NSString stringWithFormat:@"%@",[[AllTestValues objectAtIndex:j] valueForKey:@"Name"]]])
             {
             NSLog(@"here");
             
             [descDetail addObject:[AllTestValues objectAtIndex:j]];
             NSLog(@"desc %@",descDetail);
             }
             
             }
             
             [AllDescriptions addObject:descDetail];
             NSLog(@"alldesc %@",AllDescriptions);
             }
             view1=[[UIView alloc]init];
             view1.frame=CGRectMake(10,730,800,300);
             view1.backgroundColor=[UIColor whiteColor];
             [view1 setIsAccessibilityElement:YES];
             view1.userInteractionEnabled=YES;
             view1.autoresizingMask = UIViewAutoresizingFlexibleWidth ;
             view1.layer.borderColor = [UIColor grayColor].CGColor;
             view1.layer.borderWidth = 1.0f;
             [scrollview addSubview:view1];
             
             
             UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(10,10,750,50)];
             lable.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
             lable.font = [UIFont systemFontOfSize:10.0];
             // lable.backgroundColor=[UIColor grayColor];
             lable.backgroundColor=[UIColor colorWithRed:245/256. green:245/256. blue:245/256. alpha:1];
             [view1 addSubview:lable];
             
             UILabel *lable_Description=[[UILabel alloc]initWithFrame:CGRectMake(50,20,180,30)];
             lable_Description.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
             lable_Description.font = [UIFont systemFontOfSize:12.0];
             lable_Description.textAlignment = NSTextAlignmentCenter;
             // lable.backgroundColor=[UIColor grayColor];
             lable_Description.text=@"Description";
             lable_Description.backgroundColor=[UIColor colorWithRed:200/256. green:200/256. blue:200/256. alpha:1];
             [view1 addSubview:lable_Description];
             
             UILabel *lable_Unit=[[UILabel alloc]initWithFrame:CGRectMake(240,20,80,30)];
             lable_Unit.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
             lable_Unit.textAlignment = NSTextAlignmentCenter;
             lable_Unit.font = [UIFont systemFontOfSize:12.0];
             // lable.backgroundColor=[UIColor grayColor];
             lable_Unit.backgroundColor=[UIColor colorWithRed:200/256. green:200/256. blue:200/256. alpha:1];
             lable_Unit.text=@"Unit";
             [view1 addSubview:lable_Unit];
             
             UILabel *lable_Type=[[UILabel alloc]initWithFrame:CGRectMake(330,20,80,30)];
             lable_Type.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
             lable_Type.textAlignment = NSTextAlignmentCenter;
             lable_Type.font = [UIFont systemFontOfSize:12.0];
             // lable.backgroundColor=[UIColor grayColor];
             lable_Type.backgroundColor=[UIColor colorWithRed:200/256. green:200/256. blue:200/256. alpha:1];
             lable_Type.text=@"Type";
             [view1 addSubview:lable_Type];
             
             UILabel *lable_Range=[[UILabel alloc]initWithFrame:CGRectMake(420,20,80,30)];
             lable_Range.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
             lable_Range.textAlignment = NSTextAlignmentCenter;
             lable_Range.font = [UIFont systemFontOfSize:12.0];
             // lable.backgroundColor=[UIColor grayColor];
             lable_Range.backgroundColor=[UIColor colorWithRed:200/256. green:200/256. blue:200/256. alpha:1];
             lable_Range.text=@"Range";
             [view1 addSubview:lable_Range];
             
             UILabel *lable_Result=[[UILabel alloc]initWithFrame:CGRectMake(510,20,120,30)];
             lable_Result.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
             lable_Result.textAlignment = NSTextAlignmentCenter;
             lable_Result.font = [UIFont systemFontOfSize:12.0];
             // lable.backgroundColor=[UIColor grayColor];
             lable_Result.backgroundColor=[UIColor colorWithRed:200/256. green:200/256. blue:200/256. alpha:1];
             lable_Result.text=@"Result Value";
             [view1 addSubview:lable_Result];
             
             UILabel *lable_remark=[[UILabel alloc]initWithFrame:CGRectMake(640,20,80,30)];
             lable_remark.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
             lable_remark.textAlignment = NSTextAlignmentCenter;
             lable_remark.font = [UIFont systemFontOfSize:12.0];
             // lable.backgroundColor=[UIColor grayColor];
             lable_remark.backgroundColor=[UIColor colorWithRed:200/256. green:200/256. blue:200/256. alpha:1];
             lable_remark.text=@"";
             [view1 addSubview:lable_remark];
             
             //                UILabel *PrimaryCategoryName=[[UILabel alloc]initWithFrame:CGRectMake(05,780,100,30)];
             //                PrimaryCategoryName.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
             //                PrimaryCategoryName.textAlignment = NSTextAlignmentCenter;
             //                PrimaryCategoryName.font = [UIFont systemFontOfSize:12.0];
             //                // lable.backgroundColor=[UIColor grayColor];
             //                // PrimaryCategoryName.backgroundColor=[UIColor colorWithRed:200/256. green:200/256. blue:200/256. alpha:1];
             //              //  [self CallServiceTestDetail:@"PrimaryCategoryName"];
             //                PrimaryCategoryName.text=[NSString stringWithFormat:@"%@",string];
             //                [scrollview addSubview:PrimaryCategoryName];
             //
             //                UILabel *SecondaryCategoryName=[[UILabel alloc]initWithFrame:CGRectMake(110,780,180,30)];
             //                SecondaryCategoryName.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
             //                SecondaryCategoryName.textAlignment = NSTextAlignmentCenter;
             //                SecondaryCategoryName.font = [UIFont systemFontOfSize:12.0];
             //                // lable.backgroundColor=[UIColor grayColor];
             //                //  PrimaryCategoryName.backgroundColor=[UIColor colorWithRed:200/256. green:200/256. blue:200/256. alpha:1];
             //              //  [self CallServiceTestDetail:@"SecondaryCategoryName"];
             //                SecondaryCategoryName.text=[NSString stringWithFormat:@"%@",string];
             //                [scrollview addSubview:SecondaryCategoryName];
             //
             //                UILabel *test=[[UILabel alloc]initWithFrame:CGRectMake(30,820,200,30)];
             //                test.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
             //                test.textAlignment = NSTextAlignmentCenter;
             //                test.font = [UIFont systemFontOfSize:12.0];
             //                // lable.backgroundColor=[UIColor grayColor];
             //                //  PrimaryCategoryName.backgroundColor=[UIColor colorWithRed:200/256. green:200/256. blue:200/256. alpha:1];
             //                //[self CallServiceTestDetail:@"Tests"];
             //           //     [self CallServiceTestDetail:@"Name"];
             //                if([string isEqualToString:@""])
             //                {
             //                    test.text=@"Tests";
             //                }
             //                else
             //                {
             //                    test.text=[NSString stringWithFormat:@"%@",string];
             //                }
             //                [scrollview addSubview:test];
             //
             table_WorkListTest=[[UITableView alloc]initWithFrame:CGRectMake(10,60,750,130)style:UITableViewStylePlain];
             table_WorkListTest.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
             table_WorkListTest.delegate=self;
             table_WorkListTest.dataSource=self;
             table_WorkListTest.layer.borderWidth = 2.0;
             table_WorkListTest.layer.borderColor = [UIColor grayColor].CGColor;
             [view1 addSubview:table_WorkListTest];
             
             UIButton *SaveComplete=[[UIButton alloc]initWithFrame:CGRectMake(30,1000,150,30)];
             SaveComplete.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
             [SaveComplete setTitle:@"Save & Complete" forState:UIControlStateNormal];
             [SaveComplete addTarget:self action:@selector(SaveAndComplete)forControlEvents:UIControlEventTouchUpInside];
             [scrollview addSubview:SaveComplete];
             
             UIButton *Close=[[UIButton alloc]initWithFrame:CGRectMake(190,1000,150,30)];
             Close.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
             [Close setTitle:@"Close" forState:UIControlStateNormal];
             [Close addTarget:self action:@selector(Close)forControlEvents:UIControlEventTouchUpInside];
             [scrollview addSubview:Close];*/
            
            break;
        }
            
        case 5:
        {
            
            AdviseInvestigationViewController *AdviseDetail=[[AdviseInvestigationViewController alloc]init];
            AdviseDetail.CaseID=[NSString stringWithFormat:@"%@",[[WorkListDetails objectAtIndex:0]valueForKey:@"caseid"]];
            NSLog(@"code %@",AdviseDetail.CaseID);
            [self.navigationController pushViewController:AdviseDetail animated:YES];
            
            break;
        }
        case 6:
        {
            
            ViewPage.hidden=NO;
            self.navigationItem.hidesBackButton=YES;
            
            Setting=[[UIBarButtonItem alloc]initWithTitle:@"Close" style:UIBarButtonItemStyleBordered target:self action:@selector(Previouspage:)];
            Setting.tag=1;
            
            self.navigationItem.rightBarButtonItem=Setting;
            
            print1=[[UIBarButtonItem alloc]initWithTitle:@"Print" style:UIBarButtonItemStyleBordered target:self action:@selector(Previouspage:)];
            print1.tag=2;
            
            arr=[[NSMutableArray alloc]initWithObjects:Setting,print1,nil] ;
            
            self.navigationItem.rightBarButtonItems=arr;
            
            NSString  *Case_Id=[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:0] valueForKey:@"caseid"]];
            self.WebService->case_id=Case_Id;
            
            NSMutableDictionary *dictionary=[[NSMutableDictionary alloc]init];
            
            [dictionary setObject:Case_Id forKey:@"CaseId"];
            
            [self.WebService CallServiceGetpatientReceipt:@"http://192.168.1.202:81/LaboratoryModule/LISInvestigationWorklistService.asmx/GetpatientBookingSlip" Object:NULL Handler:NULL];
            NSLog(@"web %@",self.WebService.ptr);
            
            NSString *html = [NSString stringWithFormat:@"%@",self.WebService.ptr];
            
            NSLog(@"html %@",html);
            
            
            //instantiate the web view
            webView = [[UIWebView alloc]initWithFrame:CGRectMake(0,64,320,600)];
            //webView = [[UIWebView alloc] initWithFrame:self.view.frame];
            webView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
            webView.autoresizesSubviews = YES;
            webView.scalesPageToFit=YES;
            webView.delegate=self;
            
            //make the background transparent
            [webView setBackgroundColor:[UIColor clearColor]];
            
            imageLayer = webView.layer;
            [imageLayer setCornerRadius:02];
            [imageLayer setBorderWidth:1];
            imageLayer.borderColor=[[UIColor grayColor] CGColor];
            
            //pass the string to the webview
            
            // [webView loadRequest:request];
            [webView loadHTMLString:html  baseURL:nil];
            
            //add it to the subview
            [ViewPage addSubview:webView];

            
         /*   self.WebService->patientCaseID=[NSString stringWithFormat:@"%@",[[WorkListDetails objectAtIndex:0]valueForKey:@"caseid"]];
            
            [self.WebService CallServicePatientDetailsCaseID:@"http://192.168.1.202:81/LaboratoryModule/LISService.asmx/GetAdvisedInvestigationDetail" Object:NULL Handler:NULL];
            
            NSLog(@"result %@",self.WebService->ptr1);
            AllDetails=(NSMutableArray*)self.WebService->ptr1;
            
            InvestigationList=[[NSMutableArray alloc]init];
            
            for(int i=0;i<AllDetails.count;i++)
            {
                NSLog(@"inv ID %@",[[AllDetails objectAtIndex:i] valueForKey:@"InvestigationId"]);
                
                IsSampleReceived=[NSString stringWithFormat:@"%@",[[AllDetails objectAtIndex:i]valueForKey:@"IsSampleReceived"]];
                IsTestCompleted=[NSString stringWithFormat:@"%@",[[AllDetails objectAtIndex:i]valueForKey:@"IsTestCompleted"]];
                NSString *IsOutsourced=[NSString stringWithFormat:@"%@",[[AllDetails objectAtIndex:i]valueForKey:@"IsOutsourced"]];
                
                if([IsSampleReceived isEqualToString:@"1"]&&[IsTestCompleted isEqualToString:@"<null>"]&&[IsOutsourced isEqualToString:@"<null>"])
                {
                    
                    NSDictionary *dictionay=[[NSDictionary alloc]initWithObjectsAndKeys:[NSString stringWithFormat:@"%@",[[AllDetails objectAtIndex:i] valueForKey:@"InvestigationId"]],@"InvestigationId", nil];
                    
                    [InvestigationList addObject:dictionay];
                    
                }
                
            }
            NSLog(@"inves %@",InvestigationList);
            
            if(InvestigationList.count>0)
            {
                self.WebService->Detail_AdviseInvestigation=(NSMutableArray*)InvestigationList;
                
                [self.WebService CallServiceGetLaboratoryRatesOfInvestigationLis:@"http://192.168.1.202:81/LaboratoryModule/LISService.asmx/GetLaboratoryRatesOfInvestigationList" Object:NULL Handler:NULL];
                
                OutSource=(NSMutableArray*)self.WebService->ptr1;
                NSLog(@"val %@",OutSource);
                Description=[[NSMutableArray alloc]init];
                for (int i= 0 ; i < OutSource.count ; i++)
                {
                    if(![Description containsObject:[NSString stringWithFormat:@"%@",[[OutSource objectAtIndex:i] valueForKey:@"Description"]]])
                    {
                        
                        [Description addObject:[NSString stringWithFormat:@"%@",[[OutSource objectAtIndex:i] valueForKey:@"Description"]]];
                        
                    }
                    
                    NSLog(@"des %@",Description);
                }
                
                AllDescriptions =[[NSMutableArray alloc]init];
                
                for(int i=0;i<Description.count;i++)
                {
                    NSString *desc=[NSString stringWithFormat:@"%@",[Description objectAtIndex:i]];
                    NSLog(@"desc %@",desc);
                    NSMutableArray *descDetail =[[NSMutableArray alloc]init];
                    for (int j=0;j<OutSource.count; j++)
                    {
                        if([desc isEqualToString:[NSString stringWithFormat:@"%@",[[OutSource objectAtIndex:j] valueForKey:@"Description"]]])
                        {
                            NSLog(@"here");
                            
                            [descDetail addObject:[OutSource objectAtIndex:j]];
                            NSLog(@"desc %@",descDetail);
                        }
                        
                    }
                    
                    [AllDescriptions addObject:descDetail];
                    NSLog(@"alldesc %@",AllDescriptions);
                    
                }
                
                [self.WebService CallServiceGetAllLaboratoriess:@"http://192.168.1.202:81/LaboratoryModule/LISService.asmx/GetAllLaboratories" Object:NULL Handler:NULL];
                
                NSLog(@"sel %@",self.WebService->ptr1);
                AllLaboratories=(NSMutableArray*)self.WebService->ptr1;
                
                //  int h=150,y=55;
                view1=[[UIView alloc]init];
                
                //  for(int i=0;i<Description.count;i++)
                // {
                view1.frame=CGRectMake(10,740,800,300);
                view1.backgroundColor=[UIColor whiteColor];
                [view1 setIsAccessibilityElement:YES];
                view1.userInteractionEnabled=YES;
                view1.autoresizingMask = UIViewAutoresizingFlexibleWidth ;
                view1.layer.borderColor = [UIColor grayColor].CGColor;
                view1.layer.borderWidth = 1.0f;
                [scrollview addSubview:view1];
                
                UILabel *description=[[UILabel alloc]initWithFrame:CGRectMake(10,10,120,40)];
                description.font = [UIFont boldSystemFontOfSize:15.0];
                description.backgroundColor=[UIColor whiteColor];
                [description setText:@"Description"];
                description.textAlignment = NSTextAlignmentCenter;
                imageLayer = description.layer;
                [imageLayer setCornerRadius:02];
                [imageLayer setBorderWidth:2];
                imageLayer.borderColor=[[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1]CGColor];
                
                [view1 addSubview:description];
                
               close1=[[UIButton alloc]initWithFrame:CGRectMake(220,240,120,30)];
               close1.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
               close1.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
               [close1 setTitle:@"Close" forState:UIControlStateNormal];
               [close1 addTarget:self action:@selector(close)forControlEvents:UIControlEventTouchUpInside];
               [view1 addSubview:close1];
                
                
                //                if(OutSource.count>0)
                //                {
                //                UILabel *descriptionval=[[UILabel alloc]initWithFrame:CGRectMake(10,55,120,40)];
                //                descriptionval.font = [UIFont boldSystemFontOfSize:12.0];
                //                descriptionval.backgroundColor=[UIColor whiteColor];
                //                    NSLog(@"val %@",[NSString stringWithFormat:@"%@",[Description objectAtIndex:0]]);
                //                [descriptionval setText:[NSString stringWithFormat:@"%@",[Description objectAtIndex:0]]];
                //                NSLog(@"des %@",description.text);
                //
                //                 descriptionval.textAlignment = NSTextAlignmentCenter;
                //                 imageLayer = descriptionval.layer;
                //                [imageLayer setCornerRadius:02];
                //                [imageLayer setBorderWidth:2];
                //                imageLayer.borderColor=[[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1]CGColor];
                //
                //                [view1 addSubview:descriptionval];
                //                }
                int x=140;
                
                for(int i = 0;i<AllLaboratories.count;i++)
                {
                    UILabel *Laboratoryname=[[UILabel alloc]initWithFrame:CGRectMake(x,10,120,40)];
                    Laboratoryname.font = [UIFont boldSystemFontOfSize:12.0];
                    Laboratoryname.backgroundColor=[UIColor whiteColor];
                    [Laboratoryname setText:[NSString stringWithFormat:@"%@",[[AllLaboratories objectAtIndex:i]valueForKey:@"LaboratoryName"]]];
                    Laboratoryname.textAlignment = NSTextAlignmentCenter;
                    imageLayer = Laboratoryname.layer;
                    [imageLayer setCornerRadius:02];
                    [imageLayer setBorderWidth:2];
                    imageLayer.borderColor=[[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1]CGColor];
                    [view1 addSubview:Laboratoryname];
                    x=x+130;
                }
                              
               // }
                
                //                if(OutSource.count>0)
                //                {
                //
                //                    table_outsource=[[UITableView alloc]initWithFrame:CGRectMake(10,60,780,170)style:UITableViewStylePlain];
                //                    table_outsource.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
                //                    table_outsource.delegate=self;
                //                    table_outsource.dataSource=self;
                //                    table_outsource.layer.borderWidth = 2.0;
                //                    table_outsource.layer.borderColor = [UIColor grayColor].CGColor;
                //                    [view1 addSubview:table_outsource];
                //
                //                    Outsource=[[UIButton alloc]initWithFrame:CGRectMake(70,240,120,30)];
                //                    Outsource.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
                //                    Outsource.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
                //                    [Outsource setTitle:@"OutSource" forState:UIControlStateNormal];
                //
                //                    [Outsource addTarget:self action:@selector(Outsourcebtn)forControlEvents:UIControlEventTouchUpInside];
                //
                //                    [view1 addSubview:Outsource];
                //
                //                }
                
                
               
                if(OutSource.count>0)
                {
                    int y1=55;
                    
                    for(int k=0;k<AllDescriptions.count;k++)
                    {
                        SingleDescription=(NSMutableArray*)[AllDescriptions objectAtIndex:k];
                        
                        NSLog(@"single desc %@",SingleDescription);

                        
                         int x1=140;
                        
                        UILabel *descriptionval=[[UILabel alloc]initWithFrame:CGRectMake(10,y1,120,40)];
                        descriptionval.font = [UIFont boldSystemFontOfSize:15.0];
                        descriptionval.backgroundColor=[UIColor whiteColor];
                        [descriptionval setText:[NSString stringWithFormat:@"%@",[[SingleDescription objectAtIndex:k] valueForKey:@"Description"]]];
                        NSLog(@"desc %@",descriptionval.text);
                        
                        descriptionval.textAlignment = NSTextAlignmentCenter;
                        imageLayer = descriptionval.layer;
                        [imageLayer setCornerRadius:02];
                        [imageLayer setBorderWidth:2];
                        imageLayer.borderColor=[[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1]CGColor];
                        
                        [view1 addSubview:descriptionval];

                    
                    for(int i=0;i<AllLaboratories.count;i++)
                    {
                    Detail=[[UIButton alloc]initWithFrame:CGRectMake(x1,y1,120,40)];
                    Detail.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
                    Detail.backgroundColor=[UIColor whiteColor];
                    //[Detail setText:[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:i]valueForKey:@"LaboratoryName"]]];
                    //       Detail.textAlignment = NSTextAlignmentCenter;
                  

                    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(btnpress:)];
                    [Detail addGestureRecognizer:tap];
                    Detail.userInteractionEnabled=YES;
                    tap.numberOfTapsRequired = 1;
                    imageLayer = Detail.layer;
                    [imageLayer setCornerRadius:02];
                    [imageLayer setBorderWidth:2];
                    imageLayer.borderColor=[[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1]CGColor];
                    [view1 addSubview:Detail];
                    
                    NSString *LabIoratoryId=[NSString stringWithFormat:@"%@",[[AllLaboratories objectAtIndex:i] valueForKey:@"LaboratoryId"]];
                    NSLog(@"lab %@",LabIoratoryId);
                    for(int j=0;j<SingleDescription.count;j++)
                    {
                            Detail.tag=j;
                                NSString *LabId=[NSString stringWithFormat:@"%@",[[SingleDescription objectAtIndex:j] valueForKey:@"LaboratoryId"]];
                                NSLog(@"lab %@",LabId);
                                
                                if([LabId isEqualToString:LabIoratoryId])
                                {
                                    NSString *LabRate=[NSString stringWithFormat:@"%@",[[SingleDescription objectAtIndex:j] valueForKey:@"LaboratoryRate"]];
                                    
                                    NSString *InvestigationDuration=[NSString stringWithFormat:@"%@",[[SingleDescription objectAtIndex:j] valueForKey:@"InvestigationDuration"]];
                                    
                                    [Detail setTitle:[NSString stringWithFormat:@"%@,\r%@",LabRate,InvestigationDuration]forState:UIControlStateNormal];
                                    [Detail setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                                    //   Detail.titleLabel.lineBreakMode = UILineBreakModeTailTruncation;
                                    //   Detail.titleLabel.numberOfLines = 1;
                                    NSLog(@"detail %@",Detail.titleLabel.text);
                                    
                                    break;
                                    
                                }
                            
                                
                        }
                        
                      // [Outsource removeFromSuperview];
                      // [close1 removeFromSuperview];
                       
                       Outsource=[[UIButton alloc]initWithFrame:CGRectMake(70,240,120,30)];
                       Outsource.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
                       Outsource.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
                       [Outsource setTitle:@"OutSource" forState:UIControlStateNormal];
                       
                       [Outsource addTarget:self action:@selector(Outsourcebtn)forControlEvents:UIControlEventTouchUpInside];
                       
                       [view1 addSubview:Outsource];
                         x1=x1+130;
                    }
                    y1=y1+50;
                    
                }
            }
                
//                close1=[[UIButton alloc]initWithFrame:CGRectMake(220,120,120,30)];
//                close1.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
//                close1.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
//                [close1 setTitle:@"Close" forState:UIControlStateNormal];
//                [close1 addTarget:self action:@selector(close)forControlEvents:UIControlEventTouchUpInside];
//                [view1 addSubview:close1];
            
                
            }
            else
            {
                
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"check" message:@"Investigations can not be Outsourced!" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
                [alert show];
                
            }*/
        
            break;
        }
         case 7:
        {
            
             NSString *patientid=[NSString stringWithFormat:@"%@",[[WorkListDetails objectAtIndex:0]valueForKey:@"PatientId"]];
            NSLog(@"code %@",patientid);
            self.WebService->patientID=patientid;
            
            [self.WebService CallServicePatientDetailsEmailID:@"http://192.168.1.202:81/PatientModule/PatientService.asmx/GetUserEmail" Object:NULL Handler:NULL];
            

            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Enter Email ID"
                                message:nil
                            delegate:self
                                   cancelButtonTitle:@"Send"
                                   otherButtonTitles:@"Cancel", nil];
            
          [message setAlertViewStyle:UIAlertViewStylePlainTextInput];
          textField = [message textFieldAtIndex:0];
          textField.text = self.WebService.ptr;
          textField.keyboardType=UIKeyboardTypeEmailAddress;
          [message show];
            
          //  UIActivityIndicatorView *myIndicator = [[UIActivityIndicatorView alloc]                                                    initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
            
            // Position the spinner
//            [myIndicator setCenter:CGPointMake(50.0, 10.0)];
//            
//            // Add to button
//            [sender addSubview:myIndicator];
//            
//            if([myIndicator isAnimating])
//                [myIndicator stopAnimating];
//            else
//                [myIndicator startAnimating];

                      
//            for(int i=0;i<WorkListView.count;i++)
//            {
//                NSDictionary *dict=[NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:i]valueForKey:@"InvestigationId"]],@"InvestigationId",[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:i]valueForKey:@"testID"]],@"TestId", nil];
//                
//                [testdate addObject:dict];
//                
//            }
            
//            NSLog(@"data is %@",self.WebService->byteArray);
//            
//            NSMutableData *data2 = [[NSMutableData alloc] initWithCapacity:self.WebService->byteArray.count];
//            for (NSNumber *byteVal in self.WebService->byteArray)
//            {
//                Byte b = (Byte)(byteVal.intValue);
//                [data2 appendBytes:&b length:1];
//                
//                // NSLog(@"data %@",data2);
//            }
//            //    NSData *myFile = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"your_url"]];
//            //    [myFile writeToFile:[NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath], @"abcd.pdf"] atomically:YES];
//            
//            // NSData *pdfData = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:tempString]];
//            if([myIndicator isAnimating])
//            {
//                [myIndicator stopAnimating];
//                myIndicator.hidden=YES;
//                
//            }
//
//            NSString *resourceToPath = [[NSString alloc]initWithString:[[[[NSBundle mainBundle]resourcePath]  stringByDeletingLastPathComponent]stringByAppendingPathComponent:@"Documents"]];
//            NSString   *fileName = [resourceToPath stringByAppendingPathComponent:@"myPDF.pdf"];
//            NSLog(@"file %@",fileName);
//            [data2 writeToFile:fileName atomically:YES];
//
//            
//            if ([MFMailComposeViewController canSendMail])
//            {
//                
//               MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
//               
//               mailer.mailComposeDelegate = self;
//               
//               [mailer setSubject:@"A Message from CloudChowk"];
//               
//               //   NSArray *toRecipients = [NSArray arrayWithObjects:@"fisrtMail@example.com", @"secondMail@example.com", nil];
//           //                 NSLog(@"file name %@",fileName);
//               NSData *data=[NSData dataWithContentsOfFile:fileName];
//                 NSLog(@"data %@",data);
//              [mailer addAttachmentData:data mimeType:@"application/pdf" fileName:@"myPDF.pdf"];
//               
//               NSLog(@"mailer %@",mailer);
//               
//               NSString *emailBody = @"Patient Report";
//               
//               [mailer setMessageBody:emailBody isHTML:NO];
//               
//               [self presentViewController:mailer animated:YES completion:nil];
//                
//            }
//            
//            else
//            {
//                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure"message:@"Your device doesn't support the composer sheet"delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
//                
//                [alert show];
//                
//            }
            

            break;
        }
           
        case 8:
        {
            
            UIActivityIndicatorView *myIndicator = [[UIActivityIndicatorView alloc]
                                                    initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
            
            // Position the spinner
            [myIndicator setCenter:CGPointMake(50.0, 10.0)];
            
            // Add to button
            [sender addSubview:myIndicator];
            
            if([myIndicator isAnimating])
                [myIndicator stopAnimating];
            else
                [myIndicator startAnimating];
            
            self.WebService->case_id=[[WorkListView objectAtIndex:0]valueForKey:@"caseid"];
            
            
            //            for(int i=0;i<WorkListView.count;i++)
            //            {
            //                NSDictionary *dict=[NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:i]valueForKey:@"InvestigationId"]],@"InvestigationId",[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:i]valueForKey:@"testID"]],@"TestId", nil];
            //
            //                [testdate addObject:dict];
            //
            //            }
            NSLog(@"arr %@",self.WebService->Detail_AdviseInvestigation=(NSMutableArray*)testdate);
            
            //            self.WebService->investigation_id=[[WorkListView objectAtIndex:0]valueForKey:@"InvestigationId"];
            //            self.WebService->test_id=[[WorkListView objectAtIndex:0]valueForKey:@"testID"];
            [self.WebService CallServiceGetpatienttestReport:@"http://192.168.1.202:81/LaboratoryModule/LISService.asmx/GetpatienttestReport" Object:NULL Handler:NULL];
            
            NSLog(@"data is %@",self.WebService->byteArray);
            
            
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

            
            
            
//                if(![MFMessageComposeViewController canSendText])
//                {
//                    UIAlertView *warningAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Your device doesn't support SMS!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//                    [warningAlert show];
//                    return;
//                }
//                
//                NSArray *recipents = @[@"12345678", @"72345524"];
//                NSString *message = [NSString stringWithFormat:@"Just sent the %@ file to your email. Please check!", file];
//                
//                MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc] init];
//                messageController.messageComposeDelegate = self;
//                [messageController setRecipients:recipents];
//                [messageController setBody:message];
//                
//                // Present message view controller on screen
//                [self presentViewController:messageController animated:YES completion:nil];
//         
//            
//            break;
        }
            case 9:
        {
            break;
            
        }
            
        default:
            
            break;
            
            
    }
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
  // NSString *inputText = [[alertView textFieldAtIndex:0] text];
    
    if(buttonIndex==0)
    {
        self.WebService->case_id=[[WorkListView objectAtIndex:0]valueForKey:@"caseid"];
        self.WebService->Email1=textField.text;
        
        NSLog(@"arr %@",self.WebService->Detail_AdviseInvestigation=(NSMutableArray*)testdate);
        
        //            self.WebService->investigation_id=[[WorkListView objectAtIndex:0]valueForKey:@"InvestigationId"];
        //            self.WebService->test_id=[[WorkListView objectAtIndex:0]valueForKey:@"testID"];
        [self.WebService CallServiceGetpatienttestReportEmail:@"http://192.168.1.202:81/LaboratoryModule/LISService.asmx/SendMailReport" Object:NULL Handler:NULL];
        
        if([self.WebService.ptr isEqualToString:@"<null>"])
        {
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Email Successfully Send" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            
            [alert show];
            
        }
    }
    else
    {
        
    }
   

}
-(void)webViewDidFinishLoad:(UIWebView *)_webView
{
    CGSize mWebViewTextSize = [webView sizeThatFits:CGSizeMake(1.0f, 1.0f)];  // Pass about any size
    
    CGRect mWebViewFrame = webView.frame;
    
    
    mWebViewFrame.size.height = mWebViewTextSize.height;
    
    webView.frame = mWebViewFrame;
    
    
    //Disable bouncing in webview
    for (id subview in webView.subviews)
    {
        if ([[subview class] isSubclassOfClass: [UIScrollView class]])
        {
            [subview setBounces:NO];
        }
    }
   
}
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
        {
            NSLog(@"Mail cancelled: you cancelled the operation and no email message was queued.");
            break;
        }
        case MFMailComposeResultSaved:
        {
            NSLog(@"Mail saved: you saved the email message in the drafts folder.");
            break;
        }
        case MFMailComposeResultSent:
        {
            NSLog(@"Mail send: the email message is queued in the outbox. It is ready to send.");
            break;
        }
        case MFMailComposeResultFailed:
        {
            NSLog(@"Mail failed: the email message was not saved or queued, possibly due to an error.");
            break;
        }
        default:
            NSLog(@"Mail not sent.");
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult) result
{
    switch (result) {
        case MessageComposeResultCancelled:
            break;
            
        case MessageComposeResultFailed:
        {
            UIAlertView *warningAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Failed to send SMS!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [warningAlert show];
            break;
        }
            
        case MessageComposeResultSent:
            break;
            
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}




-(UIImage *)imageFromWebView:(UIWebView *)view
{
    
    NSLog(@"here");
    
    //    // tempframe to reset view size after image was created
    CGRect tmpFrame = view.frame;
    
    // set new Frame
    CGRect aFrame = view.frame;
    
    aFrame.size.height  = [view sizeThatFits:[[UIScreen mainScreen] bounds].size].height;
    view.frame = aFrame;
    
    NSLog(@"fram %@",NSStringFromCGRect(view.frame));
    
    // do image magic
    UIGraphicsBeginImageContext([view sizeThatFits:[[UIScreen mainScreen] bounds].size]);
    
    CGContextRef resizedContext = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:resizedContext];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    // reset Frame of view to origin
    view.frame = tmpFrame;
    //
    NSLog(@"fram %@",NSStringFromCGRect(view.frame));
    
    
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
	
	NSLog(@"%@",docDir);
    
	NSLog(@"saving png");
    
	NSString *pngFilePath = [NSString stringWithFormat:@"%@/test.png",docDir];
    
	NSData *data1 = [NSData dataWithData:UIImagePNGRepresentation(image)];
    
	[data1 writeToFile:pngFilePath atomically:YES];
    
	NSLog(@"saving jpeg");
    
	NSString *jpegFilePath = [NSString stringWithFormat:@"%@/test.jpeg",docDir];
    
	NSData *data2 = [NSData dataWithData:UIImageJPEGRepresentation(image, 1.0f)];//1.0f = 100% quality
    
	[data2 writeToFile:jpegFilePath atomically:YES];
    
	NSLog(@"saving image done");
    
    
    return image;
}
-(IBAction)btnpress:(UITapGestureRecognizer *)reconizer
{
    bttn.backgroundColor=[UIColor whiteColor] ;
    bttn = (UIButton *)[reconizer view];
    bttn.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1] ;
    NSLog(@"bt tag %d",bttn.tag);
    
    for(int i=0;i<AllDetails.count;i++)
    {
        NSString *Inv1=[NSString stringWithFormat:@"%@",[[AllDetails objectAtIndex:i] valueForKey:@"InvestigationId"]];
        NSLog(@"inv1 %@",Inv1);
        NSString *Inv2=[NSString stringWithFormat:@"%@",[[InvestigationList objectAtIndex:i]valueForKey:@"InvestigationId"]];
        NSLog(@"inv2 %@",Inv2);
        if([Inv1 isEqualToString:Inv2])
        {
            testID=[NSString stringWithFormat:@"%@",[[AllDetails objectAtIndex:i] valueForKey:@"TestID"]];
            break;
        }
    }
    
    listDetailOutsource=[[NSMutableArray alloc]init];
    
    NSDictionary *dictionay=[[NSDictionary alloc]initWithObjectsAndKeys:[NSString stringWithFormat:@"%@",[[OutSource objectAtIndex:bttn.tag] valueForKey:@"ReferenceId"]],@"InvestigationId",[NSString stringWithFormat:@"%@",[[OutSource objectAtIndex:bttn.tag] valueForKey:@"LaboratoryId"]],@"LaboratoryId",testID,@"TestId", nil];
    
    [listDetailOutsource addObject:dictionay];
    
    NSLog(@"list outsorce %@",listDetailOutsource);
    
}
-(void)Outsourcebtn
{
    
    self.WebService->Detail_AdviseInvestigation=(NSMutableArray*)listDetailOutsource;
    
    [self.WebService CallServiceOutsourceInvestigations:@"http://192.168.1.202:81/LaboratoryModule/LISService.asmx/OutsourceInvestigations" Object:NULL Handler:NULL];
    
    NSLog(@"result %@",self.WebService.ptr);
    if([self.WebService.ptr isEqualToString:@"<null>"])
    {
        view1.hidden=YES;
        [self viewDidLoad];
        
    }
    
}

-(void)close
{
    webView.hidden=YES;
    view1.hidden=YES;
    
}
-(IBAction)selectforemail:(UIButton*)sender
{
    
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:sender.tag-300 inSection:0];
    NSLog(@"index %@",indexPath);
    UITableViewCell *cell=[table_WorkList cellForRowAtIndexPath:indexPath];
    NSLog(@"cell %@",cell);
 UIButton *btn=(UIButton*)[cell viewWithTag:indexPath.row+300];
     NSLog(@"btn %@",btn);
   // NSIndexPath *indexPath = [table_WorkList indexPathForCell:cell];
   // NSLog(@"index %@",indexPath);
    NSLog(@"btn %@",[NSString stringWithFormat:@"%@",[WorkListView objectAtIndex:indexPath.row]]);
    
    NSLog(@"btn %d",btn.selected);
    
         NSLog(@"btn %d",indexPath.row);
    if(btn.selected)
    {
        [btn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal ];
        
        
        btn.selected=NO;
        for(int i=0;i<testdate.count;i++)
        {
        if([ [NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:indexPath.row]valueForKey:@"InvestigationId"]] isEqualToString:[NSString stringWithFormat:@"%@",[[testdate objectAtIndex:i]valueForKey:@"InvestigationId"]]] )
        {
            
            NSLog(@"here data");
            [testdate removeObjectAtIndex:i];
            
            break;
            
        }
        }
        

    }
    else
    {
    EmailSms.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
    [EmailSms addTarget:self action:@selector(AllButtons:)forControlEvents:UIControlEventTouchUpInside];
    ViewReport.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
    [ViewReport addTarget:self action:@selector(AllButtons:)forControlEvents:UIControlEventTouchUpInside];
    
    DeliverReport.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
    [DeliverReport addTarget:self action:@selector(AllButtons:)forControlEvents:UIControlEventTouchUpInside];
        
        btn.selected=YES;
        [btn setBackgroundImage:[UIImage imageNamed:@"imagesCheck"]forState:UIControlStateSelected];

        NSDictionary *dict=[NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:indexPath.row]valueForKey:@"InvestigationId"]],@"InvestigationId",[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:indexPath.row]valueForKey:@"testID"]],@"TestId", nil];
        
        [testdate addObject:dict];
        
        
    }
    NSLog(@"testdate %@",testdate);
    
    NSLog(@"test data %d",testdate.count);
    
    
    if(testdate.count==0)
    {
        EmailSms.backgroundColor=[UIColor colorWithRed:128/256. green:128/256. blue:128/256. alpha:1];
        ViewReport.backgroundColor=[UIColor colorWithRed:128/256. green:128/256. blue:128/256. alpha:1];
        
        DeliverReport.backgroundColor=[UIColor colorWithRed:128/256. green:128/256. blue:128/256. alpha:1];
    }

    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView==table_WorkList)
    {
        return [WorkListView count];
    }
    else if(tableView==table_WorkListTest)
    {
        for(int i=0;i<AllDescriptions.count;i++)
        {
            if(section==i)
                
                return [[AllDescriptions objectAtIndex:i] count];
            
        }
    }
    
    return 0;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	// There is only one section.
	
    //    if (tableView==table_outsource)
    //    {
    //    NSLog(@"all %d",AllDescriptions.count);
    //    return [AllDescriptions count];
    //    }
    if(tableView==table_WorkListTest)
    {
        NSLog(@"all %d",AllDescriptions.count);
        return [AllDescriptions count];
    }
    
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    if(tableView==table_WorkListTest)
    {
        for(int i=0;i<Description.count;i++)
        {
            if(section==i)
                
                return [NSString stringWithFormat:@"%@",[Description objectAtIndex:i]];
        }
        
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
      NSString *CellIdentifier = [NSString stringWithFormat:@"S%1dR%1d",indexPath.section,indexPath.row];
    
   // NSLog(@"cell %@",CellIdentifier);
    
    //static NSString *CellIdentifier=@"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(tableView==table_WorkList)
    {
        if (cell== nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
            // tableView.allowsSelection = NO;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            UIButton *labno=[[UIButton alloc]initWithFrame:CGRectMake(03,10,30,30)];
            labno.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
            labno.tag=1;
            
            labno.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
            labno.titleLabel.textColor=[UIColor blackColor];
            [cell.contentView addSubview:labno];
            
            UIButton *Testname=[[UIButton alloc]initWithFrame:CGRectMake(42,10,65,30)];
            Testname.tag=2;
            Testname.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
            
            Testname.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
            Testname.titleLabel.textColor=[UIColor blackColor];
            [cell.contentView addSubview:Testname];
            
            
            UIButton *reportNo=[[UIButton alloc]initWithFrame:CGRectMake(125,10,40,30)];
            reportNo.tag=3;
            // reportNo.underlinePosition = 1;
            reportNo.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
            
            reportNo.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
            reportNo.titleLabel.textColor=[UIColor blackColor];
            [cell.contentView addSubview:reportNo];
            
//            UIButton *advisedat=[[UIButton alloc]initWithFrame:CGRectMake(130,10,45,30)];
//            advisedat.tag=4;
//            advisedat.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
//            
//            advisedat.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
//            advisedat.titleLabel.textColor=[UIColor blackColor];
//            [cell.contentView addSubview:advisedat];
            
          
            
            UIButton *reportStatus=[[UIButton alloc]initWithFrame:CGRectMake(170,10,35,30)];
            reportStatus.tag=5;
            reportStatus.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
            reportStatus.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
            reportStatus.titleLabel.textColor=[UIColor blackColor];
            [cell.contentView addSubview:reportStatus];
            
            
            UIButton *sample=[[UIButton alloc]initWithFrame:CGRectMake(213,10,40,30)];
            sample.tag=6;
            sample.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
            sample.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
            sample.titleLabel.textColor=[UIColor blackColor];
            // [sample addTarget:self action:@selector(onCustomAccessoryTapped:)forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:sample];
            
//            UIButton *PanelCompany=[[UIButton alloc]initWithFrame:CGRectMake(250,10,40,30)];
//            PanelCompany.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
//            PanelCompany.tag=7;
//            PanelCompany.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
//            PanelCompany.titleLabel.textColor=[UIColor blackColor];
//            [cell.contentView addSubview:PanelCompany];
            
            UIButton *checked=[[UIButton alloc]initWithFrame:CGRectMake(260,10,25,30)];
            checked.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
            checked.tag=8;
            checked.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
            checked.titleLabel.textColor=[UIColor blackColor];
            [cell.contentView addSubview:checked];
        }
        NSLog(@"IsSampleReceived %@",[[WorkListView objectAtIndex:indexPath.row]valueForKey:@"IsSampleReceived"]);
        IsSampleReceived=[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:indexPath.row]valueForKey:@"IsSampleReceived"]];
        NSLog(@"IsSampleReceived %@",IsSampleReceived);
        IsTestCompleted=[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:indexPath.row]valueForKey:@"IsTestCompleted"]];
        NSLog(@"IsTestCompleted %@",IsTestCompleted);
        ReportNo=[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:indexPath.row]valueForKey:@"ReportNo"]];
        NSLog(@"ReportNo %@",ReportNo);
        NSString *IsCancel=[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:indexPath.row]valueForKey:@"IsCancelled"]];
        NSString *IsOutsourced=[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:indexPath.row]valueForKey:@"IsOutsourced"]];
        
        
        UIButton *btn=(UIButton *)[cell viewWithTag:1];

        [btn setTitle:[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:indexPath.row]valueForKey:@"LabNo"]]forState:UIControlStateNormal];
        if([IsSampleReceived isEqualToString:@"1"]&&[IsTestCompleted isEqualToString:@"<null>"] && ![ReportNo isEqualToString:@""]&&[IsCancel isEqualToString:@"<null>"]&&[IsOutsourced isEqualToString:@"<null>"])
        {
            btn.backgroundColor=[UIColor colorWithRed:207/256. green:141/256. blue:234/256. alpha:1];
            NSLog(@"pink color");
        }
        else  if([IsSampleReceived isEqualToString:@"1"]&&[IsTestCompleted isEqualToString:@"1"] && ![ReportNo isEqualToString:@""])
        {
            
            btn.backgroundColor=[UIColor colorWithRed:99/256. green:220/256. blue:144/256. alpha:1];
            NSLog(@"green color");
        }
        else if([IsSampleReceived isEqualToString:@"0"]&&[IsTestCompleted isEqualToString:@"<null>"] &&[ReportNo isEqualToString:@""]&&[IsCancel isEqualToString:@"<null>"]&&[IsOutsourced isEqualToString:@"<null>"])
        {
            
            btn.backgroundColor=[UIColor colorWithRed:128/256. green:181/256. blue:255/256. alpha:1];
            NSLog(@"blue color");
        }
        else if ([IsCancel isEqualToString:@"1"]&&[IsOutsourced isEqualToString:@"<null>"])
        {
            btn.backgroundColor=[UIColor colorWithRed:255/256. green:0/256. blue:0/256. alpha:1];
            NSLog(@"red color");
            
            
        }
        else if ([IsCancel isEqualToString:@"<null>"]&&[IsOutsourced isEqualToString:@"1"])
        {
            btn.backgroundColor=[UIColor colorWithRed:128/256. green:128/256. blue:128/256. alpha:1];
            NSLog(@"gray color");
            
            
        }
        btn=(UIButton *)[cell viewWithTag:2];
        [btn setTitle:[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:indexPath.row]valueForKey:@"TestName"]]forState:UIControlStateNormal];
        if([IsSampleReceived isEqualToString:@"1"]&&[IsTestCompleted isEqualToString:@"<null>"] && ![ReportNo isEqualToString:@""]&&[IsCancel isEqualToString:@"<null>"]&&[IsOutsourced isEqualToString:@"<null>"])
        {
            btn.backgroundColor=[UIColor colorWithRed:207/256. green:141/256. blue:234/256. alpha:1];
            NSLog(@"pink color");
        }
        else  if([IsSampleReceived isEqualToString:@"1"]&&[IsTestCompleted isEqualToString:@"1"] && ![ReportNo isEqualToString:@""])
        {
            
            btn.backgroundColor=[UIColor colorWithRed:99/256. green:220/256. blue:144/256. alpha:1];
            NSLog(@"green color");
        }
        else if([IsSampleReceived isEqualToString:@"0"]&&[IsTestCompleted isEqualToString:@"<null>"] &&[ReportNo isEqualToString:@""]&&[IsCancel isEqualToString:@"<null>"]&&[IsOutsourced isEqualToString:@"<null>"])
        {
            
            btn.backgroundColor=[UIColor colorWithRed:128/256. green:181/256. blue:255/256. alpha:1];
            NSLog(@"blue color");
        }
        else if ([IsCancel isEqualToString:@"1"]&&[IsOutsourced isEqualToString:@"<null>"])
        {
            btn.backgroundColor=[UIColor colorWithRed:255/256. green:0/256. blue:0/256. alpha:1];
            NSLog(@"red color");
            
            
        }
        else if ([IsCancel isEqualToString:@"<null>"]&&[IsOutsourced isEqualToString:@"1"])
        {
            btn.backgroundColor=[UIColor colorWithRed:128/256. green:128/256. blue:128/256. alpha:1];
            NSLog(@"gray color");
            
            
        }
        btn=(UIButton *)[cell viewWithTag:3];
        [btn setTitle:[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:indexPath.row]valueForKey:@"ReportNo"]]forState:UIControlStateNormal];
        if([IsSampleReceived isEqualToString:@"1"]&&[IsTestCompleted isEqualToString:@"<null>"] && ![ReportNo isEqualToString:@""]&&[IsCancel isEqualToString:@"<null>"]&&[IsOutsourced isEqualToString:@"<null>"])
        {
            btn.backgroundColor=[UIColor colorWithRed:207/256. green:141/256. blue:234/256. alpha:1];
            [btn addTarget:self action:@selector(onCustomAccessoryTapped:)forControlEvents:UIControlEventTouchUpInside];
            NSLog(@"pink color");
        }
        else  if([IsSampleReceived isEqualToString:@"1"]&&[IsTestCompleted isEqualToString:@"1"] && ![ReportNo isEqualToString:@""])
        {
            
            btn.backgroundColor=[UIColor colorWithRed:99/256. green:220/256. blue:144/256. alpha:1];
            [btn addTarget:self action:@selector(onCustomAccessoryTapped:)forControlEvents:UIControlEventTouchUpInside];
            NSLog(@"green color");
            UIButton  *Check_Test1=[[UIButton alloc]initWithFrame:CGRectMake(250,13,20,20)];
            Check_Test1.tag=indexPath.row+300;
            
            [Check_Test1 addTarget:self action:@selector(selectforemail:)forControlEvents:UIControlEventTouchUpInside];
            imageLayer = Check_Test1.layer;
            [imageLayer setCornerRadius:05];
            [imageLayer setBorderWidth:1];
            imageLayer.borderColor=[[UIColor lightGrayColor] CGColor];
            [cell.contentView addSubview:Check_Test1];
            
        }
        else if([IsSampleReceived isEqualToString:@"0"]&&[IsTestCompleted isEqualToString:@"<null>"] &&[ReportNo isEqualToString:@""]&&[IsCancel isEqualToString:@"<null>"]&&[IsOutsourced isEqualToString:@"<null>"])
        {
            
            btn.backgroundColor=[UIColor colorWithRed:128/256. green:181/256. blue:255/256. alpha:1];
            NSLog(@"blue color");
        }
        else if ([IsCancel isEqualToString:@"1"]&&[IsOutsourced isEqualToString:@"<null>"])
        {
            btn.backgroundColor=[UIColor colorWithRed:255/256. green:0/256. blue:0/256. alpha:1];
            NSLog(@"red color");
            
            
        }
        else if ([IsCancel isEqualToString:@"<null>"]&&[IsOutsourced isEqualToString:@"1"])
        {
            btn.backgroundColor=[UIColor colorWithRed:128/256. green:128/256. blue:128/256. alpha:1];
            [btn addTarget:self action:@selector(onCustomAccessoryTapped:)forControlEvents:UIControlEventTouchUpInside];
            NSLog(@"gray color");
            
            
        }
//        btn=(UIButton *)[cell viewWithTag:4];
//        
//        [btn setTitle:[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:indexPath.row]valueForKey:@"Dt"]]forState:UIControlStateNormal];
//        if([IsSampleReceived isEqualToString:@"1"]&&[IsTestCompleted isEqualToString:@"<null>"] && ![ReportNo isEqualToString:@""]&&[IsCancel isEqualToString:@"<null>"]&&[IsOutsourced isEqualToString:@"<null>"])
//        {
//            btn.backgroundColor=[UIColor colorWithRed:207/256. green:141/256. blue:234/256. alpha:1];
//            NSLog(@"pink color");
//        }
//        else  if([IsSampleReceived isEqualToString:@"1"]&&[IsTestCompleted isEqualToString:@"1"] && ![ReportNo isEqualToString:@""])
//        {
//            
//            btn.backgroundColor=[UIColor colorWithRed:99/256. green:220/256. blue:144/256. alpha:1];
//            NSLog(@"green color");
//        }
//        else if([IsSampleReceived isEqualToString:@"0"]&&[IsTestCompleted isEqualToString:@"<null>"] &&[ReportNo isEqualToString:@""]&&[IsCancel isEqualToString:@"<null>"]&&[IsOutsourced isEqualToString:@"<null>"])
//        {
//            
//            btn.backgroundColor=[UIColor colorWithRed:128/256. green:181/256. blue:255/256. alpha:1];
//            NSLog(@"blue color");
//        }
//        else if ([IsCancel isEqualToString:@"1"]&&[IsOutsourced isEqualToString:@"<null>"])
//        {
//            btn.backgroundColor=[UIColor colorWithRed:255/256. green:0/256. blue:0/256. alpha:1];
//            NSLog(@"red color");
//            
//            
//        }
//        else if ([IsCancel isEqualToString:@"<null>"]&&[IsOutsourced isEqualToString:@"1"])
//        {
//            btn.backgroundColor=[UIColor colorWithRed:128/256. green:128/256. blue:128/256. alpha:1];
//            NSLog(@"gray color");
//            
//        }
        btn=(UIButton *)[cell viewWithTag:5];
        //  [btn setTitle:[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:indexPath.row]valueForKey:@"ReportStatus"]]forState:UIControlStateNormal];
        if([IsSampleReceived isEqualToString:@"1"]&&[IsTestCompleted isEqualToString:@"<null>"] && ![ReportNo isEqualToString:@""]&&[IsCancel isEqualToString:@"<null>"]&&[IsOutsourced isEqualToString:@"<null>"])
        {
            btn.backgroundColor=[UIColor colorWithRed:207/256. green:141/256. blue:234/256. alpha:1];
            NSLog(@"pink color");
        }
        else  if([IsSampleReceived isEqualToString:@"1"]&&[IsTestCompleted isEqualToString:@"1"] && ![ReportNo isEqualToString:@""])
        {
            
            btn.backgroundColor=[UIColor colorWithRed:99/256. green:220/256. blue:144/256. alpha:1];
            if([[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:indexPath.row] valueForKey:@"IsChecked"]]isEqualToString:@"1"])
            {
                [btn setTitle:@"C"forState:UIControlStateNormal] ;
                
            }
            NSLog(@"green color");
        }
        else if([IsSampleReceived isEqualToString:@"0"]&&[IsTestCompleted isEqualToString:@"<null>"] &&[ReportNo isEqualToString:@""]&&[IsCancel isEqualToString:@"<null>"]&&[IsOutsourced isEqualToString:@"<null>"])
        {
            
            btn.backgroundColor=[UIColor colorWithRed:128/256. green:181/256. blue:255/256. alpha:1];
            NSLog(@"blue color");
        }
        else if ([IsCancel isEqualToString:@"1"]&&[IsOutsourced isEqualToString:@"<null>"])
        {
            btn.backgroundColor=[UIColor colorWithRed:255/256. green:0/256. blue:0/256. alpha:1];
            NSLog(@"red color");
            
            
        }
        else if ([IsCancel isEqualToString:@"<null>"]&&[IsOutsourced isEqualToString:@"1"])
        {
            btn.backgroundColor=[UIColor colorWithRed:128/256. green:128/256. blue:128/256. alpha:1];
            NSLog(@"gray color");
            
        }
        btn=(UIButton *)[cell viewWithTag:6];
        //   NSString *str=[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:indexPath.row]valueForKey:@"Specimen"]];
        if([[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:indexPath.row]valueForKey:@"Specimen"]]isEqualToString:@"<null>"])
        {
            
        }
        else
        {
            [btn setTitle:[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:indexPath.row]valueForKey:@"Specimen"]]forState:UIControlStateNormal];
        }
        
        if([IsSampleReceived isEqualToString:@"1"]&&[IsTestCompleted isEqualToString:@"<null>"] && ![ReportNo isEqualToString:@""]&&[IsCancel isEqualToString:@"<null>"]&&[IsOutsourced isEqualToString:@"<null>"])
        {
            btn.backgroundColor=[UIColor colorWithRed:207/256. green:141/256. blue:234/256. alpha:1];
            NSLog(@"pink color");
        }
        else  if([IsSampleReceived isEqualToString:@"1"]&&[IsTestCompleted isEqualToString:@"1"] && ![ReportNo isEqualToString:@""])
        {
            
            btn.backgroundColor=[UIColor colorWithRed:99/256. green:220/256. blue:144/256. alpha:1];
            
            NSLog(@"green color");
        }
        else if([IsSampleReceived isEqualToString:@"0"]&&[IsTestCompleted isEqualToString:@"<null>"] &&[ReportNo isEqualToString:@""]&&[IsCancel isEqualToString:@"<null>"]&&[IsOutsourced isEqualToString:@"<null>"])
        {
            
            btn.backgroundColor=[UIColor colorWithRed:128/256. green:181/256. blue:255/256. alpha:1];
            NSLog(@"blue color");
            [btn addTarget:self action:@selector(onCustomAccessoryTapped:)forControlEvents:UIControlEventTouchUpInside];
            if([[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:indexPath.row]valueForKey:@"Specimen"]] isEqualToString:@"<null>"])
            {
                
                imageLayer = btn.layer;
                [imageLayer setCornerRadius:06];
                [imageLayer setBorderWidth:1];
                imageLayer.borderColor=[[UIColor grayColor] CGColor];
                [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                btn.backgroundColor=[UIColor colorWithRed:61/256. green:148/256. blue:246/256. alpha:1];
                [btn setTitle:[NSString stringWithFormat:@"Sample"]forState:UIControlStateNormal];
                
            }
        }
        else if ([IsCancel isEqualToString:@"1"]&&[IsOutsourced isEqualToString:@"<null>"])
        {
            btn.backgroundColor=[UIColor colorWithRed:255/256. green:0/256. blue:0/256. alpha:1];
            NSLog(@"red color");
            
            
        }
        else if ([IsCancel isEqualToString:@"<null>"]&&[IsOutsourced isEqualToString:@"1"])
        {
            btn.backgroundColor=[UIColor colorWithRed:128/256. green:128/256. blue:128/256. alpha:1];
            NSLog(@"gray color");
            
        }
        
//        btn=(UIButton *)[cell viewWithTag:7];
//        [btn setTitle:[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:indexPath.row]valueForKey:@"PanelCompany"]]forState:UIControlStateNormal];
//        if([IsSampleReceived isEqualToString:@"1"]&&[IsTestCompleted isEqualToString:@"<null>"] && ![ReportNo isEqualToString:@""]&&[IsCancel isEqualToString:@"<null>"]&&[IsOutsourced isEqualToString:@"<null>"])
//        {
//            btn.backgroundColor=[UIColor colorWithRed:207/256. green:141/256. blue:234/256. alpha:1];
//            NSLog(@"pink color");
//        }
//        else  if([IsSampleReceived isEqualToString:@"1"]&&[IsTestCompleted isEqualToString:@"1"] && ![ReportNo isEqualToString:@""])
//        {
//            btn.backgroundColor=[UIColor colorWithRed:99/256. green:220/256. blue:144/256. alpha:1];
//            NSLog(@"green color");
//        }
//        else if([IsSampleReceived isEqualToString:@"0"]&&[IsTestCompleted isEqualToString:@"<null>"] &&[ReportNo isEqualToString:@""]&&[IsCancel isEqualToString:@"<null>"]&&[IsOutsourced isEqualToString:@"<null>"])
//        {
//            
//            btn.backgroundColor=[UIColor colorWithRed:128/256. green:181/256. blue:255/256. alpha:1];
//            NSLog(@"blue color");
//        }
//        else if ([IsCancel isEqualToString:@"1"]&&[IsOutsourced isEqualToString:@"<null>"])
//        {
//            btn.backgroundColor=[UIColor colorWithRed:255/256. green:0/256. blue:0/256. alpha:1];
//            NSLog(@"red color");
//            
//            
//        }
//        else if ([IsCancel isEqualToString:@"<null>"]&&[IsOutsourced isEqualToString:@"1"])
//        {
//            btn.backgroundColor=[UIColor colorWithRed:128/256. green:128/256. blue:128/256. alpha:1];
//            NSLog(@"gray color");
//            
//            
//        }
        btn=(UIButton *)[cell viewWithTag:8];
        // [btn setTitle:[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:indexPath.row]valueForKey:@"PanelCompany"]]forState:UIControlStateNormal];
        if([IsSampleReceived isEqualToString:@"1"]&&[IsTestCompleted isEqualToString:@"<null>"] && ![ReportNo isEqualToString:@""]&&[IsCancel isEqualToString:@"<null>"]&&[IsOutsourced isEqualToString:@"<null>"])
        {
            btn.backgroundColor=[UIColor colorWithRed:207/256. green:141/256. blue:234/256. alpha:1];
            NSLog(@"pink color");
        }
        else  if([IsSampleReceived isEqualToString:@"1"]&&[IsTestCompleted isEqualToString:@"1"] && ![ReportNo isEqualToString:@""])
        {
            NSLog(@"green color");
            if([[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:indexPath.row] valueForKey:@"IsChecked"]]isEqualToString:@"1"])
            {
                btn.backgroundColor=[UIColor colorWithRed:99/256. green:220/256. blue:144/256. alpha:1];
                [btn setTitle:@"C"forState:UIControlStateNormal] ;
                
            }
            else
            {
                
                imageLayer = btn.layer;
                [imageLayer setCornerRadius:03];
                [imageLayer setBorderWidth:1];
                imageLayer.borderColor=[[UIColor grayColor] CGColor];
                [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                btn.backgroundColor=[UIColor colorWithRed:61/256. green:148/256. blue:246/256. alpha:1];
                [btn setTitle:[NSString stringWithFormat:@"Check"]forState:UIControlStateNormal];
                [btn addTarget:self action:@selector(onCustomAccessoryTapped1:)forControlEvents:UIControlEventTouchUpInside];
            }
            
        }
        else if([IsSampleReceived isEqualToString:@"0"]&&[IsTestCompleted isEqualToString:@"<null>"] &&[ReportNo isEqualToString:@""]&&[IsCancel isEqualToString:@"<null>"]&&[IsOutsourced isEqualToString:@"<null>"])
        {
            
            btn.backgroundColor=[UIColor colorWithRed:128/256. green:181/256. blue:255/256. alpha:1];
            NSLog(@"blue color");
        }
        else if ([IsCancel isEqualToString:@"1"]&&[IsOutsourced isEqualToString:@"<null>"])
        {
            btn.backgroundColor=[UIColor colorWithRed:255/256. green:0/256. blue:0/256. alpha:1];
            NSLog(@"red color");
            
            
        }
        else if ([IsCancel isEqualToString:@"<null>"]&&[IsOutsourced isEqualToString:@"1"])
        {
            btn.backgroundColor=[UIColor colorWithRed:128/256. green:128/256. blue:128/256. alpha:1];
            NSLog(@"gray color");
            
            
        }
    }
    
    else if (tableView==table_outsource)
    {
        
        if(cell==nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            UILabel *Descriptions=[[UILabel alloc]initWithFrame:CGRectMake(02,10,50,30)];
            Descriptions.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
            Descriptions.tag=1;
            Descriptions.font = [UIFont boldSystemFontOfSize:12.0];
            Descriptions.textColor=[UIColor blackColor];
            Descriptions.textAlignment = NSTextAlignmentCenter;
            imageLayer = Descriptions.layer;
            [imageLayer setCornerRadius:02];
            [imageLayer setBorderWidth:2];
            imageLayer.borderColor=[[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1]CGColor];
            Descriptions.text=[NSString stringWithFormat:@"%@",[Description objectAtIndex:indexPath.row]];
            [cell.contentView addSubview:Descriptions];
            
            UIButton *Lab1=[[UIButton alloc]initWithFrame:CGRectMake(55,10,50,30)];
            Lab1.tag=1;
            Lab1.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
            Lab1.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
            
            NSString *labid=[NSString stringWithFormat:@"%@",[[AllLaboratories objectAtIndex:indexPath.row] valueForKey:@"LaboratoryId"]];
            NSString *LaboratoryID=[NSString stringWithFormat:@"%@",[[[AllDescriptions objectAtIndex:indexPath.section]objectAtIndex:indexPath.row]objectForKey:@"LaboratoryId"]];
            
            NSLog(@"lab id %@  labid %@",labid,LaboratoryID);
            
            
            //           for(int i=0;i<OutSource.count;i++)
            //           {
            //
            //
            //
            //           }
            [Lab1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            imageLayer = Lab1.layer;
            [imageLayer setCornerRadius:02];
            [imageLayer setBorderWidth:2];
            imageLayer.borderColor=[[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1]CGColor];
            [cell.contentView addSubview:Lab1];
            
            UIButton *Lab2=[[UIButton alloc]initWithFrame:CGRectMake(110,10,50,30)];
            //  Lab1.tag=1;
            Lab2.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
            Lab2.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
            //[Lab1 setTitle:@"Remark" forState:UIControlStateNormal];
            // Lab2.backgroundColor=[UIColor colorWithRed:245/256. green:245/256. blue:245/256. alpha:1];
            [Lab2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            imageLayer = Lab2.layer;
            [imageLayer setCornerRadius:02];
            [imageLayer setBorderWidth:2];
            imageLayer.borderColor=[[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1]CGColor];
            [cell.contentView addSubview:Lab2];
            
            UIButton *Lab3=[[UIButton alloc]initWithFrame:CGRectMake(165,10,50,30)];
            // Lab1.tag=1;
            Lab3.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
            Lab3.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
            //[Lab1 setTitle:@"Remark" forState:UIControlStateNormal];
            // Lab3.backgroundColor=[UIColor colorWithRed:245/256. green:245/256. blue:245/256. alpha:1];
            [Lab3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            imageLayer = Lab3.layer;
            [imageLayer setCornerRadius:02];
            [imageLayer setBorderWidth:2];
            imageLayer.borderColor=[[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1]CGColor];
            [cell.contentView addSubview:Lab3];
            
            UIButton *Lab4=[[UIButton alloc]initWithFrame:CGRectMake(220,10,50,30)];
            //   Lab1.tag=1;
            Lab4.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
            Lab4.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
            //[Lab1 setTitle:@"Remark" forState:UIControlStateNormal];
            //Lab4.backgroundColor=[UIColor colorWithRed:245/256. green:245/256. blue:245/256. alpha:1];
            [Lab4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            imageLayer = Lab4.layer;
            [imageLayer setCornerRadius:02];
            [imageLayer setBorderWidth:2];
            imageLayer.borderColor=[[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1]CGColor];
            [cell.contentView addSubview:Lab4];
            
            UIButton *Lab5=[[UIButton alloc]initWithFrame:CGRectMake(275,10,55,30)];
            //  Lab1.tag=1;
            Lab5.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
            Lab5.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
            //[Lab1 setTitle:@"Remark" forState:UIControlStateNormal];
            //Lab5.backgroundColor=[UIColor colorWithRed:245/256. green:245/256. blue:245/256. alpha:1];
            [Lab5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            imageLayer = Lab5.layer;
            [imageLayer setCornerRadius:02];
            [imageLayer setBorderWidth:2];
            imageLayer.borderColor=[[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1]CGColor];
            [cell.contentView addSubview:Lab5];
            
        }
    }
    
    /* if(tableView==table_WorkListTest)
     {
     if(cell==nil)
     {
     cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
     cell.selectionStyle = UITableViewCellSelectionStyleNone;
     cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
     cell.selectionStyle = UITableViewCellSelectionStyleNone;
     UILabel *Descriptions=[[UILabel alloc]initWithFrame:CGRectMake(20,10,80,30)];
     Descriptions.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
     Descriptions.tag=1;
     Descriptions.font = [UIFont boldSystemFontOfSize:12.0];
     Descriptions.textColor=[UIColor blackColor];
     [cell.contentView addSubview:Descriptions];
     
     UILabel *unit=[[UILabel alloc]initWithFrame:CGRectMake(110,10,30,30)];
     unit.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
     unit.tag=2;
     unit.font = [UIFont boldSystemFontOfSize:12.0];
     unit.textColor=[UIColor blackColor];
     [cell.contentView addSubview:unit];
     
     UILabel *type=[[UILabel alloc]initWithFrame:CGRectMake(140,10,30,30)];
     type.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
     type.tag=3;
     type.font = [UIFont boldSystemFontOfSize:12.0];
     type.textColor=[UIColor blackColor];
     [cell.contentView addSubview:type];
     
     UILabel *range=[[UILabel alloc]initWithFrame:CGRectMake(180,10,40,30)];
     range.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
     range.tag=4;
     range.font = [UIFont boldSystemFontOfSize:12.0];
     range.textColor=[UIColor blackColor];
     [cell.contentView addSubview:range];
     
     UIButton *remark=[[UIButton alloc]initWithFrame:CGRectMake(280,10,30,30)];
     // remark.tag=1;
     remark.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
     remark.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
     [remark setTitle:@"Remark" forState:UIControlStateNormal];
     remark.backgroundColor=[UIColor colorWithRed:245/256. green:245/256. blue:245/256. alpha:1];
     [remark setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     imageLayer = remark.layer;
     [imageLayer setCornerRadius:10];
     [imageLayer setBorderWidth:1];
     imageLayer.borderColor=[[UIColor grayColor] CGColor];
     [cell.contentView addSubview:remark];
     
     resultval=[[UITextField alloc]initWithFrame:CGRectMake(510,10,100,30)];
     resultval.tag=indexPath.row+100;
     resultval.font = [UIFont boldSystemFontOfSize:12.0];
     resultval.textAlignment = NSTextAlignmentCenter;
     resultval.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
     resultval.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
     resultval.delegate =self;
     imageLayer = resultval.layer;
     [imageLayer setCornerRadius:02];
     [imageLayer setBorderWidth:1];
     imageLayer.borderColor=[[UIColor lightGrayColor]CGColor];
     [cell.contentView addSubview:resultval];
     NSString *resulttype=[NSString stringWithFormat:@"%@",[[[AllDescriptions objectAtIndex:indexPath.section]objectAtIndex:indexPath.row]objectForKey:@"ResultType"]];
     NSString *resultvalue=[NSString stringWithFormat:@"%@",[[[AllDescriptions objectAtIndex:indexPath.section]objectAtIndex:indexPath.row]objectForKey:@"ResultValue"]];
     if([resulttype isEqualToString:@"Numerical"]&&![resultvalue isEqualToString:@""]&&![resultvalue isEqualToString:@"<null>"])
     {
     
     resultval.text=resultvalue;
     int x=[resultval.text integerValue];
     
     NSString *Criticallow=[NSString stringWithFormat:@"%@",[[[AllDescriptions objectAtIndex:indexPath.section]objectAtIndex:indexPath.row]objectForKey:@"CriticalLow"]];
     
     NSString *CriticalHigh=[NSString stringWithFormat:@"%@",[[[AllDescriptions objectAtIndex:indexPath.section]objectAtIndex:indexPath.row]objectForKey:@"CriticalHigh"]];
     NSString *Rangefrom=[NSString stringWithFormat:@"%@",[[[AllDescriptions objectAtIndex:indexPath.section]objectAtIndex:indexPath.row]objectForKey:@"RangeFrom"]];
     NSString *rangeto=[NSString stringWithFormat:@"%@",[[[AllDescriptions objectAtIndex:indexPath.section]objectAtIndex:indexPath.row]objectForKey:@"RangeTo"]];
     if(x<[Criticallow integerValue]||x>[CriticalHigh integerValue])
     {
     
     
     resultval.backgroundColor=[UIColor colorWithRed:255/256. green:0/256. blue:0/256. alpha:1];
     }
     else if ((x>=[Criticallow integerValue] && x<[Rangefrom integerValue])||(x>[rangeto integerValue]&& x<=[CriticalHigh integerValue]))
     {
     resultval.backgroundColor=[UIColor colorWithRed:255/256. green:169/256. blue:64/256. alpha:1];
     
     }
     else
     {
     
     resultval.backgroundColor=[UIColor whiteColor];
     
     }
     
     }
     if([resulttype isEqualToString:@"<null>"])
     {
     
     [resultval removeFromSuperview];
     
     
     }
     else if([resulttype isEqualToString:@"Numerical"])
     {
     
     [resultval addTarget:self action:@selector(saveresultvalue:)forControlEvents:UIControlEventEditingChanged];
     
     }
     else if([resulttype isEqualToString:@"Words"]||[resulttype isEqualToString:@"Comment"])
     {
     
     UIButton *CheckMark=[[UIButton alloc]init];
     CheckMark.frame=CGRectMake(610,10,30,30);
     CheckMark.tag=indexPath.row+200;
     [CheckMark setImage:[UIImage imageNamed:@"DownTriangle1"]forState:UIControlStateNormal];
     [CheckMark addTarget:self action:@selector(onCustomAccessoryTapped:)forControlEvents:UIControlEventTouchUpInside];
     imageLayer = CheckMark.layer;
     [imageLayer setCornerRadius:02];
     [imageLayer setBorderWidth:1];
     imageLayer.borderColor=[[UIColor blackColor] CGColor];
     [cell.contentView addSubview:CheckMark];
     }
     
     // [listTestVal addObject:resultval];
     }
     UILabel *lbl=(UILabel *)[cell viewWithTag:1];
     NSString *_description=[NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%@",[[[AllDescriptions objectAtIndex:indexPath.section]objectAtIndex:indexPath.row]objectForKey:@"Description"]]];
     
     if([_description isEqualToString:@"<null>"])
     {
     [lbl setText:@""];
     }
     else
     {
     [lbl setText:_description];
     }
     
     lbl=(UILabel *)[cell viewWithTag:2];
     [lbl setText:[NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%@",[[[AllDescriptions objectAtIndex:indexPath.section]objectAtIndex:indexPath.row]objectForKey:@"Unit"]]]];
     lbl=(UILabel *)[cell viewWithTag:3];
     
     
     NSString *_resultype=[NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%@",[[[AllDescriptions objectAtIndex:indexPath.section]objectAtIndex:indexPath.row]objectForKey:@"ResultType"]]];
     if([_resultype isEqualToString:@"<null>"])
     {
     [lbl setText:@""];
     }
     else
     {
     [lbl setText:_resultype];
     }
     
     
     lbl=(UILabel *)[cell viewWithTag:4];
     
     NSString *_rangevalue=[NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%@",[[[AllDescriptions objectAtIndex:indexPath.section]objectAtIndex:indexPath.row]objectForKey:@"RangeValue"]]];
     if([_rangevalue isEqualToString:@"<null>"])
     {
     [lbl setText:@""];
     }
     else
     {
     [lbl setText:_rangevalue];
     }
     
     }*/
    return cell;
}

- (void)onCustomAccessoryTapped1:(UIButton *)sender
{
    UITableViewCell *cell = (UITableViewCell *)sender.superview.superview;
    NSIndexPath *indexPath = [table_WorkList indexPathForCell:cell];
    NSLog(@"index %@",indexPath);
    NSLog(@"btn %@",[NSString stringWithFormat:@"%@",[WorkListView objectAtIndex:indexPath.row]]);
    
    
    self.WebService->case_id=[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:indexPath.row] valueForKey:@"caseid"]];
    self.WebService->test_id=[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:indexPath.row]valueForKey:@"testID"]];
    
    
    [self.WebService CallServiceCheckReport:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/CheckReport" Object:NULL Handler:NULL];
    
    if([self.WebService.ptr isEqualToString:@"<null>"])
    {
        
        
        [self viewDidLoad];
    }
}

-(void)onCustomAccessoryTapped:(UIButton *)sender
{
    UITableViewCell *cell = (UITableViewCell *)sender.superview.superview;
    NSIndexPath *indexPath = [table_WorkList indexPathForCell:cell];
    NSLog(@"index %@",indexPath);
    NSLog(@"btn %@",[NSString stringWithFormat:@"%@",[WorkListView objectAtIndex:indexPath.row]]);
    
    NSString  *Case_Id=[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:indexPath.row] valueForKey:@"caseid"]];
    NSLog( @"case id is %@",Case_Id);
    
    NSString  *Investigation_Id=[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:indexPath.row]valueForKey:@"InvestigationId"]];
    NSLog( @"investigation id is %@",Investigation_Id);
    
    NSString  *Test_Id=[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:indexPath.row]valueForKey:@"testID"]];
    NSLog( @"Test id is %@",Test_Id);
    
    IsSampleReceived=[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:indexPath.row]valueForKey:@"IsSampleReceived"]];
    NSLog(@"IsSampleReceived %@",IsSampleReceived);
    IsTestCompleted=[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:indexPath.row]valueForKey:@"IsTestCompleted"]];
    NSLog(@"IsTestCompleted %@",IsTestCompleted);
    ReportNo=[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:indexPath.row]valueForKey:@"ReportNo"]];
    NSLog(@"ReportNo %@",ReportNo);
    
    NSString  *AdviseDr_Id=[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:indexPath.row]valueForKey:@"AdvisedDoctorId"]];
    if([AdviseDr_Id isEqualToString:@"<null>"])
    {
        
        AdviseDr_Id=(NSString*)[NSNull null];
    }
    
    NSLog(@"dr id %@",AdviseDr_Id);
    
    NSString  *lab_No=[NSString stringWithFormat:@"%@",[[WorkListView objectAtIndex:indexPath.row]valueForKey:@"LabNo"]];
    
    if([IsSampleReceived isEqualToString:@"1"]&&[IsTestCompleted isEqualToString:@"<null>"] && ![ReportNo isEqualToString:@""])
    {
        NSLog(@"pink color");
        
        InvestigationWorkListReportGenerateViewController *InvestigationReport=[[InvestigationWorkListReportGenerateViewController alloc]init];
        InvestigationReport.Dictionay_Worklist=(NSMutableArray*)WorkListDetails;
        InvestigationReport.CaseID=[NSString stringWithFormat:@"%@",Case_Id];
        InvestigationReport.TestID=[NSString stringWithFormat:@"%@",Test_Id];
        
        [self.navigationController pushViewController:InvestigationReport animated:YES];
        
    }
    
    else if([IsSampleReceived isEqualToString:@"0"]&&[IsTestCompleted isEqualToString:@"<null>"] &&[ReportNo isEqualToString:@""])
    {
        NSLog(@"blue color");
        
        NSMutableArray *CompletTest=[[NSMutableArray alloc]init];
        //
        //        for(int i=0;i<WorkListView.count;i++)
        //        {
        NSDictionary *dict=[[NSDictionary alloc]initWithObjectsAndKeys:Investigation_Id,@"InvestigationId",AdviseDr_Id,@"AdvisedDoctorId",ReportNo,@"ReportNo",Test_Id,@"TestId",lab_No,@"LabNo", nil];
        [CompletTest addObject:dict];
        
        //        }
        self.WebService->Detail_AdviseInvestigation=(NSMutableArray*)CompletTest;
        self.WebService->case_id=Case_Id;
        
        
        [self.WebService CallServiceConfirmAllSamples:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/ConfirmAllSamples" Object:NULL Handler:NULL];
        
        if([self.WebService.ptr isEqualToString:@"<null>"])
        {
            
            
            [self viewDidLoad];
        }
        
    }
    
    else  if([IsSampleReceived isEqualToString:@"1"]&&[IsTestCompleted isEqualToString:@"1"] && ![ReportNo isEqualToString:@""])
    {
        NSLog(@"green color");
        
   
            UIActivityIndicatorView *myIndicator = [[UIActivityIndicatorView alloc]
                                                    initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
            
            // Position the spinner
            [myIndicator setCenter:CGPointMake(50.0, 20.0)];
            
            // Add to button
            [sender addSubview:myIndicator];
            
            if([myIndicator isAnimating])
                [myIndicator stopAnimating];
            else
                [myIndicator startAnimating];
            
            
            self.WebService->case_id=Case_Id;
//            self.WebService->investigation_id=Investigation_Id;
//            self.WebService->test_id=Test_Id;
         testdate=[[NSMutableArray alloc]init];
        
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
   
        
        }
    
    
}
- (UIViewController *) documentInteractionControllerViewControllerForPreview: (UIDocumentInteractionController *) controller
{
    // Use the rootViewController here so that the preview is pushed onto the navbar stack
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    return appDelegate.window.rootViewController;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
