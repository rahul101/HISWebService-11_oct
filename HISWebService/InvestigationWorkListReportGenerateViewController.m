//
//  InvestigationWorkListReportGenerateViewController.m
//  HISWebService
//
//  Created by Rahul Sharma on 18/07/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import "InvestigationWorkListReportGenerateViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "InvestigationWorkListDetailsViewController.h"
#import "WTStatusBar.h"
//#import "WEPopoverController.h"
//#import "WEPopoverContentViewController.h"
//#import "UIBarButtonItem+WEPopover.h"
#import "DemoTable1Controller.h"
@interface InvestigationWorkListReportGenerateViewController ()

@end

@implementation InvestigationWorkListReportGenerateViewController
@synthesize Dictionay_Worklist,WebService=_WebService;
@synthesize TestID,CaseID,popover,data1;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
     
    self.WebService=[[WebService alloc]init];
    copy_array =[[NSMutableArray alloc]init];
    NSLog(@"dictonay %@",Dictionay_Worklist);
    
    ScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0,0,320,568)];
    ScrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth ;
    ScrollView.autoresizesSubviews = YES;
    
    [ScrollView setContentSize:CGSizeMake(320, 800)];
    
    ScrollView.scrollEnabled = YES;
    
    ScrollView.directionalLockEnabled = YES;
    
    ScrollView.showsVerticalScrollIndicator = YES;
    
    ScrollView.showsHorizontalScrollIndicator =YES;
    
    //ScrollView.autoresizesSubviews = YES;
    ScrollView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:ScrollView];
    [self.view addSubview:viewPage];
    viewPage.hidden=YES;
    
    NSLog(@"case id is %@",self.WebService->case_id=CaseID);
    //  NSLog(@"investigation is %@",self.WebService->investigation_id=InvestigationID);
    NSLog(@"test id is %@",self.WebService->test_id=TestID);
    
    if(TestID==NULL)
    {
        [self.WebService CallServiceSetPatientResultValue:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/SetPatientResultValue" Object:NULL Handler:NULL];
    }
    else
    {
    
       [self.WebService CallServiceSetPatientResultValueByTest:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/SetPatientResultValueByTest" Object:NULL Handler:NULL];
    }
    NSLog(@"patient report is %@",self.WebService->ptr1);
    TestSample=(NSMutableArray*)self.WebService->ptr1;
    NSLog(@"testsample %@",TestSample);
    
    Description=(NSMutableArray*)[TestSample valueForKey:@"Description"];
    
        NSLog(@"testsample %@",Description);
//    for (int i= 0 ; i < TestSample.count ; i++)
//    {
//        if(![Description containsObject:[NSString stringWithFormat:@"%@",[[TestSample objectAtIndex:i] valueForKey:@"Name"]]])
//        {
//            
//            [Description addObject:[NSString stringWithFormat:@"%@",[[TestSample objectAtIndex:i] valueForKey:@"Name"]]];
//            
//        }
//        
//        NSLog(@"des %@",Description);
//    }
//    
//   AllDescriptions =[[NSMutableArray alloc]init];
// 
//    for(int i=0;i<Description.count;i++)
//    {
//        NSString *desc=[NSString stringWithFormat:@"%@",[Description objectAtIndex:i]];
//        NSLog(@"desc %@",desc);
//          NSMutableArray *descDetail =[[NSMutableArray alloc]init];
//        for (int j=0;j<TestSample.count; j++)
//        {
//            if([ desc isEqualToString:[NSString stringWithFormat:@"%@",[[TestSample objectAtIndex:j] valueForKey:@"Name"]]])
//            {
//                NSLog(@"here");
//                
//                [descDetail addObject:[TestSample objectAtIndex:j]];
//                NSLog(@"desc %@",descDetail);
//            }
//            
//        }
//        
//        [AllDescriptions addObject:descDetail];
//        NSLog(@"alldesc %@",AllDescriptions);
//        
//    }
    
    UILabel *SNo =[[UILabel alloc]initWithFrame:CGRectMake(10,20,100,30)];
    SNo.font = [UIFont systemFontOfSize:12.0];
    SNo.backgroundColor=[UIColor whiteColor];
    [SNo setText:@"S.No.:"];
    [ScrollView addSubview:SNo];
    
    UILabel *SNoVal=[[UILabel alloc]initWithFrame:CGRectMake(150,20,140,30)];
    SNoVal.font = [UIFont boldSystemFontOfSize:12.0];
    SNoVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceDetail:@"SrNo"];
    SNoVal.text = [NSString stringWithFormat:@"%@",string];
    NSLog(@"item is %@",SNoVal.text);
    [ScrollView addSubview:SNoVal];
    
    UILabel *PatientCode =[[UILabel alloc]initWithFrame:CGRectMake(10,60,100,30)];
    PatientCode.font = [UIFont systemFontOfSize:12.0];
    PatientCode.backgroundColor=[UIColor whiteColor];
    [PatientCode setText:@"Patient Code:"];
    [ScrollView addSubview:PatientCode];
    
    UILabel *PatientCodeVal=[[UILabel alloc]initWithFrame:CGRectMake(150,60,120,30)];
    PatientCodeVal.font = [UIFont boldSystemFontOfSize:12.0];
    PatientCodeVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceDetail:@"PatientCode"];
    PatientCodeVal.text = [NSString stringWithFormat:@"%@",string];
    NSLog(@"item is %@",PatientCodeVal.text);
    [ScrollView addSubview:PatientCodeVal];
    
    UILabel *PatientName =[[UILabel alloc]initWithFrame:CGRectMake(10,100,100,30)];
    PatientName.font = [UIFont systemFontOfSize:12.0];
    PatientName.backgroundColor=[UIColor whiteColor];
    [PatientName setText:@"Patient Name:"];
    [ScrollView addSubview:PatientName];
    
    UILabel *PatientNameVal=[[UILabel alloc]initWithFrame:CGRectMake(150,100,140,30)];
    PatientNameVal.font = [UIFont boldSystemFontOfSize:12.0];
    PatientNameVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceDetail:@"PatientName"];
    PatientNameVal.text = [NSString stringWithFormat:@"%@",string];
    NSLog(@"item is %@",PatientNameVal.text);
    [ScrollView addSubview:PatientNameVal];
    
    UILabel *Gender =[[UILabel alloc]initWithFrame:CGRectMake(10,140,100,30)];
    Gender.font = [UIFont systemFontOfSize:12.0];
    Gender.backgroundColor=[UIColor whiteColor];
    [Gender setText:@"Gender:"];
    [ScrollView addSubview:Gender];
    
    UILabel *GenderVal=[[UILabel alloc]initWithFrame:CGRectMake(150,140,120,30)];
    GenderVal.font = [UIFont boldSystemFontOfSize:12.0];
    GenderVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceDetail:@"Sex"];
    GenderVal.text = [NSString stringWithFormat:@"%@",string];
    NSLog(@"item is %@",GenderVal.text);
    [ScrollView addSubview:GenderVal];
    
    UILabel *Age =[[UILabel alloc]initWithFrame:CGRectMake(10,180,100,30)];
    Age.font = [UIFont systemFontOfSize:12.0];
    Age.backgroundColor=[UIColor whiteColor];
    [Age setText:@"Age:"];
    [ScrollView addSubview:Age];
    
    UILabel *AgeVal=[[UILabel alloc]initWithFrame:CGRectMake(150,180,120,30)];
    AgeVal.font = [UIFont boldSystemFontOfSize:12.0];
    AgeVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceDetail:@"Age"];
    AgeVal.text = [NSString stringWithFormat:@"%@",string];
    NSLog(@"item is %@",AgeVal.text);
    [ScrollView addSubview:AgeVal];
    
    UILabel *AdviceDr =[[UILabel alloc]initWithFrame:CGRectMake(10,220,100,30)];
    AdviceDr.font = [UIFont systemFontOfSize:12.0];
    AdviceDr.backgroundColor=[UIColor whiteColor];
    [AdviceDr setText:@"Advised By:"];
    [ScrollView addSubview:AdviceDr];
    
    UILabel *AdviceDrVal=[[UILabel alloc]initWithFrame:CGRectMake(150,220,140,30)];
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
    [ScrollView addSubview:AdviceDrVal];
    
    UILabel *AdviceDate =[[UILabel alloc]initWithFrame:CGRectMake(10,260,100,30)];
    AdviceDate.font = [UIFont systemFontOfSize:12.0];
    AdviceDate.backgroundColor=[UIColor whiteColor];
    [AdviceDate setText:@"Advise Date:"];
    [ScrollView addSubview:AdviceDate];
    
    UILabel *AdviceDateVal=[[UILabel alloc]initWithFrame:CGRectMake(150,260,140,30)];
    AdviceDateVal.font = [UIFont boldSystemFontOfSize:12.0];
    AdviceDateVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceDetail:@"Dt"];
    
    AdviceDateVal.text = [NSString stringWithFormat:@"%@",string];
    [ScrollView addSubview:AdviceDateVal];
    
    UILabel *PatientReportNo=[[UILabel alloc]initWithFrame:CGRectMake(10,300,120,30)];
    PatientReportNo.font = [UIFont systemFontOfSize:12.0];
    PatientReportNo.backgroundColor=[UIColor whiteColor];
    [PatientReportNo setText:@"Receipt No:"];
    [ScrollView addSubview:PatientReportNo];
    
    UILabel *PatientReportNoVal=[[UILabel alloc]initWithFrame:CGRectMake(150,300,170,30)];
    PatientReportNoVal.font = [UIFont boldSystemFontOfSize:12.0];
    PatientReportNoVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceDetail:@"ReceiptPrefix"];
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
    
    
    UIScrollView * _scroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 350, 320, 250)];
    [_scroll setContentSize:CGSizeMake(670,100)];
    _scroll.bounces=NO;
    //   _scroll.backgroundColor=[UIColor brownColor];
    [ScrollView addSubview:_scroll];

    
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(1,1,700,50)];
    lable.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    lable.font = [UIFont systemFontOfSize:10.0];
    // lable.backgroundColor=[UIColor grayColor];
    lable.backgroundColor=[UIColor colorWithRed:245/256. green:245/256. blue:245/256. alpha:1];
    [_scroll addSubview:lable];
    
    UILabel *lable_Description=[[UILabel alloc]initWithFrame:CGRectMake(10,10,160,30)];
    lable_Description.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    lable_Description.font = [UIFont systemFontOfSize:12.0];
    lable_Description.textAlignment = NSTextAlignmentCenter;
    // lable.backgroundColor=[UIColor grayColor];
    lable_Description.text=@"Description";
    lable_Description.backgroundColor=[UIColor colorWithRed:200/256. green:200/256. blue:200/256. alpha:1];
    [lable addSubview:lable_Description];
    
    UILabel *lable_Unit=[[UILabel alloc]initWithFrame:CGRectMake(180,10,80,30)];
    lable_Unit.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    lable_Unit.textAlignment = NSTextAlignmentCenter;
    lable_Unit.font = [UIFont systemFontOfSize:12.0];
    // lable.backgroundColor=[UIColor grayColor];
    lable_Unit.backgroundColor=[UIColor colorWithRed:200/256. green:200/256. blue:200/256. alpha:1];
    lable_Unit.text=@"Unit";
    [lable addSubview:lable_Unit];
    
    UILabel *lable_Type=[[UILabel alloc]initWithFrame:CGRectMake(270,10,80,30)];
    lable_Type.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    lable_Type.textAlignment = NSTextAlignmentCenter;
    lable_Type.font = [UIFont systemFontOfSize:12.0];
    // lable.backgroundColor=[UIColor grayColor];
    lable_Type.backgroundColor=[UIColor colorWithRed:200/256. green:200/256. blue:200/256. alpha:1];
    lable_Type.text=@"Type";
    [lable addSubview:lable_Type];
    
    UILabel *lable_Range=[[UILabel alloc]initWithFrame:CGRectMake(360,10,80,30)];
    lable_Range.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    lable_Range.textAlignment = NSTextAlignmentCenter;
    lable_Range.font = [UIFont systemFontOfSize:12.0];
    // lable.backgroundColor=[UIColor grayColor];
    lable_Range.backgroundColor=[UIColor colorWithRed:200/256. green:200/256. blue:200/256. alpha:1];
    lable_Range.text=@"Range";
    [lable addSubview:lable_Range];
    
    UILabel *lable_Result=[[UILabel alloc]initWithFrame:CGRectMake(450,10,120,30)];
    lable_Result.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    lable_Result.textAlignment = NSTextAlignmentCenter;
    lable_Result.font = [UIFont systemFontOfSize:12.0];
    // lable.backgroundColor=[UIColor grayColor];
    lable_Result.backgroundColor=[UIColor colorWithRed:200/256. green:200/256. blue:200/256. alpha:1];
    lable_Result.text=@"Result Value";
    [lable addSubview:lable_Result];
    
    UILabel *lable_remark=[[UILabel alloc]initWithFrame:CGRectMake(580,10,80,30)];
    lable_remark.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    lable_remark.textAlignment = NSTextAlignmentCenter;
    lable_remark.font = [UIFont systemFontOfSize:12.0];
    // lable.backgroundColor=[UIColor grayColor];
    lable_remark.backgroundColor=[UIColor colorWithRed:200/256. green:200/256. blue:200/256. alpha:1];
    lable_remark.text=@"Remark";
    [lable addSubview:lable_remark];
    
