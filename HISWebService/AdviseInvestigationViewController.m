
//  AdviseInvestigationViewController.m
//  HISWebService
//
//  Created by Rahul Sharma on 21/06/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import "AdviseInvestigationViewController.h"
#import "InvestigationWorkListDetailsViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "RadioButton.h"
#import "Shared.h"
#import "Delivery_Mode.h"

#define Kwidth 320

@interface AdviseInvestigationViewController ()

@end

@implementation AdviseInvestigationViewController

@synthesize WebService=_WebService,Testname,DateTime,LocationID,CaseID,popover,IndexPopOver;

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
    swipe=1;
    save_indexpath=[[NSMutableArray alloc]init];
    IndexPopOver=[[NSMutableArray alloc]init];
    z1=0;
    buttonarr=[[NSMutableArray alloc]init];
    ISFreeTest=[[NSMutableArray alloc]init];
    Cellarr=[[NSMutableArray alloc]init];
    Cancelarr=[[NSMutableArray alloc]init];
    //  arrdata=[[NSMutableArray alloc]init];
      self.WebService=[[WebService alloc]init];
    
    // LogInOutViewController *login=[[LogInOutViewController alloc]init];
    
    TestCheck=TRUE;
    CheckAdvise=TRUE;
    Shared *shared=[Shared sharedUser];
    
    LocationID=shared.LocationId=[[NSUserDefaults standardUserDefaults]valueForKey:@"branch"];
    
    NSLog(@"location id %@",LocationID);
    
    NSLog(@"branch %@ and app %@",shared.BranchID,shared.ApplicationId);
    
    copyListOfItems = [[NSMutableArray alloc] init];

    
    [self.view addSubview:toolbar];
    toolbar.hidden=YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    tap.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap];
    // [self.view addGestureRecognizer:tap];
    
    if(CaseID==NULL)
    {
    view1=[[UIView alloc]initWithFrame:CGRectMake(0,64,320,50)];
    view1.backgroundColor=[UIColor whiteColor];
    [view1 setIsAccessibilityElement:YES];
    view1.userInteractionEnabled=YES;
    view1.autoresizingMask = UIViewAutoresizingFlexibleWidth ;
    view1.layer.borderColor = [UIColor grayColor].CGColor;
    view1.layer.borderWidth = 1.0f;
    [self.view addSubview:view1];
    scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0,64,320,540)];

    
    UILabel *PatientSearch=[[UILabel alloc]initWithFrame:CGRectMake(20,10,120,40)];
    PatientSearch.font = [UIFont systemFontOfSize:12.0];
    PatientSearch.backgroundColor=[UIColor whiteColor];
    [PatientSearch setText:@"Search Patient:"];
    [view1 addSubview:PatientSearch];
    
    
    patientname=[[UITextField alloc]initWithFrame:CGRectMake(130,10,170,35)];
    patientname.font = [UIFont boldSystemFontOfSize:12.0];
    //the horizontal alignment of the text
    patientname.textAlignment = NSTextAlignmentLeft;
    // patientname.tag=1;
    patientname.borderStyle = UITextBorderStyleBezel;
    patientname.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
    patientname.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    patientname.delegate =self;
    [view1 addSubview:patientname];
    
    [patientname addTarget:self action:@selector(SearchPatients:)forControlEvents:UIControlEventEditingChanged];
    
    
    UILabel *Patientcode=[[UILabel alloc]initWithFrame:CGRectMake(10,120,140,30)];
    Patientcode.font = [UIFont systemFontOfSize:12.0];
    Patientcode.backgroundColor=[UIColor whiteColor];
    [Patientcode setText:@"Patient Code:"];
    [self.view addSubview:Patientcode];
    PatientCodeVal=[[UILabel alloc]initWithFrame:CGRectMake(150,120,170,30)];
    PatientCodeVal.font =[UIFont boldSystemFontOfSize:12.0];
    PatientCodeVal.backgroundColor=[UIColor whiteColor];
    
    [self.view addSubview:PatientCodeVal];

    UILabel *AdviseDate=[[UILabel alloc]initWithFrame:CGRectMake(10,160,140,30)];
    AdviseDate.font = [UIFont systemFontOfSize:12.0];
    AdviseDate.backgroundColor=[UIColor whiteColor];
    [AdviseDate setText:@"Advise Date:"];
    [self.view addSubview:AdviseDate];
    
    DORegistration=[[UITextField alloc]initWithFrame:CGRectMake(150,160,150,30)];
    DORegistration.tag=1;
    DORegistration.delegate=self;
    DORegistration.borderStyle = UITextBorderStyleLine;
    DORegistration.font = [UIFont boldSystemFontOfSize:12.0];
    [self.view addSubview:DORegistration];
    date = [NSDate date];
    
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MM/yyyy HH:mm:ss"];
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    
    DORegistration.text = [formatter stringFromDate:date];
    [formatter setDateFormat:@"dd/MM/yyyy HH:mm:ss"];
    theDate = [formatter stringFromDate:date];
    NSLog(@"date %@",theDate);
    
    [formatter setDateFormat:@"yyMMddHHmmssSSS"];
    unsigned long long c= [[formatter stringFromDate:date] longLongValue];
    NSLog(@"date 0x%02llx",c);
    
    hexStr=[NSString stringWithFormat:@"%llx",c];
    
    NSLog(@"str %@",hexStr);
    
    UILabel *AdviseDoctor=[[UILabel alloc]initWithFrame:CGRectMake(10,200,140,30)];
    AdviseDoctor.font = [UIFont systemFontOfSize:12.0];
    AdviseDoctor.backgroundColor=[UIColor whiteColor];
    [AdviseDoctor setText:@"Advise By Doctor:"];
    [self.view addSubview:AdviseDoctor];
    
    AdviseDr=[[UITextField alloc]initWithFrame:CGRectMake(150,200,130,30)];
    AdviseDr.font = [UIFont boldSystemFontOfSize:12.0];
    AdviseDr.borderStyle = UITextBorderStyleLine;
    AdviseDr.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    AdviseDr.delegate =self;
    AdviseDr.tag=2;
    [self.view addSubview:AdviseDr];
    
    
    CheckMark=[[UIButton alloc]initWithFrame:CGRectMake(280,200,30,30)];
    CheckMark.tag=1;
    [CheckMark setImage:[UIImage imageNamed:@"DownTriangle1"]forState:UIControlStateNormal];
    //CheckMark.backgroundColor=[UIColor grayColor];
    [CheckMark addTarget:self action:@selector(btnpress:)forControlEvents:UIControlEventTouchUpInside];
    imageLayer = CheckMark.layer;
    [imageLayer setCornerRadius:02];
    [imageLayer setBorderWidth:1];
    imageLayer.borderColor=[[UIColor blackColor] CGColor];
    [self.view addSubview:CheckMark];
    [AdviseDr addTarget:self action:@selector(SearchPatients1:)forControlEvents:UIControlEventEditingChanged];
    
    UILabel *MedicalFacility=[[UILabel alloc]initWithFrame:CGRectMake(10,240,140,30)];
    MedicalFacility.font = [UIFont systemFontOfSize:12.0];
    MedicalFacility.backgroundColor=[UIColor whiteColor];
    [MedicalFacility setText:@"MedicalFacility:"];
    [self.view addSubview:MedicalFacility];
    Medicalfacility=[[UITextField alloc]initWithFrame:CGRectMake(150,240,130,30)];
    Medicalfacility.font = [UIFont boldSystemFontOfSize:12.0];
    Medicalfacility.borderStyle = UITextBorderStyleLine;
    Medicalfacility.delegate =self;
    Medicalfacility.tag=3;
    [self.view addSubview:Medicalfacility];
    
    CheckMark=[[UIButton alloc]initWithFrame:CGRectMake(280,240,30,30)];
    CheckMark.tag=2;
    [CheckMark setImage:[UIImage imageNamed:@"DownTriangle1"]forState:UIControlStateNormal];
    //CheckMark.backgroundColor=[UIColor grayColor];
    [CheckMark addTarget:self action:@selector(btnpress:)forControlEvents:UIControlEventTouchUpInside];
    imageLayer = CheckMark.layer;
    [imageLayer setCornerRadius:02];
    [imageLayer setBorderWidth:1];
    imageLayer.borderColor=[[UIColor blackColor] CGColor];
    [self.view addSubview:CheckMark];
    [Medicalfacility addTarget:self action:@selector(SearchPatients1:)forControlEvents:UIControlEventEditingChanged];
    
    UILabel *Location=[[UILabel alloc]initWithFrame:CGRectMake(10,280,140,30)];
    Location.font = [UIFont systemFontOfSize:12.0];
    Location.backgroundColor=[UIColor whiteColor];
    [Location setText:@"Locations:"];
    [self.view addSubview:Location];
    location=[[UITextField alloc]initWithFrame:CGRectMake(150,280,160,30)];
    location.font = [UIFont boldSystemFontOfSize:12.0];
    location.borderStyle = UITextBorderStyleLine;
    location.delegate =self;
    location.tag=4;
    [self.view addSubview:location];
    [self.WebService CallServiceMedicalFacilityGetAllBranches:@"http://192.168.1.202:81//LocationModule/LocationService.asmx/GetAllBranches" Object:NULL Handler:NULL];
    
    Location_detail=(NSMutableArray*)self.WebService->ptr1;
    Location_View=(NSMutableArray*)[Location_detail valueForKey:@"Name"];
    NSLog(@"sal is %@",Location_detail);
    NSLog(@"sal is %@",Location_View);
    for(int i=0;i<Location_detail.count;i++)
    {
        
        if([LocationID isEqualToString:[[Location_detail objectAtIndex:i]valueForKey:@"LocationId"]])
        {
            
            location.text=[NSString stringWithFormat:@"%@",[[Location_detail objectAtIndex:i]valueForKey:@"Name"]];
            break;
        }
    }
    
    // [location addTarget:self action:@selector(SearchPatients1:)forControlEvents:UIControlEventEditingDidBegin];
    
    UILabel *panel=[[UILabel alloc]initWithFrame:CGRectMake(10,320,140,30)];
    panel.font = [UIFont systemFontOfSize:12.0];
    panel.backgroundColor=[UIColor whiteColor];
    [panel setText:@"Select Panel:"];
    [self.view addSubview:panel];
    
    Panel=[[UITextField alloc]initWithFrame:CGRectMake(150,320,160,30)];
    Panel.font = [UIFont boldSystemFontOfSize:12.0];
    Panel.borderStyle = UITextBorderStyleLine;
    
    //  Panel.placeholder = @"<enter text>";
    // AdviseDr.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    Panel.delegate =self;
    Panel.tag=5;
    [self.view addSubview:Panel];
    NSLog(@"branch %@",self.WebService->Branchid=LocationID);
    
    [self.WebService CallServiceMedicalFacilityGetAllPanelsWithNone:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/GetAllPanelsWithNone" Object:NULL Handler:NULL];
    Panel_detail=(NSMutableArray*)self.WebService->ptr1;
    Panel_View=(NSMutableArray*)[Panel_detail valueForKey:@"Name"];
    NSLog(@"sal is %@",Panel_View);
    NSLog(@"sal is %@",Panel_detail);
    
    Panel.text=[NSString stringWithFormat:@"%@",[[Panel_detail objectAtIndex:0]valueForKey:@"Name"]];
    PanelValue=[NSString stringWithFormat:@"%@",[[Panel_detail objectAtIndex:0]valueForKey:@"PackageId"]];
    //[Panel addTarget:self action:@selector(SearchPatients1:)forControlEvents:UIControlEventEditingDidBegin];
    
    UILabel *CollectedBy=[[UILabel alloc]initWithFrame:CGRectMake(10,360,140,30)];
    CollectedBy.font = [UIFont systemFontOfSize:12.0];
    CollectedBy.backgroundColor=[UIColor whiteColor];
    [CollectedBy setText:@"To be Collected by:"];
    [self.view addSubview:CollectedBy];
    
    [self.WebService CallServiceGetStaffByRoleName:@"http://192.168.1.202:81//StaffModule/StaffService.asmx/GetStaffByRoleName" Object:NULL Handler:NULL];
    
    NSLog(@"role is %@",self.WebService->ptr1);
    
    StaffName_Details=(NSMutableArray*)self.WebService->ptr1;
    Staff_Names=(NSMutableArray*)[StaffName_Details valueForKey:@"StaffName"];
    NSLog(@"staff name is %@",Staff_Names);
    
    ToCollectedBy=[[UITextField alloc]initWithFrame:CGRectMake(150,360,160,30)];
    ToCollectedBy.font = [UIFont boldSystemFontOfSize:12.0];
    ToCollectedBy.borderStyle = UITextBorderStyleLine;
    // ToCollectedBy.placeholder = @"<Select Staff>";
    ToCollectedBy.delegate =self;
    ToCollectedBy.tag=8;
    [self.view addSubview:ToCollectedBy];
    ToCollectedBy.text=[NSString stringWithFormat:@"%@",[[StaffName_Details objectAtIndex:0]valueForKey:@"StaffName"]];
    CollectionStaffID=[NSString stringWithFormat:@"%@",[[StaffName_Details objectAtIndex:0]valueForKey:@"StaffId"]];
    NSLog(@"collection %@",CollectionStaffID);

    UILabel *PatientAddress=[[UILabel alloc]initWithFrame:CGRectMake(10,400,140,30)];
    PatientAddress.font = [UIFont systemFontOfSize:12.0];
    PatientAddress.backgroundColor=[UIColor whiteColor];
    [PatientAddress setText:@"Patient Address:"];
    [self.view addSubview:PatientAddress];
    
    textview_Address=[[UITextView alloc]initWithFrame:CGRectMake(150,400,160,40)];
    textview_Address.font=[UIFont boldSystemFontOfSize:12.0];
    textview_Address.delegate=self;
    textview_Address.tag=6;
    imageLayer = textview_Address.layer;
    [imageLayer setCornerRadius:05];
    [imageLayer setBorderWidth:1];
    imageLayer.borderColor=[[UIColor blackColor] CGColor];
    //  [textview_Address sizeToFit];
    //some other setup like setting the font for the UITextView...
    [self.view addSubview:textview_Address];
    
    UILabel *Remark=[[UILabel alloc]initWithFrame:CGRectMake(10,450,140,30)];
    Remark.font = [UIFont systemFontOfSize:12.0];
    // Remark.backgroundColor=[UIColor whiteColor];
    [Remark setText:@"Remarks:"];
    [self.view addSubview:Remark];
    textview_Remark=[[UITextView alloc]initWithFrame:CGRectMake(150,450,160,40)];
    // textview_Remark.text = [NSString stringWithFormat:@"%@",Result];
    textview_Remark.font=[UIFont boldSystemFontOfSize:12.0];
    textview_Remark.tag=7;
    textview_Remark.delegate=self;
    //some other setup like setting the font for the UITextView...s
    imageLayer = textview_Remark.layer;
    [imageLayer setCornerRadius:05];
    [imageLayer setBorderWidth:1];
    imageLayer.borderColor=[[UIColor blackColor] CGColor];
    [self.view addSubview:textview_Remark];
    
    // [ToCollectedBy addTarget:self action:@selector(SearchPatients1:)forControlEvents:UIControlEventEditingDidBegin];
    
    advise=[[UIButton alloc]initWithFrame:CGRectMake(20, 510, 120, 30)];
    advise.backgroundColor=[UIColor colorWithRed:128/256. green:128/256. blue:128/256. alpha:1];
    [advise setTitle:@"Advise" forState:UIControlStateNormal];
    advise.userInteractionEnabled=NO;
    [advise addTarget:self action:@selector(advisetest)forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:advise];
        
        
        [self.WebService CallServiceGetDoctors:@"http://192.168.1.202:81//StaffModule/StaffService.asmx/GetAdviseDoctors" Object:NULL Handler:NULL];
        Advise_DoctorDetail=(NSMutableArray*)self.WebService->ptr1;
        Advise_Doctor=(NSMutableArray*)[Advise_DoctorDetail valueForKey:@"StaffName"];
        NSLog(@"sal is %@",Advise_DoctorDetail);
        NSLog(@"sal is %@",Advise_Doctor);
 
        [self.WebService CallServiceMedicalFacilityWithNone:@"http://192.168.1.202:81/LocationModule/LocationService.asmx/GetAllMedicalFacilitiesWithMainBranchWithNone" Object:NULL Handler:NULL];
        MedicalFacility_detail=(NSMutableArray*)self.WebService->ptr1;
        MedicalFacility_View=(NSMutableArray*)[MedicalFacility_detail valueForKey:@"Name"];
        NSLog(@"sal is %@",MedicalFacility_detail);
        NSLog(@"sal is %@",MedicalFacility_View);

        
        
    }
    else if (CaseID!=NULL)
    {
        scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0,0,320,540)];

        CheckAdvise=FALSE;
        [self advisetest];
     
        
    }
    
//    if(CaseID!=NULL)
//    {
//        view1.hidden=YES;
//        view2.hidden=YES;
//        
//        scrollview=[[UIView alloc]initWithFrame:CGRectMake(0,0,350,1050)];
//        view3.backgroundColor=[UIColor whiteColor];
//        [view3 setIsAccessibilityElement:YES];
//        view3.userInteractionEnabled=YES;
//        view3.autoresizingMask = UIViewAutoresizingFlexibleWidth ;
//        
//        view3.layer.borderColor = [UIColor grayColor].CGColor;
//        view3.layer.borderWidth = 1.0f;
//        [scrollview addSubview:view3];
//        [self donebtn:nil];
//        
//    }
//    else
//    {
//        view3=[[UIView alloc]initWithFrame:CGRectMake(0,440,320,1050)];
//        view3.backgroundColor=[UIColor whiteColor];
//        [view3 setIsAccessibilityElement:YES];
//        view3.userInteractionEnabled=YES;
//        view3.autoresizingMask = UIViewAutoresizingFlexibleWidth ;
//        
//        view3.layer.borderColor = [UIColor grayColor].CGColor;
//        view3.layer.borderWidth = 1.0f;
//        [scrollview addSubview:view3];
//    }
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}
- (void)pop:(NSIndexPath *)sender
{
//    [IndexPopOver removeAllObjects];
//    [IndexPopOver addObject:sender];
//    NSLog(@"index %@",IndexPopOver);


}
-(void)advisetest
{
    self.navigationItem.hidesBackButton=YES;
    UIBarButtonItem *Setting=[[UIBarButtonItem alloc]initWithTitle:@"Close" style:UIBarButtonItemStyleBordered target:self action:@selector(Previouspage:)];
    Setting.tag=1;
    
    self.navigationItem.rightBarButtonItem=Setting;
    
    if(CheckAdvise==FALSE)
    {
            
            
            [scrollview setContentSize:CGSizeMake(320,1050)];
            
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
            
            [self.view addSubview:toolbar];
            toolbar.hidden=YES;
            
            
            ReportDelivery=[[UIButton alloc]initWithFrame:CGRectMake(05,10,130,30)];
            ReportDelivery.titleLabel.font = [UIFont systemFontOfSize:12.0];
            ReportDelivery.backgroundColor=[UIColor grayColor];
            
           [ReportDelivery addTarget:self action:@selector(report_delivery:) forControlEvents:UIControlEventTouchUpInside];
            [ReportDelivery setTitle:@"Select Delivery Mode:" forState:normal];
            [scrollview addSubview:ReportDelivery];
            
//            UILabel *Email=[[UILabel alloc]initWithFrame:CGRectMake(150,10,50,30)];
//            Email.font = [UIFont systemFontOfSize:12.0];
//            Email.backgroundColor=[UIColor whiteColor];
//            [Email setText:@"Email"];
//            //[scrollview addSubview:Email];
//            SelectButton_Email=[[UIButton alloc]initWithFrame:CGRectMake(130,10,20,30)];
//            [SelectButton_Email setImage:[UIImage imageNamed:@"images-20"]forState:UIControlStateNormal];
//            SelectButton_Email.tag=1;
//            [SelectButton_Email addTarget:self action:@selector(SelecteButton:)forControlEvents:UIControlEventTouchUpInside];
//            // [scrollview addSubview:SelectButton_Email];
//            
//            UILabel *HospitalDr=[[UILabel alloc]initWithFrame:CGRectMake(225,10,120,30)];
//            HospitalDr.font = [UIFont systemFontOfSize:12.0];
//            HospitalDr.backgroundColor=[UIColor whiteColor];
//            [HospitalDr setText:@"Hospital/Doctor"];
//            // [scrollview addSubview:HospitalDr];
//            SelectButton_Hospital=[[UIButton alloc]initWithFrame:CGRectMake(200,10,20,30)];
//            SelectButton_Hospital.tag=2;
//            [SelectButton_Hospital setImage:[UIImage imageNamed:@"images-20"]forState:UIControlStateNormal];
//            [SelectButton_Hospital addTarget:self action:@selector(SelecteButton:)forControlEvents:UIControlEventTouchUpInside];
//            // [scrollview addSubview:SelectButton_Hospital];
//            
//            UILabel *Courier=[[UILabel alloc]initWithFrame:CGRectMake(100,50,60,30)];
//            Courier.font = [UIFont systemFontOfSize:12.0];
//            Courier.backgroundColor=[UIColor whiteColor];
//            [Courier setText:@"Courier"];
//            //[scrollview addSubview:Courier];
//            SelectButton_Courier=[[UIButton alloc]initWithFrame:CGRectMake(80,50,20,30)];
//            SelectButton_Courier.tag=3;
//            [SelectButton_Courier setImage:[UIImage imageNamed:@"images-20"]forState:UIControlStateNormal];
//            [SelectButton_Courier addTarget:self action:@selector(SelecteButton:)forControlEvents:UIControlEventTouchUpInside];
//           // [scrollview addSubview:SelectButton_Courier];
//            
//            UILabel *Self=[[UILabel alloc]initWithFrame:CGRectMake(170,50,40,30)];
//            Self.font = [UIFont systemFontOfSize:12.0];
//            Self.backgroundColor=[UIColor whiteColor];
//            [Self setText:@"Self"];
//            // [scrollview addSubview:Self];
//            
//            SelectButton_self=[[UIButton alloc]initWithFrame:CGRectMake(150,50,20,30)];
//            [SelectButton_self setImage:[UIImage imageNamed:@"images-20"]forState:UIControlStateNormal];
//            SelectButton_self.tag=4;
//            [SelectButton_self addTarget:self action:@selector(SelecteButton:)forControlEvents:UIControlEventTouchUpInside];
//           //[scrollview addSubview:SelectButton_self];
//            UILabel *DirectHand=[[UILabel alloc]initWithFrame:CGRectMake(230,50,100,30)];
//            DirectHand.font = [UIFont systemFontOfSize:12.0];
//            DirectHand.backgroundColor=[UIColor whiteColor];
//            // [DirectHand setText:@"Direct/ByHand"];
//            // [scrollview addSubview:DirectHand];
//            
//            SelectButton_DirectHand=[[UIButton alloc]initWithFrame:CGRectMake(210,50,20,30)];
//            SelectButton_DirectHand.tag=5;
//            [SelectButton_DirectHand setImage:[UIImage imageNamed:@"images-20"]forState:UIControlStateNormal];
//            [SelectButton_DirectHand addTarget:self action:@selector(SelecteButton:)forControlEvents:UIControlEventTouchUpInside];
//            //[scrollview addSubview:SelectButton_DirectHand];
//            
            UILabel *UrgentReport=[[UILabel alloc]initWithFrame:CGRectMake(30,55,100,30)];
            UrgentReport.font = [UIFont systemFontOfSize:12.0];
            UrgentReport.backgroundColor=[UIColor whiteColor];
            [UrgentReport setText:@"Urgent Report:"];
            [scrollview addSubview:UrgentReport];
            
            CheckMark=[[UIButton alloc]initWithFrame:CGRectMake(10,60,20,20)];
            //CheckMark.backgroundColor=[UIColor grayColor];
           [CheckMark setImage:[UIImage imageNamed:@""]forState:UIControlStateNormal];
           [CheckMark setImage:[UIImage imageNamed:@"imagesCheck"] forState:UIControlStateSelected];
        
            [CheckMark addTarget:self action:@selector(btnpress:)forControlEvents:UIControlEventTouchUpInside];
            CheckMark.tag=3;
            imageLayer = CheckMark.layer;
            [imageLayer setCornerRadius:05];
            [imageLayer setBorderWidth:1];
            imageLayer.borderColor=[[UIColor lightGrayColor]CGColor];
            [scrollview addSubview:CheckMark];
            
            [self donebtn:nil];
            CheckAdvise=TRUE;
            }
   else
       {
           scrollview.hidden=NO;
            scrollview.hidden=NO;
           }
}
-(void)Previouspage:(UIBarButtonItem*)sender
{
           scrollview.hidden=YES;
          scrollview.hidden=YES;
   // [scrollview removeFromSuperview];
            self.navigationItem.rightBarButtonItems=nil;
            self.navigationItem.hidesBackButton=NO;
    
    if(CaseID!=NULL)
    {
        
        NSArray *array = [self.navigationController viewControllers];
        NSLog(@"controller %@",array);
        
        
        for (int i= 0 ; i < [[self.navigationController viewControllers]count] ; i++)
        {
            if ( [[[self.navigationController viewControllers] objectAtIndex:i] isKindOfClass:[InvestigationWorkListDetailsViewController class]])
            {
                [self.navigationController popToViewController:[array objectAtIndex:i] animated:YES];
            }
        }

    }
    
}
-(void)report_delivery:(UIButton*)sender
{
    
   Delivery_Mode *contentViewController = [[Delivery_Mode alloc]initWithStyle:UITableViewStylePlain];
   //self.popoverController = [[WEPopoverController alloc] initWithContentViewController:contentViewController];
   
   popover=[[FPPopoverController alloc]initWithViewController:contentViewController];
   popover.contentSize=CGSizeMake(170, 170);
   contentViewController.advise=self;
   // contentViewController.Flag=1;
   // self.contentSizeForViewInPopover = CGSizeMake(200, 200);
   // data1=[[NSMutableArray alloc]initWithObjects:@"rahul",@"sharma",nil];
   // NSLog(@"data %@",data1);
   popover.border=YES;
   popover.arrowDirection=FPPopoverArrowDirectionLeft;
   popover.tint=FPPopoverBlackTint;
   
   //contentViewController.category=(NSMutableArray*)data1;
   [popover presentPopoverFromView:sender];
   
   // NSLog(@"count %d",CommentList.count);
    
    
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [Testname resignFirstResponder];
    [patientname resignFirstResponder];
    [AdviseDr resignFirstResponder];
    [Medicalfacility resignFirstResponder];
    [discount resignFirstResponder];
    [initialamount resignFirstResponder];
    
}
-(void)dismissKeyboard
{
    //table_SearchPatient.hidden=YES;
    [Testname resignFirstResponder];
    [patientname resignFirstResponder];
    [AdviseDr resignFirstResponder];
    [Medicalfacility resignFirstResponder];
     [discount resignFirstResponder];
    [initialamount resignFirstResponder];

}
-(IBAction)SearchPatients:(id)sender
{
    CheckAdvise=FALSE;
    [Testname removeFromSuperview];
    [table_SearchPatient removeFromSuperview];
    [tabel_AdviseTest removeFromSuperview];
    PatientName=patientname.text;
    NSLog(@"patname %@",PatientName);
    Count=@"0";
    NSLog(@"patname %@",self.WebService->patientname=PatientName);
    NSLog(@"count %@",self.WebService->count=Count);
    
    [self.WebService CallServicePatientNames:@"http://192.168.1.202:81/PatientModule/PatientService.asmx/SearchPatientjquery" Object:NULL Handler:NULL];
    
    table_SearchPatient=[[UITableView alloc]initWithFrame:CGRectMake(130,110,170,200)style:UITableViewStylePlain];
    table_SearchPatient.delegate=self;
    table_SearchPatient.dataSource=self;
    table_SearchPatient.layer.borderWidth = 2.0;
    table_SearchPatient.layer.borderColor = [UIColor grayColor].CGColor;
    [self.view addSubview:table_SearchPatient];
    SearchPatientDetail=[[NSMutableArray alloc]init];
    SearchPatientName=[[NSMutableArray alloc]init];
    NSLog(@"arr is %@",self.WebService->ptr1);
    SearchPatientDetail=(NSMutableArray*)self.WebService->ptr1 ;
    // NSLog(@"item is %@",   SearchPatientDetail);
    SearchPatientName  =(NSMutableArray *)[SearchPatientDetail valueForKey:@"Name"];
    NSLog(@"item is %@",SearchPatientName);
    
    //  toolbar.userInteractionEnabled=YES;
     // Do any additional setup after loading the view from its nib.
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    text_tag=textField.tag;
    
    if(textField.tag==1)
    {
        toolbar.hidden=NO;
        // [DatePicker removeFromSuperview];
        if ([[UIScreen mainScreen] bounds].size.height >480)
        {
            DatePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0,352,320,216)];
        }
        else
        {
            DatePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0,270,320,216)];
        }
        DatePicker.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        DatePicker.tag=1;
        // DatePicker.datePickerMode = UIDatePickerModeDate;
        DatePicker.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
        
        DatePicker.userInteractionEnabled=YES;
        [self.view addSubview:DatePicker];
        //  return YES;
    }
    //    if(textField.tag==2)
    //    {
    //        searching=NO;
    //        table_MedicalFacility.hidden=YES;
    //
    //        [table_AdviseDoctor removeFromSuperview];
    ////        PatientName=AdviseDr.text;
    ////        NSLog(@"patname %@",PatientName);
    ////        Count=@"0";
    ////        // [Testname resignFirstResponder];
    ////        NSLog(@"patname %@",self.WebService->patientname=PatientName);
    ////        NSLog(@"count %@",self.WebService->count=Count);
    ////
    ////        [self.WebService CallServicePatientNames:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/SearchAdviseDoctors" Object:NULL Handler:NULL];
    ////
    ////        Advise_DoctorDetail=(NSMutableArray*)self.WebService->ptr1;
    ////        Advise_Doctor=(NSMutableArray*)[Advise_DoctorDetail valueForKey:@"StaffName"];
    ////        NSLog(@"sal is %@",Advise_DoctorDetail);
    ////        NSLog(@"sal is %@",Advise_Doctor);
    //
    //        table_AdviseDoctor=[[UITableView alloc]initWithFrame:CGRectMake(150,140,160,150)style:UITableViewStylePlain];
    //        table_AdviseDoctor.delegate=self;
    //        table_AdviseDoctor.dataSource=self;
    //        table_AdviseDoctor.layer.borderWidth = 2.0;
    //        table_AdviseDoctor.layer.borderColor = [UIColor grayColor].CGColor;
    //        [scrollview addSubview:table_AdviseDoctor];
    //
    //    }
    //    if(textField.tag==3)
    //    {
    //        table_AdviseDoctor.hidden=YES;
    //        [table_MedicalFacility removeFromSuperview];
    //        PatientName=Medicalfacility.text;
    //        NSLog(@"patname %@",PatientName);
    //        Count=@"0";
    //        // [Testname resignFirstResponder];
    //        NSLog(@"patname %@",self.WebService->patientname=PatientName);
    //        NSLog(@"count %@",self.WebService->count=Count);
    //
    //        [self.WebService CallServicePatientNames:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/SearchMedicalFacilities" Object:NULL Handler:NULL];
    //
    //
    //        MedicalFacility_detail=(NSMutableArray*)self.WebService->ptr1;
    //        MedicalFacility_View=(NSMutableArray*)[MedicalFacility_detail valueForKey:@"Name"];
    //        NSLog(@"sal is %@",MedicalFacility_detail);
    //        NSLog(@"sal is %@",MedicalFacility_View);
    //
    //
    //        table_MedicalFacility=[[UITableView alloc]initWithFrame:CGRectMake(150,180,160,150)style:UITableViewStylePlain];
    //        table_MedicalFacility.delegate=self;
    //        table_MedicalFacility.dataSource=self;
    //        table_MedicalFacility.layer.borderWidth = 2.0;
    //        table_MedicalFacility.layer.borderColor = [UIColor grayColor].CGColor;
    //        [scrollview addSubview:table_MedicalFacility];
    //
    //    }
    //
    if(textField.tag==4)
    {
        
        // [location resignFirstResponder];
        //   [table_AdviseDoctor removeFromSuperview];
        //  [table_MedicalFacility removeFromSuperview];
        //  [table_Location removeFromSuperview];
        
        //            [self.WebService CallServiceMedicalFacilityGetAllBranches:@"http://192.168.1.202:81//LocationModule/LocationService.asmx/GetAllBranches" Object:NULL Handler:NULL];
        //
        //            Location_detail=(NSMutableArray*)self.WebService->ptr1;
        //            Location_View=(NSMutableArray*)[Location_detail valueForKey:@"Name"];
        //            NSLog(@"sal is %@",Location_detail);
        //            NSLog(@"sal is %@",Location_View);
        
        table_Location=[[UITableView alloc]initWithFrame:CGRectMake(150,310,160,150)style:UITableViewStylePlain];
        table_Location.delegate=self;
        table_Location.dataSource=self;
        table_Location.layer.borderWidth = 2.0;
        table_Location.layer.borderColor = [UIColor grayColor].CGColor;
        [self.view addSubview:table_Location];
        
    }
    
    if(textField.tag==5)
    {
        //[Panel resignFirstResponder];
        //[table_Panel removeFromSuperview];
        CheckAdvise=FALSE;
        table_Panel=[[UITableView alloc]initWithFrame:CGRectMake(150,350,160,150)style:UITableViewStylePlain];
        table_Panel.delegate=self;
        table_Panel.dataSource=self;
        table_Panel.layer.borderWidth = 2.0;
        table_Panel.layer.borderColor = [UIColor grayColor].CGColor;
        [self.view addSubview:table_Panel];
        
        
    }
    
    if(textField.tag==8)
    {
        // [table_CollectionName removeFromSuperview];
        table_CollectionName=[[UITableView alloc]initWithFrame:CGRectMake(150,390,160,150)style:UITableViewStylePlain];
        table_CollectionName.delegate=self;
        table_CollectionName.dataSource=self;
        table_CollectionName.layer.borderWidth = 2.0;
        table_CollectionName.layer.borderColor = [UIColor grayColor].CGColor;
        [self.view addSubview:table_CollectionName];
    }
    if(textField.tag==9)
    {
        // [Delivery_Staff resignFirstResponder];
        //[table_StaffNames removeFromSuperview];
        table_StaffNames=[[UITableView alloc]initWithFrame:CGRectMake(150,40,160,150)style:UITableViewStylePlain];
        table_StaffNames.delegate=self;
        table_StaffNames.dataSource=self;
        table_StaffNames.layer.borderWidth = 2.0;
        table_StaffNames.layer.borderColor = [UIColor grayColor].CGColor;
        [scrollview addSubview:table_StaffNames];
        
    }
    if(textField.tag==10)
    {
        toolbar.hidden=NO;
        //[DateTime resignFirstResponder];
        // done.hidden=NO;
        //DatePicker1.hidden=YES;
        if ([[UIScreen mainScreen] bounds].size.height >480)
        {
            DatePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0,352,320,216)];
        }
        else
        {
            DatePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0,270,320,216)];
        }
        DatePicker.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        // DatePicker.datePickerMode = UIDatePickerModeDate;
        DatePicker.tag=2;
        DatePicker.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
        
        DatePicker.datePickerMode = UIDatePickerModeDateAndTime;
        DatePicker.date =[[ NSDate alloc ] initWithTimeIntervalSinceNow:(NSTimeInterval) 2];
        DatePicker.minimumDate =[[ NSDate alloc ] initWithTimeIntervalSinceNow:(NSTimeInterval) 0];
        
        DatePicker.userInteractionEnabled=YES;
        [self.view addSubview:DatePicker];
    }
    
    return  YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    // patientname = textField;
    if(textField.tag==1)
    {
        [textField resignFirstResponder];
    }
    
    if(textField.tag==4)
    {
        [textField resignFirstResponder];
    }
    if(textField.tag==5)
    {
        [textField resignFirstResponder];
    }
    if(textField.tag==8)
    {
        [textField resignFirstResponder];
    }
    
    if(textField.tag==9)
    {
        [textField resignFirstResponder];
    }
    if(textField.tag==10)
    {
        [textField resignFirstResponder];
    }
    
    if(textField == TotalCharge)
    {
    	[TotalCharge setUserInteractionEnabled:NO];
    }
    if(textField == netcharges)
    {
    	[netcharges setUserInteractionEnabled:NO];
    }
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    table_AdviseDoctor.hidden=YES;
    table_MedicalFacility.hidden=YES;
    
    table_SearchPatient.hidden=YES;
    table_SearchTestName.hidden=YES;
    return YES;
}


