//
//  InvestigationWorkListViewController.m
//  HISWebService
//
//  Created by Rahul Sharma on 16/07/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import "InvestigationWorkListViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "InvestigationWorkListDetailsViewController.h"
#import "WorklistDetailViewController.h"
#import "Shared.h"
#import "WTStatusBar.h"
@interface InvestigationWorkListViewController ()

@end

@implementation InvestigationWorkListViewController
@synthesize WebService=_WebService,SearchText;
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
    date_flag=0;
    Clender_flag=0;
    orderby=@"0";
    orderdirection=@"1";
    SearchPatient=@"";
    //FromDate.hidden=YES;
    //ToDate.hidden=YES;
   // Clender.hidden=YES;
    select=TRUE;
    [self.view addSubview:tool];
    tool.hidden=YES;
    self.WebService=[[WebService alloc]init];
    NSDate *currentDate = [NSDate date];
    NSCalendar* calendar = [NSCalendar currentCalendar];
    components1 = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:currentDate]; // Get necessary date components
    
    [components1 month]; //gives you month
    day=[components1 day] ;//gives you day
    [components1 year] ;//gives you year
    start=[NSString stringWithFormat:@"12:00 AM"];
    End=[NSString stringWithFormat:@"11:59 PM"];
    
    FromDate.text=[NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%d/%d/%d %@",[components1 month],[components1 day],[components1 year],start]];
    ToDate.text=[NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%d/%d/%d %@",[components1 month],[components1 day],[components1 year],End]];
    TodayDate=ToDate.text;
    
    
    [scrollview setScrollEnabled:YES];
    [scrollview setContentSize:CGSizeMake(320,600)];
    
    UIBarButtonItem *Setting=[[UIBarButtonItem alloc]initWithTitle:@"Setting" style:UIBarButtonItemStyleBordered target:self action:@selector(WorklistSetting)];
    
    
    self.navigationItem.rightBarButtonItem=Setting;
    
      
    
    
    /* view1=[[UIView alloc]initWithFrame:CGRectMake(0,0,320,60)];
     view1.backgroundColor=[UIColor whiteColor];
     [view1 setIsAccessibilityElement:YES];
     view1.userInteractionEnabled=YES;
     view1.autoresizingMask = UIViewAutoresizingFlexibleWidth ;
     
     view1.layer.borderColor = [UIColor grayColor].CGColor;
     view1.layer.borderWidth = 2.0f;
     [self.view addSubview:view1];
     
     scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0,60,320,540)];
     
     scrollview.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
     scrollview.autoresizesSubviews = YES;
     
     scrollview.scrollEnabled = YES;
     scrollview.delegate = self;
     scrollview.directionalLockEnabled = YES;
     
     scrollview.showsVerticalScrollIndicator = YES;
     
     scrollview.showsHorizontalScrollIndicator = YES;
     
     scrollview.autoresizesSubviews = YES;
     scrollview.backgroundColor=[UIColor whiteColor];
     [self.view addSubview:scrollview];
     
     patientname=[[UITextField alloc]initWithFrame:CGRectMake(130,10,170,40)];
     patientname.font = [UIFont boldSystemFontOfSize:15.0];
     //the horizontal alignment of the text
     patientname.textAlignment = NSTextAlignmentLeft;
     patientname.borderStyle = UITextBorderStyleBezel;
     patientname.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
     patientname.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
     patientname.delegate =self;
     [view1 addSubview:patientname];
     [patientname addTarget:self action:@selector(SearchPatients:)forControlEvents:UIControlEventEditingChanged];
     
     //    UIButton *Current=[[UIButton alloc]initWithFrame:CGRectMake(10, 10, 100, 30)];
     //    Current.backgroundColor=[UIColor colorWithRed:36/256. green:107/256. blue:215/256. alpha:1];
     //    [Current addTarget:self action:@selector(<#selector#>) forControlEvents:UIControlStateNormal];*/
    
    //    NSDate *date = [NSDate date];
    //    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //    [formatter setDateFormat:@"MM/dd/yyyy"];
    //    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    // TodayDate = [NSString stringWithFormat:@"%d/%d/%d",[components1 month],[components1 day],[components1 year]];
    
    NSLog(@"date %@",TodayDate);
    
    NSDictionary *_search=[[NSDictionary alloc]initWithObjectsAndKeys:@"",@"str",@"",@"mode",@"",@"branchs",@"1",@"fromCount",@"100", @"toCount",@"0", @"testStatus",@"0", @"due",@"0",@"reportChecked",@"0",@"printed",@"0", @"delivered",@"0",@"sample",@"0",@"cancelled",@"false",@"urgent",[NSString stringWithFormat:@"%@",FromDate.text],@"fromDate",[NSString stringWithFormat:@"%@",ToDate.text],@"toDate",@"0",@"orderBy",@"1",@"orderDirection",@"0",@"delivery",@"",@"barCode", nil];
    
    self.WebService->Get_AdviseInvestigation=(NSMutableDictionary*)_search;
    
    [self.WebService CallServiceShowPatientListforWorkList:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/Worklist" Object:NULL Handler:NULL];
    
    NSLog(@"work list %@",self.WebService->data1);
    
    WorkList=(NSArray*)[[self.WebService->data1 valueForKey:@"data"]valueForKey:@"Table"];
    
    NSLog(@"worklist is %@",WorkList);
    
    /* UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(10,100,820,50)];
     lable.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
     lable.font = [UIFont systemFontOfSize:10.0];
     // lable.backgroundColor=[UIColor grayColor];
     lable.backgroundColor=[UIColor colorWithRed:245/256. green:245/256. blue:245/256. alpha:1];
     // [lable setText:[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:i]valueForKey:@"Description"]]] ;
     NSLog(@"date is %@",lable);
     [scrollview addSubview:lable];
     
     UIButton *serialno=[[UIButton alloc]initWithFrame:CGRectMake(15,110,50,30)];
     // serialno.frame = CGRectMake(10,110,100,30);
     
     serialno.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
     [serialno setTitle:@"Serial No" forState:UIControlStateNormal];
     
     serialno.backgroundColor=[UIColor colorWithRed:200/256. green:200/256. blue:200/256. alpha:1];
     [serialno setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     serialno.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
     [scrollview addSubview:serialno];
     
     UIButton *PatientName=[[UIButton alloc]initWithFrame:CGRectMake(75,110,110,30)];
     // serialno.frame = CGRectMake(10,110,100,30);
     PatientName.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
     PatientName.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
     [PatientName setTitle:@"Patient Name" forState:UIControlStateNormal];
     
     PatientName.backgroundColor=[UIColor colorWithRed:200/256. green:200/256. blue:200/256. alpha:1];
     [PatientName setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     [scrollview addSubview:PatientName];
     
     UIButton *AdviseDate=[[UIButton alloc]initWithFrame:CGRectMake(195,110,80,30)];
     // serialno.frame = CGRectMake(10,110,100,30);
     AdviseDate.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
     AdviseDate.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
     [AdviseDate setTitle:@"Advise Date" forState:UIControlStateNormal];
     [AdviseDate setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     AdviseDate.backgroundColor=[UIColor colorWithRed:200/256. green:200/256. blue:200/256. alpha:1];
     [scrollview addSubview:AdviseDate];
     
     UIButton *RefferedBy=[[UIButton alloc]initWithFrame:CGRectMake(285,110,80,30)];
     // serialno.frame = CGRectMake(10,110,100,30);
     RefferedBy.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
     RefferedBy.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
     [RefferedBy setTitle:@"Refered By" forState:UIControlStateNormal];
     [RefferedBy setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     RefferedBy.backgroundColor=[UIColor colorWithRed:200/256. green:200/256. blue:200/256. alpha:1];
     [scrollview addSubview:RefferedBy];
     
     UIButton *Exc=[[UIButton alloc]initWithFrame:CGRectMake(375,110,40,30)];
     // serialno.frame = CGRectMake(10,110,100,30);
     Exc.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
     Exc.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
     [Exc setTitle:@"!" forState:UIControlStateNormal];
     [Exc setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     Exc.backgroundColor=[UIColor colorWithRed:200/256. green:200/256. blue:200/256. alpha:1];
     [scrollview addSubview:Exc];
     
     UIButton *S=[[UIButton alloc]initWithFrame:CGRectMake(425,110,40,30)];
     // serialno.frame = CGRectMake(10,110,100,30);
     S.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
     S.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
     [S setTitle:@"S" forState:UIControlStateNormal];
     [S setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     S.backgroundColor=[UIColor colorWithRed:200/256. green:200/256. blue:200/256. alpha:1];
     [scrollview addSubview:S];
     
     UIButton *Total=[[UIButton alloc]initWithFrame:CGRectMake(475,110,60,30)];
     // serialno.frame = CGRectMake(10,110,100,30);
     Total.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
     Total.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
     [Total setTitle:@"Total" forState:UIControlStateNormal];
     [Total setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     Total.backgroundColor=[UIColor colorWithRed:200/256. green:200/256. blue:200/256. alpha:1];
     [scrollview addSubview:Total];
     
     UIButton *dis=[[UIButton alloc]initWithFrame:CGRectMake(545,110,60,30)];
     // serialno.frame = CGRectMake(10,110,100,30);
     dis.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
     dis.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
     [dis setTitle:@"Dis" forState:UIControlStateNormal];
     [dis setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     dis.backgroundColor=[UIColor colorWithRed:200/256. green:200/256. blue:200/256. alpha:1];
     [scrollview addSubview:dis];
     
     UIButton *net=[[UIButton alloc]initWithFrame:CGRectMake(615,110,60,30)];
     // serialno.frame = CGRectMake(10,110,100,30);
     net.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
     net.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
     [net setTitle:@"Net" forState:UIControlStateNormal];
     [net setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     net.backgroundColor=[UIColor colorWithRed:200/256. green:200/256. blue:200/256. alpha:1];
     [scrollview addSubview:net];
     
     UIButton *Bal=[[UIButton alloc]initWithFrame:CGRectMake(685,110,60,30)];
     // serialno.frame = CGRectMake(10,110,100,30);
     Bal.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
     Bal.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
     [Bal setTitle:@"Bal" forState:UIControlStateNormal];
     [Bal setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     Bal.backgroundColor=[UIColor colorWithRed:200/256. green:200/256. blue:200/256. alpha:1];
     [scrollview addSubview:Bal];
     
     UIButton *Refund=[[UIButton alloc]initWithFrame:CGRectMake(755,110,60,30)];
     // serialno.frame = CGRectMake(10,110,100,30);
     Refund.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
     Refund.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
     [Refund setTitle:@"Refund" forState:UIControlStateNormal];
     [Refund setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     
     Refund.backgroundColor=[UIColor colorWithRed:200/256. green:200/256. blue:200/256. alpha:1];
     [scrollview addSubview:Refund];
     
     Table_WorkList=[[UITableView alloc]initWithFrame:CGRectMake(10,150,820,300)style:UITableViewStylePlain];
     Table_WorkList.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin |UIViewAutoresizingFlexibleRightMargin;
     Table_WorkList.delegate=self;
     Table_WorkList.dataSource=self;
     Table_WorkList.layer.borderWidth = 2.0;
     Table_WorkList.layer.borderColor = [UIColor grayColor].CGColor;
     [scrollview addSubview:Table_WorkList];*/
   // Table_WorkList.layer.borderWidth = 2.0;
   // Table_WorkList.layer.borderColor = [UIColor grayColor].CGColor;
    //count=1;
    
    Shared *shared=[Shared sharedUser];
    shared.testValue=NULL;
    
    NSLog(@"test %@", shared.testValue);
    

    
    //[Table_WorkList reloadData];
    

    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
     [super viewWillAppear:animated];
    
    Shared *shared=[Shared sharedUser];
    
    NSLog(@"test %@", shared.testValue);
    NSLog(@"test %@", shared.DueValue);
    if(shared.testValue!=NULL && shared.checkback==1)
    {
        shared.row=4;
        NSDictionary *_search=[[NSDictionary alloc]initWithObjectsAndKeys:SearchPatient,@"str",@"",@"mode",shared.branches,@"branchs",@"1",@"fromCount",@"100", @"toCount",shared.testValue, @"testStatus",shared.DueValue, @"due",shared.Checkalue,@"reportChecked",shared.PrintValue,@"printed",shared.DeliverdValue, @"delivered",shared.SimpleValue,@"sample",shared.CancelledValue,@"cancelled",@"false",@"urgent",[NSString stringWithFormat:@"%@",FromDate.text],@"fromDate",[NSString stringWithFormat:@"%@",ToDate.text],@"toDate",orderby,@"orderBy",orderdirection,@"orderDirection",shared.DeliveryValue,@"delivery",@"",@"barCode", nil];
        
        self.WebService->Get_AdviseInvestigation=(NSMutableDictionary*)_search;
        
        [self.WebService CallServiceShowPatientListforWorkList:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/Worklist" Object:NULL Handler:NULL];
        
        NSLog(@"work list %@",self.WebService->data1);
        
        WorkList=(NSArray*)[[self.WebService->data1 valueForKey:@"data"]valueForKey:@"Table"];
        
        NSLog(@"worklist is %@",WorkList);
        //        smallArray1 = [[NSMutableArray alloc] init];
        //        [self prepareArraysForTableView:1];
        [self select];
        shared.checkback=0;
       // [Table_WorkList reloadData];
        
    }
    else
    {
        shared.testValue=@"0";
        shared.DueValue=@"0";
        shared.DeliveryValue=@"0";
        shared.DeliverdValue=@"0";
        shared.Checkalue=@"0";
        shared.CancelledValue=@"0";
        shared.SimpleValue=@"0";
        shared.branches=@"";
        shared.PrintValue=@"0";
        shared.row=4;
        [self select];
        
    }
    //[Table_WorkList reloadData];

    
}
-(void)select
{
    NSUInteger rows = 0;
    NSMutableArray *tempArray = [NSMutableArray array];
    while (rows<WorkList.count) {
        NSLog(@" row %d and count %d",rows,WorkList.count);
        NSLog(@" work %@",[WorkList objectAtIndex:rows]);
        [tempArray addObject:[WorkList objectAtIndex:rows]];
        NSLog(@" work %@",[WorkList objectAtIndex:rows]);
        rows++;
    }
    NSLog(@"tempArray %@",tempArray);
    self.mainArray = [NSArray arrayWithArray:tempArray];
    NSLog(@"subarry %@",self.mainArray);
    _pageNumber = 0;
    _numberOfVisibleRows = 10;
    _maxPageNumber = [self.mainArray count]/_numberOfVisibleRows;
    NSLog(@"_maxPageNumber %d",_maxPageNumber);
    left.enabled=NO;
    if(_pageNumber==_maxPageNumber)
    {
        next.enabled=NO;
    }
    else
    {
        next.enabled=YES;
    }
    self.subArray = [self subArrayForPageNumber:_pageNumber];
    NSLog(@"subarry %@",self.subArray);
    [Table_WorkList reloadData];
    
}
-(void)WorklistSetting
{
    WorklistDetailViewController *WDVC=[[WorklistDetailViewController alloc]init];
    [self.navigationController pushViewController:WDVC animated:YES];
    
}
-(IBAction)SearchPatients:(id)sender
{
    
    NSLog(@"patname %@",SearchText.text);
    SearchPatient=SearchText.text;
    
      
    //Count=@"0";
    //   [patientname resignFirstResponder];
    NSLog(@"patname %@",self.WebService->patientname=[NSString stringWithFormat:@"%@",SearchText.text]);
    // NSLog(@"count %@",self.WebService->count=Count);
    Shared *shared=[Shared sharedUser];
    
    NSDictionary *_search=[[NSDictionary alloc]initWithObjectsAndKeys:SearchPatient,@"str",@"",@"mode",shared.branches,@"branchs",@"1",@"fromCount",@"100", @"toCount",shared.testValue, @"testStatus",shared.DueValue, @"due",shared.Checkalue,@"reportChecked",shared.PrintValue,@"printed",shared.DeliverdValue, @"delivered",shared.SimpleValue,@"sample",shared.CancelledValue,@"cancelled",@"false",@"urgent",[NSString stringWithFormat:@"%@",FromDate.text],@"fromDate",[NSString stringWithFormat:@"%@",ToDate.text],@"toDate",orderby,@"orderBy",orderdirection,@"orderDirection",shared.DeliveryValue,@"delivery",@"",@"barCode", nil];
    
    self.WebService->Get_AdviseInvestigation=(NSMutableDictionary*)_search;
    
    [self.WebService CallServiceShowPatientListforWorkList:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/Worklist" Object:NULL Handler:NULL];
    
    NSLog(@"work list %@",self.WebService->data1);
    
    WorkList=(NSArray*)[[self.WebService->data1 valueForKey:@"data"]valueForKey:@"Table"];
    
    NSLog(@"worklist is %@",WorkList);
    [self select];
    
 //   [Table_WorkList reloadData];
    
}
-(IBAction)SelectButtonsort:(id)sender
{
    

    UIButton *btn=(UIButton*)sender;
    Shared *shared=[Shared sharedUser];
    shared.row=4;
    
    
    orderby=[NSString stringWithFormat:@"%d",btn.tag];
    
    
    switch (btn.tag)
    {
        case 0:
        {
            if([orderdirection isEqualToString:@"1"])
            {
                //btn.selected=NO;
                
                orderdirection=@"0";
                
            }
            else
            {
              //  btn.selected=YES;
                orderdirection=@"1";
               
            }
            
            NSDictionary *_search=[[NSDictionary alloc]initWithObjectsAndKeys:SearchPatient,@"str",@"",@"mode",shared.branches,@"branchs",@"1",@"fromCount",@"100", @"toCount",shared.testValue, @"testStatus",shared.DueValue, @"due",shared.Checkalue,@"reportChecked",shared.PrintValue,@"printed",shared.DeliverdValue, @"delivered",shared.SimpleValue,@"sample",shared.CancelledValue,@"cancelled",@"false",@"urgent",[NSString stringWithFormat:@"%@",FromDate.text],@"fromDate",[NSString stringWithFormat:@"%@",ToDate.text],@"toDate",orderby,@"orderBy",orderdirection,@"orderDirection",shared.DeliveryValue,@"delivery",@"",@"barCode", nil];
            
            self.WebService->Get_AdviseInvestigation=(NSMutableDictionary*)_search;
            
            [self.WebService CallServiceShowPatientListforWorkList:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/Worklist" Object:NULL Handler:NULL];
            
            NSLog(@"work list %@",self.WebService->data1);
            
            WorkList=(NSArray*)[[self.WebService->data1 valueForKey:@"data"]valueForKey:@"Table"];
            
            NSLog(@"worklist is %@",WorkList);
            
            //[Table_WorkList reloadData];

        
            break;
        }
        case 1:
        {
            if([orderdirection isEqualToString:@"1"])
            {
                //btn.selected=NO;
                
                orderdirection=@"0";
                
            }
            else
            {
                //  btn.selected=YES;
                orderdirection=@"1";
                
            }

            NSDictionary *_search=[[NSDictionary alloc]initWithObjectsAndKeys:SearchPatient,@"str",@"",@"mode",shared.branches,@"branchs",@"1",@"fromCount",@"100", @"toCount",shared.testValue, @"testStatus",shared.DueValue, @"due",shared.Checkalue,@"reportChecked",shared.PrintValue,@"printed",shared.DeliverdValue, @"delivered",shared.SimpleValue,@"sample",shared.CancelledValue,@"cancelled",@"false",@"urgent",[NSString stringWithFormat:@"%@",FromDate.text],@"fromDate",[NSString stringWithFormat:@"%@",ToDate.text],@"toDate",orderby,@"orderBy",orderdirection,@"orderDirection",shared.DeliveryValue,@"delivery",@"",@"barCode", nil];
            
            self.WebService->Get_AdviseInvestigation=(NSMutableDictionary*)_search;
            
            [self.WebService CallServiceShowPatientListforWorkList:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/Worklist" Object:NULL Handler:NULL];
            
            NSLog(@"work list %@",self.WebService->data1);
            
            WorkList=(NSArray*)[[self.WebService->data1 valueForKey:@"data"]valueForKey:@"Table"];
            
            NSLog(@"worklist is %@",WorkList);
            [Table_WorkList reloadData];
            

            break;
        }

        case 2:
        {
            if([orderdirection isEqualToString:@"1"])
            {
                //btn.selected=NO;
                
                orderdirection=@"0";
                
            }
            else
            {
                //  btn.selected=YES;
                orderdirection=@"1";
                
            }

            NSDictionary *_search=[[NSDictionary alloc]initWithObjectsAndKeys:SearchPatient,@"str",@"",@"mode",shared.branches,@"branchs",@"1",@"fromCount",@"100", @"toCount",shared.testValue, @"testStatus",shared.DueValue, @"due",shared.Checkalue,@"reportChecked",shared.PrintValue,@"printed",shared.DeliverdValue, @"delivered",shared.SimpleValue,@"sample",shared.CancelledValue,@"cancelled",@"false",@"urgent",[NSString stringWithFormat:@"%@",FromDate.text],@"fromDate",[NSString stringWithFormat:@"%@",ToDate.text],@"toDate",orderby,@"orderBy",orderdirection,@"orderDirection",shared.DeliveryValue,@"delivery",@"",@"barCode", nil];
            
            self.WebService->Get_AdviseInvestigation=(NSMutableDictionary*)_search;
            
            [self.WebService CallServiceShowPatientListforWorkList:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/Worklist" Object:NULL Handler:NULL];
            
            NSLog(@"work list %@",self.WebService->data1);
            
            WorkList=(NSArray*)[[self.WebService->data1 valueForKey:@"data"]valueForKey:@"Table"];
            
            NSLog(@"worklist is %@",WorkList);
            [Table_WorkList reloadData];
            

            
            break;
        }

            
        default:
            break;
            
    }
    [self select];

    
}
-(IBAction)SelectButton:(id)sender
{
    Shared *shared=[Shared sharedUser];
     shared.row=0;
    
    switch (((UIButton *)sender).tag)
    {
        case 1:
        {
           shared.row=4;
            //            NSLog(@"count %d",count);
            //
            //              day=[components1 day]-count;
            //             NSLog(@"day %d",day);
            //
            // NSString *Todaydate=[NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%d/%d/%d %@",[components1 month],[components1 day]-count+1,[components1 year],End]];
            //            NSLog(@"There are %d days in between the two dates. and month %d and year %d", [components1 day], [components1 month],[components1 year]);
            //
            //            NSString *date=[NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%d/%d/%d %@",[components1 month],[components1 day]-count,[components1 year],start]];
            //
            //            NSLog(@"date %@",date);
            //
            //            NSLog(@"date %@",TodayDate);
            
            NSLog(@"from %@",FromDate.text);
            NSString *FromTime=FromDate.text;
            NSLog(@"from %@",ToDate.text);
            
            NSDateFormatter *anotherDateFormatter = [[NSDateFormatter alloc] init];
            [anotherDateFormatter setAMSymbol:@"AM"];
            [anotherDateFormatter setPMSymbol:@"PM"];
            //[anotherDateFormatter setDateFormat:@"dd-MM-yyyy hh:mm:ss a"];
            
            [anotherDateFormatter setDateFormat:@"MM/dd/yyyy HH:mm a"];
            
            //  NSDate *d=[[NSDate alloc]init];
            
            NSDate *d =[anotherDateFormatter dateFromString:FromDate.text];
            
            NSDateFormatter  *anotherDateFormatter1 = [[NSDateFormatter alloc] init];
            [anotherDateFormatter1 setDateFormat:@"MM/dd/yyyy HH:mm:ss"];
            NSLog(@"%@", [anotherDateFormatter1 stringFromDate:d]);
            
            
            NSLog(@"date %@ and %@",FromDate.text,d);
            
            NSCalendar *calendar = [NSCalendar currentCalendar];
            NSDateComponents *comps = [NSDateComponents new];
            //comps.month = -1;
            comps.day= -1;
            // comps.year=-1;
            NSDate *date1 = [calendar dateByAddingComponents:comps toDate:d options:0];
            
            NSLog(@"date %@",date1);
            
            NSDateComponents *components = [calendar components:NSMonthCalendarUnit|NSDayCalendarUnit|NSYearCalendarUnit fromDate:date1]; // Get necessary date components
            NSLog(@"Previous month: %d",[components month]);
            NSLog(@"Previous day  : %d",[components day]);
            NSLog(@"Previous day  : %d",[components year]);
            
            NSString *date=[NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%d/%d/%d %@",[components month],[components day],[components year],start]];
            NSLog(@"date %@",date);
            
            FromDate.text=[NSString stringWithFormat:@"%@",date];
            
            if (date_flag==1)
            {
                
                NSString *Todate=[self Next:nil];
                
                NSLog(@"todate %@",Todate);
                
                ToDate.text=[NSString stringWithFormat:@"%@",Todate];
            }
            else if(Clender_flag==1)
            {
                ToDate.text=FromTime;
            }
            else
            {
                
                ToDate.text=[NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%d/%d/%d %@",[components1 month],[components1 day],[components1 year],start]];
            }
            NSLog(@"date %@",[NSString stringWithFormat:@"%@",  ToDate.text]);
            
           
            
            NSDictionary *_search=[[NSDictionary alloc]initWithObjectsAndKeys:SearchPatient,@"str",@"",@"mode",shared.branches,@"branchs",@"1",@"fromCount",@"100", @"toCount",shared.testValue, @"testStatus",shared.DueValue, @"due",shared.Checkalue,@"reportChecked",shared.PrintValue,@"printed",shared.DeliverdValue, @"delivered",shared.SimpleValue,@"sample",shared.CancelledValue,@"cancelled",@"false",@"urgent",[NSString stringWithFormat:@"%@",FromDate.text],@"fromDate",[NSString stringWithFormat:@"%@",ToDate.text],@"toDate",orderby,@"orderBy",orderdirection,@"orderDirection",shared.DeliveryValue,@"delivery",@"",@"barCode", nil];
            
            self.WebService->Get_AdviseInvestigation=(NSMutableDictionary*)_search;
            
            [self.WebService CallServiceShowPatientListforWorkList:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/Worklist" Object:NULL Handler:NULL];
            
            NSLog(@"work list %@",self.WebService->data1);
            
            WorkList=(NSArray*)[[self.WebService->data1 valueForKey:@"data"]valueForKey:@"Table"];
            
            NSLog(@"worklist is %@",WorkList);
            [Table_WorkList reloadData];
            
            
            date_flag=1;
            
            break;
        }
        case 2:
        {
           shared.row=4;
            date_flag=0;
            FromDate.text=[NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%d/%d/%d %@",[components1 month],[components1 day],[components1 year],start]];
            
            NSLog(@"date %@",TodayDate);
            //    FromDate.text=TodayDate;
            ToDate.text=TodayDate;
            NSDictionary *_search=[[NSDictionary alloc]initWithObjectsAndKeys:SearchPatient,@"str",@"",@"mode",shared.branches,@"branchs",@"1",@"fromCount",@"100", @"toCount",shared.testValue, @"testStatus",shared.DueValue, @"due",shared.Checkalue,@"reportChecked",shared.PrintValue,@"printed",shared.DeliverdValue, @"delivered",shared.SimpleValue,@"sample",shared.CancelledValue,@"cancelled",@"false",@"urgent",[NSString stringWithFormat:@"%@",FromDate.text],@"fromDate",[NSString stringWithFormat:@"%@",ToDate.text],@"toDate",orderby,@"orderBy",orderdirection,@"orderDirection",shared.DeliveryValue,@"delivery",@"",@"barCode", nil];
            
            self.WebService->Get_AdviseInvestigation=(NSMutableDictionary*)_search;
            
            [self.WebService CallServiceShowPatientListforWorkList:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/Worklist" Object:NULL Handler:NULL];
            
            NSLog(@"work list %@",self.WebService->data1);
            
            WorkList=(NSArray*)[[self.WebService->data1 valueForKey:@"data"]valueForKey:@"Table"];
            
            NSLog(@"worklist is %@",WorkList);
            [Table_WorkList reloadData];
            break;
        }
        case 3:
        {
           shared.row=4;
            //count=count-1;
            
            // NSLog(@"count %d",count);
            //
            //            NSString *Todaydate=[NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%d/%d/%d %@",[components1 month],day+2,[components1 year],End]];
            //            NSLog(@"today date %@",Todaydate);
            //
            //
            //            NSString *date=[NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%d/%d/%d %@",[components1 month],day+1,[components1 year],start]];
            //
            //            NSLog(@"date %@",date);
            //
            //            NSLog(@"date %@",TodayDate);
            //            FromDate.text=[NSString stringWithFormat:@"%@",date];
            //            ToDate.text=[NSString stringWithFormat:@"%@",Todaydate];
            
            NSLog(@"the date %@",[NSDate date]);
            NSLog(@"from %@",ToDate.text);
            NSLog(@"from %@",FromDate.text);
            
            
            //            NSDateFormatter *anotherDateFormatter = [[NSDateFormatter alloc] init];
            //            [anotherDateFormatter setAMSymbol:@"AM"];
            //            [anotherDateFormatter setPMSymbol:@"PM"];
            //            //[anotherDateFormatter setDateFormat:@"dd-MM-yyyy hh:mm:ss a"];
            //
            //            [anotherDateFormatter setDateFormat:@"MM/dd/yyyy HH:mm a"];
            //
            //            //  NSDate *d=[[NSDate alloc]init];
            //
            //            NSDate *d =[anotherDateFormatter dateFromString:FromDate.text];
            //            NSLog(@"d %@",d);
            //           // NSComparisonResult result = [FromDate.text compare:[NSDate date]];
            //           // NSLog(@"res %d",result);
            //
            //
            
            
            
            //            NSDateFormatter  *anotherDateFormatter1 = [[NSDateFormatter alloc] init];
            //            [anotherDateFormatter1 setDateFormat:@"MM/dd/yyyy HH:mm:ss"];
            //            NSLog(@"%@", [anotherDateFormatter1 dateFromString:d]);
            
            //            NSLog(@"from %@",FromDate.text);
            //
            //            NSString *ToDay=[NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%d/%d/%d %@",[components1 month],[components1 day],[components1 year],start]];
            //            NSLog(@"today %@",ToDay);
            //            NSComparisonResult result = [FromDate.text compare:ToDay];
            //
            //            NSLog(@"res %d",result);
            //           if (FromDate.text>ToDay)
            //            {
            //
            //                NSLog(@"greter");
            //            }
            //
            
            if([[NSString stringWithFormat:@"%@",FromDate.text]isEqualToString:[NSString stringWithFormat:@"%@",ToDate.text]])
            {
                NSLog(@"equal");
                
            }
            else
            {
                NSLog(@"notequal");
                NSLog(@"from %@",FromDate.text);
                
                NSDateFormatter *anotherDateFormatter = [[NSDateFormatter alloc] init];
                [anotherDateFormatter setAMSymbol:@"AM"];
                [anotherDateFormatter setPMSymbol:@"PM"];
                //[anotherDateFormatter setDateFormat:@"dd-MM-yyyy hh:mm:ss a"];
                
                [anotherDateFormatter setDateFormat:@"MM/dd/yyyy HH:mm a"];
                
                //  NSDate *d=[[NSDate alloc]init];
                
                NSDate *d =[anotherDateFormatter dateFromString:FromDate.text];
                
                NSDateFormatter  *anotherDateFormatter1 = [[NSDateFormatter alloc] init];
                [anotherDateFormatter1 setDateFormat:@"MM/dd/yyyy HH:mm:ss"];
                NSLog(@"%@", [anotherDateFormatter1 stringFromDate:d]);
                
                
                NSLog(@"date %@ and %@",FromDate.text,d);
                
                NSCalendar *calendar = [NSCalendar currentCalendar];
                NSDateComponents *comps = [NSDateComponents new];
                //comps.month = -1;
                comps.day= +1;
                // comps.year=-1;
                NSDate *date1 = [calendar dateByAddingComponents:comps toDate:d options:0];
                NSDateComponents *components = [calendar components:NSMonthCalendarUnit|NSDayCalendarUnit|NSYearCalendarUnit fromDate:date1]; // Get necessary date components
                NSLog(@"Previous month: %d",[components month]);
                NSLog(@"Previous day  : %d",[components day]);
                NSLog(@"Previous day  : %d",[components year]);
                
                NSString *date=[NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%d/%d/%d %@",[components month],[components day],[components year],start]];
                NSLog(@"date %@",date);
                
                FromDate.text=[NSString stringWithFormat:@"%@",date];
                
                NSString *Todate=[self NextButton:nil];
                
                NSLog(@"todate %@",Todate);
                
                
                ToDate.text=[NSString stringWithFormat:@"%@",Todate];
                
                
                NSLog(@"date %@",[NSString stringWithFormat:@"%@",ToDate.text]);
                
                
                NSMutableDictionary *_search=[[NSMutableDictionary alloc]initWithObjectsAndKeys:SearchPatient,@"str",@"",@"mode",shared.branches,@"branchs",@"1",@"fromCount",@"100", @"toCount",shared.testValue, @"testStatus",shared.DueValue, @"due",shared.Checkalue,@"reportChecked",shared.PrintValue,@"printed",shared.DeliverdValue, @"delivered",shared.SimpleValue,@"sample",shared.CancelledValue,@"cancelled",@"false",@"urgent",[NSString stringWithFormat:@"%@",FromDate.text],@"fromDate",[NSString stringWithFormat:@"%@",ToDate.text],@"toDate",orderby,@"orderBy",orderdirection,@"orderDirection",shared.DeliveryValue,@"delivery",@"",@"barCode", nil];
                

                
                self.WebService->Get_AdviseInvestigation=_search;
                
                [self.WebService CallServiceShowPatientListforWorkList:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/Worklist" Object:NULL Handler:NULL];
                
                NSLog(@"work list %@",self.WebService->data1);
                
                WorkList=(NSArray*)[[self.WebService->data1 valueForKey:@"data"]valueForKey:@"Table"];
                
                NSLog(@"worklist is %@",WorkList);
                [Table_WorkList reloadData];
                
                //count=count-1;
                day=day+1;
                
                
                //                NSString *ToDay=[NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%d/%d/%d %@",[components1 month],[components1 day],[components1 year],start]];
                //                NSLog(@"today %@",ToDay);
                //
                //                NSLog(@"from %@",FromDate.text);
                //
                //                if(FromDate.text<ToDay)
                //                {
                //                    NSLog(@"here");
                //
                //                }
                //
                
                
            }
            
            
            break;
        }
        case 4:
        {
           shared.row=4;
            date_flag=0;
            Clender_flag=1;
            
            FromDate.text=[NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%d/%d/%d %@",[components1 month],[components1 day],[components1 year],start]];
            NSLog(@"from %@",FromDate.text);
            
            ToDate.text=[NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%d/%d/%d %@",[components1 month],[components1 day],[components1 year],End]];
             NSLog(@"from %@",ToDate.text);
            
            NSDateFormatter *anotherDateFormatter = [[NSDateFormatter alloc] init];
            [anotherDateFormatter setAMSymbol:@"AM"];
            [anotherDateFormatter setPMSymbol:@"PM"];
            //[anotherDateFormatter setDateFormat:@"dd-MM-yyyy hh:mm:ss a"];
            
            [anotherDateFormatter setDateFormat:@"MM/dd/yyyy HH:mm a"];
            
            //  NSDate *d=[[NSDate alloc]init];
            
            NSDate *d =[anotherDateFormatter dateFromString:FromDate.text];
            
            NSDateFormatter  *anotherDateFormatter1 = [[NSDateFormatter alloc] init];
            [anotherDateFormatter1 setDateFormat:@"MM/dd/yyyy HH:mm:ss"];
            NSLog(@"%@", [anotherDateFormatter1 stringFromDate:d]);
            
            
            NSLog(@"date %@ and %@",FromDate.text,d);
            
            NSCalendar *calendar = [NSCalendar currentCalendar];
            NSDateComponents *comps = [NSDateComponents new];
            comps.month = -1;
          //  comps.day= +1;
            // comps.year=-1;
            NSDate *date1 = [calendar dateByAddingComponents:comps toDate:d options:0];
            NSDateComponents *components = [calendar components:NSMonthCalendarUnit|NSDayCalendarUnit|NSYearCalendarUnit fromDate:date1]; // Get necessary date components
            NSLog(@"Previous month: %d",[components month]);
            NSLog(@"Previous day  : %d",[components day]);
            NSLog(@"Previous day  : %d",[components year]);
            
            NSString *date=[NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%d/%d/%d %@",[components month],[components day],[components year],start]];
            NSLog(@"date %@",date);
            
            FromDate.text=[NSString stringWithFormat:@"%@",date];
            

            
            
//            NSString *Todaydate=[NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%d/%d/%d %@",[components1 month],[components1 day],[components1 year],End]];
//   
//          //  NSString *date=[NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%d/%d/%d %@",[components1 month]-1,[components1 day]+1,[components1 year],start]];
//            
//            NSLog(@"date %@",date);
//            
//            NSLog(@"date %@",TodayDate);
//            FromDate.text=[NSString stringWithFormat:@"%@",date];
//            ToDate.text=[NSString stringWithFormat:@"%@",Todaydate];
//
//            [WTStatusBar setStatusText:@"Downloading data..." animated:YES];
//            _progress = 0;
//            [WTStatusBar setProgressBarColor:[UIColor greenColor]];
//            [self performSelector:@selector(setTextStatusProgress3) withObject:nil afterDelay:0.1];
            
            [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
            
            
         NSMutableDictionary *_search=[[NSMutableDictionary alloc]initWithObjectsAndKeys:SearchPatient,@"str",@"",@"mode",shared.branches,@"branchs",@"1",@"fromCount",@"100", @"toCount",shared.testValue, @"testStatus",shared.DueValue, @"due",shared.Checkalue,@"reportChecked",shared.PrintValue,@"printed",shared.DeliverdValue,@"delivered",shared.SimpleValue,@"sample",shared.CancelledValue,@"cancelled",@"false",@"urgent",[NSString stringWithFormat:@"%@",FromDate.text],@"fromDate",[NSString stringWithFormat:@"%@",ToDate.text],@"toDate",orderby,@"orderBy",orderdirection,@"orderDirection",shared.DeliveryValue,@"delivery",@"",@"barCode", nil];
            
            
           self.WebService->Get_AdviseInvestigation=_search;
            
            [self.WebService CallServiceShowPatientListforWorkList:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/Worklist" Object:NULL Handler:NULL];
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            NSLog(@"work list %@",self.WebService->data1);
            
            WorkList=(NSArray*)[[self.WebService->data1 valueForKey:@"data"]valueForKey:@"Table"];
            
            NSLog(@"worklist is %@",WorkList);
            
            
            break;
        }
        default:
            break;
            
            
            
            
    }
    
    //    smallArray1 = [[NSMutableArray alloc] init];
    //    [self prepareArraysForTableView:1];
    
    [self select];
  //  [Table_WorkList reloadData];

    
//    NSUInteger rows = 0;
//   NSMutableArray *tempArray = [NSMutableArray array];
//   while (rows<WorkList.count) {
//  NSLog(@" row %d and count %d",rows,WorkList.count);
//  NSLog(@" work %@",[WorkList objectAtIndex:rows]);
//  [tempArray addObject:[WorkList objectAtIndex:rows]];
//  NSLog(@" work %@",[WorkList objectAtIndex:rows]);
//  rows++;
//   }
//   NSLog(@"tempArray %@",tempArray);
//   self.mainArray = [NSArray arrayWithArray:tempArray];
//   NSLog(@"subarry %@",self.mainArray);
//   _pageNumber = 0;
//   _numberOfVisibleRows = 10;
//   _maxPageNumber = [self.mainArray count]/_numberOfVisibleRows;
//   NSLog(@"_maxPageNumber %d",_maxPageNumber);
//   self.subArray = [self subArrayForPageNumber:_pageNumber];
//   NSLog(@"subarry %@",self.subArray);
//   [Table_WorkList reloadData];
    
}
- (void)setTextStatusProgress3
{
    if (_progress < 1.0)
    {
        _progress += 0.1;
        [WTStatusBar setProgress:_progress animated:YES];
        [self performSelector:@selector(setTextStatusProgress3) withObject:nil afterDelay:0.1];
    }
    else
    {
      //  [WTStatusBar setStatusText:@"Parsing data..." animated:YES];
        _progress = 0;
       // [WTStatusBar setProgressBarColor:[UIColor yellowColor]];
        [self performSelector:@selector(setTextStatusProgress4) withObject:nil afterDelay:0.3];
    }
}

- (void)setTextStatusProgress4
{
    if (_progress < 1.0)
    {
        _progress += 0.3;
        [WTStatusBar setProgress:_progress animated:YES];
        [self performSelector:@selector(setTextStatusProgress4) withObject:nil afterDelay:0.3];
    }
    else
    {
        [WTStatusBar setStatusText:@"Done!" timeout:0.5 animated:YES];
    }
}

- (NSArray *)subArrayForPageNumber:(NSUInteger)pageNumber{
    
   NSRange range = NSMakeRange(_pageNumber*_numberOfVisibleRows, _numberOfVisibleRows);
   if (range.location+range.length>[self.mainArray count]) {
     range.length = [self.mainArray count]-range.location;
  }
   // NSLog(@"range %d", range);
    
   NSLog(@"subarry %@",[self.mainArray subarrayWithRange:range]);
   
   return [self.mainArray subarrayWithRange:range];
}
-(void)prepareArraysForTableView:(int)sender
{
    [smallArray1 removeAllObjects];
    //[smallArray2 removeAllObjects];
    if (sender==1)
    {
        NSLog(@"total %i", totalValues);
        if ([WorkList count]>totalValues+9)
        {
            
            for (int i=totalValues; i<=totalValues+9; i++)
            {
                
                [smallArray1 addObject:[WorkList objectAtIndex:i]];
                //[smallArray2 addObject:[array2 objectAtIndex:i]];
                
                NSLog(@"total %i, i %i", totalValues, i);
            }
            //            if(WorkList.count<9)
            //            {
            //                totalValues =0;
            //
            //
            //            }
            //            else
            {
                totalValues = totalValues+9;
            }
        }else{
            if(WorkList.count<9)
            {
                totalValues =0;
                
                
            }
            else
            {
                totalValues = totalValues+9;
            }
            
            if ([WorkList count]>0) {
                for (int j=totalValues; j<[WorkList count]; j++) {
                    [smallArray1 addObject:[WorkList objectAtIndex:j]];
                    // [smallArray2 addObject:[array2 objectAtIndex:j]];
                    
                }
            }
            //            [sender setEnabled:NO];
        }
    }else
    {
        if ([WorkList count]>10) {
            if (totalValues>=9) {
                
                for (int i=totalValues-9; i<=totalValues; i++) {
                    
                    [smallArray1 addObject:[WorkList objectAtIndex:i]];
                    // [smallArray2 addObject:[array2 objectAtIndex:i]];
                    
                    NSLog(@"total %i, i %i", totalValues, i);
                }
                totalValues = totalValues-9;
            }else{
                if ([WorkList count]>0) {
                    for (int j=totalValues; j<10; j++) {
                        [smallArray1 addObject:[WorkList objectAtIndex:j]];
                        //  [smallArray2 addObject:[array2 objectAtIndex:j]];
                        
                    }
                    
                }
                //[sender setEnabled:NO];
            }
        }
        else
        {
            for (int j=totalValues; j<[WorkList count]; j++) {
                [smallArray1 addObject:[WorkList objectAtIndex:j]];
                // [smallArray2 addObject:[array2 objectAtIndex:j]];
                
            }
            
        }
    }
    
    //    if ([WorkList count]>totalValues+9)
    //    {
    //
    //        for (int i=totalValues; i<=totalValues+9; i++)
    //        {
    //
    //            [smallArray1 addObject:[WorkList objectAtIndex:i]];
    //            //[smallArray2 addObject:[array2 objectAtIndex:i]];
    //
    //            NSLog(@"total %i, i %i", totalValues, i);
    //        }
    //        totalValues = totalValues+9;
    //    }else{
    //        if ([WorkList count]>0) {
    //            for (int j=totalValues; j<[WorkList count]; j++) {
    //                [smallArray1 addObject:[WorkList objectAtIndex:j]];
    //                // [smallArray2 addObject:[array2 objectAtIndex:j]];
    //
    //            }
    //        }
    //        //            [sender setEnabled:NO];
    //    }
    
    
    
    [Table_WorkList reloadData];
    
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    text_tag=textField.tag;
    
    NSLog(@"texttag %d",text_tag);
    if( textField.tag==1)
    {
        tool.hidden=NO;
        date_flag=0;
        Clender = [[UIDatePicker alloc] initWithFrame:CGRectMake(0,352,320,216)];
        Clender.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        Clender.datePickerMode = UIDatePickerModeDate;
        Clender.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];;
        Clender.tintColor=[UIColor blueColor];
        
        NSDateFormatter *anotherDateFormatter = [[NSDateFormatter alloc] init];
        [anotherDateFormatter setAMSymbol:@"AM"];
        [anotherDateFormatter setPMSymbol:@"PM"];
        //[anotherDateFormatter setDateFormat:@"dd-MM-yyyy hh:mm:ss a"];
        
        [anotherDateFormatter setDateFormat:@"MM/dd/yyyy HH:mm a"];
        
        //  NSDate *d=[[NSDate alloc]init];
        
        NSDate *myDate =[anotherDateFormatter dateFromString:ToDate.text];
        NSLog(@"mydate %@",myDate);
        
        
       // Clender.date =[[ NSDate alloc ] initWithTimeIntervalSinceNow:(NSTimeInterval) 0];
       Clender.maximumDate =myDate ;
        

        Clender.datePickerMode = UIDatePickerModeDateAndTime;
      //  Clender.date = myDate;
        
        //done.hidden=NO;
        
        Clender.userInteractionEnabled=YES;
        //DatePicker.hidden=YES;
        // [self.DOB setInputView:DatePicker];
        [self.view addSubview:Clender];
    }
    if( textField.tag==2)
    {
        tool.hidden=NO;
        date_flag=0;
        Clender = [[UIDatePicker alloc] initWithFrame:CGRectMake(0,352,320,216)];
        Clender.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        // DatePicker.datePickerMode = UIDatePickerModeDate;
        Clender.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
        
        NSDateFormatter *anotherDateFormatter = [[NSDateFormatter alloc] init];
        [anotherDateFormatter setAMSymbol:@"AM"];
        [anotherDateFormatter setPMSymbol:@"PM"];
        //[anotherDateFormatter setDateFormat:@"dd-MM-yyyy hh:mm:ss a"];
        
        [anotherDateFormatter setDateFormat:@"MM/dd/yyyy HH:mm a"];
        
        //  NSDate *d=[[NSDate alloc]init];
        
        NSDate *d =[anotherDateFormatter dateFromString:FromDate.text];
        
        NSDateFormatter  *anotherDateFormatter1 = [[NSDateFormatter alloc] init];
        [anotherDateFormatter1 setDateFormat:@"MM/dd/yyyy HH:mm:ss"];
        NSLog(@"%@", [anotherDateFormatter1 stringFromDate:d]);
        
        
        NSLog(@"date %@ and %@",FromDate.text,d);
        
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps = [NSDateComponents new];
        //comps.month = -1;
        //comps.day= -1;
        // comps.year=-1;
        NSDate *date1 = [calendar dateByAddingComponents:comps toDate:d options:0];
        
        
        
        
        NSLog(@"mydate %@",date1);
        Clender.minimumDate =date1 ;
        
        // Clender.date =[[ NSDate alloc ] initWithTimeIntervalSinceNow:(NSTimeInterval) 0];
        

        Clender.datePickerMode = UIDatePickerModeDateAndTime;
        //Clender.date =[[ NSDate alloc ] initWithTimeIntervalSinceNow:(NSTimeInterval) 2];
 
        Clender.userInteractionEnabled=YES;
        [self.view addSubview:Clender];
        
    }
    
    return YES;
    
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if(textField.tag==1 || textField.tag==2)
    {
        [textField resignFirstResponder];
    }
    
}
-(NSString*)Next:(id)sender
{
    NSLog(@"from %@",ToDate.text);
    
    NSDateFormatter *anotherDateFormatter = [[NSDateFormatter alloc] init];
    [anotherDateFormatter setAMSymbol:@"AM"];
    [anotherDateFormatter setPMSymbol:@"PM"];
    //[anotherDateFormatter setDateFormat:@"dd-MM-yyyy hh:mm:ss a"];
    
    [anotherDateFormatter setDateFormat:@"MM/dd/yyyy HH:mm a"];
    
    //  NSDate *d=[[NSDate alloc]init];
    
    NSDate *d =[anotherDateFormatter dateFromString:ToDate.text];
    
    NSDateFormatter  *anotherDateFormatter1 = [[NSDateFormatter alloc] init];
    [anotherDateFormatter1 setDateFormat:@"MM/dd/yyyy HH:mm:ss"];
    NSLog(@"%@", [anotherDateFormatter1 stringFromDate:d]);
    
    
    NSLog(@"date %@ and %@",ToDate.text,d);
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [NSDateComponents new];
    //comps.month = -1;
    comps.day= -1;
    // comps.year=-1;
    NSDate *date1 = [calendar dateByAddingComponents:comps toDate:d options:0];
    NSDateComponents *components = [calendar components:NSMonthCalendarUnit|NSDayCalendarUnit|NSYearCalendarUnit fromDate:date1]; // Get necessary date components
    NSLog(@"Previous month: %d",[components month]);
    NSLog(@"Previous day  : %d",[components day]);
    NSLog(@"Previous day  : %d",[components year]);
    
    NSString *date=[NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%d/%d/%d %@",[components month],[components day],[components year],start]];
    NSLog(@"date %@",date);
    
    
    
    return date;
    
}

-(NSString*)NextButton:(id)sender
{
    NSLog(@"from %@",ToDate.text);
    
    NSDateFormatter *anotherDateFormatter = [[NSDateFormatter alloc] init];
    [anotherDateFormatter setAMSymbol:@"AM"];
    [anotherDateFormatter setPMSymbol:@"PM"];
    //[anotherDateFormatter setDateFormat:@"dd-MM-yyyy hh:mm:ss a"];
    
    [anotherDateFormatter setDateFormat:@"MM/dd/yyyy HH:mm a"];
    
    //  NSDate *d=[[NSDate alloc]init];
    NSDate *d ;
    if(Clender_flag==1)
    {
        d =[anotherDateFormatter dateFromString:FromDate.text];
    }
    else
    {
        d =[anotherDateFormatter dateFromString:ToDate.text];
    }
    NSDateFormatter  *anotherDateFormatter1 = [[NSDateFormatter alloc] init];
    [anotherDateFormatter1 setDateFormat:@"MM/dd/yyyy HH:mm:ss"];
    NSLog(@"%@", [anotherDateFormatter1 stringFromDate:d]);
    
    
    NSLog(@"date %@ and %@",ToDate.text,d);
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [NSDateComponents new];
    //comps.month = -1;
    comps.day= +1;
    // comps.year=-1;
    NSDate *date1 = [calendar dateByAddingComponents:comps toDate:d options:0];
    NSDateComponents *components = [calendar components:NSMonthCalendarUnit|NSDayCalendarUnit|NSYearCalendarUnit fromDate:date1]; // Get necessary date components
    NSLog(@"Previous month: %d",[components month]);
    NSLog(@"Previous day  : %d",[components day]);
    NSLog(@"Previous day  : %d",[components year]);
    
    NSString *date=[NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%d/%d/%d %@",[components month],[components day],[components year],start]];
    NSLog(@"date %@",date);
    
    return date;
    
}

-(IBAction)SelectClender:(id)sender
{
    
    if(select==TRUE)
    {
        
        FromDate.hidden=NO;
        ToDate.hidden=NO;
        select=FALSE;
        
    }
    else
    {
        FromDate.hidden=YES;
        ToDate.hidden=YES;
        select=TRUE;
        
    }
    
}

-(IBAction)ClenderTextEvent:(id)sender
{
    Shared *share=[Shared sharedUser];
    // UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]init];
    share.row=4;
    
//    smallArray1 = [[NSMutableArray alloc] init];
//    [self prepareArraysForTableView:1];
//    
    Clender_flag=1;
    
    //   [FromDate resignFirstResponder];
    Clender.hidden=NO;
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateStyle = NSDateFormatterMediumStyle;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int year = [[calendar components:NSYearCalendarUnit fromDate:[Clender date]] year];
    int month = [[calendar components:NSMonthCalendarUnit fromDate:[Clender date]] month];
    int day1= [[calendar components:NSDayCalendarUnit fromDate:[Clender date]] day];
    int hour =[[calendar components:NSHourCalendarUnit fromDate:[Clender date]] hour];
    int minute = [[calendar components:NSMinuteCalendarUnit fromDate:[Clender date]] minute];
    
    
    NSString *date1 = [NSString stringWithFormat:@"%d/%d/%d %d:%d",day1,month,year,hour,minute];//[df stringFromDate:_datePickerView.date]];
    NSLog(@"date %@",date1);
    
    NSDateFormatter  *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy HH:mm"];
    
    NSDate  *myDate = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@",date1]];
    NSLog(@"%@", [dateFormatter stringFromDate:myDate]);
    
    NSDateFormatter  *anotherDateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setAMSymbol:@"AM"];
    [dateFormatter setPMSymbol:@"PM"];
    [anotherDateFormatter setDateFormat:@"MM/dd/yyyy hh:mm a"];
    NSLog(@"%@", [anotherDateFormatter stringFromDate:myDate]);
    
    //    DateTime.text =[anotherDateFormatter stringFromDate:myDate];
    //    NSLog(@"datetime is %@",DateTime.text);
    //
    //
    //
    //
    //    NSDateFormatter  *dateFormatter = [[NSDateFormatter alloc] init];
    //    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss +HHmm"];
    //    NSDate  *myDate = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@",FromDate.text]];
    //    NSLog(@"%@", [dateFormatter stringFromDate:myDate]);
    //
    //    NSDateFormatter  *anotherDateFormatter = [[NSDateFormatter alloc] init];
    //    [anotherDateFormatter setDateFormat:@"MM/dd/yyyy "];
    //    NSLog(@"%@", [anotherDateFormatter stringFromDate:myDate]);
    //
    if(text_tag==1)
    {
        FromDate.text =[anotherDateFormatter stringFromDate:myDate];
    }
    else if (text_tag==2)
    {
        ToDate.text =[anotherDateFormatter stringFromDate:myDate];
        
    }
    
    //  Clender.hidden=YES;
    Shared *shared=[Shared sharedUser];
    
    NSMutableDictionary *_search=[[NSMutableDictionary alloc]initWithObjectsAndKeys:SearchPatient,@"str",@"",@"mode",shared.branches,@"branchs",@"1",@"fromCount",@"100", @"toCount",shared.testValue, @"testStatus",shared.DueValue, @"due",shared.Checkalue,@"reportChecked",shared.PrintValue,@"printed",shared.DeliverdValue, @"delivered",shared.SimpleValue,@"sample",shared.CancelledValue,@"cancelled",@"false",@"urgent",[NSString stringWithFormat:@"%@",FromDate.text],@"fromDate",[NSString stringWithFormat:@"%@",ToDate.text],@"toDate",orderby,@"orderBy",orderdirection,@"orderDirection",shared.DeliveryValue,@"delivery",@"",@"barCode", nil];
    
    
    self.WebService->Get_AdviseInvestigation=_search;
    
    [self.WebService CallServiceShowPatientListforWorkList:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/Worklist" Object:NULL Handler:NULL];
    
    NSLog(@"work list %@",self.WebService->data1);
    
    WorkList=(NSArray*)[[self.WebService->data1 valueForKey:@"data"]valueForKey:@"Table"];
    
    NSLog(@"worklist is %@",WorkList);
    
    NSUInteger rows = 0;
    NSMutableArray *tempArray = [NSMutableArray array];
    while (rows<WorkList.count) {
        NSLog(@" row %d and count %d",rows,WorkList.count);
        NSLog(@" work %@",[WorkList objectAtIndex:rows]);
        [tempArray addObject:[WorkList objectAtIndex:rows]];
        NSLog(@" work %@",[WorkList objectAtIndex:rows]);
        rows++;
    }
    NSLog(@"tempArray %@",tempArray);
    self.mainArray = [NSArray arrayWithArray:tempArray];
    NSLog(@"subarry %@",self.mainArray);
    _pageNumber = 0;
    _numberOfVisibleRows = 10;
    _maxPageNumber = [self.mainArray count]/_numberOfVisibleRows;
    NSLog(@"_maxPageNumber %d",_maxPageNumber);
    self.subArray = [self subArrayForPageNumber:_pageNumber];
    NSLog(@"subarry %@",self.subArray);
    [Table_WorkList reloadData];
    
    tool.hidden=YES;
    
    Clender.hidden=YES;
    
    //  UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapInPickerView:)];
    //            [singleTap addTarget:self action:@selector(tapInPickerView:)];
    //            [singleTap setNumberOfTapsRequired:1];
    //            [singleTap setNumberOfTouchesRequired:1];
    //            [Clender addGestureRecognizer:singleTap];
    //
    
    
}
-(IBAction)ClenderTextEvent1:(id)sender
{
    Clender_flag=1;
    //[ToDate resignFirstResponder];
    
    Clender.hidden=NO;
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateStyle = NSDateFormatterMediumStyle;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int year = [[calendar components:NSYearCalendarUnit fromDate:[Clender date]] year];
    int month = [[calendar components:NSMonthCalendarUnit fromDate:[Clender date]] month];
    int day1= [[calendar components:NSDayCalendarUnit fromDate:[Clender date]] day];
    int hour =[[calendar components:NSHourCalendarUnit fromDate:[Clender date]] hour];
    int minute = [[calendar components:NSMinuteCalendarUnit fromDate:[Clender date]] minute];
    
    
    NSString *date1 = [NSString stringWithFormat:@"%d/%d/%d %d:%d",day1,month,year,hour,minute];//[df stringFromDate:_datePickerView.date]];
    NSLog(@"date %@",date1);
    
    NSDateFormatter  *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy HH:mm"];
    
    NSDate  *myDate = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@",date1]];
    NSLog(@"%@", [dateFormatter stringFromDate:myDate]);
    
    NSDateFormatter  *anotherDateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setAMSymbol:@"AM"];
    [dateFormatter setPMSymbol:@"PM"];
    [anotherDateFormatter setDateFormat:@"MM/dd/yyyy hh:mm a"];
    NSLog(@"%@", [anotherDateFormatter stringFromDate:myDate]);
    ToDate.text =[anotherDateFormatter stringFromDate:myDate];
    // Clender.hidden=YES;
    NSDictionary *_search=[[NSDictionary alloc]initWithObjectsAndKeys:@"",@"str",@"",@"mode",@"",@"branchs",@"1",@"fromCount",@"150", @"toCount",@"0", @"testStatus",@"0", @"due",@"0",@"reportChecked",@"0",@"printed",@"0", @"delivered",@"0",@"sample",@"0",@"cancelled",@"false",@"urgent",[NSString stringWithFormat:@"%@",FromDate.text],@"fromDate",[NSString stringWithFormat:@"%@",ToDate.text],@"toDate",orderby,@"orderBy",orderdirection,@"orderDirection",@"0",@"delivery",@"",@"barCode", nil];
    
    self.WebService->Get_AdviseInvestigation=(NSMutableDictionary*)_search;
    
    [self.WebService CallServiceShowPatientListforWorkList:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/Worklist" Object:NULL Handler:NULL];
    
    NSLog(@"work list %@",self.WebService->data1);
    
    WorkList=(NSArray*)[[self.WebService->data1 valueForKey:@"data"]valueForKey:@"Table"];
    
    NSLog(@"worklist is %@",WorkList);
    
    [Table_WorkList reloadData];
    
}

- (IBAction)prevNextAction:(id)sender
{
    NSLog(@"sender %d",[sender tag]);
 
    if ([sender tag] ==1)
    {
           NSLog(@"pn %d",_pageNumber);
           NSLog(@"pn %d",_maxPageNumber);
     _pageNumber= MIN(_maxPageNumber, _pageNumber+1);
        NSLog(@"pn %d",_pageNumber);
        left.enabled=YES;
        
       }
    else
       {
       _pageNumber = MAX(0, _pageNumber-1);
            NSLog(@"pn %d",_pageNumber);
             next.enabled=YES;
        }
    
    self.subArray = [self subArrayForPageNumber:_pageNumber];
    NSLog(@"page %d",_pageNumber);
    NSLog(@"page %d",_maxPageNumber);

    if(_pageNumber==0)
    {
        left.enabled=NO;
    }
    
    else if (_pageNumber+1==_maxPageNumber)
    {
        next.enabled=NO;
        
        // self.subArray = [self subArrayForPageNumber:_pageNumber-2];
    }
        
    
    [Table_WorkList reloadData];
  //  [self prepareArraysForTableView:[sender tag]];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    NSLog(@"selected here");
    
    
}
- (void)tapInPickerView:(UIGestureRecognizer *)sender
{
    NSLog(@"selected here");
    
    // [FromDate setInputView:Clender];
    //  UIDatePicker *picker = (UIDatePicker*)FromDate.inputView;
    
    // FromDate.text = [NSString stringWithFormat:@"%@",Clender.date];
    //  NSLog(@"date %@",FromDate.text);
    
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateStyle = NSDateFormatterMediumStyle;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int year = [[calendar components:NSYearCalendarUnit fromDate:[Clender date]] year];
    int month = [[calendar components:NSMonthCalendarUnit fromDate:[Clender date]] month];
    int day1= [[calendar components:NSDayCalendarUnit fromDate:[Clender date]] day];
    int hour =[[calendar components:NSHourCalendarUnit fromDate:[Clender date]] hour];
    int minute = [[calendar components:NSMinuteCalendarUnit fromDate:[Clender date]] minute];
    
    
    NSString *date1 = [NSString stringWithFormat:@"%d/%d/%d %d:%d",day1,month,year,hour,minute];//[df stringFromDate:_datePickerView.date]];
    NSLog(@"date %@",date1);
    
    NSDateFormatter  *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy HH:mm"];
    
    NSDate  *myDate = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@",date1]];
    NSLog(@"%@", [dateFormatter stringFromDate:myDate]);
    
    NSDateFormatter  *anotherDateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setAMSymbol:@"AM"];
    [dateFormatter setPMSymbol:@"PM"];
    [anotherDateFormatter setDateFormat:@"MM/dd/yyyy hh:mm a"];
    NSLog(@"%@", [anotherDateFormatter stringFromDate:myDate]);
    
    //    DateTime.text =[anotherDateFormatter stringFromDate:myDate];
    //    NSLog(@"datetime is %@",DateTime.text);
    //
    //
    //
    //
    //    NSDateFormatter  *dateFormatter = [[NSDateFormatter alloc] init];
    //    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss +HHmm"];
    //    NSDate  *myDate = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@",FromDate.text]];
    //    NSLog(@"%@", [dateFormatter stringFromDate:myDate]);
    //
    //    NSDateFormatter  *anotherDateFormatter = [[NSDateFormatter alloc] init];
    //    [anotherDateFormatter setDateFormat:@"MM/dd/yyyy "];
    //    NSLog(@"%@", [anotherDateFormatter stringFromDate:myDate]);
    //
    FromDate.text =[anotherDateFormatter stringFromDate:myDate];
    
    Clender.hidden=YES;
    
    NSDictionary *_search=[[NSDictionary alloc]initWithObjectsAndKeys:@"",@"str",@"",@"mode",@"",@"branchs",@"1",@"fromCount",@"150", @"toCount",@"0", @"testStatus",@"0", @"due",@"0",@"reportChecked",@"0",@"printed",@"0", @"delivered",@"0",@"sample",@"0",@"cancelled",@"false",@"urgent",[NSString stringWithFormat:@"%@",FromDate.text],@"fromDate",[NSString stringWithFormat:@"%@",ToDate.text],@"toDate",@"0",@"orderBy",@"1",@"orderDirection",@"0",@"delivery",@"",@"barCode", nil];
    
    self.WebService->Get_AdviseInvestigation=(NSMutableDictionary*)_search;
    
    [self.WebService CallServiceShowPatientListforWorkList:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/Worklist" Object:NULL Handler:NULL];
    
    NSLog(@"work list %@",self.WebService->data1);
    
    WorkList=(NSArray*)[[self.WebService->data1 valueForKey:@"data"]valueForKey:@"Table"];
    
    NSLog(@"worklist is %@",WorkList);
    [Table_WorkList reloadData];
    
    
    
}
- (void)tapInPickerView1:(UIGestureRecognizer *)sender
{
    //    [ToDate setInputView:Clender];
    //    UIDatePicker *picker = (UIDatePicker*)ToDate.inputView;
    //
    //    ToDate.text = [NSString stringWithFormat:@"%@",picker.date];
    //    NSLog(@"date %@",ToDate.text);
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateStyle = NSDateFormatterMediumStyle;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int year = [[calendar components:NSYearCalendarUnit fromDate:[Clender date]] year];
    int month = [[calendar components:NSMonthCalendarUnit fromDate:[Clender date]] month];
    int day1= [[calendar components:NSDayCalendarUnit fromDate:[Clender date]] day];
    int hour =[[calendar components:NSHourCalendarUnit fromDate:[Clender date]] hour];
    int minute = [[calendar components:NSMinuteCalendarUnit fromDate:[Clender date]] minute];
    
    NSString *date1 = [NSString stringWithFormat:@"%d/%d/%d %d:%d",day1,month,year,hour,minute];//[df stringFromDate:_datePickerView.date]];
    NSLog(@"date %@",date1);
    
    NSDateFormatter  *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy HH:mm"];
    
    NSDate  *myDate = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@",date1]];
    NSLog(@"%@", [dateFormatter stringFromDate:myDate]);
    
    NSDateFormatter  *anotherDateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setAMSymbol:@"AM"];
    [dateFormatter setPMSymbol:@"PM"];
    [anotherDateFormatter setDateFormat:@"MM/dd/yyyy hh:mm a"];
    NSLog(@"%@", [anotherDateFormatter stringFromDate:myDate]);
    ToDate.text =[anotherDateFormatter stringFromDate:myDate];
    Clender.hidden=YES;
    NSDictionary *_search=[[NSDictionary alloc]initWithObjectsAndKeys:@"",@"str",@"",@"mode",@"",@"branchs",@"1",@"fromCount",@"150", @"toCount",@"0", @"testStatus",@"0", @"due",@"0",@"reportChecked",@"0",@"printed",@"0", @"delivered",@"0",@"sample",@"0",@"cancelled",@"false",@"urgent",[NSString stringWithFormat:@"%@",FromDate.text],@"fromDate",[NSString stringWithFormat:@"%@",ToDate.text],@"toDate",@"0",@"orderBy",@"1",@"orderDirection",@"0",@"delivery",@"",@"barCode", nil];
    
    self.WebService->Get_AdviseInvestigation=(NSMutableDictionary*)_search;
    
    [self.WebService CallServiceShowPatientListforWorkList:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/Worklist" Object:NULL Handler:NULL];
    
    NSLog(@"work list %@",self.WebService->data1);
    
    WorkList=(NSArray*)[[self.WebService->data1 valueForKey:@"data"]valueForKey:@"Table"];
    
    NSLog(@"worklist is %@",WorkList);
    
    [Table_WorkList reloadData];
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    Shared *share=[Shared sharedUser];
    
       if(share.row==0)
        {
    
    return [WorkList count];
      }
      else
      {
          return [self.subArray count];
   
      }
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	// There is only one section.
	return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //static NSString *MyIdentifier = @"MyIdentifier";
    
     NSString *MyIdentifier = [NSString stringWithFormat:@"S%1dR%1d",indexPath.section,indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell== nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier] ;
        // tableView.allowsSelection = NO;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    UIButton *SerialNO=[[UIButton alloc]initWithFrame:CGRectMake(05,10,50,30)];
         SerialNO.tag=indexPath.row;
     [SerialNO addTarget:self action:@selector(onCustomAccessoryTapped:)forControlEvents:UIControlEventTouchUpInside];
    SerialNO.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    SerialNO.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
    SerialNO.titleLabel.textColor=[UIColor blackColor];
    [cell.contentView addSubview:SerialNO];
    
    UIButton *Patientname=[[UIButton alloc]initWithFrame:CGRectMake(60,10,120,30)];
    //Patientname.tag=2;
    Patientname.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    Patientname.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
    Patientname.titleLabel.textColor=[UIColor blackColor];
    [cell.contentView addSubview:Patientname];
    
    
    UIButton *advisedat=[[UIButton alloc]initWithFrame:CGRectMake(185,10,130,30)];
    //advisedat.tag=3;
    advisedat.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    advisedat.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
    advisedat.titleLabel.textColor=[UIColor blackColor];
    [cell.contentView addSubview:advisedat];
    NSString *Completed=@"";
    NSString *CompletedCount=@"";
   // Shared *share=[Shared sharedUser];
//    if (share.row==0)
//    {
//        Completed=[NSString stringWithFormat:@"%@",[[WorkList objectAtIndex:indexPath.row]valueForKey:@"Completed"]];
//        CompletedCount=[NSString stringWithFormat:@"%@",[[WorkList objectAtIndex:indexPath.row]valueForKey:@"CompletedCount"]];
//        [SerialNO setTitle:[NSString stringWithFormat:@"%@",[[WorkList objectAtIndex:indexPath.row]valueForKey:@"SrNo"]]forState:UIControlStateNormal];
//        [Patientname setTitle:[NSString stringWithFormat:@"%@",[[WorkList objectAtIndex:indexPath.row] valueForKey:@"PatientName"]]forState:UIControlStateNormal];
//        [advisedat setTitle:[NSString stringWithFormat:@"%@",[[WorkList objectAtIndex:indexPath.row]valueForKey:@"Dt"]]forState:UIControlStateNormal];
//    }
//        else
           {
               Completed=[NSString stringWithFormat:@"%@",[[self.subArray objectAtIndex:indexPath.row]valueForKey:@"Completed"]];
               CompletedCount=[NSString stringWithFormat:@"%@",[[self.subArray  objectAtIndex:indexPath.row]valueForKey:@"CompletedCount"]];
    
               [SerialNO setTitle:[NSString stringWithFormat:@"%@",[[self.subArray  objectAtIndex:indexPath.row]valueForKey:@"SrNo"]]forState:UIControlStateNormal];
                [Patientname setTitle:[NSString stringWithFormat:@"%@",[[self.subArray  objectAtIndex:indexPath.row] valueForKey:@"PatientName"]]forState:UIControlStateNormal];
                  [advisedat setTitle:[NSString stringWithFormat:@"%@",[[self.subArray  objectAtIndex:indexPath.row]valueForKey:@"Dt"]]forState:UIControlStateNormal];
           }
    
    NSLog(@"ser %@",SerialNO);
    
    if([Completed isEqualToString:@"1"])
    {
        SerialNO.backgroundColor=[UIColor colorWithRed:99/256. green:220/256. blue:144/256. alpha:1];
        NSLog(@"green color");
    }
    
    else if ([CompletedCount isEqualToString:@"0"])
    {
        SerialNO.backgroundColor=[UIColor colorWithRed:128/256. green:181/256. blue:255/256. alpha:1];
        NSLog(@"blue color");
    }
    else
    {
        SerialNO.backgroundColor=[UIColor colorWithRed:255/256. green:169/256. blue:64/256. alpha:1];
        NSLog(@"orange color");
    }
    
    
    if([Completed isEqualToString:@"1"])
    {
        Patientname.backgroundColor=[UIColor colorWithRed:99/256. green:220/256. blue:144/256. alpha:1];
        NSLog(@"green color");
    }
    else if ([CompletedCount isEqualToString:@"0"])
    {
        Patientname.backgroundColor=[UIColor colorWithRed:128/256. green:181/256. blue:255/256. alpha:1];
        NSLog(@"blue color");
    }
    else
    {
        Patientname.backgroundColor=[UIColor colorWithRed:255/256. green:169/256. blue:64/256. alpha:1];
        NSLog(@"orange color");
    }
    //    btn=(UIButton *)[cell viewWithTag:3];
    //    NSLog(@"date %@",[[WorkList objectAtIndex:indexPath.row]valueForKey:@"Dt"]);
    
    
    
    if([Completed isEqualToString:@"1"])
    {
        advisedat.backgroundColor=[UIColor colorWithRed:99/256. green:220/256. blue:144/256. alpha:1];
        NSLog(@"green color");
    }
    else if ([CompletedCount isEqualToString:@"0"])
    {
        advisedat.backgroundColor=[UIColor colorWithRed:128/256. green:181/256. blue:255/256. alpha:1];
        NSLog(@"blue color");
    }
    else
    {
        advisedat.backgroundColor=[UIColor colorWithRed:255/256. green:169/256. blue:64/256. alpha:1];
        NSLog(@"orange color");
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"select here");
    
}
- (void)onCustomAccessoryTapped:(UIButton *)sender
{
    
    NSLog(@"butoon %ld",(long)sender.tag);
    NSIndexPath *path=[NSIndexPath indexPathForRow:sender.tag inSection:0];
    NSLog(@"index %@",path);
    //UITableViewCell *cell = (UITableViewCell *)sender.superview.superview;
    //NSIndexPath *indexPath = [Table_WorkList indexPathForCell:cell];
    // NSLog(@"index %@",indexPath);
    NSLog(@"btn %@",[NSString stringWithFormat:@"%@",[WorkList objectAtIndex:path.row]]);
    
    InvestigationWorkListDetailsViewController *InvestigationWorkList=[[InvestigationWorkListDetailsViewController alloc]init];
    InvestigationWorkList.WorkListDetails=[[NSMutableArray alloc]init];
    [InvestigationWorkList.WorkListDetails addObject:[self.subArray objectAtIndex:path.row]];
    [self.navigationController pushViewController:InvestigationWorkList animated:YES];
}
-(IBAction)btnpress:(UITapGestureRecognizer *)reconizer
{
    UITableViewCell *buttonselect = (UITableViewCell *)[reconizer view];
    NSLog(@"btn %d",buttonselect.tag);
    NSIndexPath *indexPath = [Table_WorkList indexPathForCell:(UITableViewCell*)[[buttonselect superview]superview]];
    NSLog(@"index %@",indexPath);
    NSLog(@"btn %@",[NSString stringWithFormat:@"%@",[WorkList objectAtIndex:indexPath.row]]);
    
    switch (buttonselect.tag)
    {
        case 1:
        {
            
            break;
        }
        case 2:
        {
            break;
        }
        default:
            break;
    }
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