//    UILabel *PrimaryCategoryName=[[UILabel alloc]initWithFrame:CGRectMake(05,410,100,30)];
//    PrimaryCategoryName.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
//    PrimaryCategoryName.textAlignment = NSTextAlignmentCenter;
//    PrimaryCategoryName.font = [UIFont systemFontOfSize:12.0];
//    // lable.backgroundColor=[UIColor grayColor];
//    // PrimaryCategoryName.backgroundColor=[UIColor colorWithRed:200/256. green:200/256. blue:200/256. alpha:1];
//    [self CallServiceTestDetail:@"PrimaryCategoryName"];
//    PrimaryCategoryName.text=[NSString stringWithFormat:@"%@",string];
//    [ScrollView addSubview:PrimaryCategoryName];
//    
//    UILabel *SecondaryCategoryName=[[UILabel alloc]initWithFrame:CGRectMake(110,410,180,30)];
//    SecondaryCategoryName.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
//    SecondaryCategoryName.textAlignment = NSTextAlignmentCenter;
//    SecondaryCategoryName.font = [UIFont systemFontOfSize:12.0];
//    // lable.backgroundColor=[UIColor grayColor];
//    //  PrimaryCategoryName.backgroundColor=[UIColor colorWithRed:200/256. green:200/256. blue:200/256. alpha:1];
//    [self CallServiceTestDetail:@"SecondaryCategoryName"];
//    SecondaryCategoryName.text=[NSString stringWithFormat:@"%@",string];
//    [ScrollView addSubview:SecondaryCategoryName];
//    
//    UILabel *test=[[UILabel alloc]initWithFrame:CGRectMake(30,450,200,30)];
//    test.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
//    test.textAlignment = NSTextAlignmentCenter;
//    test.font = [UIFont systemFontOfSize:12.0];
//    // lable.backgroundColor=[UIColor grayColor];
//    //  PrimaryCategoryName.backgroundColor=[UIColor colorWithRed:200/256. green:200/256. blue:200/256. alpha:1];
//    //[self CallServiceTestDetail:@"Tests"];
//    [self CallServiceTestDetail:@"Name"];
//    if([string isEqualToString:@""])
//    {
//        test.text=@"Tests";
//    }
//    [ScrollView addSubview:test];

    Table_worklist=[[UITableView alloc]initWithFrame:CGRectMake(10,60,660,170)style:UITableViewStylePlain];
    Table_worklist.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    Table_worklist.delegate=self;
    Table_worklist.dataSource=self;
    Table_worklist.layer.borderWidth = 2.0;
    Table_worklist.layer.borderColor = [UIColor grayColor].CGColor;
    [_scroll addSubview:Table_worklist];
    
    UIButton *savecomplete=[[UIButton alloc]initWithFrame:CGRectMake(10,610,150,30)];
    savecomplete.tag=1;
    savecomplete.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;

    savecomplete.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
    [savecomplete setTitle:@"Save & Complete" forState:UIControlStateNormal];
    [savecomplete addTarget:self action:@selector(allbtn:)forControlEvents:UIControlEventTouchUpInside];
    [ScrollView addSubview:savecomplete];
    
    UIButton *Saveclose=[[UIButton alloc]initWithFrame:CGRectMake(170,610,140,30)];
    Saveclose.tag=5;
     Saveclose.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    Saveclose.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
    [Saveclose addTarget:self action:@selector(allbtn:)forControlEvents:UIControlEventTouchUpInside];

    [Saveclose setTitle:@"Save & Close" forState:UIControlStateNormal];
    [ScrollView addSubview:Saveclose];
    