-(IBAction)donebtn:(id)sender
{

    Check=TRUE;
    Isurgent=@"0";
    DiscountINPerc=@"true";
    DiscountBreakUP=@"false";
    Urgenttime=(NSString*)[NSNull null];
    
    Labeltxt=[[NSMutableArray alloc]init];
    LabelArr=[[NSMutableArray alloc]init];
    AdviseTest=[[NSMutableArray alloc]init];
    ChargeVal=[[NSMutableArray alloc]init];
    ChargeArr =[[NSMutableArray alloc]init];
    Test_ID=[[NSMutableArray alloc]init];
    repotstatus=[[NSMutableArray alloc]init];
    Investigatio_ID=[[NSMutableArray alloc]init];
    tble_scroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0,140, 320, 320)];
    [tble_scroll setContentSize:CGSizeMake(Kwidth,304)];
    //tble_scroll.backgroundColor=[UIColor brownColor];
    
//    pre=[[UIButton alloc ]initWithFrame:CGRectMake(0, 185, 40, 30)];
//    [pre setTitle:@"<" forState:UIControlStateNormal];
//    [pre setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    // pre.backgroundColor=[UIColor redColor];
//    pre.enabled=NO;
//    [pre addTarget:self action:@selector(previous) forControlEvents:UIControlEventTouchUpInside];
//    [scrollview addSubview: pre];
//    next=[[UIButton alloc ]initWithFrame:CGRectMake(280, 185, 40, 30)];
//    // next.backgroundColor=[UIColor redColor];
//    [next setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [next setTitle:@">" forState:UIControlStateNormal];
//    [next addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
//    
//    [scrollview addSubview: next];
    
    [scrollview addSubview:tble_scroll];
    if(CaseID!=NULL)
    {
        Freetest=[[NSMutableArray alloc]init];
        CancelTest=[[NSMutableArray alloc]init];
        
        self.WebService->patientCaseID=CaseID;
        NSLog(@"case id %@",self.WebService->patientCaseID);
        [self.WebService CallServicePatientDetailsCaseID:@"http://192.168.1.202:81/LaboratoryModule/LISService.asmx/GetAdvisedInvestigationDetail" Object:NULL Handler:NULL];
        
        NSLog(@"result %@",self.WebService->ptr1);
        WorkListData=(NSMutableArray*)self.WebService->ptr1;
        
        NSLog(@"array %@",WorkListData);
        Patientid=[NSString stringWithFormat:@"%@",[[WorkListData objectAtIndex:0] valueForKey:@"PatientId"]];
        ReportStatus=[NSString stringWithFormat:@"%@",[[WorkListData objectAtIndex:0] valueForKey:@"ReportStatus"]];
         PanelValue=[NSString stringWithFormat:@"%@",[[WorkListData objectAtIndex:0] valueForKey:@"PanelId"]];
        NSArray *reportarr=[ReportStatus componentsSeparatedByString:@","];
        
        ReportStatus=[NSString stringWithFormat:@"%@",[reportarr objectAtIndex:0]];
        
        NSLog(@"report %@",ReportStatus);
        
        for(int i=0;i<WorkListData.count;i++)
        {
            NSString  *Paid_Amount =[NSString stringWithFormat:@"%@",[[WorkListData objectAtIndex:i] valueForKey:@"ActualAmount"]];
            NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"-"];
            Paid_Amount = [[Paid_Amount componentsSeparatedByCharactersInSet:doNotWant]componentsJoinedByString:@""];
            NSLog(@"%@", Paid_Amount);
            
            if([[NSString stringWithFormat:@"%@",[[WorkListData objectAtIndex:i] valueForKey:@"IsCancelled"]]isEqualToString:@"1"])
            {
                
                
                
            }
            else
            {
                
                [AdviseTest addObject:[[WorkListData objectAtIndex:i] valueForKey:@"Description"]];
                NSLog(@"worklist %@",AdviseTest);

            [ChargeVal addObject:Paid_Amount];
                
            NSLog(@"worklist1 %@",ChargeArr);
            [Investigatio_ID addObject:[[WorkListData objectAtIndex:i]valueForKey:@"InvestigationId"]];
            NSLog(@"Investigatio_ID %@",Investigatio_ID);
            
            [Test_ID addObject:[[WorkListData objectAtIndex:i]valueForKey:@"TestID"]];
            [repotstatus addObject:ReportStatus];
            [Freetest addObject:@"false"];
            [CancelTest addObject:@"false"];
           // [LabelArr addObject:[[ChargeVal objectAtIndex:i] valueForKey:@"value"]];
        
            //[Labeltxt addObject:@"0"];
            
            NSMutableDictionary *get=[[NSMutableDictionary alloc]initWithObjectsAndKeys:Paid_Amount,@"value",[NSString stringWithFormat:@"%d",i+100],@"tag", nil];
            
            [LabelArr addObject:get];
            NSLog(@"arrray %@",LabelArr);
            NSMutableDictionary *text_tag_dic=[[NSMutableDictionary alloc]initWithObjectsAndKeys:@"0",@"value",[NSString stringWithFormat:@"%d",i+200],@"tag",nil];
            [Labeltxt addObject:text_tag_dic];
            NSLog(@"lal %@ and %@",LabelArr,Labeltxt);
            }
        }
    }
    
    self.WebService->patientID=Patientid;
    [self.WebService CallServiceGetPatientRewardCategory:@"http://192.168.1.202:81//PatientModule/PatientService.asmx/GetPatientRewardCategory" Object:NULL Handler:NULL];
    
    PointsVal=[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:0]valueForKey:@"Points"]];
    NSLog(@"point is %@",PointsVal);
    [PointsVal integerValue];
    
    [self.WebService CallServiceGetAllLoyalities:@"http://192.168.1.202:81//PatientModule/PatientService.asmx/GetAllLoyalities" Object:NULL Handler:NULL];
    
    NSLog(@"value is %@",self.WebService->ptr1);
    
    for (int i=0; i<(self.WebService->ptr1).count;i++)
    {
        NSLog(@"point is %@",[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:i]valueForKey:@"RangeTo"]]);
        NSString *Resultval=[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:i]valueForKey:@"RangeTo"]];
        NSLog(@"point is %@",PointsVal);
        
        if([PointsVal integerValue]>=[Resultval integerValue])
        {
            //NSLog(@"gold");
            Point_Result=[[NSMutableArray alloc]initWithObjects:[self.WebService->ptr1 objectAtIndex:i], nil];
            NSLog(@"point result is %@",Point_Result);
            LoyalityId=[NSString stringWithFormat:@"%@",[[Point_Result objectAtIndex:0]valueForKey:@"LoyalityId"]];
            break;
            
        }
        
    }
    
    Testname=[[UITextField alloc]initWithFrame:CGRectMake(50,100,190,30)];
    Testname.font = [UIFont boldSystemFontOfSize:12.0];
    //the horizontal alignment of the text
    Testname.tag=7;
    Testname.textAlignment = NSTextAlignmentCenter;
    Testname.borderStyle = UITextBorderStyleBezel;
   Testname.placeholder = @"--Search Test--" ;
    Testname.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
    Testname.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    Testname.delegate =self;
    [scrollview addSubview:Testname];
    
    [Testname addTarget:self action:@selector(SearchPatients1:)forControlEvents:UIControlEventEditingChanged];
    
    
    TestCount=[[UILabel alloc]initWithFrame:CGRectMake(250,100,65,30)];
    TestCount.text=@"Test Count";
    //TestCount.hidden=YES;
    TestCount.font=[UIFont boldSystemFontOfSize:12.0];
    TestCount.backgroundColor=[UIColor colorWithRed:200/256. green:200/256. blue:200/256. alpha:1];
    TestCount.textAlignment = NSTextAlignmentCenter;
    [scrollview addSubview:TestCount];

    
    
    
    [self.WebService CallServiceGetPrimaryCategory:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/GetPrimaryCategory" Object:NULL Handler:NULL];
    
    NSLog(@"primary is %@",self.WebService->ptr1);
    
    PrimaryCategoryDetail=(NSMutableArray*)self.WebService->ptr1;
    PrimaryCategory=(NSMutableArray*)[PrimaryCategoryDetail valueForKey:@"PrimaryCategoryName"];
    
    tabel=[[UITableView alloc]initWithFrame:CGRectMake(05,2,310,310) style:UITableViewStylePlain];
    tabel.delegate=self;
    tabel.dataSource=self;
    tabel.layer.borderWidth = 2.0;
    tabel.layer.borderColor = [UIColor grayColor].CGColor;
    [tble_scroll addSubview:tabel];
    
    PrimaryCategoryID=[NSString stringWithFormat:@"%@",[[PrimaryCategoryDetail objectAtIndex:0]valueForKey:@"PrimaryCategoryId"]];
    
    NSLog(@"secondary id is %@", self.WebService->Primarycategory=PrimaryCategoryID);
    
    [self.WebService CallServiceGetSecondaryCategory:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/GetSecondaryCategory" Object:NULL Handler:NULL];
    
    NSLog(@"sec is %@",self.WebService->ptr1);
    
    SecondaryCategoryDetail=(NSMutableArray*)self.WebService->ptr1;
    SecondaryCategory=(NSMutableArray*)[SecondaryCategoryDetail valueForKey:@"SecondaryCategoryName"];
    
    NSLog(@"second is %@",SecondaryCategory);
    
    tabel_SecondaryID=[[UITableView alloc]initWithFrame:CGRectMake(325,2,310,300) style:UITableViewStylePlain];
    tabel_SecondaryID.delegate=self;
    tabel_SecondaryID.dataSource=self;
    tabel_SecondaryID.layer.borderWidth = 2.0;
    tabel_SecondaryID.layer.borderColor = [UIColor grayColor].CGColor;
    [tble_scroll addSubview:tabel_SecondaryID];
    
    SecondaryCategoryID=[NSString stringWithFormat:@"%@",[[SecondaryCategoryDetail objectAtIndex:0]valueForKey:@"SecondaryCategoryId"]];
    NSLog(@"secondary id is %@", self.WebService->Primarycategory=SecondaryCategoryID);
    self.WebService->Branchid=LocationID;
    self.WebService->packageId=PanelValue;
    
    [self.WebService CallServiceGetInvestigationsBySecondaryCategory:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/GetInvestigationsBySecondaryCategory" Object:NULL Handler:NULL];
    
    NSLog(@"sec is %@",self.WebService->ptr1);
    
    TestsDetail=(NSMutableArray*)self.WebService->ptr1;
    Tests=(NSMutableArray*)[TestsDetail valueForKey:@"Description"];
    
    tabel_Tests=[[UITableView alloc]initWithFrame:CGRectMake(645,2,310,300) style:UITableViewStylePlain];
    tabel_Tests.delegate=self;
    tabel_Tests.dataSource=self;
    tabel_Tests.layer.borderWidth = 2.0;
    tabel_Tests.layer.borderColor = [UIColor grayColor].CGColor;
    [tble_scroll addSubview:tabel_Tests];
    
//    tabel_AdviseTest=[[UITableView alloc]initWithFrame:CGRectMake(482,2,160,300) style:UITableViewStylePlain];
//    tabel_AdviseTest.delegate=self;
//    tabel_AdviseTest.dataSource=self;
//    [tble_scroll addSubview:tabel_AdviseTest];
//    tabel_AdviseTest.hidden=YES;
   
    
    
    UILabel *Adviseinvestigation=[[UILabel alloc]initWithFrame:CGRectMake(0,460,320,40)];
    Adviseinvestigation.text=@"Advised Investigation";
    Adviseinvestigation.font=[UIFont boldSystemFontOfSize:12.0];
    Adviseinvestigation.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
    Adviseinvestigation.textAlignment = NSTextAlignmentCenter;
    [scrollview addSubview:Adviseinvestigation];
    
    UILabel *DiscountBreakUp=[[UILabel alloc]initWithFrame:CGRectMake(10,510,120,20)];
    DiscountBreakUp.text=@"Discount BreakUp:";
    DiscountBreakUp.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:DiscountBreakUp];
    
    CheckMark=[[UIButton alloc]initWithFrame:CGRectMake(120,510,20,20)];
    //CheckMark.backgroundColor=[UIColor grayColor];
    [CheckMark addTarget:self action:@selector(btnpress:)forControlEvents:UIControlEventTouchUpInside];
    CheckMark.tag=4;
    [CheckMark setImage:[UIImage imageNamed:@"imagesCheck"] forState:UIControlStateSelected];
    [CheckMark setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    
    imageLayer = CheckMark.layer;
    [imageLayer setCornerRadius:05];
    [imageLayer setBorderWidth:1];
    imageLayer.borderColor=[[UIColor lightGrayColor] CGColor];
    //    singleTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(btnpress:)];
    //
    //    [CheckMark addGestureRecognizer:singleTap];
    //    singleTap.numberOfTapsRequired = 1;
    //
    [scrollview addSubview:CheckMark];
    Check1=TRUE;
    
    UILabel *Discount=[[UILabel alloc]initWithFrame:CGRectMake(140,510,80,20)];
    Discount.text=@"Discount(%):";
    Discount.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:Discount];
    
    _button=[[UIButton alloc]initWithFrame:CGRectMake(210,510,20,20)];
    _button.tag=1;
    _button.selected=YES;
    [_button setImage:[UIImage imageNamed:@"images-19"] forState:UIControlStateSelected];
    [_button setImage:[UIImage imageNamed:@"images-20"] forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(buttonPress_Check:) forControlEvents:UIControlEventTouchUpInside];
    //    singleTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(buttonPress_Check:)];
    //
    //    [_button addGestureRecognizer:singleTap];
    //    singleTap.numberOfTapsRequired = 1;
    
    [scrollview addSubview:_button];
    
    UILabel *DiscountRs=[[UILabel alloc]initWithFrame:CGRectMake(230,510,80,20)];
    DiscountRs.text=@"Discount(Rs):";
    DiscountRs.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:DiscountRs];
    
    _button1=[[UIButton alloc]initWithFrame:CGRectMake(300,510,20,20)];
    _button1.tag=2;
    [_button1 setImage:[UIImage imageNamed:@"images-19"] forState:UIControlStateSelected];
    [_button1 setImage:[UIImage imageNamed:@"images-20"] forState:UIControlStateNormal];
    [_button1 addTarget:self action:@selector(buttonPress_Check:) forControlEvents:UIControlEventTouchUpInside];
    //    singleTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(buttonPress_Check:)];
    //
    //    [_button1 addGestureRecognizer:singleTap];
    //    singleTap.numberOfTapsRequired = 1;
    
    [scrollview addSubview:_button1];
    
//    discount_scroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 620, 320, 110)];
//    [discount_scroll setContentSize:CGSizeMake(700,100)];
//    discount_scroll.bounces=NO;
//   // discount_scroll.backgroundColor=[UIColor brownColor];
//    [scrollview addSubview:discount_scroll];
    //discount_scroll.hidden=YES;
    
    
    table_AdviseTestDetails=[[UITableView alloc]initWithFrame:CGRectMake(1,550,320,110) style:UITableViewStylePlain];
    table_AdviseTestDetails.delegate=self;
    table_AdviseTestDetails.dataSource=self;
    table_AdviseTestDetails.layer.borderWidth = 2.0;
    table_AdviseTestDetails.layer.borderColor = [UIColor grayColor].CGColor;
    [scrollview addSubview:table_AdviseTestDetails];
   // table_AdviseTestDetails.hidden=YES;
    
    //    view1=[[UIView alloc]initWithFrame:CGRectMake(0,950,800,200)];
    //    view1.backgroundColor=[UIColor whiteColor];
    //    [view1 setIsAccessibilityElement:YES];
    //    view1.userInteractionEnabled=YES;
    //    [scrollview addSubview:view1];
    
    UILabel *TotalCharges=[[UILabel alloc]initWithFrame:CGRectMake(10,680,100,30)];
    TotalCharges.text=@"Total Charges:";
    TotalCharges.font=[UIFont boldSystemFontOfSize:12.0];
    //TotalCharges.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
    //TotalCharges.textAlignment = NSTextAlignmentCenter;
    [scrollview addSubview:TotalCharges];
    
    TotalCharge  =[[UITextField alloc]initWithFrame:CGRectMake(10,710,90,30)];
    TotalCharge.font = [UIFont boldSystemFontOfSize:12.0];
    TotalCharge.userInteractionEnabled=NO;
    //the horizontal alignment of the text
    // TotalCharge.textAlignment = NSTextAlignmentLeft;
    TotalCharge.borderStyle = UITextBorderStyleLine;
    // TotalCharge.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
    TotalCharge.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    TotalCharge.delegate =self;
    [scrollview addSubview:TotalCharge];
    
    DiscountPer=[[UILabel alloc]initWithFrame:CGRectMake(120,680,100,30)];
    DiscountPer.text=@"Discount(%):";
    DiscountPer.font=[UIFont boldSystemFontOfSize:12.0];
    // TotalCharges.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
    //TotalCharges.textAlignment = NSTextAlignmentCenter;
    [scrollview addSubview:DiscountPer];
    
    discount  =[[UITextField alloc]initWithFrame:CGRectMake(120,710,90,30)];
    discount.font = [UIFont boldSystemFontOfSize:12.0];
    discount.keyboardType=UIKeyboardTypeNumberPad;
    
    //the horizontal alignment of the text
    //discount.textAlignment = NSTextAlignmentLeft;
    discount.borderStyle = UITextBorderStyleLine;
    // discount.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
    discount.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    discount.delegate =self;
    [scrollview addSubview:discount];
    [discount addTarget:self action:@selector(discountvalue)forControlEvents:UIControlEventEditingChanged];
    
//    DiscountRuppes=[[UILabel alloc]initWithFrame:CGRectMake(120,730,340,30)];
//    DiscountRuppes.text=@"Discount(Rs):";
//    //  DiscountRuppes.font=[UIFont boldSystemFontOfSize:12.0];
//    // TotalCharges.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
//    //TotalCharges.textAlignment = NSTextAlignmentCenter;
//    [scrollview addSubview:DiscountRuppes];
//    DiscountRuppes.hidden=YES;
    
    //    discountrupees =[[UITextField alloc]initWithFrame:CGRectMake(120,770,90,30)];
    //    discountrupees.font = [UIFont boldSystemFontOfSize:12.0];
    //    //the horizontal alignment of the text
    //    discountrupees.textAlignment = NSTextAlignmentLeft;
    //    discountrupees.borderStyle = UITextBorderStyleLine;
    //    discountrupees.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
    //    discountrupees.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    //    discountrupees.delegate =self;
    //    [scrollview addSubview:discountrupees];
    //    [discountrupees addTarget:self action:@selector(discountvalue)forControlEvents:UIControlEventEditingChanged];
    
    //  discountrupees.hidden=YES;
    
    UILabel *NetCharges=[[UILabel alloc]initWithFrame:CGRectMake(230,680,90,30)];
    NetCharges.text=@"NetCharges:";
    NetCharges.font=[UIFont boldSystemFontOfSize:12.0];
    
    [scrollview addSubview:NetCharges];
    
    netcharges  =[[UITextField alloc]initWithFrame:CGRectMake(220,710,90,30)];
    netcharges.font = [UIFont boldSystemFontOfSize:12.0];
    //the horizontal alignment of the text
    netcharges.userInteractionEnabled=NO;
    netcharges.textAlignment = NSTextAlignmentLeft;
    netcharges.borderStyle = UITextBorderStyleLine;
    netcharges.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
    netcharges.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    netcharges.delegate =self;
    [scrollview addSubview:netcharges];
    
    
    UILabel *InitialAmount=[[UILabel alloc]initWithFrame:CGRectMake(10,750,100,30)];
    InitialAmount.text=@"InitialAmount:";
    InitialAmount.font=[UIFont boldSystemFontOfSize:12.0];
    [scrollview addSubview:InitialAmount];
    
    initialamount =[[UITextField alloc]initWithFrame:CGRectMake(10,790,90,30)];
    initialamount.font = [UIFont boldSystemFontOfSize:12.0];
    //the horizontal alignment of the text
    initialamount.keyboardType=UIKeyboardTypeNumberPad;
    
    initialamount.textAlignment = NSTextAlignmentLeft;
    initialamount.borderStyle = UITextBorderStyleLine;
    initialamount.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
    initialamount.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    initialamount.delegate =self;
    [scrollview addSubview:initialamount];
    [initialamount addTarget:self action:@selector(InitialAmount)forControlEvents:UIControlEventEditingChanged];
    
    
    UILabel *Balance=[[UILabel alloc]initWithFrame:CGRectMake(120,750,100,30)];
    Balance.text=@"Balance:";
    Balance.font=[UIFont boldSystemFontOfSize:12.0];
    [scrollview addSubview:Balance];
    balance  =[[UITextField alloc]initWithFrame:CGRectMake(120,790,90,30)];
    balance.font = [UIFont boldSystemFontOfSize:12.0];
    //the horizontal alignment of the text
    balance.textAlignment = NSTextAlignmentLeft;
    balance.userInteractionEnabled=NO;
    balance.borderStyle = UITextBorderStyleLine;
    balance.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
    balance.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    balance.delegate =self;
    [scrollview addSubview:balance];
    
    
    UILabel *Points=[[UILabel alloc]initWithFrame:CGRectMake(230,750,100,30)];
    Points.text=@"Points:";
    Points.font=[UIFont boldSystemFontOfSize:12.0];
    [scrollview addSubview:Points];
    point  =[[UITextField alloc]initWithFrame:CGRectMake(220,790,90,30)];
    point.font = [UIFont boldSystemFontOfSize:12.0];
    //the horizontal alignment of the text
    point.textAlignment = NSTextAlignmentLeft;
    point.userInteractionEnabled=NO;
    point.borderStyle = UITextBorderStyleLine;
    point.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
    point.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    point.delegate =self;
    [scrollview addSubview:point];
    
    // Swipe Left
    
    UISwipeGestureRecognizer * Swipeleft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeleft:)];
    Swipeleft.delegate=self;
    [Swipeleft setNumberOfTouchesRequired:1];
    Swipeleft.direction=UISwipeGestureRecognizerDirectionLeft;
    [tabel addGestureRecognizer:Swipeleft];
    
    UISwipeGestureRecognizer * Swipeleft1=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeleft:)];
    Swipeleft1.delegate=self;
    [Swipeleft1 setNumberOfTouchesRequired:1];
    Swipeleft1.direction=UISwipeGestureRecognizerDirectionLeft;
    [tabel_SecondaryID addGestureRecognizer:Swipeleft1];
    
    // SwipeRight
    UISwipeGestureRecognizer * Swiperight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swiperight:)];
     Swiperight.delegate=self;
    [Swiperight setNumberOfTouchesRequired:1];
    Swiperight.direction=UISwipeGestureRecognizerDirectionRight;
    [tabel_Tests addGestureRecognizer:Swiperight];
    
    UISwipeGestureRecognizer * Swiperight1=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swiperight:)];
    Swiperight1.delegate=self;
    [Swiperight1 setNumberOfTouchesRequired:1];
    Swiperight1.direction=UISwipeGestureRecognizerDirectionRight;
    [tabel_SecondaryID addGestureRecognizer:Swiperight1];
    
    
    
    
    
    
    int x,y,z;
    if(CaseID!=NULL)
    {
         TestCount.text=[NSString stringWithFormat:@"%d",AdviseTest.count];
        NSString *totalactualamount=[NSString stringWithFormat:@"%@",[[WorkListData objectAtIndex:0] valueForKey:@"TotalActualAmount"]];
        
        NSString *totalpaidamount=[NSString stringWithFormat:@"%@",[[WorkListData objectAtIndex:0] valueForKey:@"TotalPaidAmount"]];
        
         z=(([totalactualamount integerValue]-[totalpaidamount integerValue])*100)/[totalactualamount integerValue];
        
        NSLog(@"dis %d",z);
        
        discount.text=[NSString stringWithFormat:@"%d",z];
        
        NSLog(@"dis %@",discount.text);

        
        TotalCharge.text=[NSString stringWithFormat:@"%@",[[WorkListData objectAtIndex:0]valueForKey:@"TotalActualAmount"]];
        netcharges.text=[NSString stringWithFormat:@"%@",[[WorkListData objectAtIndex:0]valueForKey:@"TotalPaidAmount"]];
        
        initialamount.text=[NSString stringWithFormat:@"%@",[[WorkListData objectAtIndex:0]valueForKey:@"InitialAmount"]];
        NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"-"];
        initialamount.text = [[initialamount.text componentsSeparatedByCharactersInSet:doNotWant]componentsJoinedByString:@""];
        
        
        NSLog(@"str is %@",ChargeVal);
        x=[netcharges.text integerValue];
        NSLog(@"netcharge is %@",netcharges.text);
        y=[[[Point_Result objectAtIndex:0]valueForKey:@"Value"] integerValue];
        z=[[[Point_Result objectAtIndex:0]valueForKey:@"Points"] integerValue];
        point.text=[NSString stringWithFormat:@"%.f",(floor(x/y))*z];
        
        UILabel *refund=[[UILabel alloc]initWithFrame:CGRectMake(10,820,100,30)];
        refund.text=@"Refund:";
        refund.font=[UIFont boldSystemFontOfSize:12.0];
        [scrollview addSubview:refund];
        Refund   =[[UITextField alloc]initWithFrame:CGRectMake(10,860,100,30)];
        Refund.font = [UIFont boldSystemFontOfSize:12.0];
        //the horizontal alignment of the text
        Refund.textAlignment = NSTextAlignmentLeft;
        Refund.borderStyle = UITextBorderStyleLine;
        Refund.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
        Refund.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
        Refund.delegate =self;
        x=[netcharges.text integerValue];
        y=[initialamount.text integerValue];
        if([netcharges.text integerValue]>=[initialamount.text integerValue])
        {
            NSLog(@"zero value");
            Refund.text=@"0";
            balance.text=[NSString stringWithFormat:@"%d",x-y];
            
            
        }
        else
        {
            Refund.text=[NSString stringWithFormat:@"%d",y-x];
            balance.text=@"0";
        }
        
        
        [scrollview addSubview:Refund];
        tabel_AdviseTest.hidden=NO;
        //        table_adviseInvestiondetail=[[UITableView alloc]initWithFrame:CGRectMake(10,630,700,90) style:UITableViewStylePlain];
        //        table_adviseInvestiondetail.delegate=self;
        //        table_adviseInvestiondetail.dataSource=self;
        //        table_adviseInvestiondetail.layer.borderWidth = 2.0;
        //        table_adviseInvestiondetail.layer.borderColor = [UIColor grayColor].CGColor;
        //        [scrollview addSubview:table_adviseInvestiondetail];
        table_AdviseTestDetails.hidden=NO;
        discount_scroll.hidden=NO;
        
        UIButton *update=[[UIButton alloc]initWithFrame:CGRectMake(70,900,100,30)];
        update.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
        [update setTitle:@"Update" forState:UIControlStateNormal];
        update.tag=3;
        [update addTarget:self action:@selector(buttonselect:)forControlEvents:UIControlEventTouchUpInside];
        [scrollview addSubview:update];
        
        UIButton *cancel=[[UIButton alloc]initWithFrame:CGRectMake(180,900,100,30)];
        cancel.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
        [cancel setTitle:@"Close" forState:UIControlStateNormal];
        cancel.tag=4;
        [cancel addTarget:self action:@selector(buttonselect:)forControlEvents:UIControlEventTouchUpInside];
        [scrollview addSubview:cancel];
        
    }
    else
    {
        
        UIButton *Submit=[[UIButton alloc]initWithFrame:CGRectMake(70,900,100,30)];
        Submit.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
        [Submit setTitle:@"Submit" forState:UIControlStateNormal];
        Submit.tag=1;
        [Submit addTarget:self action:@selector(buttonselect:)forControlEvents:UIControlEventTouchUpInside];
        [scrollview addSubview:Submit];
        
        UIButton *Clear=[[UIButton alloc]initWithFrame:CGRectMake(180,900,100,30)];
        Clear.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
        [Clear setTitle:@"Clear" forState:UIControlStateNormal];
        Clear.tag=2;
        [Clear addTarget:self action:@selector(buttonselect:)forControlEvents:UIControlEventTouchUpInside];
        [scrollview addSubview:Clear];
        
    }
    
}
-(void)swipeleft:(UISwipeGestureRecognizer*)gestureRecognizer
{
    NSLog(@"left");
    pre.enabled=YES;
    NSLog(@"swipe left %d",swipe);
    
    [tble_scroll setContentOffset:CGPointMake(Kwidth*swipe, 0) animated:YES];
    NSLog(@"Kwidth %d",Kwidth);
    swipe++;
    next.enabled=NO;
}