//    UIBarButtonItem *close=[[UIBarButtonItem alloc]initWithTitle:@"Close" style:UIBarButtonItemStyleBordered target:self action:@selector(Previouspage:)];
//    close.tag=3;
//    
//    self.navigationItem.rightBarButtonItem=close;
 NSLog(@"list %@",Description);
    listTestVal=[[NSMutableArray alloc]init];
    
    for (int i=0; i<Description.count; i++) {
        [listTestVal addObject:[NSNull null]];
    }
    
    
    NSLog(@"list %@",listTestVal);
    // Do any additional setup after loading the view from its nib.
}
-(void)Previouspage:(UIBarButtonItem*)sender
{
    switch (sender.tag)
    {
        case 1:
        {
            viewPage.hidden=YES;
            self.navigationItem.rightBarButtonItems=nil;
            self.navigationItem.hidesBackButton=NO;
          
            /////////////
            
            NSIndexPath *indexPath1 = [NSIndexPath indexPathForRow:_row-200 inSection:_section];
            UITableViewCell *cell = (UITableViewCell *)[Table_worklist cellForRowAtIndexPath:indexPath1];
            UITextField *txt=(UITextField*)[cell viewWithTag:_row-100];
            NSLog(@"txt %@  %d",txt,txt.tag);
           // txt.text=[NSString stringWithFormat:@"%@",html];
           
           
            if (chk_cmmt!=1) {
                 [listTestVal replaceObjectAtIndex:indexPath1.row withObject:[NSNull null]];
            }
            ////////////
            
            break;
        }
        case 2:
        {

            NSLog(@"row %d",_row);
            
            NSString *html = [webView stringByEvaluatingJavaScriptFromString:@"CKEDITOR.instances.editor1.getData()"];
            NSLog(@"val is %@",html);
            NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"\n\t"];
            html= [[html componentsSeparatedByCharactersInSet:doNotWant]componentsJoinedByString:@""];
            NSLog(@"%@", html); // => foobarbazfoo
            NSIndexPath *indexPath1 = [NSIndexPath indexPathForRow:_row-200 inSection:0];
            UITableViewCell *cell = [self->Table_worklist cellForRowAtIndexPath:indexPath1];
            
            UITextField *txt=(UITextField*)[cell viewWithTag:indexPath1.row+100];
            
            NSLog(@"ind  txt %@ , %d",txt,txt.tag);
            
            ///////////////////
            txt.text=[NSString stringWithFormat:@"%@",[[CommentList objectAtIndex:indexPath1.row]valueForKey:@"Name"]];
            
             NSLog(@"txt %@",txt.text);
            
            [listTestVal replaceObjectAtIndex:indexPath1.row withObject:html];
            NSLog(@"array %@",listTestVal);
            chk_cmmt=1;
            //////////////
            
            
           
            viewPage.hidden=YES;
            self.navigationItem.rightBarButtonItems=nil;
            self.navigationItem.hidesBackButton=NO;

            break;
        }
           case 3:
        {
            NSArray *array = [self.navigationController viewControllers];
            NSLog(@"arr %@",array);
            NSLog(@"arr %d",array.count);
            // [self.navigationController pushViewController:WorkListDetail animated:YES];
            [self.navigationController popToViewController:[array objectAtIndex:3] animated:YES];
            break;

        }
            
        default:
            break;
    }
    
}