-(void)swiperight:(UISwipeGestureRecognizer*)gestureRecognizer
{
    --swipe;
 NSLog(@"Kwidth %d",Kwidth);
    NSLog(@"right");
    next.enabled=YES;
    NSLog(@"swipe right %d",swipe);
    
    [tble_scroll setContentOffset:CGPointMake(Kwidth*(swipe-1), 0) animated:YES];
    pre.enabled=NO;
    
}



//-(void)previous
//{
//    next.enabled=YES;
//    
//    [tble_scroll setContentOffset:CGPointMake(0, 0) animated:YES];
//    pre.enabled=NO;
//    
//}
//-(void)next
//{
//    pre.enabled=YES;
//    [tble_scroll setContentOffset:CGPointMake(Kwidth, 0) animated:YES];
//    next.enabled=NO;
//    
//}
-(IBAction)discountvalueIndividuals:(id)sender
{
    NSLog(@"btnarr %@",buttonarr);
    
    UITextField *txt=(UITextField*)sender;
    
    NSLog(@"sender %d",txt.tag);

    
    //  NSIndexPath *indexPath = [table_AdviseTestDetails indexPathForCell:(UITableViewCell*)[[sender superview]superview]];
    //  NSLog(@"indexpath 2 %@",indexPath);
    
    // NSInteger _section=indexPath2.section;
    // NSLog(@"ind  %d",_section);
    
    NSIndexPath *indexPath1 = [NSIndexPath indexPathForRow:txt.tag-200 inSection:0];
    
    NSLog(@"sender %@",indexPath1);
    UITableViewCell *cell = [self->table_AdviseTestDetails cellForRowAtIndexPath:indexPath1];
    
    NSLog(@"cell %@",cell);
    
    //  UITextField *txt=(UITextField*)[cell viewWithTag:sender.tag];
    NSLog(@"ind  txt %@ , %d",txt,txt.tag);
    
    int x=[txt.text integerValue];
    
    NSLog(@"x is %d",x);
    
    UILabel *lbl_Val=(UILabel*)[cell viewWithTag:txt.tag-150];
    NSLog(@"ind  txt %@ , %d",lbl_Val,lbl_Val.tag);
    
    float x1=[lbl_Val.text floatValue];
    
    NSLog(@"x is %f",x1);
    
    
    //    NSIndexPath *indexPath3 = [NSIndexPath indexPathForRow:sender.tag-100 inSection:0];
    //    UITableViewCell *cell1 = (UITableViewCell *)[table_AdviseTestDetails cellForRowAtIndexPath:indexPath3];
    
    //    NSIndexPath *indexPath2 = [NSIndexPath indexPathForRow:sender.tag-100 inSection:0];
    //    UITableViewCell *cell2 = (UITableViewCell *)[table_AdviseTestDetails cellForRowAtIndexPath:indexPath2];
    UILabel *lbl=(UILabel*)[cell viewWithTag:txt.tag-100];
    NSLog(@"ind  txt %@ , %d",lbl,lbl.tag);
    //
    float x2=[lbl.text floatValue];
    //
    NSLog(@"x is %f",x2);
    
    
    for (int i=0; i<Labeltxt.count; i++)
    {
        int tag=[[[Labeltxt objectAtIndex:i]valueForKey:@"tag"]intValue];
        
        if (tag==txt.tag) {
            NSMutableDictionary* entry = [Labeltxt objectAtIndex:i];
            NSLog(@"entry %@",entry);
            // NSString *str=[entry valueForKey:@"value"];
            
            [entry setValue:txt.text forKey:@"value"];
            // NSLog(@" la  bel %@",sltr);
            NSLog(@"entry %@",entry);
            [Labeltxt replaceObjectAtIndex:i withObject:entry];
            NSLog(@" label %@",Labeltxt);
            
        }
        
    }
    
    if(_button.selected)
    {
        x=100-x;
        NSLog(@"value is here %d",x);
        float z=x1*x/100;
        NSLog(@"z is %f",z);
        lbl.text=[NSString stringWithFormat:@"%.2f",z];
    }
    else if (_button1.selected)
    {
        lbl.text=[NSString stringWithFormat:@"%.2f",x1-x];
        
    }
    
    
    for (int i=0; i<LabelArr.count; i++) {
        int tag=[[[LabelArr objectAtIndex:i]valueForKey:@"tag"]intValue];
        
        if (tag==lbl.tag) {
            NSMutableDictionary* entry = [LabelArr objectAtIndex:i];
            NSLog(@"entry %@",entry);
            // NSString *str=[entry valueForKey:@"value"];
            
            
            
            [entry setValue:lbl.text forKey:@"value"];
            // NSLog(@" label %@",sltr);
            NSLog(@"entry %@",entry);
            [LabelArr replaceObjectAtIndex:i withObject:entry];
            NSLog(@" label %@",LabelArr);
            
        }
    }
    
     r = 0;
    for(int i=0;i<buttonarr.count;i++)
    {
        
        NSString *butt=[NSString stringWithFormat:@"%@",[buttonarr objectAtIndex:i]];
        
        for(int j=0;j<LabelTag.count;j++)
        {
            NSString *labelbutt=[NSString stringWithFormat:@"%@",[LabelTag objectAtIndex:j]];
            
            if([butt isEqualToString:labelbutt])
            {
                //                NSIndexPath *indexPath1 =[NSIndexPath indexPathForRow:j inSection:0];
                //                NSLog(@"indexPath %@",indexPath1);
                //                UITableViewCell *mycel=[self->table_AdviseTestDetails cellForRowAtIndexPath:indexPath1];
                //                NSLog(@"cell %@",mycel);
                
                UILabel *mybutton=(UILabel*)[self.view viewWithTag:100+j];
                // mybutton.selected=YES;
                NSLog(@"label %@",mybutton.text);
                
                
                r=r+[mybutton.text floatValue];
                NSLog(@"r %f",r);
                
                
            }
            
            
            
        }
    }
    netcharges.text=0;
    
    for(int i=0;i<LabelArr.count;i++)
    {
        NSString *y= [NSString stringWithFormat:@"%@",[[LabelArr objectAtIndex:i] valueForKey:@"value"]];
        
        
        float z=[netcharges.text floatValue]+[y integerValue];
        
        
        netcharges.text=[NSString stringWithFormat:@"%.2f",z];
        NSLog(@"net %@",netcharges.text);
        //balance.text=[NSString stringWithFormat:@"%.2f",z];
        
    }
    netcharges.text=[NSString stringWithFormat:@"%.2f",[netcharges.text floatValue]-r];
    
    NSLog(@"net %@",netcharges.text);
    point.text=[NSString stringWithFormat:@"%.f",(floor([netcharges.text integerValue]/[[[Point_Result objectAtIndex:0]valueForKey:@"Value"] integerValue]))*[[[Point_Result objectAtIndex:0]valueForKey:@"Points"] integerValue]];
    balance.text=netcharges.text;
    NSLog(@"net %@",balance.text);
    
    //       Details=[[NSMutableArray alloc]init];
    //    for(int i=0;i<ChargeVal.count;i++)
    //    {
    //        NSDictionary *d1=[[NSDictionary alloc]initWithObjectsAndKeys:[NSString stringWithFormat:@"%@",[ChargeVal objectAtIndex:i]],@"Charge",[NSString stringWithFormat:@"%@",[Investigatio_ID objectAtIndex:i]], @"InvestigationId",[NSString stringWithFormat:@"%@",[Labeltxt objectAtIndex:i]], @"InvDiscount",[NSString stringWithFormat:@"%@",[LabelArr objectAtIndex:i]],@"InvNetCharge",(NSString*)[NSNull null],@"ReminderDate",LocationID,@"TestLocationId",nil];
    //        [Details addObject:d1];
    //        NSLog(@"details %@",Details);
    //    }
    //    NSLog(@"d1 is %@",Details);
    //
    
    if([initialamount.text integerValue]>0)
    {
        if([initialamount.text floatValue]>[netcharges.text floatValue])
        {
            initialamount.backgroundColor=[UIColor colorWithRed:255/256. green:0/256. blue:0/256. alpha:1];
            balance.text=@"0";
        }
        else
        {
            initialamount.backgroundColor=[UIColor whiteColor];
            float z=[netcharges.text floatValue]-[initialamount.text floatValue];
            NSLog(@"z is %f",z);
            // netcharges.text=[NSString stringWithFormat:@"%.2f",z];
            balance.text=[NSString stringWithFormat:@"%.2f",z];
        }
    }
    
    if(Refund.hidden==FALSE)
    {
        
        int x=[netcharges.text integerValue];
        int  y=[initialamount.text integerValue];
        if([netcharges.text integerValue]>=[initialamount.text integerValue])
        {
            NSLog(@"zero value");
            Refund.text=@"0";
            balance.text=[NSString stringWithFormat:@"%d",x-y];
            
        }
        else
        {
            Refund.text=[NSString stringWithFormat:@"%d",y-x];
            balance.text=@"0";
        }
        
    }
    
}

-(IBAction)FreeTest:(id)reconizer
{
    // UIButton *btn = (UIButton *)reconizer ;
    //  NSLog(@"btn %d",btn.tag);
    
    NSIndexPath *indexPath1 = [NSIndexPath indexPathForRow:[reconizer tag]-300 inSection:0];
    UITableViewCell *cell = [self->table_AdviseTestDetails cellForRowAtIndexPath:indexPath1];
    
    NSLog(@"cell %@",cell);
    
    UIButton *btn=(UIButton*)[cell viewWithTag:indexPath1.row+300];
    
    if( canceltest==FALSE)
    {
        UITextField *txt=(UITextField*)[cell viewWithTag:indexPath1.row+200];
        
        float x=[txt.text floatValue];
        
        UILabel *lbl_Val=(UILabel*)[cell viewWithTag:indexPath1.row+50];
        NSLog(@"ind  txt %@ , %d",lbl_Val,lbl_Val.tag);
        float x1=[lbl_Val.text floatValue];
        
        
        UILabel *lbl=(UILabel*)[cell viewWithTag:indexPath1.row+100];
        NSLog(@"ind  txt %@ , %d",lbl,lbl.tag);
        
        
        float x2=[lbl.text floatValue];
        
        NSLog(@"x is %f",x2);
        
        if(_button.selected)
        {
            x=100-x;
            NSLog(@"value is here %f",x);
            float z=x1*x/100;
            NSLog(@"z is %f",z);
            lbl.text=[NSString stringWithFormat:@"%.2f",z];
        }
        else if (_button1.selected)
        {
            lbl.text=[NSString stringWithFormat:@"%.2f",x1-x];
            
        }
        
        if(btn.selected)
        {
            
            [buttonarr removeObject:[NSString stringWithFormat:@"%d",lbl.tag]];
            [ISFreeTest removeObject:[NSString stringWithFormat:@"%d",btn.tag]];
            
            [btn setImage:[UIImage imageNamed:@""]forState:UIControlStateNormal];
            TestCheck=TRUE;
            btn.selected=NO;
            txt.userInteractionEnabled=YES;
           TotalCharge.text=[NSString stringWithFormat:@"%.2f",[TotalCharge.text integerValue]+x1];
            
            for (int i=0; i<Labeltxt.count; i++)
            {
//                int tag=[[[Labeltxt objectAtIndex:i]valueForKey:@"tag"]intValue];
//                
//                if (tag==txt.tag)
//                {
//                    NSMutableDictionary* entry = [Labeltxt objectAtIndex:i];
//                    NSLog(@"entry %@",entry);
//                    // NSString *str=[entry valueForKey:@"value"];
//                    
//                    [entry setValue:txt.text forKey:@"value"];
//                    // NSLog(@" la  bel %@",sltr);
//                    NSLog(@"entry %@",entry);
//                    [Labeltxt replaceObjectAtIndex:i withObject:entry];
//                    NSLog(@" label %@",Labeltxt);
//                    
//                }
                int taglbl=[[[LabelArr objectAtIndex:i]valueForKey:@"tag"]intValue];
                
                if (taglbl==lbl.tag)
                {
                    NSMutableDictionary* entry = [LabelArr objectAtIndex:i];
                    NSLog(@"entry %@",entry);
                    // NSString *str=[entry valueForKey:@"value"];
                    
                    [entry setValue:lbl.text forKey:@"value"];
                    // NSLog(@" la  bel %@",sltr);
                    NSLog(@"entry %@",entry);
                    [LabelArr replaceObjectAtIndex:i withObject:entry];
                    NSLog(@" label %@",LabelArr);
                    
                }
//                int chargelbl=[[[ChargeVal objectAtIndex:i]valueForKey:@"tag"]intValue];
//               if (chargelbl==lbl_Val.tag)
//               {
//                   NSMutableDictionary* entry =[ChargeVal objectAtIndex:i];
//                   NSLog(@"entry %@",entry);
//                   // NSString *str=[entry valueForKey:@"value"];
//                   
//                   [entry setValue:lbl_Val.text forKey:@"value"];
//                   // NSLog(@" la  bel %@",sltr);
//                   NSLog(@"entry %@",entry);
//                   [ChargeVal replaceObjectAtIndex:i withObject:entry];
//                   NSLog(@" label %@",ChargeVal);
//               }
            }
        }
        else
        {
            [buttonarr addObject:[NSString stringWithFormat:@"%d",lbl.tag]];
            [ISFreeTest addObject:[NSString stringWithFormat:@"%d",btn.tag]];
            
            btn.selected=YES;
            [btn setImage:[UIImage imageNamed:@"imagesCheck"]forState:UIControlStateSelected];
            
            TestCheck=FALSE;
            txt.userInteractionEnabled=NO;
            TotalCharge.text=[NSString stringWithFormat:@"%.2f",[TotalCharge.text integerValue]-x1];
            
            for (int i=0; i<Labeltxt.count; i++)
            {
//                int tag=[[[Labeltxt objectAtIndex:i]valueForKey:@"tag"]intValue];
//                
//                if (tag==txt.tag)
//                {
//                    NSMutableDictionary* entry = [Labeltxt objectAtIndex:i];
//                    NSLog(@"entry %@",entry);
//                    // NSString *str=[entry valueForKey:@"value"];
//                    
//                    [entry setValue:@"0" forKey:@"value"];
//                    // NSLog(@" la  bel %@",sltr);
//                    NSLog(@"entry %@",entry);
//                    [Labeltxt replaceObjectAtIndex:i withObject:entry];
//                    NSLog(@" label %@",Labeltxt);
//                    
//                }
                int taglbl=[[[LabelArr objectAtIndex:i]valueForKey:@"tag"]intValue];
                
                if (taglbl==lbl.tag)
                {
                    NSMutableDictionary* entry = [LabelArr objectAtIndex:i];
                    NSLog(@"entry %@",entry);
                    // NSString *str=[entry valueForKey:@"value"];
                    
                    [entry setValue:@"0" forKey:@"value"];
                    // NSLog(@" la  bel %@",sltr);
                    NSLog(@"entry %@",entry);
                    [LabelArr replaceObjectAtIndex:i withObject:entry];
                    NSLog(@" label %@",LabelArr);
                }
                
//               int chargelbl=[[[ChargeVal objectAtIndex:i]valueForKey:@"tag"]intValue];
//               
//               if (chargelbl==lbl_Val.tag)
//               {
//                   NSMutableDictionary* entry = [ChargeVal objectAtIndex:i];
//                   NSLog(@"entry %@",entry);
//                   // NSString *str=[entry valueForKey:@"value"];
//                   
//                   [entry setValue:@"0" forKey:@"value"];
//                   // NSLog(@" la  bel %@",sltr);
//                   NSLog(@"entry %@",entry);
//                   [ChargeVal replaceObjectAtIndex:i withObject:entry];
//                   NSLog(@" label %@",ChargeVal);
//                   
//               }
            }
            
            //NSLog(@"discount %@ and dis rs %@",discount.text,discountrupees.text);
            
            //        if([discount.text isEqualToString:@""]||[discountrupees.text isEqualToString:@""])
            //        {
            //
            //
            //
            //        }
            
            
            //TestCheck=TRUE;
        }
        
//        TotalCharge.text=0;
//        for(int i=0;i<ChargeVal.count;i++)
//        {
//            
//            NSString *y= [NSString stringWithFormat:@"%@",[[ChargeVal objectAtIndex:i]valueForKey:@"value"]];
//            
//            int z=[TotalCharge.text integerValue]+[y integerValue];
//            
//            TotalCharge.text=[NSString stringWithFormat:@"%d",z];
//            
//        }
        
        NSLog(@"discount %@",TotalCharge.text);

        
        //if ([DiscountBreakUP isEqualToString:@"true"])
       // {
            // LabelArr=[[NSMutableArray alloc]init];
            //Labeltxt=[[NSMutableArray alloc]init];
            
            
            //  NSMutableArray *LabelTag=[[NSMutableArray alloc]init];
            
            // for (int j = 0; j < [table_AdviseTestDetails numberOfRowsInSection:0]; j++)
            //    {
            ////        NSIndexPath *indexPath1 =[NSIndexPath indexPathForRow:j inSection:0];
            ////        NSLog(@"indexPath %@",indexPath1);
            ////        UITableViewCell *mycel=[self->table_AdviseTestDetails cellForRowAtIndexPath:indexPath1];
            ////        NSLog(@"cell %@",mycel);
            ////
            //        UILabel *mybutton=(UILabel*)[self.view viewWithTag:100+j];
            //        // mybutton.selected=YES;
            //        NSLog(@"label %@",mybutton.text);
            //        [LabelTag addObject:[NSString stringWithFormat:@"%d",mybutton.tag]];
            //
            //        [LabelArr addObject:mybutton.text];
            //        UITextField *mytxt=(UITextField*)[self.view viewWithTag:200+j];
            //
            //        NSLog(@"mytxt %@",mytxt.text);
            //        if([mytxt.text isEqualToString:@"(null)"])
            //        {
            //            [Labeltxt addObject:@"0"];
            //
            //        }
            //        else
            //        {
            //            [Labeltxt addObject:mytxt.text];
            //        }
            //      //  [FreeTest addObject:[NSString stringWithFormat:@"%d",btn.tag+j]];
            //
            //    }
//            NSLog(@"label %@",LabelArr);
//            NSLog(@"label %@",Labeltxt);
//            // NSLog(@"label %@",LabelTag);
//            NSLog(@"label %@",buttonarr);
//            
  //          r = 0;
            //    for(int i=0;i<buttonarr.count;i++)
            //    {
            //
            //        NSString *butt=[NSString stringWithFormat:@"%@",[buttonarr objectAtIndex:i]];
            //
            //        for(int j=0;j<LabelTag.count;j++)
            //        {
            //            NSString *labelbutt=[NSString stringWithFormat:@"%@",[LabelTag objectAtIndex:j]];
            //
            //            if([butt isEqualToString:labelbutt])
            //            {
            //               NSIndexPath *indexPath1 =[NSIndexPath indexPathForRow:j inSection:0];
            //               NSLog(@"indexPath %@",indexPath1);
            //               UITableViewCell *mycel=[self->table_AdviseTestDetails cellForRowAtIndexPath:indexPath1];
            //               NSLog(@"cell %@",mycel);
            //
            //                UILabel *mybutton=(UILabel*)[mycel viewWithTag:100+j];
            //                // mybutton.selected=YES;
            //                NSLog(@"label %@",mybutton.text);
            //
            //                r=r+[mybutton.text floatValue];
            //                NSLog(@"r %f",r);
            //
            //            }
            //
            //        }
            //    }
            netcharges.text=0;
            
            for(int i=0;i<LabelArr.count;i++)
            {
                NSString *y= [NSString stringWithFormat:@"%@",[[LabelArr objectAtIndex:i]valueForKey:@"value"]];
                
                
                float z=[netcharges.text floatValue]+[y integerValue];
                
                
                netcharges.text=[NSString stringWithFormat:@"%.2f",z];
                NSLog(@"net %@",netcharges.text);
                //balance.text=[NSString stringWithFormat:@"%.2f",z];
                
            }
            netcharges.text=[NSString stringWithFormat:@"%.2f",[netcharges.text floatValue]-r];
            
            NSLog(@"net %@",netcharges.text);
            point.text=[NSString stringWithFormat:@"%.f",(floor([netcharges.text integerValue]/[[[Point_Result objectAtIndex:0]valueForKey:@"Value"] integerValue]))*[[[Point_Result objectAtIndex:0]valueForKey:@"Points"] integerValue]];
            balance.text=netcharges.text;
            NSLog(@"net %@",balance.text);
            
            NSLog(@"btn %@",buttonarr);
//        }
//        else
       // {
            
            [self discountvalue];
      //  }
        if([initialamount.text integerValue]>0)
        {
            if([initialamount.text floatValue]>[netcharges.text floatValue])
            {
                initialamount.backgroundColor=[UIColor colorWithRed:255/256. green:0/256. blue:0/256. alpha:1];
                balance.text=@"0";
            }
            else
            {
                initialamount.backgroundColor=[UIColor whiteColor];
                float z=[netcharges.text floatValue]-[initialamount.text floatValue];
                NSLog(@"z is %f",z);
                // netcharges.text=[NSString stringWithFormat:@"%.2f",z];
                balance.text=[NSString stringWithFormat:@"%.2f",z];
            }
        }
    }
    
    if(CaseID!=NULL)
    {
        //        if(btn.selected)
        //        {
        //
        //           // [buttonarr removeObject:[NSString stringWithFormat:@"%d",lbl.tag]];
        //            [ISFreeTest removeObject:[NSString stringWithFormat:@"%d",btn.tag]];
        //
        //            [btn setImage:[UIImage imageNamed:@""]forState:UIControlStateNormal];
        //            TestCheck=TRUE;
        //            btn.selected=NO;
        //          //  txt.userInteractionEnabled=YES;
        //          //  TotalCharge.text=[NSString stringWithFormat:@"%.2f",[TotalCharge.text integerValue]+x1];
        //
        //
        //        }
        //        else
        //        {
        //            //[buttonarr addObject:[NSString stringWithFormat:@"%d",lbl.tag]];
        //            [ISFreeTest addObject:[NSString stringWithFormat:@"%d",btn.tag]];
        //
        //            btn.selected=YES;
        //            [btn setImage:[UIImage imageNamed:@"imagesCheck"]forState:UIControlStateSelected];
        //
        //            TestCheck=FALSE;
        //         //   txt.userInteractionEnabled=NO;
        //          //  TotalCharge.text=[NSString stringWithFormat:@"%.2f",[TotalCharge.text integerValue]-x1];
        //
        //        }
        //
        //
        NSMutableArray *FreeTest=[[NSMutableArray alloc]init];
        for(int i=0;i<Investigatio_ID.count;i++)
        {
            
            [FreeTest addObject:[NSString stringWithFormat:@"%d",300+i]];
            
        }
        
        Freetest=[[NSMutableArray alloc]init];
        
        for (int i= 0 ; i < FreeTest.count ; i++)
        {
            if(![ISFreeTest containsObject:[NSString stringWithFormat:@"%@",[FreeTest objectAtIndex:i]]])
            {
                [Freetest addObject:@"false"];
                
            }
            else
            {
                [Freetest addObject:@"true"];
                
            }
            
            NSLog(@"des %@",Freetest);
        }
        
        NSLog(@"des %@",Freetest);
        
    }
    
    
    
    
}
-(IBAction)btnpress:(id)reconizer
{
    UIButton *btn = (UIButton *)reconizer ;
    NSLog(@"btn %d",btn.tag);
    switch (btn.tag)
    
    {
        case 1:
        {
            table_MedicalFacility.hidden=YES;
            [table_AdviseDoctor removeFromSuperview];
           
            
            table_AdviseDoctor=[[UITableView alloc]initWithFrame:CGRectMake(150,230,160,150)style:UITableViewStylePlain];
            table_AdviseDoctor.delegate=self;
            table_AdviseDoctor.dataSource=self;
            table_AdviseDoctor.layer.borderWidth = 2.0;
            table_AdviseDoctor.layer.borderColor = [UIColor grayColor].CGColor;
            [self.view addSubview:table_AdviseDoctor];
            
            
            break;
        }
        case 2:
        {
            table_AdviseDoctor.hidden=YES;
            [table_MedicalFacility removeFromSuperview];
            
           
            table_MedicalFacility=[[UITableView alloc]initWithFrame:CGRectMake(150,270,160,140)style:UITableViewStylePlain];
            table_MedicalFacility.delegate=self;
            table_MedicalFacility.dataSource=self;
            table_MedicalFacility.layer.borderWidth = 2.0;
            table_MedicalFacility.layer.borderColor = [UIColor grayColor].CGColor;
            [self.view addSubview:table_MedicalFacility];
            
             break;
            
        }
        case 3:
        {
            if(!btn.selected)
            {
                btn.selected=YES;
                Isurgent=@"1";
                [_CheckMark setImage:[UIImage imageNamed:@"imagesCheck"]forState:UIControlStateNormal];
                Check=FALSE;
                
                DateTime=[[UITextField alloc]initWithFrame:CGRectMake(150,55,150,30)];
                DateTime.font = [UIFont boldSystemFontOfSize:12.0];
                DateTime.tag=10;
                //  DateTime.placeholder = @"<enter text>";
                DateTime.borderStyle = UITextBorderStyleLine;
                DateTime.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
                DateTime.delegate =self;
                //   [scrollview addSubview:rb3];
                // [scrollview addSubview:rb4];
                [scrollview addSubview:DateTime];
                
//                done=[[UIButton alloc]initWithFrame:CGRectMake(300, 130,50,30)];
//                done.backgroundColor=[UIColor redColor];
//                [done setTitle:@"Done" forState:UIControlStateNormal];
//                [done addTarget:self action:@selector(UpdatePicker:)forControlEvents:UIControlEventTouchUpInside];
//                done.hidden=YES;
//                
//                [scrollview addSubview:done];
//                
                //[DateTime addTarget:self action:@selector(SearchPatients1:)forControlEvents:UIControlEventEditingDidBegin];
                
            }
            else
            {
                btn.selected=NO;
                Isurgent=@"0";
                [DateTime removeFromSuperview];
                [_CheckMark setImage:[UIImage imageNamed:@""]forState:UIControlStateNormal];
                Check=TRUE;
            }
            break;
            
        }
        case 4:
        {
            if(!btn.selected)
            {
                btn.selected=YES;
                NSLog(@"btnarr %@",buttonarr);
                DiscountBreakUP=@"true";
                //  [CheckMark setImage:[UIImage imageNamed:@"imagesCheck"]forState:UIControlStateNormal];
                Check1=FALSE;
//                range=1;
//                [table_AdviseTestDetails reloadData];
//                
                //[table_AdviseTestDetails reloadData];
                DiscountPer.hidden=YES;
                discount.hidden=YES;
                // discountrupees.hidden=YES;
                DiscountRuppes.hidden=YES;
                //[self discountvalueIndividuals:nil];
                NSLog(@"res %d",ResultValue);
                
//                LabelArr=[[NSMutableArray alloc]init];
//                Labeltxt=[[NSMutableArray alloc]init];
                
                [LabelArr removeAllObjects];
                [Labeltxt removeAllObjects];
                LabelTag=[[NSMutableArray alloc]init];
              //  NSArray *visible2 = [table_AdviseTestDetails indexPathsForVisibleRows];
                
                for (int j = 0; j<save_indexpath.count; j++)
                {
                    NSIndexPath *indexpath = (NSIndexPath*)[[save_indexpath objectAtIndex:j] valueForKey:@"index"];
                    NSLog(@"cell %@",indexpath);
                    // NSIndexPath *indexPath1 = [NSIndexPath indexPathForRow:j inSection:0];
                    UITableViewCell *cell1 = (UITableViewCell*)[[save_indexpath objectAtIndex:j] valueForKey:@"cell"];
                    //
                    NSLog(@"cell %@",cell1);
                    UITextField *txt=(UITextField*)[cell1 viewWithTag:indexpath.row+ 200];
                    int x=[txt.text integerValue];
                    //
                    NSLog(@"x is %d",x);
                    //
                    //
                    // UILabel *lbl_Val=(UILabel*)[cell1 viewWithTag:indexpath.row+50];
                    // NSLog(@"ind txt %@ , %d",lbl_Val,lbl_Val.tag);
                    //
                    // float x1=[lbl_Val.text floatValue];
                    //
                    // NSLog(@"x is %f",x1);
                    
                    UILabel *lbl=(UILabel*)[cell1 viewWithTag:indexpath.row+100];
                    NSLog(@"ind txt %@ , %d",lbl,lbl.tag);
                    [LabelTag addObject:[NSString stringWithFormat:@"%d",lbl.tag]];
                    NSLog(@"label tag is %@",LabelTag);
                    
                    NSMutableDictionary *get=[[NSMutableDictionary alloc]initWithObjectsAndKeys:lbl.text,@"value",[NSString stringWithFormat:@"%d",lbl.tag],@"tag", nil];
                    
                    [LabelArr addObject:get];
                    NSLog(@"label %@",LabelArr);
                    NSMutableDictionary *text_tag_dic=[[NSMutableDictionary alloc]initWithObjectsAndKeys:txt.text,@"value",[NSString stringWithFormat:@"%d",txt.tag],@"tag", nil];
                    NSLog(@"arrray %@",LabelArr);
                    if([txt.text isEqualToString:@""])
                    {
                        txt.text=@"0";
                        [Labeltxt addObject:text_tag_dic];
                        
                    }
                    else
                    {
                        [Labeltxt addObject:text_tag_dic];
                    }
                    NSLog(@"labl txt %@",Labeltxt);
                }
                r = 0;
                for(int i=0;i<buttonarr.count;i++)
                {
                    
                    NSString *butt=[NSString stringWithFormat:@"%@",[buttonarr objectAtIndex:i]];
                    
                    for(int j=0;j<LabelTag.count;j++)
                    {
                        NSString *labelbutt=[NSString stringWithFormat:@"%@",[LabelTag objectAtIndex:j]];
                        
                        if([butt isEqualToString:labelbutt])
                        {
                            NSIndexPath *indexPath1 =[NSIndexPath indexPathForRow:j inSection:0];
                            NSLog(@"indexPath %@",indexPath1);
                            UITableViewCell *mycel=[self->table_AdviseTestDetails cellForRowAtIndexPath:indexPath1];
                            NSLog(@"cell %@",mycel);
                            
                            UILabel *mybutton=(UILabel*)[mycel viewWithTag:100+j];
                            // mybutton.selected=YES;
                            NSLog(@"label %@",mybutton.text);
                            
                            
                            r=r+[mybutton.text floatValue];
                            NSLog(@"r %f",r);
                            
                        }
                        
                    }
                }
                
              range=1;
                
              [table_AdviseTestDetails reloadData];
                
                if(TestCheck==FALSE)
                {
                    TestCheck=TRUE;
                }
//                else
//                {
//                      TestCheck=FALSE;
//                }
                
                [self CallMethod];
                
            
//            netcharges.text=0;
//                z1=0;
//                
//                NSLog(@"label arr %@",LabelArr);
//                
//                
//                       for(int i=0;i<LabelArr.count;i++)
//                        {
//                            NSString *y= [NSString stringWithFormat:@"%@",[[LabelArr objectAtIndex:i] valueForKey:@"value"]];
//             
//             
//                         z1=z1+[y integerValue];
//             
//             
//                            netcharges.text=[NSString stringWithFormat:@"%.2f",z1];
//                            NSLog(@"net %@",netcharges.text);
//                            //balance.text=[NSString stringWithFormat:@"%.2f",z];
//             
//                        }
//                        netcharges.text=[NSString stringWithFormat:@"%.2f",[netcharges.text floatValue]-r];
//             
//                        NSLog(@"net %@",netcharges.text);
//                        point.text=[NSString stringWithFormat:@"%.f",(floor([netcharges.text integerValue]/[[[Point_Result objectAtIndex:0]valueForKey:@"Value"] integerValue]))*[[[Point_Result objectAtIndex:0]valueForKey:@"Points"] integerValue]];
//                        balance.text=netcharges.text;
//                        NSLog(@"net %@",balance.text);
//             
//

            }
            else
            {
                
                btn.selected=NO;
                DiscountBreakUP=@"false";
                // [CheckMark setImage:[UIImage imageNamed:@""]forState:UIControlStateNormal];
                Check1=TRUE;
                // [table_AdviseTestDetails reloadData];
                if(_button.selected)
                {
                    DiscountPer.hidden=NO;
                    discount.hidden=NO;
                }
                else if(_button1.selected)
                {
                    DiscountRuppes.hidden=NO;
                     //discountrupees.hidden=NO;
                }
                
                [LabelTag removeAllObjects];
                
                // NSMutableArray *LabelTag=[[NSMutableArray alloc]init];
                //NSLog(@"btnarr %@",buttonarr);
                
                //                for (int j = 0; j < [table_AdviseTestDetails numberOfRowsInSection:0]; j++)
                //                {
                //                    NSIndexPath *indexPath1 =[NSIndexPath indexPathForRow:j inSection:0];
                //                    NSLog(@"indexPath %@",indexPath1);
                //                    UITableViewCell *mycel=[self->table_AdviseTestDetails cellForRowAtIndexPath:indexPath1];
                //                    NSLog(@"cell %@",mycel);
                //
                //                    UILabel *mybutton=(UILabel*)[mycel viewWithTag:100+j];
                //                    // mybutton.selected=YES;
                //                    NSLog(@"label %@",mybutton.text);
                //                    [LabelTag addObject:[NSString stringWithFormat:@"%d",mybutton.tag]];
                //
                //                   // [LabelArr addObject:mybutton.text];
                //                }
                //
                r = 0;
                //                for(int i=0;i<buttonarr.count;i++)
                //                {
                //
                //                    NSString *butt=[NSString stringWithFormat:@"%@",[buttonarr objectAtIndex:i]];
                //
                //                    for(int j=0;j<LabelTag.count;j++)
                //                    {
                //                        NSString *labelbutt=[NSString stringWithFormat:@"%@",[LabelTag objectAtIndex:j]];
                //
                //                        if([butt isEqualToString:labelbutt])
                //                        {
                //                            NSIndexPath *indexPath1 =[NSIndexPath indexPathForRow:j inSection:0];
                //                            NSLog(@"indexPath %@",indexPath1);
                //                            UITableViewCell *mycel=[self->table_AdviseTestDetails cellForRowAtIndexPath:indexPath1];
                //                            NSLog(@"cell %@",mycel);
                //
                //                            UILabel *mybutton=(UILabel*)[mycel viewWithTag:100+j];
                //                            // mybutton.selected=YES;
                //                            NSLog(@"label %@",mybutton.text);
                //
                //
                //                            r=r+[mybutton.text floatValue];
                //                            NSLog(@"r %f",r);
                //
                //
                //                        }
                //
                //                    }
                //                }
                
                netcharges.text=0;
                
                for(int i=0;i<ChargeVal.count;i++)
                {
                    NSString *y= [NSString stringWithFormat:@"%@",[ChargeVal objectAtIndex:i]];
                    
                    float z=[netcharges.text floatValue]+[y integerValue];
                    
                    netcharges.text=[NSString stringWithFormat:@"%.2f",z];
                    NSLog(@"net %@",netcharges.text);
                    //balance.text=[NSString stringWithFormat:@"%.2f",z];
                    
                }
                
                netcharges.text=[NSString stringWithFormat:@"%.2f",[netcharges.text floatValue]-r];
                
                NSLog(@"net %@",netcharges.text);
                point.text=[NSString stringWithFormat:@"%.f",(floor([netcharges.text integerValue]/[[[Point_Result objectAtIndex:0]valueForKey:@"Value"] integerValue]))*[[[Point_Result objectAtIndex:0]valueForKey:@"Points"] integerValue]];
                balance.text=netcharges.text;
                NSLog(@"net %@",balance.text);
                
                if(![discount.text isEqualToString:@""])
                {
                    
                    [self discountvalue];
                    
                }
                range=0;
                if([initialamount.text integerValue]>0)
                {
                    if([initialamount.text floatValue]>[netcharges.text floatValue])
                    {
                        initialamount.backgroundColor=[UIColor colorWithRed:255/256. green:0/256. blue:0/256. alpha:1];
                        balance.text=@"0";
                    }
                    else
                    {
                        initialamount.backgroundColor=[UIColor whiteColor];
                        float z=[netcharges.text floatValue]-[initialamount.text floatValue];
                        NSLog(@"z is %f",z);
                        // netcharges.text=[NSString stringWithFormat:@"%.2f",z];
                        balance.text=[NSString stringWithFormat:@"%.2f",z];
                        NSLog(@"bal %@",balance.text);
                        
                    }
                }
                
                [table_AdviseTestDetails reloadData];
                
            }
            //NSLog(NSString *format, ...)
            
            break;
        }
        default:
            break;
    }
    
}
-(void)CallMethod
{
    if(TestCheck==TRUE)
    {
    
    for (int j = 0; j < save_indexpath.count; j++)
    {
        NSIndexPath *indexPath = (NSIndexPath*)[[save_indexpath objectAtIndex:j] valueForKey:@"index"];
        NSLog(@"cell %@",indexPath);
        // NSIndexPath *indexPath1 = [NSIndexPath indexPathForRow:j inSection:0];
        UITableViewCell *cell1 = (UITableViewCell*)[[save_indexpath objectAtIndex:j] valueForKey:@"cell"];
        
        UILabel *lbl111=(UILabel *)[cell1 viewWithTag:indexPath.row+100];
        UITextField *txt11=(UITextField *)[cell1 viewWithTag:indexPath.row+200];

        int tag1=[[[Labeltxt objectAtIndex:indexPath.row]valueForKey:@"tag"]intValue];
        
        
        if (tag1==txt11.tag) {
            NSMutableDictionary* entry = [Labeltxt objectAtIndex:indexPath.row];
            [entry setValue:txt11.text forKey:@"value"];
            // NSLog(@" label %@",sltr);
            NSLog(@"entry %@",entry);
            
            [Labeltxt replaceObjectAtIndex:indexPath.row withObject:entry];
            NSLog(@" label %@",Labeltxt);
            
        }
        
        int tag=[[[LabelArr objectAtIndex:indexPath.row]valueForKey:@"tag"]intValue];
        
        if (tag==lbl111.tag) {
            NSMutableDictionary* entry = [LabelArr objectAtIndex:indexPath.row];
            [entry setValue:lbl111.text forKey:@"value"];
            // NSLog(@" label %@",sltr);
            NSLog(@"entry %@",entry);
            
            [LabelArr replaceObjectAtIndex:indexPath.row withObject:entry];
            NSLog(@" label %@",LabelArr);
            
            
        }

        //
    }
    }
    
    netcharges.text=0;
    z1=0;
    
    NSLog(@"label arr %@",LabelArr);
    
    
    for(int i=0;i<LabelArr.count;i++)
    {
        NSString *y= [NSString stringWithFormat:@"%@",[[LabelArr objectAtIndex:i] valueForKey:@"value"]];
        
        
        z1=z1+[y integerValue];
        
        
        netcharges.text=[NSString stringWithFormat:@"%.2f",z1];
        NSLog(@"net %@",netcharges.text);
        //balance.text=[NSString stringWithFormat:@"%.2f",z];
        
    }
    netcharges.text=[NSString stringWithFormat:@"%.2f",[netcharges.text floatValue]-r];
    
    NSLog(@"net %@",netcharges.text);
    point.text=[NSString stringWithFormat:@"%.f",(floor([netcharges.text integerValue]/[[[Point_Result objectAtIndex:0]valueForKey:@"Value"] integerValue]))*[[[Point_Result objectAtIndex:0]valueForKey:@"Points"] integerValue]];
    balance.text=netcharges.text;
    NSLog(@"net %@",balance.text);
    
    
    if([initialamount.text integerValue]>0)
    {
        if([initialamount.text floatValue]>[netcharges.text floatValue])
        {
            initialamount.backgroundColor=[UIColor colorWithRed:255/256. green:0/256. blue:0/256. alpha:1];
            balance.text=@"0";
        }
        else
        {
            initialamount.backgroundColor=[UIColor whiteColor];
            float z=[netcharges.text floatValue]-[initialamount.text floatValue];
            NSLog(@"z is %f",z);
            // netcharges.text=[NSString stringWithFormat:@"%.2f",z];
            balance.text=[NSString stringWithFormat:@"%.2f",z];
            NSLog(@"bal %@",balance.text);
            
        }
    }
    

    
}
-(void)SelecteButton:(int)index and:(NSString*)string
{
    
    switch(index)
    {
        case 1:
        {
           
            [Delivery_Staff removeFromSuperview];
//            
//            Label_Email=[[UILabel alloc]initWithFrame:CGRectMake(10,90,140,30)];
//            Label_Email.font = [UIFont systemFontOfSize:12.0];
//            Label_Email.backgroundColor=[UIColor whiteColor];
//            [Label_Email setText:@"Confim Email:"];
//            [scrollview addSubview:Label_Email];
            
            [ReportDelivery setTitle:@"Confim Email:" forState:normal];
            
            NSLog(@"patient id %@",Patientid);
            
            NSLog(@"patient id %@",self.WebService->patientID=Patientid);
            [self.WebService CallServicePatientDetailsEmailID:@"http://192.168.1.202:81/PatientModule/PatientService.asmx/GetUserEmail" Object:NULL Handler:NULL];
            
            Email_Val=[[UITextField alloc]initWithFrame:CGRectMake(150,10,160,30)];
            Email_Val.font = [UIFont boldSystemFontOfSize:12.0];
            Email_Val.clearButtonMode = UITextFieldViewModeWhileEditing;
            Email_Val.borderStyle = UITextBorderStyleLine;
            //  Email_Val.placeholder = @"";
            Email_Val.delegate =self;
            Email_Val.text=[NSString stringWithFormat:@"%@",self.WebService.ptr];
            email=Email_Val.text;
            DeliveryStaffID=(NSString*)[NSNull null];
            [scrollview addSubview:Email_Val];
            
            ReportStatus=@"2";
            
            break;
            
        }
        case 2:
        {
            
            [Email_Val removeFromSuperview];
            
//            Label_Staff=[[UILabel alloc]initWithFrame:CGRectMake(10,90,140,30)];
//            Label_Staff.font = [UIFont systemFontOfSize:12.0];
//            Label_Staff.backgroundColor=[UIColor whiteColor];
//            [Label_Staff setText:@"Select Delivery Staff:"];
//            [scrollview addSubview:Label_Staff];
            
                [ReportDelivery setTitle:@"Hospital/Doctor:" forState:normal];
            [Delivery_Staff removeFromSuperview];
            Delivery_Staff=[[UITextField alloc]initWithFrame:CGRectMake(150,10,160,30)];
            Delivery_Staff.font = [UIFont boldSystemFontOfSize:12.0];
            Delivery_Staff.placeholder = @"--Select Delivery Staff--" ;
            Delivery_Staff.borderStyle = UITextBorderStyleLine;
            Delivery_Staff.delegate =self;
            Delivery_Staff.tag=9;
            [scrollview addSubview:Delivery_Staff];
            email=(NSString*)[NSNull null];
            // DeliveryStaffID=(NSString*)[NSNull null];
            //[Delivery_Staff addTarget:self action:@selector(SearchPatients1:)forControlEvents:UIControlEventEditingDidBegin];
            ReportStatus=@"3";
            break;
            
        }
        case 3:
        {
            
            [ReportDelivery setTitle:@"Courier:" forState:normal];

            [Delivery_Staff removeFromSuperview];
            [Email_Val removeFromSuperview];
            email=(NSString*)[NSNull null];
            DeliveryStaffID=(NSString*)[NSNull null];
            
            ReportStatus=@"4";
            break;
            
        }
        case 4:
        {
            
            [ReportDelivery setTitle:@"Self:" forState:normal];
            [Delivery_Staff removeFromSuperview];
           
            [Email_Val removeFromSuperview];
      
            email=(NSString*)[NSNull null];
            DeliveryStaffID=(NSString*)[NSNull null];
            ReportStatus=@"5";
            break;
            
        }
        case 5:
        {
            
                [ReportDelivery setTitle:@"Direct/ByHand:" forState:normal];
//            Label_Staff=[[UILabel alloc]initWithFrame:CGRectMake(10,90,140,30)];
//            Label_Staff.font = [UIFont systemFontOfSize:12.0];
//            Label_Staff.backgroundColor=[UIColor whiteColor];
//            [Label_Staff setText:@"Select Delivery Staff:"];
//            [scrollview addSubview:Label_Staff];
            email=(NSString*)[NSNull null];
            // DeliveryStaffID=(NSString*)[NSNull null];
            // [self.WebService CallServiceGetStaffByRoleName:@"http://192.168.1.202:81//StaffModule/StaffService.asmx/GetStaffByRoleName" Object:NULL Handler:NULL];
            
            //   NSLog(@"role is %@",self.WebService->ptr1);
            
            //  Staff_Names=(NSMutableArray*)[self.WebService->ptr1 valueForKey:@"StaffName"];
            // NSLog(@"staff name is %@",Staff_Names);
            [Delivery_Staff removeFromSuperview];
            [Email_Val removeFromSuperview];
            Delivery_Staff=[[UITextField alloc]initWithFrame:CGRectMake(150,10,160,30)];
            Delivery_Staff.font = [UIFont boldSystemFontOfSize:12.0];
             Delivery_Staff.placeholder = @"--Select Delivery Staff--" ;
            Delivery_Staff.borderStyle = UITextBorderStyleLine;
            Delivery_Staff.delegate =self;
            Delivery_Staff.tag=9;
            [scrollview addSubview:Delivery_Staff];
            
            // [Delivery_Staff addTarget:self action:@selector(SearchPatients1:)forControlEvents:UIControlEventEditingDidBegin];
            ReportStatus=@"1";
            break;
            
        }
            
    }
    
}