-(void)GetCommentDetails:(NSString *)indexpath
{
    NSLog(@"details %@",indexpath);

    if([words isEqualToString:@"Words"])
    {
        
    }
    else
    {
        viewPage.hidden=NO;
      
         self.navigationItem.hidesBackButton=YES;
        
       UIBarButtonItem *Setting=[[UIBarButtonItem alloc]initWithTitle:@"Close" style:UIBarButtonItemStyleBordered target:self action:@selector(Previouspage:)];
        Setting.tag=1;
        
        self.navigationItem.rightBarButtonItem=Setting;
        
      UIBarButtonItem *print1=[[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStyleBordered target:self action:@selector(Previouspage:)];
        print1.tag=2;
        
       NSMutableArray *arr=[[NSMutableArray alloc]initWithObjects:Setting,print1,nil] ;
        
        self.navigationItem.rightBarButtonItems=arr;
        
        self.WebService->commentID=[NSString stringWithFormat:@"%@",[[CommentList objectAtIndex:[indexpath integerValue]]valueForKey:@"CommentId"]];
    NSLog(@"cooment id %@",self.WebService->commentID);
    [self.WebService CallServiceGetComment:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/GetComment" Object:NULL Handler:NULL];
    NSLog(@"result %@",self.WebService->ptr1);
//    view2=[[UIView alloc]initWithFrame:CGRectMake(10,650,350,500)];
//    view2.backgroundColor=[UIColor whiteColor];
//    [view2 setIsAccessibilityElement:YES];
//    view2.userInteractionEnabled=YES;
//    view2.autoresizingMask = UIViewAutoresizingFlexibleWidth ;
//    
//    //view2.layer.borderColor = [UIColor grayColor].CGColor;
//   // view2.layer.borderWidth = 2.0f;
//    [ScrollView addSubview:view2];

    webView = [[UIWebView alloc]initWithFrame:CGRectMake(0,64,320,550)];
    [viewPage addSubview:webView];
    //webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    webView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    webView.autoresizesSubviews = YES;
       // webView.scalesPageToFit=YES;
    webView.backgroundColor=[UIColor grayColor];
        webView.userInteractionEnabled=YES;
    webView.delegate=self;
    imageLayer = webView.layer;
    [imageLayer setCornerRadius:02];
    [imageLayer setBorderWidth:1];
    imageLayer.borderColor=[[UIColor grayColor] CGColor];
 
//    UIButton  *save=[[UIButton alloc]initWithFrame:CGRectMake(10,400,120,30)];
//    save.tag=3;
//    save.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
//    save.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
//    [save setTitle:@"Save" forState:UIControlStateNormal];
//    //[save addTarget:self action:@selector(allbtn)forControlEvents:UIControlEventTouchUpInside];
//    singleTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(allbtn:)];
//    
//    [save addGestureRecognizer:singleTap];
//    singleTap.numberOfTapsRequired = 1;
//    [viewPage addSubview:save];
//    
//    UIButton *close=[[UIButton alloc]initWithFrame:CGRectMake(160,400,150,30)];
//    close.tag=4;
//    close.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
//
//    close.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
//    [close setTitle:@"Close" forState:UIControlStateNormal];
//    singleTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(allbtn:)];
//    
//    [close addGestureRecognizer:singleTap];
//    singleTap.numberOfTapsRequired = 1;
//    //[close addTarget:self action:@selector(allbtn)forControlEvents:UIControlEventTouchUpInside];
//    [viewPage addSubview:close];
     NSString *path =[[[NSBundle mainBundle] bundlePath] stringByAppendingString:@"/CKEditor/demo.html"];
    //  NSString *path =[[[NSBundle mainBundle] bundlePath] stringByAppendingString:@"/htdocs/index.html"];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]]];
    }
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView==Table_worklist)
    {
//        for(int i=0;i<AllDescriptions.count;i++)
//        {
//            if(section==i)
        
                return [Description count];
            
        //}
    }
    else if (tableView==Table_Commentlist)
    {
        
        return [CommentList count];
    }
   return 0;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	// There is only one section.
//    if(tableView==Table_worklist)
//    {
//        NSLog(@"all %d",AllDescriptions.count);
//        return [AllDescriptions count];
//    }
    return 1;
}
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//   
//    
////    for(int i=0;i<Description.count;i++)
////    {
////        if(section==i)
////        {
////            if([[NSString stringWithFormat:@"%@",[Description objectAtIndex:i]]isEqualToString:@""])
////            {
////                return [NSString stringWithFormat:@"Test"];
////            }
////         else
////         {
////            return [NSString stringWithFormat:@"%@",[Description objectAtIndex:i]];
////         }
////     }
////    }
//
//    return 0;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"S%1dR%1d",indexPath.section,indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(tableView==Table_worklist)
    {
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        UILabel *Descriptions=[[UILabel alloc]initWithFrame:CGRectMake(03,10,80,30)];
        Descriptions.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        Descriptions.tag=1;
        Descriptions.font = [UIFont boldSystemFontOfSize:12.0];
        Descriptions.textColor=[UIColor blackColor];
        [cell.contentView addSubview:Descriptions];
        
        UILabel *unit=[[UILabel alloc]initWithFrame:CGRectMake(90,10,30,30)];
        unit.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        unit.tag=2;
        unit.font = [UIFont boldSystemFontOfSize:12.0];
        unit.textColor=[UIColor blackColor];
        [cell.contentView addSubview:unit];
        
        UILabel *type=[[UILabel alloc]initWithFrame:CGRectMake(130,10,30,30)];
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
        
        UIButton *remark=[[UIButton alloc]initWithFrame:CGRectMake(285,10,30,30)];
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
        
        resultval=[[UITextField alloc]initWithFrame:CGRectMake(440,10,100,30)];
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
        NSString *resulttype=[NSString stringWithFormat:@"%@",[[TestSample  objectAtIndex:indexPath.row]objectForKey:@"ResultType"]];
        NSString *resultvalue=[NSString stringWithFormat:@"%@",[[TestSample objectAtIndex:indexPath.row]objectForKey:@"ResultValue"]];
    if([resulttype isEqualToString:@"Numerical"]&&![resultvalue isEqualToString:@""]&&![resultvalue isEqualToString:@"<null>"])
        {
            
            resultval.text=resultvalue;
            float x=[resultval.text floatValue];
            NSLog(@"x %f",x);
            
            
            NSCharacterSet  *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"-"];
            NSString *Criticallow=[NSString stringWithFormat:@"%@",[[TestSample objectAtIndex:indexPath.row]objectForKey:@"CriticalLow"]];
            Criticallow = [[Criticallow componentsSeparatedByCharactersInSet:doNotWant]componentsJoinedByString:@""];
              NSLog(@"CL %@",Criticallow);
            NSString *CriticalHigh=[NSString stringWithFormat:@"%@",[[TestSample objectAtIndex:indexPath.row]objectForKey:@"CriticalHigh"]];
            
            CriticalHigh = [[CriticalHigh componentsSeparatedByCharactersInSet:doNotWant]componentsJoinedByString:@""];
              NSLog(@"CH %@",CriticalHigh);
            
            NSString *Rangefrom=[NSString stringWithFormat:@"%@",[[TestSample objectAtIndex:indexPath.row]objectForKey:@"RangeFrom"]];
            
            Rangefrom = [[Rangefrom componentsSeparatedByCharactersInSet:doNotWant]componentsJoinedByString:@""];
              NSLog(@"RF %@",Rangefrom);
            NSString *rangeto=[NSString stringWithFormat:@"%@",[[TestSample objectAtIndex:indexPath.row]objectForKey:@"RangeTo"]];
          
            rangeto = [[rangeto componentsSeparatedByCharactersInSet:doNotWant]componentsJoinedByString:@""];
                NSLog(@"RT %@",rangeto);
            if(x<[Criticallow floatValue]||x>[CriticalHigh floatValue])
            {
                
                
                resultval.backgroundColor=[UIColor colorWithRed:255/256. green:0/256. blue:0/256. alpha:1];
            }
            else if ((x>=[Criticallow floatValue] && x<[Rangefrom floatValue])||(x>[rangeto floatValue]&& x<=[CriticalHigh floatValue]))
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
            CheckMark.frame=CGRectMake(540,10,30,30);
            CheckMark.tag=indexPath.row+200;
            [CheckMark setImage:[UIImage imageNamed:@"DownTriangle1"]forState:UIControlStateNormal];
            [CheckMark addTarget:self action:@selector(onCustomAccessoryTapped:)forControlEvents:UIControlEventTouchUpInside];
            imageLayer = CheckMark.layer;
            [imageLayer setCornerRadius:02];
            [imageLayer setBorderWidth:1];
            imageLayer.borderColor=[[UIColor blackColor] CGColor];
            [cell.contentView addSubview:CheckMark];
          }

        //[listTestVal addObject:resultval];
        if ([resultval.text isEqualToString:@""]) {
              [listTestVal replaceObjectAtIndex:indexPath.row withObject:[NSNull null]];
        }
        else
        {
         [listTestVal replaceObjectAtIndex:indexPath.row withObject:resultval.text];
        }
            NSLog(@"list %@",listTestVal);
    }
    UILabel *lbl=(UILabel *)[cell viewWithTag:1];
        NSString *_description=[NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%@",[[TestSample objectAtIndex:indexPath.row]objectForKey:@"Description"]]];

        if([_description isEqualToString:@"<null>"])
        {
            [lbl setText:@""];
        }
        else
        {
            [lbl setText:_description];
        }
    
    lbl=(UILabel *)[cell viewWithTag:2];
        [lbl setText:[NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%@",[[TestSample objectAtIndex:indexPath.row]objectForKey:@"Unit"]]]];
            lbl=(UILabel *)[cell viewWithTag:3];
        
        
        NSString *_resultype=[NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%@",[[TestSample objectAtIndex:indexPath.row]objectForKey:@"ResultType"]]];
        if([_resultype isEqualToString:@"<null>"])
        {
            [lbl setText:@""];
        }
        else
        {
            [lbl setText:_resultype];
        }

    
    lbl=(UILabel *)[cell viewWithTag:4];
        
        NSString *_rangevalue=[NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%@",[[TestSample objectAtIndex:indexPath.row]objectForKey:@"RangeValue"]]];
        if([_rangevalue isEqualToString:@"<null>"])
        {
            [lbl setText:@""];
        }
        else
        {
            [lbl setText:_rangevalue];
        }
        
      }
    else if (tableView==Table_Commentlist)
    {
        if (cell== nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
            
        }
        cell.textLabel.text = [[CommentList objectAtIndex:indexPath.row]valueForKey:@"Name"];
    }
    
    return cell;
}

-(void)settext:(NSString*)string1
{
    NSLog(@"k %@",string1);
//    
//    NSIndexPath *indexPath1 = [NSIndexPath indexPathForRow:_row-200 inSection:_section];
//    UITableViewCell *cell = (UITableViewCell *)[Table_worklist cellForRowAtIndexPath:indexPath1];
//    UITextField *txt=(UITextField*)[cell viewWithTag:_row-100];
//       NSLog(@"txt %@  %d",txt,txt.tag);
//    txt.text=[NSString stringWithFormat:@"%@",string1];
//       NSLog(@"txt %@",txt.text);

}

-(void)webViewDidFinishLoad:(UIWebView *)_webView
{
    // NSMutableString *html = [NSMutableString stringWithString: @"<html><head><title></title></head><body style=\"background:transparent;\">"];
    
    //continue building the string
//    CGSize mWebViewTextSize = [webView sizeThatFits:CGSizeMake(1.0f, 1.0f)];  // Pass about any size
//    
//    CGRect mWebViewFrame = webView.frame;
//    
//    
//    mWebViewFrame.size.height = mWebViewTextSize.height;
//    
//    webView.frame = mWebViewFrame;
//    
//    
//    //Disable bouncing in webview
//    
//    for (id subview in webView.subviews)
//    {
//        if ([[subview class] isSubclassOfClass: [UIScrollView class]])
//        {
//            [subview setBounces:NO];
//        }
//    }
    
    
    
    
    
    
    
    NSString *html=[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:0]valueForKey:@"CommentHTML"]];
    NSLog(@"html %@",html);
    NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"'"];
    html= [[html componentsSeparatedByCharactersInSet:doNotWant]componentsJoinedByString:@"&rsquo;"];
    
    NSArray *split = [html componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    split = [split filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"length > 0"]];
    NSString *res1 = [split componentsJoinedByString:@""];
    NSLog(@"res %@",res1);
    
    [_webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.getElementById('editor1').innerHTML='%@'",res1]];
    
}
-(NSInteger)sectionForCell:(UITableViewCell*)cell
{
    
    NSIndexPath *ind=[Table_worklist indexPathForCell:cell];
    return ind.section;
    
}
-(void)onCustomAccessoryTapped:(UIButton *)sender
{
    NSLog(@"ind  %d",sender.tag);
    
    _row=sender.tag;
    
    NSLog(@"ind  %d",_row);
    
//    NSIndexPath *indexPath2 = [Table_worklist indexPathForCell:(UITableViewCell*)[[sender superview]superview]];
//    NSLog(@"indexpath 2 %@",indexPath2);
//   _section=indexPath2.section;
//    NSLog(@"ind  %d",_section);
    
    //[Table_Commentlist removeFromSuperview];
    // cell1 = (UITableViewCell *)sender.superview.superview;
  //  NSIndexPath *indexPath = [Table_worklist indexPathForCell:cell1];
  //  NSLog(@"index %@",indexPath);
//    NSIndexPath *indexPath1 = [NSIndexPath indexPathForRow:[reconizer tag]-300 inSection:0];
//    UITableViewCell *cell = [self->table_AdviseTestDetails cellForRowAtIndexPath:indexPath1];
    
//    NSLog(@"cell %@",cell);
//    
//    UIButton *btn=(UIButton*)[cell viewWithTag:indexPath1.row+300];
//
    NSIndexPath *indexPath1 = [NSIndexPath indexPathForRow:_row-200 inSection:0];
    UITableViewCell *cell = [self->Table_worklist cellForRowAtIndexPath:indexPath1];
    
    UITextField *txt=(UITextField*)[cell viewWithTag:indexPath1.row+100];
   
    NSLog(@"ind  txt %@ , %d",txt,txt.tag);
    UILabel *lbl=(UILabel*)[cell viewWithTag:3];
    NSLog(@"lbl %@",lbl);
    //  for(int i=0;i<TestSample.count;i++)
    //{
    self.WebService->investigation_id=[NSString stringWithFormat:@"%@",[[TestSample objectAtIndex:indexPath1.row]objectForKey:@"InvestigationId"]];
    
    words=[NSString stringWithFormat:@"%@",[[TestSample objectAtIndex:indexPath1.row]objectForKey:@"ResultType"]];
    
    if([words isEqualToString:@"Words"])
    {
    [self.WebService CallServiceGetInvestigationComments:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/GetInvestigationWords" Object:NULL Handler:NULL];
        
        CommentList=(NSMutableArray*)self.WebService->ptr1;
        //   NSMutableArray *Comment_arr=[[NSMutableArray alloc]init];
        
        if(CommentList.count>0)
        {
            //view1.hidden=YES;
            
            data1=[[NSMutableArray alloc]init];
            
            for(int i=0;i<CommentList.count;i++)
            {
                [data1 addObject:[[CommentList objectAtIndex:i]valueForKey:@"Value"]];
                
            }
            DemoTable1Controller  *contentViewController = [[DemoTable1Controller alloc]initWithStyle:UITableViewStylePlain];
            //self.popoverController = [[WEPopoverController alloc] initWithContentViewController:contentViewController];
            
            popover=[[FPPopoverController alloc]initWithViewController:contentViewController];
            popover.contentSize=CGSizeMake(200, 200);
            contentViewController.qvc=self;
            contentViewController.Flag=1;
            // self.contentSizeForViewInPopover = CGSizeMake(200, 200);
            // data1=[[NSMutableArray alloc]initWithObjects:@"rahul",@"sharma",nil];
            NSLog(@"data %@",data1);
            popover.border=YES;
            popover.arrowDirection=FPPopoverArrowDirectionRight;
            popover.tint=FPPopoverBlackTint;
            
            contentViewController.category=(NSMutableArray*)data1;
            [popover presentPopoverFromView:sender];
            
            NSLog(@"count %d",CommentList.count);

        }
       
    }
    else
    {
        [self.WebService CallServiceGetInvestigationComments:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/GetInvestigationComments" Object:NULL Handler:NULL];
    
        NSLog(@"comment %@",self.WebService->ptr1);
    
      CommentList=(NSMutableArray*)self.WebService->ptr1;
//   NSMutableArray *Comment_arr=[[NSMutableArray alloc]init];
   
       if(CommentList.count>0)
       {
       view1.hidden=YES;
    
       data1=[[NSMutableArray alloc]init];
       
       for(int i=0;i<CommentList.count;i++)
       {
           [data1 addObject:[[CommentList objectAtIndex:i]valueForKey:@"Name"]];
           
       }
           DemoTable1Controller  *contentViewController = [[DemoTable1Controller alloc]initWithStyle:UITableViewStylePlain];
           //self.popoverController = [[WEPopoverController alloc] initWithContentViewController:contentViewController];
           
           popover=[[FPPopoverController alloc]initWithViewController:contentViewController];
           popover.contentSize=CGSizeMake(200, 200);
           contentViewController.qvc=self;
           contentViewController.Flag=1;
           // self.contentSizeForViewInPopover = CGSizeMake(200, 200);
           // data1=[[NSMutableArray alloc]initWithObjects:@"rahul",@"sharma",nil];
           NSLog(@"data %@",data1);
           popover.border=YES;
           popover.arrowDirection=FPPopoverArrowDirectionRight;
           popover.tint=FPPopoverBlackTint;
           
           contentViewController.category=(NSMutableArray*)data1;
           [popover presentPopoverFromView:sender];
           
           NSLog(@"count %d",CommentList.count);
     }
       
    }
          
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
   // [listTestVal addObject:resultval.text];
    
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)aTextField
{
    return  YES;
}

-(void)saveresultvalue:(UITextField *)TxtResult
{
    NSLog(@"txt %d",TxtResult.tag);
    NSIndexPath *indexPath2 = [Table_worklist indexPathForCell:(UITableViewCell*)[[TxtResult superview]superview]];
    NSLog(@"indexpath 2 %@",indexPath2);
    _section=indexPath2.section;
    NSLog(@"ind  %d",_section);

    NSIndexPath *indexPath1 = [NSIndexPath indexPathForRow:TxtResult.tag-100 inSection:_section];
    UITableViewCell *cell = (UITableViewCell *)[Table_worklist cellForRowAtIndexPath:indexPath1];
    UITextField *txt=(UITextField*)[cell viewWithTag:TxtResult.tag];
    NSLog(@"ind  txt %@ , %d",txt,txt.tag);
    
    
   ////////////
     [listTestVal replaceObjectAtIndex:indexPath1.row withObject:txt.text];
   /////////////
    
    
    
    UILabel *lbl=(UILabel*)[cell viewWithTag:3];
    NSLog(@"lbl %@",lbl);
    float x=[txt.text floatValue];
    NSCharacterSet  *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"-"];
    NSString *Criticallow=[NSString stringWithFormat:@"%@",[[TestSample objectAtIndex:indexPath1.row]objectForKey:@"CriticalLow"]];
          Criticallow = [[Criticallow componentsSeparatedByCharactersInSet:doNotWant]componentsJoinedByString:@""];
  
    NSString *CriticalHigh=[NSString stringWithFormat:@"%@",[[TestSample objectAtIndex:indexPath1.row]objectForKey:@"CriticalHigh"]];
   
    CriticalHigh = [[CriticalHigh componentsSeparatedByCharactersInSet:doNotWant]componentsJoinedByString:@""];

    
    NSString *Rangefrom=[NSString stringWithFormat:@"%@",[[TestSample objectAtIndex:indexPath1.row]objectForKey:@"RangeFrom"]];
   
    Rangefrom = [[Rangefrom componentsSeparatedByCharactersInSet:doNotWant]componentsJoinedByString:@""];
    NSString *rangeto=[NSString stringWithFormat:@"%@",[[TestSample objectAtIndex:indexPath1.row]objectForKey:@"RangeTo"]];
    rangeto = [[rangeto componentsSeparatedByCharactersInSet:doNotWant]componentsJoinedByString:@""];
    if(x<[Criticallow floatValue]||x>[CriticalHigh floatValue])
    {
       txt.backgroundColor=[UIColor colorWithRed:255/256. green:0/256. blue:0/256. alpha:1];
    }
    else if ((x>=[Criticallow floatValue] && x<[Rangefrom floatValue])||(x>[rangeto floatValue]&& x<=[CriticalHigh floatValue]))
    {
       txt.backgroundColor=[UIColor colorWithRed:255/256. green:169/256. blue:64/256. alpha:1];
        
    }
    else
    {
        txt.backgroundColor=[UIColor whiteColor];
    }
//    [listTestVal addObject:resultval.text];
//    NSLog(@"result %@",listTestVal);
    
}

-(void)allbtn:(id)reconizer
{
    UIButton *btn = (UIButton *)reconizer;
    NSLog(@"btn %d",btn.tag);
    switch (btn.tag)
    {
        case 1:
        {
            NSLog(@"list %@",listTestVal);
            NSString *str=[NSString stringWithFormat:@"%@",[[listTestVal objectAtIndex:0] valueForKey:@"text"]];
            NSLog(@"val is %@",str);
            
            for(int i=0;i<TestSample.count;i++)
            {
                NSString *result_value=[NSString stringWithFormat:@"%@",[[listTestVal objectAtIndex:i]valueForKey:@"text"]];
                NSLog(@"val is %@",result_value);
                self.WebService->test_id=[NSString stringWithFormat:@"%@",[[TestSample objectAtIndex:i]valueForKey:@"TestId"]];
                self.WebService->investigation_id=[NSString stringWithFormat:@"%@",[[TestSample objectAtIndex:i]valueForKey:@"InvestigationId"]];
                
                if(![[listTestVal objectAtIndex:i]valueForKey:@"text"]||[[NSString stringWithFormat:@"%@",[[listTestVal objectAtIndex:i]valueForKey:@"text"]]isEqualToString:@""])
                {
                    self.WebService->resultval=(NSString*)[NSNull null];
                }
                else
                {
                    self.WebService->resultval=[NSString stringWithFormat:@"%@",result_value];
                }
                NSLog(@"result %@",self.WebService->resultval);
                
                self.WebService->remark=(NSString*)[NSNull null];
                [self.WebService CallServiceInsertInvestigationResult:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/InsertInvestigationResult" Object:NULL Handler:NULL];
            }
            if([self.WebService.ptr isEqualToString:@"<null>"])
            {
                alert = [[UIAlertView alloc] initWithTitle:@"TEST" message:@"Save And Complete" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                [alert show];
            }
            else
            {
                alert = [[UIAlertView alloc] initWithTitle:@"TEST" message:@"Not Save And Complete" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                [alert show];
                
            }

            break;
        }
        case 2:
        {
            NSArray *array = [self.navigationController viewControllers];
            NSLog(@"arr %@",array);
            NSLog(@"arr %d",array.count);
            // [self.navigationController pushViewController:WorkListDetail animated:YES];
            [self.navigationController popToViewController:[array objectAtIndex:3] animated:YES];
            break;
        }
        case 3:
        {
            view1.hidden=NO;
            view2.hidden=YES;
            NSString *html = [webView stringByEvaluatingJavaScriptFromString:@"CKEDITOR.instances.editor1.getData()"];
            NSLog(@"val is %@",html);
            NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"\n\t"];
            html= [[html componentsSeparatedByCharactersInSet:doNotWant]componentsJoinedByString:@""];
            NSLog(@"%@", html); // => foobarbazfoo
            NSIndexPath *indexPath1 = [NSIndexPath indexPathForRow:_row-200 inSection:_section];
            UITableViewCell *cell = (UITableViewCell *)[Table_worklist cellForRowAtIndexPath:indexPath1];
            UITextField *txt=(UITextField*)[cell viewWithTag:indexPath1.row+100];
            NSLog(@"txt %@  %d",txt,txt.tag);
            
            
            txt.text=[NSString stringWithFormat:@"%@",html];
            NSLog(@"txt %@",txt.text);
            
            
            
          //  for (int i=0; i<listTestVal.count; i++)
            {
                
//                if () {
//                    <#statements#>
//                }
//                
//                
//                NSMutableDictionary* entry = [Labeltxt objectAtIndex:i];
//                NSLog(@"entry %@",entry);
//                // NSString *str=[entry valueForKey:@"value"];
//                
//                [entry setValue:txt.text forKey:@"value"];
//                // NSLog(@" la  bel %@",sltr);
//                NSLog(@"entry %@",entry);
//                [listTestVal replaceObjectAtIndex:indexPath1.row withObject:html];
//                NSLog(@" label %@",Labeltxt);

                
                
            }
            
            
            break;
        }
        case 4:
        {
            view1.hidden=NO;
            view2.hidden=YES;
            break;
        }
            
        case 5:
        {
            NSLog(@"list %@",listTestVal);
       //     NSString *str=[NSString stringWithFormat:@"%@",[[listTestVal objectAtIndex:0] valueForKey:@"text"]];
          //  NSLog(@"val is %@",str);
            
            for(int i=0;i<TestSample.count;i++)
            {
                NSString *result_value=[NSString stringWithFormat:@"%@",[listTestVal objectAtIndex:i]];
                NSLog(@"val is %@",result_value);
              
                self.WebService->test_id=[NSString stringWithFormat:@"%@",[[TestSample objectAtIndex:i]valueForKey:@"TestId"]];
                self.WebService->investigation_id=[NSString stringWithFormat:@"%@",[[TestSample objectAtIndex:i]valueForKey:@"InvestigationId"]];
                
                self.WebService->resultval=[NSString stringWithFormat:@"%@",[listTestVal objectAtIndex:i]];

                
//                if(![[listTestVal objectAtIndex:i]valueForKey:@"text"]||[[NSString stringWithFormat:@"%@",[[listTestVal objectAtIndex:i]valueForKey:@"text"]]isEqualToString:@""])
//                {
//                    self.WebService->resultval=(NSString*)[NSNull null];
//                }
//                else
//                {
//                    self.WebService->resultval=[NSString stringWithFormat:@"%@",result_value];
//                }
//                NSLog(@"result %@",self.WebService->resultval);
//                 
                self.WebService->remark=(NSString*)[NSNull null];
                [self.WebService CallServiceInsertInvestigationResult:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/InsertInvestigationResultWithoutCompleted" Object:NULL Handler:NULL];
            }
            if([self.WebService.ptr isEqualToString:@"<null>"])
            {
                NSArray *array = [self.navigationController viewControllers];
                NSLog(@"arr %@",array);
                NSLog(@"arr %d",array.count);
                // [self.navigationController pushViewController:WorkListDetail animated:YES];
                [self.navigationController popToViewController:[array objectAtIndex:3] animated:YES];
            }
            break;
        }
          default:
            break;
    }
}

-(void)CallServiceDetail:(NSString *)Str
{
    
    string=[NSString stringWithFormat:@"%@",[[Dictionay_Worklist objectAtIndex:0]valueForKey:Str]];
    NSLog(@"%@", string);
    
}
-(void)CallServiceTestDetail:(NSString *)Str
{

    string=[NSString stringWithFormat:@"%@",[[TestSample objectAtIndex:0]valueForKey:Str]];
    NSLog(@"%@", string);
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