-(void)discountvalue
{
    if(_button.selected)
    {
        DiscountINPerc=@"true";
        
        NSLog(@"discount is %@",discount.text);
        
        int x=100-[discount.text integerValue];
        NSLog(@"value is here %d",x);
        if(x<0)
        {
            discount.backgroundColor=[UIColor colorWithRed:255/256. green:0/256. blue:0/256. alpha:1];
            netcharges.text=@"";
            balance.text=@"0";
        }
        else
        {
            discount.backgroundColor=[UIColor whiteColor];
            float z=[TotalCharge.text integerValue]*x/100;
            NSLog(@"z is %f",z);
            netcharges.text=[NSString stringWithFormat:@"%.2f",z];
            point.text=[NSString stringWithFormat:@"%.f",(floor([netcharges.text integerValue]/[[[Point_Result objectAtIndex:0]valueForKey:@"Value"] integerValue]))*[[[Point_Result objectAtIndex:0]valueForKey:@"Points"] integerValue]];
            balance.text=[NSString stringWithFormat:@"%.2f",z];
        }
    }
    else if (_button1.selected)
    {
        DiscountINPerc=@"false";
        
        if([discount.text integerValue]>[TotalCharge.text integerValue])
        {
            discount.backgroundColor=[UIColor colorWithRed:255/256. green:0/256. blue:0/256. alpha:1];
            netcharges.text=@"";
            balance.text=@"0";
            
        }
        else
        {
            float x=[TotalCharge.text integerValue];
            float y=[discount.text integerValue];
            netcharges.text=[NSString stringWithFormat:@"%.2f",(x-y)];
            balance.text=[NSString stringWithFormat:@"%.2f",(x-y)];
            point.text=[NSString stringWithFormat:@"%.f",(floor([netcharges.text integerValue]/[[[Point_Result objectAtIndex:0]valueForKey:@"Value"] integerValue]))*[[[Point_Result objectAtIndex:0]valueForKey:@"Points"] integerValue]];
            
        }
        
    }
    if([initialamount.text integerValue]>0)
    {
        if([initialamount.text floatValue]>[netcharges.text floatValue])
        {
            initialamount.backgroundColor=[UIColor colorWithRed:255/256. green:0/256. blue:0/256. alpha:1];
            balance.text=@"0";
        }
        else
        {
            initialamount.backgroundColor=[UIColor whiteColor];
            float z=[netcharges.text floatValue]-[initialamount.text floatValue];
            NSLog(@"z is %f",z);
            // netcharges.text=[NSString stringWithFormat:@"%.2f",z];
            balance.text=[NSString stringWithFormat:@"%.2f",z];
        }
    }
    
    if(Refund.hidden==FALSE)
    {
        
        int x=[netcharges.text integerValue];
        int  y=[initialamount.text integerValue];
        if([netcharges.text integerValue]>=[initialamount.text integerValue])
        {
            NSLog(@"zero value");
            Refund.text=@"0";
            balance.text=[NSString stringWithFormat:@"%d",x-y];
            
        }
        else
        {
            Refund.text=[NSString stringWithFormat:@"%d",y-x];
            balance.text=@"0";
        }
        
    }
}
-(void)InitialAmount
{
    if([initialamount.text floatValue]>[netcharges.text floatValue])
    {
        initialamount.backgroundColor=[UIColor colorWithRed:255/256. green:0/256. blue:0/256. alpha:1];
        balance.text=@"0";
    }
    else
    {
        initialamount.backgroundColor=[UIColor whiteColor];
        float x=[initialamount.text floatValue];
        float y=[netcharges.text floatValue];
        balance.text=[NSString stringWithFormat:@"%.2f",(y-x)];
    }
    
    if(Refund.hidden==FALSE)
    {
        
        int x=[netcharges.text integerValue];
        int  y=[initialamount.text integerValue];
        if([netcharges.text integerValue]>=[initialamount.text integerValue])
        {
            NSLog(@"zero value");
            Refund.text=@"0";
            balance.text=[NSString stringWithFormat:@"%d",x-y];
            
        }
        else
        {
            Refund.text=[NSString stringWithFormat:@"%d",y-x];
            balance.text=@"0";
        }
        
    }
    
}
-(IBAction)SearchPatients1:(id)sender
{
    switch (((UITextField*)sender).tag)
    {
        case 2:
        {
            searching=NO;
            table_MedicalFacility.hidden=YES;
            
            [table_AdviseDoctor removeFromSuperview];
            PatientName=AdviseDr.text;
            NSLog(@"patname %@",PatientName);
            Count=@"0";
            // [Testname resignFirstResponder];
            NSLog(@"patname %@",self.WebService->patientname=PatientName);
            NSLog(@"count %@",self.WebService->count=Count);
            
            [self.WebService CallServicePatientNames:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/SearchAdviseDoctors" Object:NULL Handler:NULL];
            
            Advise_DoctorDetail=(NSMutableArray*)self.WebService->ptr1;
            Advise_Doctor=(NSMutableArray*)[Advise_DoctorDetail valueForKey:@"StaffName"];
            NSLog(@"sal is %@",Advise_DoctorDetail);
            NSLog(@"sal is %@",Advise_Doctor);
            
            table_AdviseDoctor=[[UITableView alloc]initWithFrame:CGRectMake(150,230,160,150)style:UITableViewStylePlain];
            table_AdviseDoctor.delegate=self;
            table_AdviseDoctor.dataSource=self;
            table_AdviseDoctor.layer.borderWidth = 2.0;
            table_AdviseDoctor.layer.borderColor = [UIColor grayColor].CGColor;
            [self.view addSubview:table_AdviseDoctor];
            
            [table_AdviseDoctor reloadData];
            
            break;
            
        }
        case 3:
        {
            table_AdviseDoctor.hidden=YES;
            [table_MedicalFacility removeFromSuperview];
            PatientName=Medicalfacility.text;
            NSLog(@"patname %@",PatientName);
            Count=@"0";
            // [Testname resignFirstResponder];
            NSLog(@"patname %@",self.WebService->patientname=PatientName);
            NSLog(@"count %@",self.WebService->count=Count);
            
            [self.WebService CallServicePatientNames:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/SearchMedicalFacilities" Object:NULL Handler:NULL];
            
            
            MedicalFacility_detail=(NSMutableArray*)self.WebService->ptr1;
            MedicalFacility_View=(NSMutableArray*)[MedicalFacility_detail valueForKey:@"Name"];
            NSLog(@"sal is %@",MedicalFacility_detail);
            NSLog(@"sal is %@",MedicalFacility_View);
            
            
            table_MedicalFacility=[[UITableView alloc]initWithFrame:CGRectMake(150,270,160,150)style:UITableViewStylePlain];
            table_MedicalFacility.delegate=self;
            table_MedicalFacility.dataSource=self;
            table_MedicalFacility.layer.borderWidth = 2.0;
            table_MedicalFacility.layer.borderColor = [UIColor grayColor].CGColor;
            [self.view addSubview:table_MedicalFacility];
            
            
            
            break;
        }
        case 4:
        {
            [Panel resignFirstResponder];
            [table_Panel removeFromSuperview];
            table_Panel=[[UITableView alloc]initWithFrame:CGRectMake(150,270,160,150)style:UITableViewStylePlain];
            table_Panel.delegate=self;
            table_Panel.dataSource=self;
            table_Panel.layer.borderWidth = 2.0;
            table_Panel.layer.borderColor = [UIColor grayColor].CGColor;
            [scrollview addSubview:table_Panel];
            break;
        }
        case 5:
        {
            [Delivery_Staff resignFirstResponder];
            [table_StaffNames removeFromSuperview];
            table_StaffNames=[[UITableView alloc]initWithFrame:CGRectMake(150,120,160,150)style:UITableViewStylePlain];
            table_StaffNames.delegate=self;
            table_StaffNames.dataSource=self;
            table_StaffNames.layer.borderWidth = 2.0;
            table_StaffNames.layer.borderColor = [UIColor grayColor].CGColor;
            [scrollview addSubview:table_StaffNames];
            
            break;
        }
        case 6:
        {
            [ToCollectedBy resignFirstResponder];
            [table_CollectionName removeFromSuperview];
            table_CollectionName=[[UITableView alloc]initWithFrame:CGRectMake(150,420,160,150)style:UITableViewStylePlain];
            table_CollectionName.delegate=self;
            table_CollectionName.dataSource=self;
            table_CollectionName.layer.borderWidth = 2.0;
            table_CollectionName.layer.borderColor = [UIColor grayColor].CGColor;
            [self.view addSubview:table_CollectionName];
            // table_CollectionName.hidden=YES;
            break;
        }
        case 7:
        {
            [table_SearchTestName removeFromSuperview];
            PatientName=Testname.text;
            NSLog(@"patname %@",PatientName);
            Count=@"0";
            // [Testname resignFirstResponder];
            NSLog(@"patname %@",self.WebService->patientname=PatientName);
            NSLog(@"count %@",self.WebService->count=Count);
            [self.WebService CallServicePatientNames:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/GetInvestigations" Object:NULL Handler:NULL];
            
            SearchTestDetails=[[NSMutableArray alloc]init];
            SearchTestNames=[[NSMutableArray alloc]init];
            NSLog(@"arr is %@",self.WebService->ptr1);
            SearchTestDetails=(NSMutableArray*)self.WebService->ptr1;
            NSLog(@"item is %@", SearchTestDetails);
            SearchTestNames=(NSMutableArray *)[SearchTestDetails valueForKey:@"Description"];
            NSLog(@"item is %@",SearchTestNames);
            
            table_SearchTestName=[[UITableView alloc]initWithFrame:CGRectMake(50,130,190,160) style:UITableViewStylePlain];
            table_SearchTestName.delegate=self;
            table_SearchTestName.dataSource=self;
            table_SearchTestName.layer.borderWidth = 2.0;
            table_SearchTestName.layer.borderColor = [UIColor grayColor].CGColor;
            [scrollview addSubview:table_SearchTestName];
            break;
        }
        case 8:
        {
            [DateTime resignFirstResponder];
            done.hidden=NO;
            if ([[UIScreen mainScreen] bounds].size.height >480)
            {
                DatePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0,350,320,50)];
            }
            else
            {
                DatePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0,270,320,50)];
            }
            DatePicker.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
            // DatePicker.datePickerMode = UIDatePickerModeDate;
            DatePicker.datePickerMode = UIDatePickerModeDateAndTime;
            DatePicker.date =
            [[ NSDate alloc ] initWithTimeIntervalSinceNow:(NSTimeInterval) 2];
            DatePicker.minimumDate =
            [[ NSDate alloc ] initWithTimeIntervalSinceNow:(NSTimeInterval) 0];
            //     DatePicker.date = [NSDate date];
            // [self.DateTime setInputView:DatePicker];
            //  done.hidden=NO;
            // [DateTime resignFirstResponder];
            DatePicker.userInteractionEnabled=YES;
            [self.view addSubview:DatePicker];
            
            break;
            
        }
            
        default:
            break;
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView==table_SearchPatient)
    {
        return [SearchPatientName count];
    }
    if(tableView==table_AdviseDoctor)
    {
        if (searching)
        {
            NSLog(@"copy %d",copyListOfItems.count);
            
            return copyListOfItems.count;
        }
        else
        {
            return [Advise_Doctor count];
        }
    }
    
    if (tableView==table_MedicalFacility)
    {
        return [MedicalFacility_View count];
        
    }
    if (tableView==table_Location)
    {
        return [Location_View count];
        
    }
    if (tableView==table_Panel)
    {
        NSLog(@"panel is %d",[Panel_View count]);
        return [Panel_View count];
        
    }
    if (tableView==table_StaffNames)
    {
        return [Staff_Names count];
        
    }
    if (tableView==table_CollectionName)
    {
        return [Staff_Names count];
        
    }
    if(tableView==tabel)
    {
        return [PrimaryCategory count];
    }
    if (tableView==tabel_SecondaryID)
    {
        return [SecondaryCategory count];
        
    }
    if (tableView==tabel_Tests)
    {
        return [Tests count];
        
    }
    if (tableView==tabel_AdviseTest)
    {
        NSLog(@"count is1 %d",[AdviseTest count]);
        return [AdviseTest count];
        
    }
    if (tableView==table_SearchTestName)
    {
        NSLog(@"count is 2%d",[SearchTestNames count]);
        return [SearchTestNames count];
        
    }
    if (tableView==table_AdviseTestDetails)
    {
        NSLog(@"count is3 %d",[AdviseTest count]);
        if([AdviseTest count]==0)
        {
            return 1;
        }
        else
        {
        return [AdviseTest count];
        }
        
    }
    if (tableView==table_adviseInvestiondetail)
    {
        NSLog(@"count is4 %d",[AdviseTest count]);
        return [AdviseTest count];
        
    }
    
    return 0;
    //count number of row from counting array hear cataGorry is An Array
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	// There is only one section.
	return 1;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *title;
    
    
    if(tableView==tabel)
    {
        title=@"Primary Category";
    }
    if(tableView==tabel_SecondaryID)
    {
        title=@"Secondary Category";
    }
    if(tableView==tabel_Tests)
    {
        title=@"Tests";
    }
    if(tableView==tabel_AdviseTest)
    {
        title=@"Advise Tests";
    }
    
    return title;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    static NSString *MyIdentifier = @"MyIdentifier";
    //
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    NSString *MyIdentifier = [NSString stringWithFormat:@"S%1dR%1d",indexPath.section,indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    
    if(tableView==table_SearchPatient)
    {
        
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier] ;
            
        }
        cell.textLabel.text = [SearchPatientName objectAtIndex:indexPath.row];
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12.0f];
    }
    else if(tableView==table_AdviseDoctor)
    {
        
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier] ;
            
        }
        if(searching)
        {
            cell.textLabel.text = [copyListOfItems objectAtIndex:indexPath.row];
            
        }
        else
        {
            cell.textLabel.text = [Advise_Doctor objectAtIndex:indexPath.row];
        }
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12.0f];
        NSLog(@"advise dr is %@",AdviseDr.text);
        
        
    }
    else if(tableView==table_MedicalFacility)
    {
        
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier] ;
            
        }
        cell.textLabel.text = [MedicalFacility_View objectAtIndex:indexPath.row];
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12.0f];
        if([MedicalFacility_View containsObject:Medicalfacility.text])
        {
            cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12.0f];
            
        }
    }
    else if(tableView==table_Location)
    {
        
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier] ;
            
        }
        cell.textLabel.text = [Location_View objectAtIndex:indexPath.row];
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12.0f];
    }
    else  if(tableView==table_Panel)
    {
        
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier] ;
            
        }
        cell.textLabel.text = [Panel_View objectAtIndex:indexPath.row];
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12.0f];
    }
    else  if(tableView==table_StaffNames)
    {
        
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier] ;
            
        }
        cell.textLabel.text = [Staff_Names objectAtIndex:indexPath.row];
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12.0f];
    }
    else  if(tableView==table_CollectionName)
    {
        
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier] ;
            
        }
        cell.textLabel.text = [Staff_Names objectAtIndex:indexPath.row];
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12.0f];
    }
    
    else  if(tableView==tabel)
    {
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier] ;
        }
        cell.textLabel.text = [PrimaryCategory objectAtIndex:indexPath.row];
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12.0f];
    }
    
    
    else if (tableView==tabel_SecondaryID)
    {        if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier] ;
        
    }
        
        cell.textLabel.text = [SecondaryCategory objectAtIndex:indexPath.row];
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12.0f];
        
    }
    else  if (tableView==tabel_Tests)
    {
        
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier] ;
            
        }
        
        cell.textLabel.text = [Tests objectAtIndex:indexPath.row];
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12.0f];
        
    }
    else  if (tableView==tabel_AdviseTest)
    {
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier] ;
            
        }
        cell.textLabel.text = [AdviseTest objectAtIndex:indexPath.row];
        NSLog(@"cell is %@",cell.textLabel.text);
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12.0f];
    }
    else  if (tableView==table_SearchTestName)
    {
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier] ;
            
        }
        
        cell.textLabel.text = [SearchTestNames objectAtIndex:indexPath.row];
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12.0f];
    }
    else  if (tableView==table_AdviseTestDetails)
    {
        if (cell== nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier] ;
            
//            UILabel *FreeTest1=[[UILabel alloc]initWithFrame:CGRectMake(300, 10, 100, 15)];
//            [FreeTest1 setText:@"Free Test?"];
//            [cell.contentView addSubview:FreeTest1];
            NSLog(@"here");
            
            UILabel *testnameval=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 44)];
            testnameval.tag=1;
            testnameval.font = [UIFont systemFontOfSize:12.0];

            [cell.contentView addSubview:testnameval];
            
            UILabel *amountval=[[UILabel alloc]initWithFrame:CGRectMake(240, 0, 50, 44)];
            amountval.tag=indexPath.row+50;
            [cell.contentView addSubview:amountval];
            
            UIButton  *Check_Test1=[[UIButton alloc]initWithFrame:CGRectMake(200,13,18,18)];
            Check_Test1.tag=indexPath.row+300;
            //            [Check_Test1 setImage:[UIImage imageNamed:@""]forState:UIControlStateNormal];
            //            [Check_Test1 setImage:[UIImage imageNamed:@"cross_red"]forState:UIControlStateSelected];
            [Check_Test1 addTarget:self action:@selector(FreeTest:)forControlEvents:UIControlEventTouchUpInside];
            imageLayer = Check_Test1.layer;
            [imageLayer setCornerRadius:05];
            [imageLayer setBorderWidth:1];
            imageLayer.borderColor=[[UIColor lightGrayColor] CGColor];
            Check_Test1.hidden=YES;
            [cell.contentView addSubview:Check_Test1];
         }

    if([AdviseTest count]!=0)
    {

        UIButton   * check=(UIButton *)[cell viewWithTag:indexPath.row+300];
        
         UILabel   * lbl1=(UILabel *)[cell viewWithTag:1];
        [lbl1 setText:[NSString stringWithFormat:@"%@",[AdviseTest objectAtIndex:indexPath.row]]];
          lbl1.lineBreakMode=NSLineBreakByWordWrapping;
        
        NSLog(@"label %@",NSStringFromCGRect(lbl1.frame));
        
        
        lbl1.numberOfLines=0;
        
        UILabel *lbl2=(UILabel *)[cell viewWithTag:indexPath.row+50];
        
        lbl2.hidden=NO;
        [lbl2 setText:[NSString stringWithFormat:@"%@",[ChargeVal objectAtIndex:indexPath.row]]];
        NSLog(@"label %@",NSStringFromCGRect(lbl2.frame));

       
        check.hidden=NO;
        
        
        if (CaseID!=NULL)
        {
            NSString *is_sample_recv=[NSString stringWithFormat:@"%@",[[WorkListData objectAtIndex:indexPath.row] valueForKey:@"IsSampleReceived"]];
            NSString *is_IsTestCompleted=[NSString stringWithFormat:@"%@",[[WorkListData objectAtIndex:indexPath.row] valueForKey:@"IsTestCompleted"]];
            NSLog(@"sample and cmp %@ and %@",is_IsTestCompleted,is_sample_recv);
            
            if ([is_sample_recv isEqualToString:@"1"] && [is_IsTestCompleted isEqualToString:@"1"]) {
                
                NSLog(@"sample and cmp %@ and %@",is_IsTestCompleted,is_sample_recv);
                check.hidden=YES;
                
            }
            else
            {
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                // UIImageView *av = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width, .frame.size.height)];
                tableView.allowsMultipleSelection=YES;
                
                //av.tag=indexPath.row+400;
                // cell.backgroundView=av;
                UIButton *cancel_test=[[UIButton alloc]initWithFrame:CGRectMake(0,0,30,44)];
                cancel_test.tag=indexPath.row+500;
                
                [cancel_test setImage:[UIImage imageNamed:@"cross_red"]forState:UIControlStateNormal];
                CGRect frame=lbl1.frame;
                frame.origin.x=32;
                //cancel_test.backgroundColor=[UIColor grayColor];
               // lbl1.backgroundColor=[UIColor redColor];
                lbl1.frame=frame;
                 NSLog(@"label %@",NSStringFromCGRect(lbl1.frame));
                
                
                CGRect f2= check.frame;
                f2.origin.x=240;
                check.frame=f2;

                
                CGRect f1= lbl2.frame;
                f1.origin.x=280;
                lbl2.frame=f1;
                
                
                
             
                //   [cancel_test setImage:[UIImage imageNamed:@"cross_red"]forState:UIControlStateSelected];
                
                //  cancel_test.backgroundColor=[UIColor grayColor];
                //   [cancel_test setImage:[UIImage imageNamed:@""]forState:UIControlStateNormal];
                [cancel_test addTarget:self action:@selector(cancelTest:)forControlEvents:UIControlEventTouchUpInside];
                [cell.contentView addSubview:cancel_test];
            }
        }
        else
        {
            tableView.allowsMultipleSelection=NO;
            
        }
   
       // UILabel *lbl1=(UILabel *)[cell viewWithTag:1];
       
       // lbl111.text=lbl1.text;
        

       }
       else
       {
           // UILabel *lbl1=(UILabel *)[cell viewWithTag:1];
            //  cell.textLabel.text=@"Test To be Added";
           UILabel   * lbl1=(UILabel *)[cell viewWithTag:1];
           [lbl1 setText:@"Test To be Added"];

           cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12.0f];
            
            
        }
        
    }

    return cell;    // Here we use the provided setImageWithURL: method to load the web image
    // Ensure you use a placeholder image otherwise cells will be initialized with no image
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(tableView==table_SearchPatient)
    {
         [patientname resignFirstResponder];
        
        advise.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
        advise.userInteractionEnabled=YES;
        [patientname setText:[NSString stringWithFormat:@"%@",[SearchPatientName objectAtIndex:indexPath.row]]];
        NSLog(@"patient name %@",patientname.text);
        
        
        PatientCode=[NSString stringWithFormat:@"%@",[[SearchPatientDetail objectAtIndex:indexPath.row]valueForKey:@"PatientCode"]];
        NSLog(@"patient code %@",PatientName);
         PatientCodeVal.text = [NSString stringWithFormat:@"%@",PatientCode];
        
        Patientid=[NSString stringWithFormat:@"%@",[[SearchPatientDetail objectAtIndex:indexPath.row]valueForKey:@"PatientId"]];
        
        NSLog(@"patient code %@",Patientid);
        
        
        NSLog(@"patcode=%@",self.WebService->patientcode=Patientid);
        
        [self.WebService CallServicePatientDetails:@"http://192.168.1.202:81/PatientModule/PatientBedAssignmentService.asmx/GetPatient" Object:NULL Handler:NULL];
        Result=[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:0]valueForKey:@"Address"]];
        
        AreaID=[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:0]valueForKey:@"AreaId"]];
        NSLog(@"area is %@",self.WebService->Area_Id=AreaID);
        
        [self.WebService CallServicePatientDetailsAreaID:@"http://192.168.1.202:81/CommonMasterModule/UIService.asmx/GetOthersFromArea" Object:NULL Handler:NULL];
        
        NSLog(@"area is %@",self.WebService->ptr1);
        
        Result=[NSString stringWithFormat:@"%@ ,%@ ,%@ ",Result,[[self.WebService->ptr1 objectAtIndex:0]valueForKey:@"AreaName"],[[self.WebService->ptr1 objectAtIndex:0]valueForKey:@"PinCode"]];
        
        textview_Address.text = [NSString stringWithFormat:@"%@",Result];

        
        // [table_SearchPatient reloadData];
        table_SearchPatient.hidden=YES;
       // [self donebtn:nil];
        
    }
    if(tableView==table_AdviseDoctor)
    {
        //        NSLog(@"row %d",indexPath.row);
        //        if(searching)
        //        {
        //
        //            [AdviseDr setText:[NSString stringWithFormat:@"%@",[copyListOfItems objectAtIndex:indexPath.row]]];
        //
        //            NSLog(@"advise dr %@",AdviseDr.text);
        //
        //        }
        //        else
        {
            [AdviseDr setText:[NSString stringWithFormat:@"%@",[Advise_Doctor objectAtIndex:indexPath.row]]];
            
            NSLog(@"advise dr %@",AdviseDr.text);
        }
        
        table_AdviseDoctor.hidden=YES;
        AdviseBy=[NSString stringWithFormat:@"%@",[[Advise_DoctorDetail objectAtIndex:indexPath.row]valueForKey:@"StaffId"]];
        self.WebService->Staff_id=AdviseBy;
        NSLog(@"value is %@",self.WebService->Staff_id);
        [self.WebService CallServiceGetLocationOfStaff:@"http://192.168.1.202:81//StaffModule/StaffService.asmx/GetLocationOfStaff" Object:NULL Handler:NULL];
        
        NSLog(@"value is %@",self.WebService->ptr1);
        if((self.WebService->ptr1).count==0)
        {
            [Medicalfacility setText:[NSString stringWithFormat:@""]];
            SerialNumberName=AdviseBy;
            NSLog(@"serial %@",SerialNumberName);
            
        }
        else
        {
            [Medicalfacility setText:[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:0] valueForKey:@"Name"]]];
            SerialNumberName=[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:0] valueForKey:@"LocationId"]];
            NSLog(@"serial %@",SerialNumberName);
        }
    }
    if(tableView==table_MedicalFacility)
    {
        [Medicalfacility setText:[NSString stringWithFormat:@"%@",[MedicalFacility_View objectAtIndex:indexPath.row]]];
        SerialNumberName=[NSString stringWithFormat:@"%@",[[MedicalFacility_detail objectAtIndex:indexPath.row]valueForKey:@"LocationId"]];
        NSLog(@"advise is %@",SerialNumberName);
        table_MedicalFacility.hidden=YES;
        AdviseDr.text=@"";
        AdviseBy=(NSString*)[NSNull null];
        // DeliveryStaffID=(NSString*)[NSNull null];
        
    }
    if(tableView==table_Location)
    {
        [location setText:[NSString stringWithFormat:@"%@",[Location_View objectAtIndex:indexPath.row]]];
        LocationID=[NSString stringWithFormat:@"%@",[[Location_detail objectAtIndex:indexPath.row]valueForKey:@"LocationId"]];
        NSLog(@"location %@",LocationID);
        table_Location.hidden=YES;
        
        self.WebService->Branchid=LocationID;
        
        [self.WebService CallServiceMedicalFacilityGetAllPanelsWithNone:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/GetAllPanelsWithNone" Object:NULL Handler:NULL];
        Panel_detail=(NSMutableArray*)self.WebService->ptr1;
        Panel_View=(NSMutableArray*)[Panel_detail valueForKey:@"Name"];
        NSLog(@"sal is %@",Panel_View);
        NSLog(@"sal is %@",Panel_detail);
        
        Panel.text=[NSString stringWithFormat:@"%@",[[Panel_detail objectAtIndex:0]valueForKey:@"Name"]];
        PanelValue=[NSString stringWithFormat:@"%@",[[Panel_detail objectAtIndex:0]valueForKey:@"PackageId"]];
        
    }
    if(tableView==table_Panel)
    {
        [Panel setText:[NSString stringWithFormat:@"%@",[Panel_View objectAtIndex:indexPath.row]]];
        
        table_Panel.hidden=YES;
        PanelValue=[NSString stringWithFormat:@"%@",[[Panel_detail objectAtIndex:indexPath.row]valueForKey:@"PackageId"]];
        
        NSLog(@"row %@",PanelValue);
        
    }
    if(tableView==table_StaffNames)
    {
        [Delivery_Staff setText:[NSString stringWithFormat:@"%@",[Staff_Names objectAtIndex:indexPath.row]]];
        DeliveryStaffID=[NSString stringWithFormat:@"%@",[[StaffName_Details objectAtIndex:indexPath.row]valueForKey:@"StaffId"]];
        
        table_StaffNames.hidden=YES;
        
    }
    if(tableView==table_CollectionName)
    {
        [ToCollectedBy setText:[NSString stringWithFormat:@"%@",[Staff_Names objectAtIndex:indexPath.row]]];
        CollectionStaffID=[NSString stringWithFormat:@"%@",[[StaffName_Details objectAtIndex:indexPath.row]valueForKey:@"StaffId"]];
        table_CollectionName.hidden=YES;
    }
    
    if(tableView==tabel)
    {
        PrimaryCategoryID=[NSString stringWithFormat:@"%@",[[PrimaryCategoryDetail objectAtIndex:indexPath.row]valueForKey:@"PrimaryCategoryId"]];
        
        NSLog(@"secondary id is %@", self.WebService->Primarycategory=PrimaryCategoryID);
        
        [self.WebService CallServiceGetSecondaryCategory:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/GetSecondaryCategory" Object:NULL Handler:NULL];
        
        NSLog(@"sec is %@",self.WebService->ptr1);
        
        SecondaryCategoryDetail=(NSMutableArray*)self.WebService->ptr1;
        SecondaryCategory=(NSMutableArray*)[SecondaryCategoryDetail valueForKey:@"SecondaryCategoryName"];
        NSLog(@"secondary is %@",SecondaryCategory);
        [tabel_SecondaryID reloadData];
        
        SecondaryCategoryID=[NSString stringWithFormat:@"%@",[[SecondaryCategoryDetail objectAtIndex:0]valueForKey:@"SecondaryCategoryId"]];
        
        NSLog(@"secondary id is %@", self.WebService->Primarycategory=SecondaryCategoryID);
        
        [self.WebService CallServiceGetInvestigationsBySecondaryCategory:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/GetInvestigationsBySecondaryCategory" Object:NULL Handler:NULL];
        
        NSLog(@"sec is %@",self.WebService->ptr1);
        
        TestsDetail=(NSMutableArray*)self.WebService->ptr1;
        Tests=(NSMutableArray*)[TestsDetail valueForKey:@"Description"];
        NSLog(@"secondary is %@",Tests);
        
        [tble_scroll setContentOffset:CGPointMake(Kwidth*swipe, 0) animated:YES];
        NSLog(@"Kwidth %d",Kwidth);
        swipe++;
        
        [tabel_Tests reloadData];
        
    }
    if (tableView==tabel_SecondaryID)
    {
        pre.enabled=YES;
        [tble_scroll setContentOffset:CGPointMake(Kwidth*swipe, 0) animated:YES];
        NSLog(@"Kwidth %d",Kwidth);
        swipe++;
               SecondaryCategoryID=[NSString stringWithFormat:@"%@",[[SecondaryCategoryDetail objectAtIndex:indexPath.row]valueForKey:@"SecondaryCategoryId"]];
        
        NSLog(@"secondary id is %@", self.WebService->Primarycategory=SecondaryCategoryID);
        
        [self.WebService CallServiceGetInvestigationsBySecondaryCategory:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/GetInvestigationsBySecondaryCategory" Object:NULL Handler:NULL];
        
        NSLog(@"sec is %@",self.WebService->ptr1);
        
        TestsDetail=(NSMutableArray*)self.WebService->ptr1;
        Tests=(NSMutableArray*)[TestsDetail valueForKey:@"Description"];
        NSLog(@"secondary is %@",Tests);
        
        [tabel_Tests reloadData];
        
    }
    if (tableView==tabel_Tests)
    {
        next.enabled=NO;
        
        self.WebService->patientID=Patientid;
        InvistigationID=[NSString stringWithFormat:@"%@",[[TestsDetail objectAtIndex:indexPath.row]valueForKey:@"InvestigationId"]];
        
        [Investigatio_ID addObject:InvistigationID];
        NSLog(@"inv is %@",Investigatio_ID);
        
        self.WebService->investigation_id=InvistigationID;
        [self.WebService CallServiceIsInvestigationApplicable:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/IsInvestigationApplicable" Object:NULL Handler:NULL];
        NSLog(@"result is %@",self.WebService->ptr1);
        // CheckTest=(NSMutableArray*)self.WebService->ptr1;
        NSLog(@"result is %@",[NSString stringWithFormat:@"%@",[self.WebService->ptr1 valueForKey:@"Value"]]);
        // NSString *Value=
        
        if([[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:0]valueForKey:@"Value"]]isEqualToString:@"<null>"])
        {
            alert = [[UIAlertView alloc] initWithTitle:@"Check" message:@"This test is not applicable to this patient" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
            
            [alert show];
        }
        else
        {
            if([AdviseTest containsObject:[Tests objectAtIndex:indexPath.row]])
            {
                NSLog(@"test alreay exit");
                alert = [[UIAlertView alloc] initWithTitle:@"Check" message:@"This test is already selected" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
                
                [alert show];
            }
            else
            {
                self.WebService->investigation_id=[NSString stringWithFormat:@"%@",[[TestsDetail objectAtIndex:indexPath.row]valueForKey:@"InvestigationId"]];
                self.WebService->Branchid=LocationID;
                
                [self.WebService CallServiceGetApplicableChargesNew:@"http://192.168.1.202:81//BillingModule/BillingService.asmx/GetApplicableChargesNew" Object:NULL Handler:NULL];
                
                NSLog(@"charge is %@",self.WebService->ptr1);
                ChargeDetail=(NSMutableArray*)self.WebService->ptr1;
                NSLog(@"panel %@",PanelValue);
                
                for (int i=0;i<ChargeDetail.count ; i++)
                {
                    if([PanelValue isEqualToString:[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:i]valueForKey:@"PackageId"]]])
                    {
                        
                        if([[NSString stringWithFormat:@"%@",[[ChargeDetail objectAtIndex:i]valueForKey:@"Amount"]]isEqualToString:@"<null>"])
                        {
                            str=[NSString stringWithFormat:@"%@",[[ChargeDetail objectAtIndex:0]valueForKey:@"Amount"]];
                            NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"-"];
                            str = [[str componentsSeparatedByCharactersInSet:doNotWant]componentsJoinedByString:@""];
                            
                        }
                        else
                        {
                            str=[NSString stringWithFormat:@"%@",[[ChargeDetail objectAtIndex:i]valueForKey:@"Amount"]];
                            NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"-"];
                            str = [[str componentsSeparatedByCharactersInSet:doNotWant]componentsJoinedByString:@""];
                        }
                        break;
                    }
                    
                }
                
               // [ChargeArr addObject:str];
              //  NSMutableDictionary *charge=[[NSMutableDictionary alloc]initWithObjectsAndKeys:str,@"value",[NSString stringWithFormat:@"%d",indexPath.row+50],@"tag", nil];
             
                
                
                [ChargeVal addObject:str];
                NSLog(@"inde %d",indexPath.row);
                
                NSMutableDictionary *get=[[NSMutableDictionary alloc]initWithObjectsAndKeys:str,@"value",[NSString stringWithFormat:@"%d",indexPath.row+100],@"tag", nil];
                
                [LabelArr addObject:get];
                NSLog(@"arrray %@",LabelArr);
                NSMutableDictionary *text_tag_dic=[[NSMutableDictionary alloc]initWithObjectsAndKeys:@"0",@"value",[NSString stringWithFormat:@"%d",indexPath.row+200],@"tag",nil];
                [Labeltxt addObject:text_tag_dic];
                
                NSLog(@"lal %@ and %@",LabelArr,Labeltxt);
                    
                TotalCharge.text=[NSString stringWithFormat:@"%d", [TotalCharge.text integerValue]+[str integerValue]];
                NSLog(@"chare val %@",TotalCharge.text);
                NSLog(@"chare val %@",netcharges.text);
                netcharges.text=[NSString stringWithFormat:@"%d", [netcharges.text integerValue]+[str integerValue]];
                NSLog(@"chare val %@",netcharges.text);
                balance.text=netcharges.text;
                
                NSLog(@"chare val %@",balance.text);
                
                NSDictionary *d2=[[NSDictionary alloc]initWithObjectsAndKeys:@"0",@"IsSampleReceived",@"0",@"IsTestCompleted", nil];
                
                [WorkListData addObject:d2];
                
                if(_button.selected)
                {
                    if([discount.text integerValue]>0)
                    {
                        float z=[TotalCharge.text floatValue]*(100-[discount.text floatValue])/100;
                        NSLog(@"z is %f",z);
                        netcharges.text=[NSString stringWithFormat:@"%.2f",z];
                        balance.text=[NSString stringWithFormat:@"%.2f",z];
                    }
                }
                else if (_button1.selected)
                {
                    if([discount.text integerValue]>[TotalCharge.text integerValue])
                    {
                        discount.backgroundColor=[UIColor colorWithRed:255/256. green:0/256. blue:0/256. alpha:1];
                        netcharges.text=@"";
                        balance.text=@"0";
                        
                    }
                    else
                    {
                        discount.backgroundColor=[UIColor whiteColor];
                        float x=[TotalCharge.text integerValue];
                        float y=[discount.text integerValue];
                        netcharges.text=[NSString stringWithFormat:@"%.2f",(x-y)];
                        balance.text=[NSString stringWithFormat:@"%.2f",(x-y)];
                        
                    }
                }
                
                if([initialamount.text integerValue]>0)
                {
                    if([initialamount.text floatValue]>[netcharges.text floatValue])
                    {
                        initialamount.backgroundColor=[UIColor colorWithRed:255/256. green:0/256. blue:0/256. alpha:1];
                        balance.text=@"0";
                    }
                    else
                    {
                        initialamount.backgroundColor=[UIColor whiteColor];
                        float z=[netcharges.text floatValue]-[initialamount.text floatValue];
                        NSLog(@"z is %f",z);
                        // netcharges.text=[NSString stringWithFormat:@"%.2f",z];
                        balance.text=[NSString stringWithFormat:@"%.2f",z];
                    }
                }
                
                if(CaseID!=NULL)
                {
                    
                    [Test_ID addObject:(NSString*)[NSNull null]];
                    [repotstatus addObject:ReportStatus];
                    [Freetest addObject:@"false"];
                    [CancelTest addObject:@"false"];
                    
                    int x,y;
                    
                    NSLog(@"str is %@",ChargeVal);
                    
                    x=[netcharges.text integerValue];
                    y=[initialamount.text integerValue];
                    if([netcharges.text integerValue]>=[initialamount.text integerValue])
                    {
                        NSLog(@"zero value");
                        Refund.text=@"0";
                        balance.text=[NSString stringWithFormat:@"%d",x-y];
                        
                    }
                    else
                    {
                        Refund.text=[NSString stringWithFormat:@"%d",y-x];
                        balance.text=@"0";
                    }
                    [table_AdviseTestDetails setEditing:NO animated:NO];

                }
                else{
                    [table_AdviseTestDetails setEditing:YES animated:YES];
                   
                }
                NSLog(@"str is %@",ChargeVal);
                
                [AdviseTest addObject:[Tests objectAtIndex:indexPath.row]];
                NSLog(@"selected is %@",AdviseTest);
                TestCount.hidden=NO;
                TestCount.text=[NSString stringWithFormat:@"%d",AdviseTest.count];
                int x=[netcharges.text integerValue];
                NSLog(@"netcharge is %@",netcharges.text);
                int y=[[[Point_Result objectAtIndex:0]valueForKey:@"Value"] integerValue];
                int z=[[[Point_Result objectAtIndex:0]valueForKey:@"Points"] integerValue];
                point.text=[NSString stringWithFormat:@"%.f",(floor(x/y))*z];
                tabel_AdviseTest.hidden=NO;
                discount_scroll.hidden=NO;
              //  table_AdviseTestDetails.hidden=NO;
                
                [table_AdviseTestDetails reloadData];
                [tabel_AdviseTest reloadData];
                // [table_adviseInvestiondetail reloadData];
                 //[super setEditing:YES animated:YES];
                [tabel_AdviseTest setEditing:YES animated:YES];
//                [table_AdviseTestDetails setEditing:YES animated:YES];
                
                self.WebService->investigation_id=InvistigationID;
                
                [self.WebService CallServiceGetApplicableChargesNew:@"http://192.168.1.202:81//BillingModule/BillingService.asmx/GetApplicableChargesNew" Object:NULL Handler:NULL];
                NSLog(@"charge is %@",self.WebService->ptr1);
                
            }
        }
    }
    if (tableView==table_SearchTestName)
    {
        [Testname resignFirstResponder];
        //[Testname setText:[NSString stringWithFormat:@"%@",[[SearchTestDetails objectAtIndex:indexPath.row]valueForKey:@"Description"]]];
        self.WebService->patientID=Patientid;
        InvistigationID=[NSString stringWithFormat:@"%@",[[SearchTestDetails objectAtIndex:indexPath.row]valueForKey:@"InvestigationId"]];
        
        [Investigatio_ID addObject:InvistigationID];
        
        self.WebService->investigation_id=InvistigationID;
        
        [self.WebService CallServiceIsInvestigationApplicable:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/IsInvestigationApplicable" Object:NULL Handler:NULL];
        
        NSLog(@"result is %@",self.WebService->ptr1);
        // CheckTest=(NSMutableArray*)self.WebService->ptr1;
        NSLog(@"result is %@",[NSString stringWithFormat:@"%@",[self.WebService->ptr1 valueForKey:@"Value"]]);
        
        if([[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:0]valueForKey:@"Value"]]isEqualToString:@"<null>"])
        {
            alert = [[UIAlertView alloc] initWithTitle:@"Check" message:@"This test is not applicable to this patient" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
            
            [alert show];
            
        }
        else
        {
            if([AdviseTest containsObject:[SearchTestNames objectAtIndex:indexPath.row]])
            {
                NSLog(@"test alreay exit");
                alert = [[UIAlertView alloc] initWithTitle:@"Check" message:@"This test is already selected" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
                
                [alert show];
            }
            else
            {
                self.WebService->investigation_id=[NSString stringWithFormat:@"%@",[[SearchTestDetails objectAtIndex:indexPath.row]valueForKey:@"InvestigationId"]];
                
                [self.WebService CallServiceGetApplicableChargesNew:@"http://192.168.1.202:81//BillingModule/BillingService.asmx/GetApplicableChargesNew" Object:NULL Handler:NULL];
                
                NSLog(@"charge is %@",self.WebService->ptr1);
                ChargeDetail=(NSMutableArray*)self.WebService->ptr1;
                
                for (int i=0;i<ChargeDetail.count ; i++)
                {
                    if([PanelValue isEqualToString:[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:i]valueForKey:@"PackageId"]]])
                    {
                        
                        if([[NSString stringWithFormat:@"%@",[[ChargeDetail objectAtIndex:i]valueForKey:@"Amount"]]isEqualToString:@"<null>"])
                        {
                            str=[NSString stringWithFormat:@"%@",[[ChargeDetail objectAtIndex:0]valueForKey:@"Amount"]];
                            NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"-"];
                            str = [[str componentsSeparatedByCharactersInSet:doNotWant]componentsJoinedByString:@""];
                            
                        }
                        else
                        {
                            str=[NSString stringWithFormat:@"%@",[[ChargeDetail objectAtIndex:i]valueForKey:@"Amount"]];
                            NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"-"];
                            str = [[str componentsSeparatedByCharactersInSet:doNotWant]componentsJoinedByString:@""];
                        }
                        break;
                    }
                    
                }
               
                [ChargeVal addObject:str];
                NSLog(@"inde %d",indexPath.row);
                
                NSMutableDictionary *get=[[NSMutableDictionary alloc]initWithObjectsAndKeys:str,@"value",[NSString stringWithFormat:@"%d",indexPath.row+100],@"tag", nil];
                
                [LabelArr addObject:get];
                NSLog(@"arrray %@",LabelArr);
                NSMutableDictionary *text_tag_dic=[[NSMutableDictionary alloc]initWithObjectsAndKeys:@"0",@"value",[NSString stringWithFormat:@"%d",indexPath.row+200],@"tag",nil];
                [Labeltxt addObject:text_tag_dic];
                
                NSLog(@"lal %@ and %@",LabelArr,Labeltxt);
                
                TotalCharge.text=[NSString stringWithFormat:@"%d", [TotalCharge.text integerValue]+[str integerValue]];
                NSLog(@"chare val %@",TotalCharge.text);
                NSLog(@"chare val %@",netcharges.text);
                netcharges.text=[NSString stringWithFormat:@"%d", [netcharges.text integerValue]+[str integerValue]];
                NSLog(@"chare val %@",netcharges.text);
                balance.text=netcharges.text;
                
                NSLog(@"chare val %@",balance.text);
                
                NSDictionary *d2=[[NSDictionary alloc]initWithObjectsAndKeys:@"0",@"IsSampleReceived",@"0",@"IsTestCompleted", nil];
                
                [WorkListData addObject:d2];
                
                if(_button.selected)
                {
                    if([discount.text integerValue]>0)
                    {
                        float z=[TotalCharge.text floatValue]*(100-[discount.text floatValue])/100;
                        NSLog(@"z is %f",z);
                        netcharges.text=[NSString stringWithFormat:@"%.2f",z];
                        balance.text=[NSString stringWithFormat:@"%.2f",z];
                    }
                }
                else if (_button1.selected)
                {
                    if([discount.text integerValue]>[TotalCharge.text integerValue])
                    {
                        discount.backgroundColor=[UIColor colorWithRed:255/256. green:0/256. blue:0/256. alpha:1];
                        netcharges.text=@"";
                        balance.text=@"0";
                        
                    }
                    else
                    {
                        discount.backgroundColor=[UIColor whiteColor];
                        float x=[TotalCharge.text integerValue];
                        float y=[discount.text integerValue];
                        netcharges.text=[NSString stringWithFormat:@"%.2f",(x-y)];
                        balance.text=[NSString stringWithFormat:@"%.2f",(x-y)];
                        
                    }
                }
                
                if([initialamount.text integerValue]>0)
                {
                    if([initialamount.text floatValue]>[netcharges.text floatValue])
                    {
                        initialamount.backgroundColor=[UIColor colorWithRed:255/256. green:0/256. blue:0/256. alpha:1];
                        balance.text=@"0";
                    }
                    else
                    {
                        initialamount.backgroundColor=[UIColor whiteColor];
                        float z=[netcharges.text floatValue]-[initialamount.text floatValue];
                        NSLog(@"z is %f",z);
                        // netcharges.text=[NSString stringWithFormat:@"%.2f",z];
                        balance.text=[NSString stringWithFormat:@"%.2f",z];
                    }
                }
                
                if(CaseID!=NULL)
                {
                    
                    [Test_ID addObject:(NSString*)[NSNull null]];
                    [repotstatus addObject:ReportStatus];
                    [Freetest addObject:@"false"];
                    [CancelTest addObject:@"false"];
                    
                    int x,y;
                    
                    NSLog(@"str is %@",ChargeVal);
                    
                    x=[netcharges.text integerValue];
                    y=[initialamount.text integerValue];
                    if([netcharges.text integerValue]>=[initialamount.text integerValue])
                    {
                        NSLog(@"zero value");
                        Refund.text=@"0";
                        balance.text=[NSString stringWithFormat:@"%d",x-y];
                        
                    }
                    else
                    {
                        Refund.text=[NSString stringWithFormat:@"%d",y-x];
                        balance.text=@"0";
                    }
                    
                }
                
                NSLog(@"str is %@",ChargeVal);
                
                [AdviseTest addObject:[SearchTestNames objectAtIndex:indexPath.row]];
                NSLog(@"selected is %@",AdviseTest);
              //  TestCount.hidden=NO;
                TestCount.text=[NSString stringWithFormat:@"%d",AdviseTest.count];
                int x=[netcharges.text integerValue];
                NSLog(@"netcharge is %@",netcharges.text);
                int y=[[[Point_Result objectAtIndex:0]valueForKey:@"Value"] integerValue];
                int z=[[[Point_Result objectAtIndex:0]valueForKey:@"Points"] integerValue];
                point.text=[NSString stringWithFormat:@"%.f",(floor(x/y))*z];
                tabel_AdviseTest.hidden=NO;
                discount_scroll.hidden=NO;
                //  table_AdviseTestDetails.hidden=NO;
                
                [table_AdviseTestDetails reloadData];
                [tabel_AdviseTest reloadData];
                // [table_adviseInvestiondetail reloadData];
                //[super setEditing:YES animated:YES];
                [tabel_AdviseTest setEditing:YES animated:YES];
                [table_AdviseTestDetails setEditing:YES animated:YES];
                
                self.WebService->investigation_id=InvistigationID;
                
                [self.WebService CallServiceGetApplicableChargesNew:@"http://192.168.1.202:81//BillingModule/BillingService.asmx/GetApplicableChargesNew" Object:NULL Handler:NULL];
                NSLog(@"charge is %@",self.WebService->ptr1);
                
            }
        }
        table_SearchTestName.hidden=YES;
        Testname.text=@"";
    }
    
}
//-(void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    NSLog(@"here");
//    
//    if(tableView==table_AdviseTestDetails)
//    {
//        UILabel *lbl=(UILabel*)[cell viewWithTag:indexPath.row+50];
//        
//        [Cellarr addObject:lbl.text];
//        
//        NSLog(@"labl %@",Cellarr);
//        
//    }
//    
//    
//}
- (UITableViewCellEditingStyle)tableView:(UITableView *)aTableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if((aTableView==tabel_AdviseTest||aTableView==table_AdviseTestDetails)&&(CaseID==NULL))
    {
        
         return UITableViewCellEditingStyleDelete;
    }
    
//    if (CaseID!=NULL)
//    {
    else
    {
        return UITableViewCellEditingStyleNone;
        
     }
//    else
//        return UITableViewCellEditingStyleDelete;
//    
    //  return UITableViewCellEditingStyleNone;
}

// Update the data model according to edit actions delete or insert.
- (void)tableView:(UITableView *)aTableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        //  [aTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]  withRowAnimation:UITableViewRowAnimationFade];
            UITableViewCell *cell=[aTableView cellForRowAtIndexPath:indexPath];
               UIButton *btn=(UIButton*)[cell viewWithTag:indexPath.row+300];
                  UILabel *lbl=(UILabel*)[cell viewWithTag:indexPath.row+50];
        
        if(btn.selected)
        {
            btn.selected=NO;
        }
        
        ////          UITextField *txt=(UITextField*)[cell viewWithTag:indexPath.row+200];
        ////        txt.text=@"";
        //
        //        btn.selected=YES;
        //      //  [cell removeFromSuperview];
        
        [AdviseTest removeObjectAtIndex:indexPath.row];
        [ChargeVal removeObjectAtIndex:indexPath.row];
        [LabelArr removeObjectAtIndex:indexPath.row];
        [Labeltxt removeObjectAtIndex:indexPath.row];
        NSLog(@"chareval is %@",ChargeVal);
        NSLog(@"chareval is %@",LabelArr);
        
        TestCount.text=[NSString stringWithFormat:@"%d",AdviseTest.count];
        
        
        
        netcharges.text=@"0";
        balance.text=@"0";
        TotalCharge.text=@"0";
//        if(buttonarr.count==0)
//        {
           // TotalCharge.text=@"";
            for(int i=0;i<LabelArr.count;i++)
            {
                int x=[[[LabelArr objectAtIndex:i]valueForKey:@"value"]integerValue];
                NSLog(@"x is %d",x);
                int y=[TotalCharge.text integerValue];
                NSLog(@"y is %d",y);
                TotalCharge.text=[NSString stringWithFormat:@"%d",(x+y)];
                  netcharges.text=[NSString stringWithFormat:@"%d",(x+y)];
                 balance.text=[NSString stringWithFormat:@"%d",(x+y)];
                
                NSLog(@"total chare is %@",TotalCharge.text);
                
            }
        {
            
            if(_button.selected)
            {
                if([discount.text integerValue]>0)
                {
                    float z=[TotalCharge.text floatValue]*(100-[discount.text floatValue])/100;
                    NSLog(@"z is %f",z);
                    netcharges.text=[NSString stringWithFormat:@"%.2f",z];
                    balance.text=[NSString stringWithFormat:@"%.2f",z];
                }
            }
            else if (_button1.selected)
            {
                if([discount.text integerValue]>[TotalCharge.text integerValue])
                {
                    discount.backgroundColor=[UIColor colorWithRed:255/256. green:0/256. blue:0/256. alpha:1];
                    netcharges.text=@"";
                    balance.text=@"0";
                    
                }
                else
                {
                    float x=[TotalCharge.text integerValue];
                    float y=[discount.text integerValue];
                    netcharges.text=[NSString stringWithFormat:@"%.2f",(x-y)];
                    balance.text=[NSString stringWithFormat:@"%.2f",(x-y)];
                    
                }
            }
        }
        if([initialamount.text integerValue]>0)
        {
            if([initialamount.text floatValue]>[netcharges.text floatValue])
            {
                initialamount.backgroundColor=[UIColor colorWithRed:255/256. green:0/256. blue:0/256. alpha:1];
                balance.text=@"0";
                
            }
            else
            {
                
                float z=[netcharges.text floatValue]-[initialamount.text floatValue];
                NSLog(@"z is %f",z);
                // netcharges.text=[NSString stringWithFormat:@"%.2f",z];
                balance.text=[NSString stringWithFormat:@"%.2f",z];
                initialamount.backgroundColor=[UIColor whiteColor];
                
            }
        }
        int x=[netcharges.text integerValue];
        int y=[[[Point_Result objectAtIndex:0]valueForKey:@"Value"] integerValue];
        int z=[[[Point_Result objectAtIndex:0]valueForKey:@"Points"] integerValue];
        point.text=[NSString stringWithFormat:@"%.f",(floor(x/y))*z];
        
        
		[tabel_AdviseTest reloadData];
        
        NSLog(@"advise test is %d",AdviseTest.count);
        if(AdviseTest.count==0||ChargeVal.count==0)
        {
            TotalCharge.text=@"0";
            // [tabel_AdviseTest removeFromSuperview];
            //  [table_AdviseTestDetails removeFromSuperview];
            tabel_AdviseTest.hidden=YES;
            btn.hidden=YES;
            lbl.hidden=YES;
              [table_AdviseTestDetails setEditing:NO animated:NO];
           // discount_scroll.hidden=YES;
            //table_AdviseTestDetails.hidden=YES;
            
        }
        [table_AdviseTestDetails reloadData];

    }
}
-(IBAction)cancelTest:(id)sender
{
    if (table_AdviseTestDetails)
    {
        if ( CaseID!=NULL)
        {
            NSLog(@"tag %ld",(long)[sender tag]);
            NSIndexPath *index=[NSIndexPath indexPathForRow:[sender tag]-500 inSection:0];
            UITableViewCell *cell=[table_AdviseTestDetails cellForRowAtIndexPath:index];
            UIButton *btn=(UIButton*)[cell viewWithTag:index.row+500];
            
            UILabel *lbl=(UILabel*)[cell viewWithTag:index.row+50];
            float x1=[lbl.text floatValue];
            
            NSLog(@"chareval is %f",x1);
            
            NSLog(@"tag %@",btn );
            
            UITextField *txt=(UITextField*)[cell viewWithTag:index.row+200];
            
            UILabel *lbl_val=(UILabel*)[cell viewWithTag:index.row+100];
            r =[lbl_val.text floatValue];
            
            if (!(btn.selected))
            {
                canceltest=TRUE;
                
                [Cancelarr addObject:[NSString stringWithFormat:@"%d",btn.tag]];
                
                btn.selected=YES;
                cell.selected=YES;
                cell.backgroundColor=[UIColor redColor];
                TotalCharge.text=[NSString stringWithFormat:@"%.2f",[TotalCharge.text integerValue]-x1];
                netcharges.text=[NSString stringWithFormat:@"%.2f",[netcharges.text floatValue]-r];
                txt.userInteractionEnabled=NO;
                NSLog(@"tag %@",  TotalCharge.text );
                NSLog(@"tag %@",  netcharges.text );
                
            }
            else
            {
                canceltest=FALSE;
                
                [Cancelarr removeObject:[NSString stringWithFormat:@"%d",btn.tag]];
                
                btn.selected=NO;
                cell.selected=NO;
                cell.backgroundColor=[UIColor whiteColor];
                
                TotalCharge.text=[NSString stringWithFormat:@"%.2f",[TotalCharge.text integerValue]+x1];
                netcharges.text=[NSString stringWithFormat:@"%.2f",[netcharges.text floatValue]+r];
                txt.userInteractionEnabled=YES;
                
                NSLog(@"tag %@",  TotalCharge.text );
                NSLog(@"tag %@",  netcharges.text );
                
            }
            
            NSMutableArray *cancelcheck=[[NSMutableArray alloc]init];
            
            
            for(int i=0;i<Investigatio_ID.count;i++)
            {
                [cancelcheck addObject:[NSString stringWithFormat:@"%d",500+i]];
            }
            
            NSLog(@"cancel %@",Cancelarr);
            
            
            NSLog(@"cancel %@",cancelcheck);
            
            CancelTest=[[NSMutableArray alloc]init];
            
            
            for (int i= 0 ; i < cancelcheck.count ; i++)
            {
                if(![Cancelarr containsObject:[NSString stringWithFormat:@"%@",[cancelcheck objectAtIndex:i] ]])
                {
                    [CancelTest addObject:@"false"];
                    
                    
                }
                else
                {
                    [CancelTest addObject:@"true"];
                    
                }
                
                NSLog(@"des %@",CancelTest);
            }
            
            NSLog(@"des %@",CancelTest);
            
            
            if ([DiscountBreakUP isEqualToString:@"true"])
            {
                LabelArr=[[NSMutableArray alloc]init];
                Labeltxt=[[NSMutableArray alloc]init];
       //LabelTag=[[NSMutableArray alloc]init];
                
                for (int j = 0; j < [table_AdviseTestDetails numberOfRowsInSection:0]; j++)
                {
                    //            NSIndexPath *indexPath1 =[NSIndexPath indexPathForRow:j inSection:0];
                    //            NSLog(@"indexPath %@",indexPath1);
                    //            UITableViewCell *mycel=[self->table_AdviseTestDetails cellForRowAtIndexPath:indexPath1];
                    //            NSLog(@"cell %@",mycel);
                    //
                    UILabel *mybutton=(UILabel*)[self.view viewWithTag:100+j];
                    // mybutton.selected=YES;
                    NSLog(@"label %@",mybutton.text);
                    [LabelTag addObject:[NSString stringWithFormat:@"%d",mybutton.tag]];
                    
                    [LabelArr addObject:mybutton.text];
                    UITextField *mytxt=(UITextField*)[self.view viewWithTag:200+j];
                    
                    NSLog(@"mytxt %@",mytxt.text);
                    if([mytxt.text isEqualToString:@"(null)"])
                    {
                        [Labeltxt addObject:@"0"];
                        
                    }
                    else
                    {
                        [Labeltxt addObject:mytxt.text];
                    }
                }
                NSLog(@"label %@",LabelArr);
                NSLog(@"label %@",Labeltxt);
                NSLog(@"label %@",LabelTag);
                NSLog(@"label %@",buttonarr);
                
                
                //        for(int i=0;i<buttonarr.count;i++)
                //        {
                //
                //            NSString *butt=[NSString stringWithFormat:@"%@",[buttonarr objectAtIndex:i]];
                //
                //            for(int j=0;j<LabelTag.count;j++)
                //            {
                //                NSString *labelbutt=[NSString stringWithFormat:@"%@",[LabelTag objectAtIndex:j]];
                //
                //                if([butt isEqualToString:labelbutt])
                //                {
                //                    NSIndexPath *indexPath1 =[NSIndexPath indexPathForRow:j inSection:0];
                //                    NSLog(@"indexPath %@",indexPath1);
                //                    UITableViewCell *mycel=[self->table_AdviseTestDetails cellForRowAtIndexPath:indexPath1];
                //                    NSLog(@"cell %@",mycel);
                //
                //                    UILabel *mybutton=(UILabel*)[mycel viewWithTag:100+j];
                //                    // mybutton.selected=YES;
                //                    NSLog(@"label %@",mybutton.text);
                //
                //
                //                    r=r+[mybutton.text floatValue];
                //                    NSLog(@"r %f",r);
                //
                //                }
                //
                //            }
                //        }
                //        netcharges.text=0;
                //
                //        NSLog(@"tag %f",r );
                //
                //        for(int i=0;i<LabelArr.count;i++)
                //        {
                //            NSString *y= [NSString stringWithFormat:@"%@",[LabelArr objectAtIndex:i]];
                //
                //
                //            float z=[netcharges.text floatValue]+[y integerValue];
                //
                //
                //            netcharges.text=[NSString stringWithFormat:@"%.2f",z];
                //            NSLog(@"net %@",netcharges.text);
                //            //balance.text=[NSString stringWithFormat:@"%.2f",z];
                //
                //        }
                // netcharges.text=[NSString stringWithFormat:@"%.2f",[netcharges.text floatValue]-r];
                
                NSLog(@"net %@",netcharges.text);
                point.text=[NSString stringWithFormat:@"%.f",(floor([netcharges.text integerValue]/[[[Point_Result objectAtIndex:0]valueForKey:@"Value"] integerValue]))*[[[Point_Result objectAtIndex:0]valueForKey:@"Points"] integerValue]];
                balance.text=netcharges.text;
                NSLog(@"net %@",balance.text);
                
                NSLog(@"btn %@",buttonarr);
            }
            else
            {
                
                [self discountvalue];
            }
            
            if([initialamount.text integerValue]>0)
            {
                if([initialamount.text floatValue]>[netcharges.text floatValue])
                {
                    initialamount.backgroundColor=[UIColor colorWithRed:255/256. green:0/256. blue:0/256. alpha:1];
                    balance.text=@"0";
                }
                else
                {
                    initialamount.backgroundColor=[UIColor whiteColor];
                    float z=[netcharges.text floatValue]-[initialamount.text floatValue];
                    NSLog(@"z is %f",z);
                    // netcharges.text=[NSString stringWithFormat:@"%.2f",z];
                    balance.text=[NSString stringWithFormat:@"%.2f",z];
                }
            }
            
            int x=[netcharges.text integerValue];
            int  y=[initialamount.text integerValue];
            if([netcharges.text integerValue]>=[initialamount.text integerValue])
            {
                NSLog(@"zero value");
                Refund.text=@"0";
                balance.text=[NSString stringWithFormat:@"%d",x-y];
                
            }
            else
            {
                Refund.text=[NSString stringWithFormat:@"%d",y-x];
                balance.text=@"0";
            }
            
        }
    }
    
}
#pragma mark Row reordering

// Determine whether a given row is eligible for reordering or not.
//- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}
// Process the row move. This means updating the data model to correct the item indices.
//- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
//{
//    
//	NSString *item = [AdviseTest objectAtIndex:fromIndexPath.row];
//	[AdviseTest removeObject:item];
//	[AdviseTest insertObject:item atIndex:toIndexPath.row];
//    NSString *item1 = [ChargeVal objectAtIndex:fromIndexPath.row];
//	[ChargeVal removeObject:item1];
//	[ChargeVal insertObject:item1 atIndex:toIndexPath.row];
//    
//}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 30.0;

-(IBAction)UpdatePicker:(id)sender
{
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateStyle = NSDateFormatterMediumStyle;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int year = [[calendar components:NSYearCalendarUnit fromDate:[DatePicker date]] year];
    int month = [[calendar components:NSMonthCalendarUnit fromDate:[DatePicker date]] month];
    int day= [[calendar components:NSDayCalendarUnit fromDate:[DatePicker date]] day];
    int hour =[[calendar components:NSHourCalendarUnit fromDate:[DatePicker date]] hour];
    int minute = [[calendar components:NSMinuteCalendarUnit fromDate:[DatePicker date]] minute];
    
    NSString *date1 = [NSString stringWithFormat:@"%d/%d/%d %d:%d",day,month,year,hour,minute];//[df stringFromDate:_datePickerView.date]];
    NSLog(@"date %@",date1);
    
    if(text_tag==10)
    {
        
        NSDateFormatter  *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"dd/MM/yyyy HH:mm"];
        
        NSDate  *myDate = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@",date1]];
        NSLog(@"%@", [dateFormatter stringFromDate:myDate]);
        
        NSDateFormatter  *anotherDateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setAMSymbol:@"AM"];
        [dateFormatter setPMSymbol:@"PM"];
        [anotherDateFormatter setDateFormat:@"dd/MM/yyyy hh:mm a"];
        NSLog(@"%@", [anotherDateFormatter stringFromDate:myDate]);
        
        DateTime.text =[anotherDateFormatter stringFromDate:myDate];
        NSLog(@"datetime is %@",DateTime.text);
        Urgenttime=DateTime.text;
        DatePicker.hidden=YES;
        
    }
    else if (text_tag==1)
    {
        NSDateFormatter  *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"dd/MM/yyyy HH:mm"];
        
        NSDate  *myDate = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@",date1]];
        NSLog(@"%@", [dateFormatter stringFromDate:myDate]);
        
        NSDateFormatter  *anotherDateFormatter = [[NSDateFormatter alloc] init];
        //        [dateFormatter setAMSymbol:@"AM"];
        //        [dateFormatter setPMSymbol:@"PM"];
        [anotherDateFormatter setDateFormat:@"dd/MM/yyyy HH:mm"];
        NSLog(@"%@", [anotherDateFormatter stringFromDate:myDate]);
        
        DORegistration.text =[anotherDateFormatter stringFromDate:myDate];
        
    }
    DatePicker.hidden=YES;
    toolbar.hidden=YES;
    
}

-(IBAction)buttonPress_Check:(id)reconizer
{

    UIButton *buttonTag=(UIButton*)reconizer;
    
        if(buttonTag.tag==1)
        {
            DiscountPer.text=@"Discount(%)";
            float x=[TotalCharge.text floatValue];
            NSLog(@"x %.2f",x);
            
            float y=100-[discount.text integerValue];
            
            NSLog(@"y %.2f",y);
            
            float z=x*y/100;
            
            NSLog(@"z is %.2f",z);
            
            netcharges.text=[NSString stringWithFormat:@"%.2f",z ];
            
            balance.text=netcharges.text;
            
            _button.selected=YES;
            _button1.selected=NO;
            
        }
        else
        {
            DiscountPer.text=@"Discount(Rs)";
            float x=[TotalCharge.text floatValue];
            
            float y=[discount.text floatValue];
            
            float z=x-y;
            
            netcharges.text=[NSString stringWithFormat:@"%.2f",z ];
            
            _button.selected=NO;
            _button1.selected=YES;
            balance.text=netcharges.text;
            
        }
    
//        netcharges.text=0;
//            
//            for(int i=0;i<LabelArr.count;i++)
//            {
//                NSString *y= [NSString stringWithFormat:@"%@",[LabelArr objectAtIndex:i]];
//                
//                
//                float z=[netcharges.text floatValue]+[y integerValue];
//                
//                
//                netcharges.text=[NSString stringWithFormat:@"%.2f",z];
//                NSLog(@"net %@",netcharges.text);
//                //balance.text=[NSString stringWithFormat:@"%.2f",z];
//                
//            }
//            netcharges.text=[NSString stringWithFormat:@"%.2f",[netcharges.text floatValue]-r];
    
            NSLog(@"net %@",netcharges.text);
            point.text=[NSString stringWithFormat:@"%.f",(floor([netcharges.text integerValue]/[[[Point_Result objectAtIndex:0]valueForKey:@"Value"] integerValue]))*[[[Point_Result objectAtIndex:0]valueForKey:@"Points"] integerValue]];
            balance.text=netcharges.text;
            NSLog(@"net %@",balance.text);
    
      
     if([initialamount.text integerValue]>0)
     {
        if([initialamount.text floatValue]>[netcharges.text floatValue])
        {
            initialamount.backgroundColor=[UIColor colorWithRed:255/256. green:0/256. blue:0/256. alpha:1];
            balance.text=@"0";
        }
        else
        {
            initialamount.backgroundColor=[UIColor whiteColor];
            float z=[netcharges.text floatValue]-[initialamount.text floatValue];
            NSLog(@"z is %f",z);
            // netcharges.text=[NSString stringWithFormat:@"%.2f",z];
            balance.text=[NSString stringWithFormat:@"%.2f",z];
        }
    }
    
    //
    //    UIButton *btn = (UIButton *)[reconizer view];
    //    NSLog(@"btn %d",btn.tag);
    //    switch (btn.tag)
    //    {
    //
    //        case 1:
    //        {
    //            [_button setImage:[UIImage imageNamed:@"images-19"] forState:UIControlStateNormal];
    //
    //            [_button1 setImage:[UIImage imageNamed:@"images-20"] forState:UIControlStateNormal];
    //
    //            discount.hidden=NO;
    //            discountrupees.hidden=YES;
    //            DiscountRuppes.hidden=YES;
    //            DiscountPer.hidden=NO;
    //            break;
    //
    //        }
    //        case 2:
    //        {
    //            [_button setImage:[UIImage imageNamed:@"images-20"] forState:UIControlStateNormal];
    //
    //            [_button1 setImage:[UIImage imageNamed:@"images-19"] forState:UIControlStateNormal];
    //
    //            discount.hidden=YES;
    //            discountrupees.hidden=NO;
    //            DiscountRuppes.hidden=NO;
    //            DiscountPer.hidden=YES;
    //
    //            break;
    //
    //        }
    //
    //        default:
    //            break;
    //
    //    }
    //
}

-(void)buttonselect:(id)sender
{
    
    UIButton *btn=(UIButton*)sender;
    
    //  {"submitDetails":{"advisedBy":null,"IsUrgent":false,"MedFacilityName":"","FirstName":"","UrgentTime":null,"AdvisedDate":"05/07/2013 14:34:56","PatientId":"d210948a-b04d-4eaa-9332-2ef80552df4f","AreaId":"d89c15ef-30b2-4c8d-8c85-66a5871d7c24","PatientCode":"PH170520130160","panelId":null,"reportStatus":"5","discountInPerc":true,"email":null,"locationId":"5f15648f-12ef-4534-a145-4044bc7c742e","remarks":"","DiscountBreakUp":false,"TotalCharges":0,"Discount":0,"NetCharges":0,"serialNumberName":"5f15648f-12ef-4534-a145-4044bc7c742e","CollectionStaffId":"33dbb45b-2014-467e-9693-137f92c54e98","RewardPoints":0,"LoyalityId":"dbb8d53e-c6c5-4d89-9733-a3947f22fc65","DeliveryStaffId":null,"InitialAmount":0},"advisedInvestigations":[{"InvestigationId":"33a8b03f-4ad2-424a-8aa9-02a07d3937eb","Charge":0,"InvDiscount":0,"InvNetCharge":0,"ReminderDate":null}]}
    
    switch (btn.tag)
    {
        case 1:
        {
            
            NSLog(@"lablarr %@",LabelArr);
            
            NSLog(@"lablarr %@",Labeltxt);

            NSLog(@"lablarr %@",ChargeArr);

            NSLog(@"lablarr %@",ChargeVal);

            
            NSLog(@"patientcode %@",PatientName);
            NSLog(@"patientid %@",Patientid);
            NSLog(@"advise date %@",theDate);
            NSLog(@"area  id is %@",AreaID);
            NSLog(@"collection %@",CollectionStaffID);
            
            totalCharge=TotalCharge.text;
            netcharge=netcharges.text;
            
            discountstr=discount.text;
            initialAmount=initialamount.text;
            RewardPoints=point.text;
            
            if(TotalCharge.text==NULL || [TotalCharge.text isEqual:@""])
            {
                totalCharge=@"0";
                
            }
            if(netcharges.text==NULL || [netcharges.text isEqual:@""])
            {
                netcharge=@"0";
                
            }
            
            if(discount.text==NULL || [discount.text isEqual:@""])
            {
                discountstr=@"0";
                
            }
            
            if(initialamount.text==NULL || [initialamount.text isEqual:@""])
            {
                initialAmount=@"0";
                
            }
            if(point.text==NULL || [point.text isEqual:@""])
            {
                RewardPoints=@"0";
                
            }
            NSLog(@"advis %@,medical %@",AdviseDr.text,Medicalfacility.text);
            
            if(((AdviseDr.text==NULL)||[AdviseDr.text isEqualToString:@""]) && ((Medicalfacility.text ==NULL)|| [Medicalfacility.text isEqualToString:@""]))
            {
                
                AdviseBy=(NSString*)[NSNull null];
                SerialNumberName=LocationID;
                NSLog(@"serial no %@",SerialNumberName);
                
            }
            if([textview_Remark.text isEqual:@""]||(textview_Remark.text==NULL))
            {
                Remarks=@"";
                
            }
            else
            {
                Remarks=textview_Remark.text;
            }
            NSLog(@"total chare %@",totalCharge);
            NSLog(@"netchare %@",netcharge);
            NSLog(@"discount %@",discountstr);
            NSLog(@"initial %@",initialAmount);
            NSLog(@"reward point %@",RewardPoints);
            NSLog(@"is urgent %@",Isurgent);
            NSLog(@"discountprec %@",DiscountINPerc);
            SetAdviseInvestigation=[[NSMutableDictionary alloc]initWithObjectsAndKeys:(NSString*)[NSNull null],@"ReferrerId",AdviseBy,@"advisedBy",Isurgent,@"IsUrgent",@"", @"MedFacilityName",@"",@"FirstName",Urgenttime,@"UrgentTime",theDate,@"AdvisedDate",Patientid, @"PatientId",AreaID,@"AreaId",PatientCode,@"PatientCode",PanelValue,@"panelId",ReportStatus,@"reportStatus",DiscountINPerc,@"discountInPerc",email,@"email",LocationID,@"locationId",Remarks,@"remarks",DiscountBreakUP,@"DiscountBreakUp",totalCharge,@"TotalCharges",discountstr,@"Discount",netcharge,@"NetCharges",SerialNumberName,@"serialNumberName",CollectionStaffID,@"CollectionStaffId",RewardPoints,@"RewardPoints",LoyalityId,@"LoyalityId",DeliveryStaffID,@"DeliveryStaffId",initialAmount,@"InitialAmount",hexStr,@"BarCodeString",nil];
            NSLog(@"dictionary is %@",SetAdviseInvestigation);
            
            NSLog(@"lal arr %@ and %@",LabelArr ,Labeltxt);
            
            Details=[[NSMutableArray alloc]init];
            
            for(int i=0;i<ChargeVal.count;i++)
            {
                NSDictionary *d1=[[NSDictionary alloc]initWithObjectsAndKeys:[NSString stringWithFormat:@"%@",[[LabelArr objectAtIndex:i] valueForKey:@"value"]],@"Charge",[NSString stringWithFormat:@"%@",[Investigatio_ID objectAtIndex:i]], @"InvestigationId",[NSString stringWithFormat:@"%@",[[Labeltxt objectAtIndex:i ] valueForKey:@"value"]], @"InvDiscount",[NSString stringWithFormat:@"%@",[[LabelArr objectAtIndex:i] valueForKey:@"value"]],@"InvNetCharge",(NSString*)[NSNull null],@"ReminderDate",LocationID,@"TestLocationId",nil];
                [Details addObject:d1];
                NSLog(@"details %@",Details);
                
            }
            NSLog(@"d1 is %@",Details);
            
            NSLog(@"arr %@",self.WebService->Detail_AdviseInvestigation=(NSMutableArray*)Details);
            NSLog(@"dict %@",self.WebService->Get_AdviseInvestigation=(NSMutableDictionary*)SetAdviseInvestigation);
            
            NSLog(@"report %@",ReportStatus);
            if(ReportStatus==NULL)
            {
                alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Please Select Report Delivery Status!" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
                [alert show];

                
            }
            else
            {
           [self.WebService CallServiceAddAdvisedInvestigationLIS:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/AddAdvisedInvestigationLIS" Object:NULL Handler:NULL];
            NSLog(@"val %@",self.WebService.ptr);
            alert = [[UIAlertView alloc] initWithTitle:@"Case ID" message:self.WebService.ptr delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
            [alert show];
            }
            
            break;
        }
        case 2:
        {
            
            break;
        }
            
        case 3:
        {
            
            //NSString  *Patientid=[NSString stringWithFormat:@"%@",[[WorkListData objectAtIndex:0] valueForKey:@"PatientId"]];
            NSString *PreUrgenttime=[NSString stringWithFormat:@"%@",[[WorkListData objectAtIndex:0] valueForKey:@"IsUrgentTime"]];
            NSString  *BillingID=[NSString stringWithFormat:@"%@",[[WorkListData objectAtIndex:0] valueForKey:@"BillingId"]];
            NSString  *LogInuserId=[NSString stringWithFormat:@"%@",[[WorkListData objectAtIndex:0] valueForKey:@"loginUserID"]];
            
        NSString *reffedId=[NSString stringWithFormat:@"%@",[[WorkListData objectAtIndex:0] valueForKey:@"MarketingReferrerId"]];
            
            PatientCode=[NSString stringWithFormat:@"%@",[[WorkListData objectAtIndex:0] valueForKey:@"PatientCode"]];
            
            NSString *reciptpre=[NSString stringWithFormat:@"%@",[[WorkListData objectAtIndex:0] valueForKey:@"ReceiptPrefix"]];
            
            LocationID=[NSString stringWithFormat:@"%@",[[WorkListData objectAtIndex:0] valueForKey:@"LocationId"]];
            
            LoyalityId=[NSString stringWithFormat:@"%@",[[WorkListData objectAtIndex:0] valueForKey:@"LoyalityId"]];
            
            Isurgent=[NSString stringWithFormat:@"%@",[[WorkListData objectAtIndex:0] valueForKey:@"IsUrgent"]];
            
            AdviseBy=[NSString stringWithFormat:@"%@",[[WorkListData objectAtIndex:0] valueForKey:@"AdvisedDoctorId"]];
            
            theDate=[NSString stringWithFormat:@"%@",[[WorkListData objectAtIndex:0] valueForKey:@"AdviseDate"]];
            
            AreaID=[NSString stringWithFormat:@"%@",[[WorkListData objectAtIndex:0] valueForKey:@"AreaId"]];
            
            email=[NSString stringWithFormat:@"%@",[[WorkListData objectAtIndex:0] valueForKey:@"EmailAddress"]];
            
            Remarks=[NSString stringWithFormat:@"%@",[[WorkListData objectAtIndex:0] valueForKey:@"Remarks"]];
            
            NSString *caseid=[NSString stringWithFormat:@"%@",[[WorkListData objectAtIndex:0] valueForKey:@"CaseId"]];
            
            DeliveryStaffID=[NSString stringWithFormat:@"%@",[[WorkListData objectAtIndex:0] valueForKey:@"StaffID"]];
            
            NSLog(@"patientcode %@",PatientName);
            NSLog(@"patientid %@",Patientid);
            NSLog(@"advise date %@",theDate);
            NSLog(@"area  id is %@",AreaID);
            NSLog(@"collection %@",CollectionStaffID);
            
            totalCharge=TotalCharge.text;
            netcharge=netcharges.text;
            
            discountstr=discount.text;
            initialAmount=initialamount.text;
            RewardPoints=point.text;
            
            if(TotalCharge.text==NULL || [TotalCharge.text isEqual:@""])
            {
                totalCharge=@"0";
                
            }
            if(netcharges.text==NULL || [netcharges.text isEqual:@""])
            {
                netcharge=@"0";
                
            }
            
            if(discount.text==NULL || [discount.text isEqual:@""])
            {
                discountstr=@"0";
                
            }
            
            if(initialamount.text==NULL || [initialamount.text isEqual:@""])
            {
                initialAmount=@"0";
                
            }
            if(point.text==NULL || [point.text isEqual:@""])
            {
                RewardPoints=@"0";
                
            }
            NSLog(@"advis %@,medical %@",AdviseDr.text,Medicalfacility.text);
            
            if(((AdviseDr.text==NULL)||[AdviseDr.text isEqualToString:@""]) && ((Medicalfacility.text ==NULL)|| [Medicalfacility.text isEqualToString:@""]))
            {
                
                AdviseBy=(NSString*)[NSNull null];
                SerialNumberName=LocationID;
                NSLog(@"serial no %@",SerialNumberName);
                
            }
            if([textview_Remark.text isEqual:@""]||(textview_Remark.text==NULL))
            {
                Remarks=@"";
                
            }
            else
            {
                Remarks=textview_Remark.text;
            }
            NSLog(@"total chare %@",totalCharge);
            NSLog(@"netchare %@",netcharge);
            NSLog(@"discount %@",discountstr);
            NSLog(@"initial %@",initialAmount);
            NSLog(@"reward point %@",RewardPoints);
            NSLog(@"is urgent %@",Isurgent);
            NSLog(@"discountprec %@",DiscountINPerc);
            
            SetAdviseInvestigation=[[NSMutableDictionary alloc]initWithObjectsAndKeys:reffedId,@"ReferrerId",AdviseBy,@"AdvisedDoctorId" ,Isurgent,@"IsUrgent",Urgenttime,@"UrgentTime",Patientid, @"PatientId",AreaID,@"AreaId",PanelValue, @"PanelId",ReportStatus,@"ReportStatus",email,@"Email",LocationID,@"LocationId",DiscountBreakUP,@"DiscountBreakUp",discountstr,@"Discount",DeliveryStaffID,@"DeliveryStaffId",initialAmount,@"InitialAmount",reciptpre,@"ReceiptPrefix", ReportStatus,@"NewReportStatus",(NSString*)[NSNull null],@"NewDeliveryStaffId",caseid,@"CaseId",PreUrgenttime,@"PreviousUrgentTime",Refund.text,@"Refund",BillingID,@"BillingId",RewardPoints,@"RewardPoints",LoyalityId,@"LoyalityId",LogInuserId,@"loginUserID",nil];
            
            NSLog(@"dictionary is %@",SetAdviseInvestigation);
            Details=[[NSMutableArray alloc]init];
            NSLog(@"free %@",Freetest);
            NSLog(@"cancel %@",CancelTest);
            NSLog(@"label %@",LabelArr);
            NSLog(@"label %@",Labeltxt);
            NSLog(@"cout %d",Investigatio_ID.count);
            
            for(int i=0;i<Investigatio_ID.count;i++)
            {
                NSDictionary *d1=[[NSDictionary alloc]initWithObjectsAndKeys:[NSString stringWithFormat:@"%@",[[LabelArr objectAtIndex:i] valueForKey:@"value"]],@"Charge",[NSString stringWithFormat:@"%@",[Investigatio_ID objectAtIndex:i]], @"InvestigationId",[NSString stringWithFormat:@"%@",[[Labeltxt objectAtIndex:i] valueForKey:@"value"]], @"InvDiscount",[NSString stringWithFormat:@"%@",[[LabelArr objectAtIndex:i] valueForKey:@"value"]],@"InvNetCharge",(NSString*)[NSNull null],@"ReminderDate",LocationID,@"TestLocationId",[NSString stringWithFormat:@"%@",[Freetest objectAtIndex:i]],@"IsFree",[NSString stringWithFormat:@"%@",[CancelTest objectAtIndex:i]],@"IsCancelled",[NSString stringWithFormat:@"%@",[repotstatus objectAtIndex:i]],@"ReportStatus",[NSString stringWithFormat:@"%@",[Test_ID objectAtIndex:i]],@"TestId",(NSString*)[NSNull null],@"PrevReminderDate", nil];
                [Details addObject:d1];
                NSLog(@"details %@",Details);
                
            }
            NSLog(@"d1 is %@",Details);
            
            for(int i=0;i<Details.count;i++)
            {
                NSString *test=[NSString stringWithFormat:@"%@",[[Details objectAtIndex:i] valueForKey:@"TestId"]];
                NSLog(@"detail %@",test);
                
                NSString *cancel=[NSString stringWithFormat:@"%@",[[Details objectAtIndex:i] valueForKey:@"IsCancelled"]];
                NSLog(@"detail %@",cancel);
                
                if([test isEqualToString:@"<null>"]&&[cancel isEqualToString:@"true"])
                {
                    
                    [Details removeObject:[Details objectAtIndex:i]];
                }
            }

            NSLog(@"detail %@",Details);
            
            NSLog(@"arr %@",self.WebService->Detail_AdviseInvestigation=Details);
            NSLog(@"dict %@",self.WebService->Get_AdviseInvestigation=SetAdviseInvestigation);
            [self.WebService CallServiceAddAdvisedInvestigationLIS:@"http://192.168.1.202:81//LaboratoryModule/LISService.asmx/AddNewAdvisedInvestigation" Object:NULL Handler:NULL];
            NSLog(@"val %@",self.WebService.ptr);
            alert = [[UIAlertView alloc] initWithTitle:@"Case ID" message:self.WebService.ptr delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
            [alert show];
            break;
        }

            default:
            break;
    }
    
}
- (void)onCustomAccessoryTapped:(UITextField *)sender
{
    //    NSLog(@"arr %@",arrdata);
    //
    //    UITableViewCell *cell = (UITableViewCell *)sender.superview.superview;
    //    NSIndexPath *indexPath = [table_AdviseTestDetails indexPathForCell:cell];
    //
    //    NSLog(@"index %@",indexPath);
    //
    //    int x=100-[resultval.text integerValue];
    //    NSLog(@"value is here %d",x);
    //    if(x<0)
    //    {
    //       // discount.backgroundColor=[UIColor colorWithRed:255/256. green:0/256. blue:0/256. alpha:1];
    //      //  netcharges.text=@"";
    //       // balance.text=@"0";
    //    }
    //    else
    //    {
    //        resultval.backgroundColor=[UIColor whiteColor];
    //        float z=50*x/100;
    //        NSLog(@"z is %f",z);
    //        resultval.text=[NSString stringWithFormat:@"%.2f",z];
    //        netcharges.text=[NSString stringWithFormat:@"%.2f",z];
    //        point.text=[NSString stringWithFormat:@"%.f",(floor([netcharges.text integerValue]/[[[Point_Result objectAtIndex:0]valueForKey:@"Value"] integerValue]))*[[[Point_Result objectAtIndex:0]valueForKey:@"Points"] integerValue]];
    //        balance.text=[NSString stringWithFormat:@"%.2f",z];
    
    
    //    if([arrdata containsObject:indexPath])
    //    {
    //        NSLog(@"here data ");
    //
    //    }
    //    [arrdata addObject:indexPath];
    //    NSLog(@"arr data %@",arrdata);
    //
    //
    //    if(TestCheck==TRUE)
    //    {
    //        [Freebtn setImage:[UIImage imageNamed:@"imagesCheck"]forState:UIControlStateNormal];
    //        TestCheck=FALSE;
    //
    //    }
    //    else
    //    {
    //        [Freebtn setImage:[UIImage imageNamed:@""]forState:UIControlStateNormal];
    //        TestCheck=TRUE;
    //
    //    }
    //
    //  NSLog(@"btn %@",[NSString stringWithFormat:@"%@",[WorkListView objectAtIndex:indexPath.row]]);
}

/*-(IBAction)FreeTest:(UITapGestureRecognizer *)reconizer
 {
 NSLog(@"check mark %d",CheckMark.tag);
 UIButton *btn= (UIButton *)[reconizer view];
 NSLog(@"btn is %d",btn.tag);
 //   if (btn.tag)
 //    {
 //        [CheckMark setImage:[UIImage imageNamed:@"imagesCheck"]forState:UIControlStateNormal];
 //        Check=FALSE;
 //
 //    }
 //    if((btn.tag>=0)&&(Check==FALSE))
 //    {
 //        [CheckMark setImage:[UIImage imageNamed:@""]forState:UIControlStateNormal];
 //
 //    }
 switch(btn.tag)
 {
 
 case 1:
 {
 [CheckMark setImage:[UIImage imageNamed:@"imagesCheck"]forState:UIControlStateNormal];
 Check=FALSE;
 
 break;
 }
 default:
 break;
 }
 //   if(Check==TRUE)
 //    {
 //        [CheckMark setImage:[UIImage imageNamed:@"imagesCheck"]forState:UIControlStateNormal];
 //        Check=FALSE;
 //
 //    }
 //    else
 //    {
 //        [CheckMark setImage:[UIImage imageNamed:@""]forState:UIControlStateNormal];
 //        Check=TRUE;
 //    }
 
 
 }*/

//-(void)DiccountBreakUp
//{
//    if(Check==TRUE)
//    {
//        [CheckMark setImage:[UIImage imageNamed:@"imagesCheck"]forState:UIControlStateNormal];
//        Check=FALSE;
//
//    }
//    else
//    {
//        [CheckMark setImage:[UIImage imageNamed:@""]forState:UIControlStateNormal];
//        Check=TRUE;
//    }
//
//}
/*-(void)radioButtonSelectedAtIndex:(NSUInteger)index inGroup:(NSString *)groupId
 {
 NSLog(@"changed to %d in %@",index,groupId);
 if(index==0)
 {
 Delivery_Staff.text=@"";
 Delivery_Staff.placeholder = @"";
 
 Label=[[UILabel alloc]initWithFrame:CGRectMake(10,350,140,30)];
 Label.font = [UIFont systemFontOfSize:12.0];
 Label.backgroundColor=[UIColor whiteColor];
 [Label setText:@"Confim Email:"];
 [scrollview addSubview:Label];
 
 
 NSLog(@"patient id %@",self.WebService->patientID=Patientid);
 [self.WebService CallServicePatientDetailsEmailID:@"http://192.168.1.202:81/PatientModule/PatientService.asmx/GetUserEmail" Object:NULL Handler:NULL];
 
 Delivery_Staff=[[UITextField alloc]initWithFrame:CGRectMake(150,350,190,30)];
 Delivery_Staff.font = [UIFont boldSystemFontOfSize:12.0];
 Delivery_Staff.clearButtonMode = UITextFieldViewModeWhileEditing;
 Delivery_Staff.borderStyle = UITextBorderStyleLine;
 Delivery_Staff.placeholder = @"";
 Delivery_Staff.delegate =self;
 Delivery_Staff.text=[NSString stringWithFormat:@"%@",self.WebService.ptr];
 
 Delivery_Staff.tag=0;
 [scrollview addSubview:Delivery_Staff];
 
 }
 else if(index==1 || index==4)
 {
 Delivery_Staff.text=@"";
 Delivery_Staff.placeholder = @"";
 
 Label=[[UILabel alloc]initWithFrame:CGRectMake(10,350,140,30)];
 Label.font = [UIFont systemFontOfSize:12.0];
 Label.backgroundColor=[UIColor whiteColor];
 [Label setText:@"Select Delivery Staff:"];
 [scrollview addSubview:Label];
 
 // [self.WebService CallServiceGetStaffByRoleName:@"http://192.168.1.202:81//StaffModule/StaffService.asmx/GetStaffByRoleName" Object:NULL Handler:NULL];
 
 //   NSLog(@"role is %@",self.WebService->ptr1);
 
 //  Staff_Names=(NSMutableArray*)[self.WebService->ptr1 valueForKey:@"StaffName"];
 // NSLog(@"staff name is %@",Staff_Names);
 
 
 Delivery_Staff=[[UITextField alloc]initWithFrame:CGRectMake(150,350,190,30)];
 Delivery_Staff.font = [UIFont boldSystemFontOfSize:12.0];
 Delivery_Staff.placeholder = @"<Select Staff>";
 Delivery_Staff.borderStyle = UITextBorderStyleLine;
 Delivery_Staff.delegate =self;
 Delivery_Staff.tag=5;
 [scrollview addSubview:Delivery_Staff];
 [Delivery_Staff addTarget:self action:@selector(btnpress1:)forControlEvents:UIControlEventEditingDidBegin];
 
 }
 else if(index==2)
 {
 
 Delivery_Staff.hidden=YES;
 
 [Delivery_Staff resignFirstResponder];
 
 Label.text=@"";
 Delivery_Staff.text=@"";
 }
 else if(index==3)
 {
 Delivery_Staff.hidden=YES;
 Label.hidden=YES;
 Label.text=@"";
 }
 
 }*/

/*-(IBAction)btnpress1:(id)sender
 {
 singleTap = [[UITapGestureRecognizer alloc]init];
 
 switch(((UITextField*)sender).tag)
 {
 
 case 1:
 {
 //scrollview.scrollEnabled=NO;
 //[AdviseDr resignFirstResponder];
 table_AdviseDoctor.hidden=NO;
 Medicalfacility.hidden=YES;
 location.hidden=YES;
 Panel.hidden=YES;
 pickerview_AdviseDoctor.hidden=NO;
 [singleTap addTarget:self action:@selector(tapInPickerView:)];
 [singleTap setNumberOfTapsRequired:1];
 [singleTap setNumberOfTouchesRequired:1];
 [pickerview_AdviseDoctor addGestureRecognizer:singleTap];
 
 break;
 
 }
 
 case 2:
 {
 
 [Medicalfacility resignFirstResponder];
 location.hidden=YES;
 Panel.hidden=YES;
 table_MedicalFacility.hidden=NO;
 //            pickerview_MedicalFacility.hidden=NO;
 //            [singleTap addTarget:self action:@selector(tapInPickerView:)];
 //            [singleTap setNumberOfTapsRequired:1];
 //            [singleTap setNumberOfTouchesRequired:1];
 //            [pickerview_MedicalFacility addGestureRecognizer:singleTap];
 
 break;
 
 }
 
 
 case 3:
 {
 
 [location resignFirstResponder];
 Panel.hidden=YES;
 textview.hidden=YES;
 table_Location.hidden=NO;
 
 //            pickerview_Location.hidden=NO;
 //            [singleTap addTarget:self action:@selector(tapInPickerView:)];
 //            [singleTap setNumberOfTapsRequired:1];
 //            [singleTap setNumberOfTouchesRequired:1];
 //            [pickerview_Location addGestureRecognizer:singleTap];
 //
 break;
 
 }
 
 case 4:
 {
 
 [Panel resignFirstResponder];
 textview.hidden=YES;
 table_Panel.hidden=NO;
 //            pickerview_Panel.hidden=NO;
 //            [singleTap addTarget:self action:@selector(tapInPickerView:)];
 //            [singleTap setNumberOfTapsRequired:1];
 //            [singleTap setNumberOfTouchesRequired:1];
 //            [pickerview_Panel addGestureRecognizer:singleTap];
 
 break;
 
 }
 case 5:
 {
 
 [Delivery_Staff resignFirstResponder];
 Testname.hidden=YES;
 table_StaffNames.hidden=NO;
 ToCollectedBy.hidden=YES;
 //            pickerview_StaffNames.hidden=NO;
 //            [singleTap addTarget:self action:@selector(tapInPickerView:)];
 //            [singleTap setNumberOfTapsRequired:1];
 //            [singleTap setNumberOfTouchesRequired:1];
 //            [pickerview_StaffNames addGestureRecognizer:singleTap];
 //
 break;
 
 }
 case 6:
 {
 [ToCollectedBy resignFirstResponder];
 Testname.hidden=YES;
 table_CollectionName.hidden=NO;
 
 //            pickerview_CollectionName.hidden=NO;
 //            [singleTap addTarget:self action:@selector(tapInPickerView:)];
 //            [singleTap setNumberOfTapsRequired:1];
 //            [singleTap setNumberOfTouchesRequired:1];
 //            [pickerview_CollectionName addGestureRecognizer:singleTap];
 //
 break;
 
 }
 case 7:
 {
 [DateTime resignFirstResponder];
 done.hidden=NO;
 if ([[UIScreen mainScreen] bounds].size.height >480)
 {
 DatePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0,350,320,50)];
 }
 else
 {
 DatePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0,270,320,50)];
 }
 DatePicker.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
 // DatePicker.datePickerMode = UIDatePickerModeDate;
 DatePicker.datePickerMode = UIDatePickerModeDateAndTime;
 DatePicker.date = [NSDate date];
 [self.DateTime setInputView:DatePicker];
 //  done.hidden=NO;
 // [DateTime resignFirstResponder];
 DatePicker.userInteractionEnabled=YES;
 [self.view addSubview:DatePicker];
 
 break;
 
 }
 
 }
 }
 
 - (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
 {
 if(pickerView== pickerview||pickerView==pickerview_AdviseDoctor||pickerView==pickerview_Location||pickerView==pickerview_MedicalFacility||pickerView==pickerview_Panel||pickerView==pickerview_StaffNames||pickerView==pickerview_CollectionName)
 return 1;
 else
 return 0;
 }
 
 - (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
 {
 return 40.0;
 }
 
 - (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
 {
 if(pickerView==pickerview)
 {
 NSLog(@"arr is= %d",[SearchPatientName count]);
 return [SearchPatientName  count];
 }
 else if (pickerView==pickerview_AdviseDoctor)
 {
 return [Advise_Doctor  count];
 
 }
 else if (pickerView==pickerview_MedicalFacility)
 {
 return [MedicalFacility_View  count];
 
 }
 
 else if (pickerView==pickerview_Location)
 {
 return [Location_View  count];
 
 }
 else if (pickerView==pickerview_Panel)
 {
 return [Panel_View  count];
 
 }
 else if (pickerView==pickerview_StaffNames)
 {
 return [Staff_Names  count];
 
 }
 else if (pickerView==pickerview_CollectionName)
 {
 return [Staff_Names  count];
 
 }
 else
 {
 return 0;
 }
 
 }
 - (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
 {
 
 NSString *returnStr = @"";
 
 // note: custom picker doesn't care about titles, it uses custom views
 if(pickerView==pickerview)
 {
 
 if(component==0)
 {
 
 returnStr=[SearchPatientName objectAtIndex:row];
 
 }
 }
 else if (pickerView==pickerview_AdviseDoctor)
 {
 
 if(component==0)
 {
 
 
 returnStr=[Advise_Doctor objectAtIndex:row];
 
 }
 }
 else if (pickerView==pickerview_MedicalFacility)
 {
 
 if(component==0)
 {
 
 
 returnStr=[MedicalFacility_View objectAtIndex:row];
 
 }
 }
 else if (pickerView==pickerview_Location)
 {
 
 if(component==0)
 {
 
 
 returnStr=[Location_View objectAtIndex:row];
 
 }
 }
 else if (pickerView==pickerview_Panel)
 {
 
 if(component==0)
 {
 
 PanelValue=[NSString stringWithFormat:@"%@",[[Panel_detail objectAtIndex:0]valueForKey:@"PackageId"]];
 
 returnStr=[Panel_View objectAtIndex:row];
 
 }
 }
 else if (pickerView==pickerview_StaffNames)
 {
 
 if(component==0)
 {
 
 
 returnStr=[Staff_Names objectAtIndex:row];
 
 }
 }
 else if (pickerView==pickerview_CollectionName)
 {
 
 if(component==0)
 {
 
 
 returnStr=[Staff_Names objectAtIndex:row];
 
 }
 }
 
 return returnStr;
 }
 
 //- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
 //{
 //    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 310, 40)];
 //    label.text = [NSString stringWithFormat:@"%@",[SearchPatientName objectAtIndex:row]];
 //    label.font=[UIFont boldSystemFontOfSize:17.0];
 //    label.backgroundColor = [UIColor clearColor];
 //    return label;
 //
 //}
 
 - (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
 {
 if (pickerView==pickerview)
 {
 [SearchPatientName objectAtIndex:[pickerview selectedRowInComponent:0]];
 
 }
 else if(pickerView==pickerview_AdviseDoctor)
 {
 [Advise_Doctor objectAtIndex:[pickerview_AdviseDoctor selectedRowInComponent:0]];
 NSLog(@"Selected Color: %@. Index of selected color: %i", [Advise_Doctor objectAtIndex:row], row);
 // MedicalFacility=[NSString stringWithFormat:@"%@",[[Advise_DoctorDetail objectAtIndex:row]valueForKey:@"LocationId"]];
 
 //  NSLog(@"row %@",MedicalFacility);
 }
 else if(pickerView==pickerview_MedicalFacility)
 {
 [MedicalFacility_View objectAtIndex:[pickerview_MedicalFacility selectedRowInComponent:0]];
 NSLog(@"Selected Color: %@. Index of selected color: %i", [MedicalFacility_View objectAtIndex:row], row);
 // MedicalFacility=[NSString stringWithFormat:@"%@",[[Advise_DoctorDetail objectAtIndex:row]valueForKey:@"LocationId"]];
 
 //  NSLog(@"row %@",MedicalFacility);
 }
 
 else if(pickerView==pickerview_Location)
 {
 [Location_View objectAtIndex:[pickerview_Location selectedRowInComponent:0]];
 NSLog(@"Selected Color: %@. Index of selected color: %i", [Location_View objectAtIndex:row], row);
 // MedicalFacility=[NSString stringWithFormat:@"%@",[[Advise_DoctorDetail objectAtIndex:row]valueForKey:@"LocationId"]];
 
 //  NSLog(@"row %@",MedicalFacility);
 }
 else if(pickerView==pickerview_Panel)
 {
 [Panel_View objectAtIndex:[pickerview_Panel selectedRowInComponent:0]];
 NSLog(@"Selected Color: %@. Index of selected color: %i", [Panel_View objectAtIndex:row], row);
 PanelValue=[NSString stringWithFormat:@"%@",[[Panel_detail objectAtIndex:row]valueForKey:@"PackageId"]];
 
 NSLog(@"row %@",PanelValue);
 
 }
 else if(pickerView==pickerview_StaffNames)
 {
 [Staff_Names objectAtIndex:[pickerview_StaffNames selectedRowInComponent:0]];
 NSLog(@"Selected Color: %@. Index of selected color: %i", [Staff_Names objectAtIndex:row], row);
 // MedicalFacility=[NSString stringWithFormat:@"%@",[[Advise_DoctorDetail objectAtIndex:row]valueForKey:@"LocationId"]];
 
 //  NSLog(@"row %@",MedicalFacility);
 }
 else if(pickerView==pickerview_CollectionName)
 {
 [Staff_Names objectAtIndex:[pickerview_StaffNames selectedRowInComponent:0]];
 NSLog(@"Selected Color: %@. Index of selected color: %i", [Staff_Names objectAtIndex:row], row);
 // MedicalFacility=[NSString stringWithFormat:@"%@",[[Advise_DoctorDetail objectAtIndex:row]valueForKey:@"LocationId"]];
 
 //  NSLog(@"row %@",MedicalFacility);
 }
 
 }
 
 - (void)tapInPickerView:(UIGestureRecognizer *)sender
 {
 
 if (pickerview_AdviseDoctor.hidden==FALSE)
 {
 [AdviseDr setText:[NSString stringWithFormat:@"%@",[Advise_Doctor objectAtIndex:[pickerview_AdviseDoctor selectedRowInComponent:0]]]];
 pickerview_AdviseDoctor.hidden=YES;
 // done1.hidden=YES;
 }
 else if (pickerview_MedicalFacility.hidden==FALSE)
 {
 [Medicalfacility setText:[NSString stringWithFormat:@"%@",[MedicalFacility_View objectAtIndex:[pickerview_MedicalFacility selectedRowInComponent:0]]]];
 pickerview_MedicalFacility.hidden=YES;
 // done1.hidden=YES;
 }
 else if (pickerview_Location.hidden==FALSE)
 {
 [location setText:[NSString stringWithFormat:@"%@",[Location_View objectAtIndex:[pickerview_Location selectedRowInComponent:0]]]];
 pickerview_Location.hidden=YES;
 // done1.hidden=YES;
 }
 else if (pickerview_Panel.hidden==FALSE)
 {
 [Panel setText:[NSString stringWithFormat:@"%@",[Panel_View objectAtIndex:[pickerview_Panel selectedRowInComponent:0]]]];
 pickerview_Panel.hidden=YES;
 // done1.hidden=YES;
 }
 else if (pickerview_StaffNames.hidden==FALSE)
 {
 [Delivery_Staff setText:[NSString stringWithFormat:@"%@",[Staff_Names objectAtIndex:[pickerview_StaffNames selectedRowInComponent:0]]]];
 
 pickerview_StaffNames.hidden=YES;
 // done1.hidden=YES;
 }
 
 else if (pickerview_CollectionName.hidden==FALSE)
 {
 [ToCollectedBy setText:[NSString stringWithFormat:@"%@",[Staff_Names objectAtIndex:[pickerview_CollectionName selectedRowInComponent:0]]]];
 
 pickerview_CollectionName.hidden=YES;
 // done1.hidden=YES;
 }
 
 //    else if (tabel.hidden==FALSE)
 //    {
 //        NSLog(@"table is here ");
 //      //  NSString *PrimaryCategoryID=[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:0]valueForKey:@"PrimaryCategoryId"]];
 //
 //
 //    }
 
 }*/
-(IBAction)CallServiceWithIndex:(NSString*)Str
{
    Result =[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:0]valueForKey:Str]];
    NSLog(@"%@", Result);
    
}
#pragma mark -
#pragma mark UITextViewDelegate Methods
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    /*--
     * This method is called just before the textView becomes active
     * Return YES to let the textView become the First Responder otherwise return NO
     * Use this method to give the textView a green colored background
     --*/
    
    NSLog(@"textViewShouldBeginEditing:");
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    /*--
     * This method is called when the textView becomes active, or is the First Responder
     --*/
    
    NSLog(@"textViewDidBeginEditing:");
    textView.backgroundColor = [UIColor whiteColor];
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    /*--
     * This method is called just before the textView is no longer active
     * Return YES to let the textView resign first responder status, otherwise return NO
     * Use this method to turn the background color back to white
     --*/
    
    NSLog(@"textViewShouldEndEditing:");
    textView.backgroundColor = [UIColor whiteColor];
    return YES;
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    /*--
     * This method is called when the textView is no longer active
     --*/
    
    NSLog(@"textViewDidEndEditing:");
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    NSLog(@"textView:shouldChangeTextInRange:replacementText:");
    
    NSLog(@"textView.text.length -- %i",textView.text.length);
    NSLog(@"text.length         -- %i",text.length);
    //NSLog(@"textView.text.length + text.length-- %i",textView.text.length + text.length);
    
    /*--
     * This method is called just before text in the textView is displayed
     * This is a good place to disallow certain characters
     * Limit textView to 140 characters
     * Resign keypad if done button pressed comparing the incoming text against the newlineCharacterSet
     * Return YES to update the textView otherwise return NO
     --*/
    
    NSCharacterSet *doneButtonCharacterSet = [NSCharacterSet newlineCharacterSet];
    NSRange replacementTextRange = [text rangeOfCharacterFromSet:doneButtonCharacterSet];
    NSUInteger location1 = replacementTextRange.location;
    
    if (textView.text.length + text.length > 140){//140 characters are in the textView
        if (location1 != NSNotFound){ //Did not find any newline characters
            [textView resignFirstResponder];
        }
        return NO;
    }
    else if (location1 != NSNotFound){ //Did not find any newline characters
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
    
}

- (void)textViewDidChange:(UITextView *)textView
{
    NSLog(@"textViewDidChange:");
    //This method is called when the user makes a change to the text in the textview
}

- (void)textViewDidChangeSelection:(UITextView *)textView
{
    NSLog(@"textViewDidChangeSelection:------->>");
    //This method is called when a selection of text is made or changed
}



@end
