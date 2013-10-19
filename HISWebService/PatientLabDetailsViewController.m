


//
//  PatientLabDetailsViewController.m
//  HISWebService
//
//  Created by Rahul Sharma on 06/05/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import "PatientLabDetailsViewController.h"
#import "PatientLabTestDesc1ViewController.h"
#import "ChargeDetailsViewController.h"
#import "PatientContactDetailsViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "Shared.h"

@interface PatientLabDetailsViewController ()

@end

@implementation PatientLabDetailsViewController
@synthesize WebService=_WebService;
@synthesize scrollview,PatientCode;
@synthesize PTH,PatientName,patientname,PatientAdvisedDrVal,Patientid;


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
    
    // self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth ;
    //  self.view.autoresizesSubviews = YES;
    
    self.WebService=[[WebService alloc]init];
    // self.PTH=[[PatientTestHistoryViewController alloc]init];
    
    view1=[[UIView alloc]initWithFrame:CGRectMake(0,64,320,60)];
    view1.backgroundColor=[UIColor whiteColor];
    [view1 setIsAccessibilityElement:YES];
    view1.userInteractionEnabled=YES;
    view1.autoresizingMask = UIViewAutoresizingFlexibleWidth ;
    
    view1.layer.borderColor = [UIColor grayColor].CGColor;
    view1.layer.borderWidth = 2.0f;
    [self.view addSubview:view1];
    
    // Do any additional setup after loading the view from its nib.
    self.WebService=[[WebService alloc]init];
    
    scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0,124,320,540)];
    
    [scrollview setContentSize:CGSizeMake(320,800)];
    
    scrollview.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    scrollview.autoresizesSubviews = YES;
    
    scrollview.scrollEnabled = YES;
    scrollview.delegate = self;
    scrollview.directionalLockEnabled = YES;
    
    scrollview.showsVerticalScrollIndicator = YES;
    
    scrollview.showsHorizontalScrollIndicator = NO;
    
    scrollview.autoresizesSubviews = YES;
    scrollview.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:scrollview];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    tap.cancelsTouchesInView = NO;
    [scrollview addGestureRecognizer:tap];
    // [self.view addGestureRecognizer:tap];
    
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
    
    //[[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(SearchPatients:) name:UITextFieldTextDidChangeNotification object:patientname];
    //    if ([[UIScreen mainScreen] bounds].size.height >480)
    //    {
  
//    TabBar=[[UINavigationBar alloc]initWithFrame:CGRectMake(0, 480, 320, 80)];
//    TabBar.autoresizingMask =UIViewContentModeTopRight | UIViewAutoresizingFlexibleWidth;
//    // TabBar.autoresizesSubviews = YES;
//    
//    TabBar.tintColor=[UIColor blackColor];
//    
//    UIButton *btn1=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
//    
//    // [btn1 setImage:[UIImage imageNamed:@"Charge1.png"] forState:UIControlStateNormal];
//    
//    [btn1 setTitle:@"Charge Details" forState:UIControlStateNormal];
//    btn1.titleLabel.font=[UIFont boldSystemFontOfSize:10.0];
//    //   btn1.tag=1;
//    
//    [btn1 addTarget:self action:@selector(ChargeDetails) forControlEvents:UIControlEventTouchUpInside];
//    
//    UIBarButtonItem *button1 = [[UIBarButtonItem alloc]initWithCustomView:btn1];
//    
//    UIButton *btn2=[[UIButton alloc]initWithFrame:CGRectMake(0,0,40,40)];
//    btn2.titleLabel.font=[UIFont boldSystemFontOfSize:10.0];
//    // [btn2 setImage:[UIImage imageNamed:@"save.png"] forState:UIControlStateNormal];
//    [btn2 setTitle:@"View Contact Details"  forState:UIControlStateNormal];
//    
//    [btn2 addTarget:self action:@selector(ViewContactDetails) forControlEvents:UIControlEventTouchUpInside];
//    
//    UIBarButtonItem *button2 = [[UIBarButtonItem alloc]initWithCustomView:btn2];
//    
////    UIBarButtonItem *fixed = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
////    fixed.width = 3.0;
//    TabBar.items=[[NSArray alloc]initWithObjects:button1,button2, nil];
//    
//   // NSLog(@"arr %@",arr);
//    
//   // [TabBar setItems:nil animated:YES];
//    
//    
    [self.view addSubview:TabBar];
//    
    
   TabBar.hidden=YES;
   
       NSLog(@"patient code %@",Patientid);
    
    if(Patientid!=NULL)
    {
        patientname.hidden=YES;
        [self donebtn:nil];
    }
    
    // Do any additional setup after loading the view from its nib.
}
- (void)setItems:(NSArray *)items animated:(BOOL)animated
{
    
    NSLog(@"here");
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // pickerview.hidden=YES;
    // [self.view reloadInputViews];
    // [self.scrollview reloadInputViews];
    // [self viewDidLoad];
    if(self.WebService->patientCaseID!=NULL)
    {
        [self GetAdvisedInvestigationDetail];
    }
}

-(IBAction)SearchPatients:(id)sender
{
    //  [PTH.table reloadData];
    
    self.PTH=[[PatientTestHistoryViewController alloc]init];

    Shared *shared=[Shared sharedUser];
    shared.Case_ID=NULL;
    
    NSLog(@"val %@",shared.Case_ID);
    
    [table_SearchPatient removeFromSuperview];
    PatientName=patientname.text;
    NSLog(@"patname %@",PatientName);
    Count=@"0";
    //   [patientname resignFirstResponder];
    NSLog(@"patname %@",self.WebService->patientname=PatientName);
    NSLog(@"count %@",self.WebService->count=Count);
    
    [self.WebService CallServicePatientNames:@"http://192.168.1.202:81/LaboratoryModule/LISService.asmx/SearchPatientMasterJquery" Object:NULL Handler:NULL];
    
    table_SearchPatient=[[UITableView alloc]initWithFrame:CGRectMake(130,110,170,250)style:UITableViewStylePlain];
    table_SearchPatient.delegate=self;
    table_SearchPatient.dataSource=self;
    table_SearchPatient.layer.borderWidth = 2.0;
    table_SearchPatient.layer.borderColor = [UIColor grayColor].CGColor;
    [self.view addSubview:table_SearchPatient];
    
    array1=[[NSMutableArray alloc]init];
    arr2=[[NSMutableArray alloc]init];
    NSLog(@"arr is %@",self.WebService->ptr1);
    array1=(NSMutableArray*)[self.WebService->ptr1 valueForKey:@"PatientCode"];
    NSLog(@"item is %@",   array1);
    arr2  =(NSMutableArray *)[self.WebService->ptr1 valueForKey:@"Name"];
    NSLog(@"item is %@",arr2);
    
    
//   NSMutableString *sb = [[NSMutableString alloc] init];
//    
//    NSMutableString *sb1 = [[NSMutableString alloc] init];
//    AppendArray=[[NSMutableArray alloc]init];
//    for (int i=0; i < array1.count; i++)
//    {
//        sb=[NSMutableString stringWithFormat:@"%@",array1[i]];
//        
//        sb1=[NSMutableString stringWithFormat:@"%@",arr2[i]];
//        
//        [AppendArray addObject:[[sb stringByAppendingString:@""]  stringByAppendingString:sb1]];
//        
//        NSLog(@"arr %@",AppendArray);
//    }
//    NSLog(@"arr %d",AppendArray.count);
    
    
    
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
    
}

//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    if (textField.text.length >= 10 && range.length == 0)
//        return NO;
//    // Only characters in the NSCharacterSet you choose will insertable.
//    NSCharacterSet *invalidCharSet = [[NSCharacterSet characterSetWithCharactersInString:@"abcdefgABCDEFG"] invertedSet];
//    NSString *filtered = [[string componentsSeparatedByCharactersInSet:invalidCharSet] componentsJoinedByString:@""];
//    return [string isEqualToString:filtered];
//
//
//}

//- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
//{
//    if(fromInterfaceOrientation == UIInterfaceOrientationPortrait)
//    {
//                  tool=[[UIToolbar alloc]initWithFrame:CGRectMake(0,200,400,50)];
//
//            pickerview=[[UIPickerView alloc]initWithFrame:CGRectMake(0,250,400,300)];
//
//
//
//        //[webView stringByEvaluatingJavaScriptFromString:@"rotate(0)"];
//
//    }
//    else
//    {
//       // [webView stringByEvaluatingJavaScriptFromString:@"rotate(1)"];
//    }
//
//
//}
//-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
//{
//	//[super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
//}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [patientname resignFirstResponder];
    // pickerview.hidden=YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    patientname = textField;
    pickerview.hidden=YES;
    tool.hidden=YES;
}
-(void)dismissKeyboard
{
    [patientname resignFirstResponder];
    
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [patientname resignFirstResponder];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	// There is only one section.
	return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [array1 count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if(tableView==table_SearchPatient)
    {
        
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier] ;
            
        }
        
        cell.textLabel.numberOfLines=2;
        cell.textLabel.text =[NSString stringWithFormat:@"%@  %@",[array1 objectAtIndex:indexPath.row],[arr2 objectAtIndex:indexPath.row]];
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12.0f];
        // cell.detailTextLabel.text=[SearchPatientName objectAtIndex:indexPath.row];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(tableView==table_SearchPatient)
    {
         [patientname resignFirstResponder];
        
        [patientname setText:[NSString stringWithFormat:@"%@",[arr2 objectAtIndex:indexPath.row]]];
        NSLog(@"patient name %@",patientname.text);
        
        PatientCode=[NSString stringWithFormat:@"%@",[array1 objectAtIndex:indexPath.row]];
        NSLog(@"patient code %@",PatientCode);
        
       Patientid=[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:indexPath.row]valueForKey:@"PatientId"]];
        
       // NSLog(@"patient code %@",Patientid);
        // [table_SearchPatient reloadData];
        table_SearchPatient.hidden=YES;
        [self donebtn:nil];

    }
    
}

-(IBAction)donebtn:(id)sender
{
    TabBar.hidden=NO;
    // self.WebService=[[WebService alloc]init];
    NSLog(@"patcode=%@",self.WebService->patientcode=Patientid);
    [self.WebService CallServicePatientDetails:@"http://192.168.1.202:81/PatientModule/PatientBedAssignmentService.asmx/GetPatient" Object:NULL Handler:NULL];
    NSLog(@"hello=%@",self.WebService->ptr1);
    
    Patient_detail=(NSMutableDictionary*)self.WebService->ptr1;
    
    NSLog(@"patdet %@",Patient_detail);
    
    UILabel *Patientcode=[[UILabel alloc]initWithFrame:CGRectMake(10,30,140,30)];
    Patientcode.font = [UIFont systemFontOfSize:12.0];
    Patientcode.backgroundColor=[UIColor whiteColor];
    [Patientcode setText:@"Patient Code:"];
    [scrollview addSubview:Patientcode];
    
    UILabel *PatientCodeVal=[[UILabel alloc]initWithFrame:CGRectMake(150,30,170,30)];
    //     PatientCodeVal.borderStyle = UITextBorderStyleBezel;
    PatientCodeVal.font =[UIFont boldSystemFontOfSize:15.0];
    PatientCodeVal.backgroundColor=[UIColor whiteColor];
    [self CallService:@"PatientCode"];
    
    PatientCodeVal.text = [NSString stringWithFormat:@"%@",s];
    
    NSLog(@"item is %@",PatientCodeVal.text);
    //[PatCodeVal setText:arr3];
    [scrollview addSubview:PatientCodeVal];
    
    UILabel *Patientname=[[UILabel alloc]initWithFrame:CGRectMake(10,70,140,30)];
    [Patientname setText:@"Name:"];
    Patientname.font = [UIFont systemFontOfSize:12.0];
    Patientname.backgroundColor=[UIColor whiteColor];
    [scrollview addSubview:Patientname];
    
    UILabel *PatientNameVal=[[UILabel alloc]initWithFrame:CGRectMake(150,70,170,30)];
    PatientNameVal.font =[UIFont boldSystemFontOfSize:15.0];
    PatientNameVal.backgroundColor=[UIColor whiteColor];
    [self CallService:@"PatientName"];
    
    PatientNameVal.text = [NSString stringWithFormat:@"%@",s];
    
    NSLog(@"item is %@",PatientCodeVal.text);
    //[PatCodeVal setText:arr3];
    [scrollview addSubview:PatientNameVal];
    
    
    UILabel *PatientDob=[[UILabel alloc]initWithFrame:CGRectMake(10,110,140,30)];
    PatientDob.font = [UIFont systemFontOfSize:12.0];
    PatientDob.backgroundColor=[UIColor whiteColor];
    [PatientDob setText:@"Date of Birth:"];
    [scrollview addSubview:PatientDob];
    
    UILabel *PatientDobVal=[[UILabel alloc]initWithFrame:CGRectMake(150,110,170,30)];
    PatientDobVal.font = [UIFont boldSystemFontOfSize:15.0];
    PatientDobVal.backgroundColor=[UIColor whiteColor];
    [self CallService:@"DOB"];
    
    NSDateFormatter  *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
    NSDate  *myDate = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@",s]];
    NSLog(@"%@", [dateFormatter stringFromDate:myDate]);
    
    NSDateFormatter  *anotherDateFormatter = [[NSDateFormatter alloc] init];
    [anotherDateFormatter setDateFormat:@"dd/MM/yyyy"];
    NSLog(@"%@", [anotherDateFormatter stringFromDate:myDate]);
    PatientDobVal.text =  [anotherDateFormatter stringFromDate:myDate];
    NSLog(@"item is %@",PatientDobVal.text);
    [scrollview addSubview:PatientDobVal];
           
    UILabel *PatientBloodGroup=[[UILabel alloc]initWithFrame:CGRectMake(10,150,140,30)];
    PatientBloodGroup.font = [UIFont systemFontOfSize:12.0];
    PatientBloodGroup.backgroundColor=[UIColor whiteColor];
    [PatientBloodGroup setText:@"Blood Group:"];
    [scrollview addSubview:PatientBloodGroup];
    
    UILabel *PatintBloodGroupVal=[[UILabel alloc]initWithFrame:CGRectMake(150,150,170,30)];
    PatintBloodGroupVal.font = [UIFont boldSystemFontOfSize:15.0];
    PatintBloodGroupVal.backgroundColor=[UIColor whiteColor];
    [self CallService:@"BloodGroup"];
    
    if([s isEqualToString:@"<null>"])
    {
        PatintBloodGroupVal.text = @"";
    }
    else
    {
        PatintBloodGroupVal.text = [NSString stringWithFormat:@"%@",s];
        
    }
    NSLog(@"item is %@",PatintBloodGroupVal.text);
    [scrollview addSubview:PatintBloodGroupVal];
    
      
    UILabel *PatientDateofRegistration=[[UILabel alloc]initWithFrame:CGRectMake(10,190,140,30)];
    PatientDateofRegistration.font = [UIFont systemFontOfSize:12.0];
    PatientDateofRegistration.backgroundColor=[UIColor whiteColor];
    [PatientDateofRegistration setText:@"Date of Registraion:"];
    [scrollview addSubview:PatientDateofRegistration];
    
    UILabel *PatientDateofRegistrationVal=[[UILabel alloc]initWithFrame:CGRectMake(150,190,170,30)];
    PatientDateofRegistrationVal.font = [UIFont boldSystemFontOfSize:15.0];
    PatientDateofRegistrationVal.backgroundColor=[UIColor whiteColor];
    [self CallService:@"DORegistration"];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
    myDate = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@",s]];
    NSLog(@"%@", [dateFormatter stringFromDate:myDate]);
    
    anotherDateFormatter = [[NSDateFormatter alloc] init];
    [anotherDateFormatter setDateFormat:@"dd/MM/yyyy"];
    NSLog(@"%@", [anotherDateFormatter stringFromDate:myDate]);
    
    PatientDateofRegistrationVal.text = [anotherDateFormatter stringFromDate:myDate];
    NSLog(@"item is %@",PatientDateofRegistrationVal.text);
    [scrollview addSubview:PatientDateofRegistrationVal];
    
    UILabel *PatientSex=[[UILabel alloc]initWithFrame:CGRectMake(10,230,140,30)];
    PatientSex.font = [UIFont systemFontOfSize:12.0];
    PatientSex.backgroundColor=[UIColor whiteColor];
    [PatientSex setText:@"Sex :"];
    [scrollview addSubview:PatientSex];
    
    UILabel *PatientSexVal=[[UILabel alloc]initWithFrame:CGRectMake(150,230,170,30)];
    PatientSexVal.font = [UIFont boldSystemFontOfSize:15.0];
    PatientSexVal.backgroundColor=[UIColor whiteColor];
    [self CallService:@"Sex"];
    PatientSexVal.text = [NSString stringWithFormat:@"%@",s];
    NSLog(@"item is %@",PatientSexVal.text);
    [scrollview addSubview:PatientSexVal];
    
    UILabel *PatientComments=[[UILabel alloc]initWithFrame:CGRectMake(10,270,130,30)];
    PatientComments.font = [UIFont systemFontOfSize:12.0];
    PatientComments.backgroundColor=[UIColor whiteColor];
    [PatientComments setText:@"Comments :"];
    [scrollview addSubview:PatientComments];
    
    UILabel *PatientCommentsVal=[[UILabel alloc]initWithFrame:CGRectMake(150,270,170,30)];
    PatientCommentsVal.font =[UIFont boldSystemFontOfSize:15.0];
    PatientCommentsVal.backgroundColor=[UIColor whiteColor];
    [self CallService:@"Comments"];
    PatientCommentsVal.text = [NSString stringWithFormat:@"%@",s];
    NSLog(@"item is %@",PatientCommentsVal.text);
    [scrollview addSubview:PatientCommentsVal];
    
    [self CallService:@"PatientId"];
    NSLog(@"s=%@",self.WebService->patientID=s);
    [self.WebService CallServicePatientGetRewardPoint:@"http://192.168.1.202:81/PatientModule/PatientService.asmx/GetPatientRewardPoints" Object:NULL Handler:NULL];
    
    UILabel *TolalRewardPoint=[[UILabel alloc]initWithFrame:CGRectMake(10,310,140,30)];
    TolalRewardPoint.font = [UIFont systemFontOfSize:12.0];
    TolalRewardPoint.backgroundColor=[UIColor whiteColor];
    [TolalRewardPoint setText:@"Total Reward Points:"];
    [scrollview addSubview:TolalRewardPoint];
    
    UILabel *TolalRewardPointVal=[[UILabel alloc]initWithFrame:CGRectMake(150,310,170,30)];
    TolalRewardPointVal.font =[UIFont boldSystemFontOfSize:15.0];
    TolalRewardPointVal.backgroundColor=[UIColor whiteColor];
    // [self CallService:@"Comments"];
    if([self.WebService->ptr1 count]==0)
    {
          TolalRewardPointVal.text=@"0.00";
    }
    else
    {
    TolalRewardPointVal.text = [NSString stringWithFormat:@"%.2f",[[[self.WebService->ptr1 objectAtIndex:0]valueForKey:@"Points"]floatValue]];
    }
    NSLog(@"item is %@",TolalRewardPointVal.text);
    [scrollview addSubview:TolalRewardPointVal];
    
    
    UIButton *ViewHistory=[[UIButton alloc]initWithFrame:CGRectMake(10,80,100,30)];
    [ViewHistory addTarget:self action:@selector(TestDescription2:)forControlEvents:UIControlEventTouchUpInside];
    ViewHistory.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
      [ViewHistory setTitle:@"ViewHistory" forState:UIControlStateNormal];
    [self.view addSubview:ViewHistory];
    
        Shared *shared=[Shared sharedUser];
        shared.ApplicationId=[[NSUserDefaults standardUserDefaults]valueForKey:@"ApplicationId"];
    NSLog(@"s=%@",self.WebService->patientID=s);

       NSLog(@"s=%@",self.WebService->applicationid=shared.ApplicationId);
    [self.WebService CallServicePatientDetailsID:@"http://192.168.1.202:81/PatientModule/PatientService.asmx/GetAllLisPatientCaseDetail" Object:NULL Handler:NULL];
    
    NSLog(@"print value is %@",self.WebService->ptr1);
     HistroyReport=[[NSMutableArray alloc]init];
    if([self.WebService->ptr1 count]==0)
    {
        
    }
    else
    {
   
    HistroyReport=(NSMutableArray*)self.WebService->ptr1;
    NSLog(@"his report %@",HistroyReport);
    
   
    NSLog(@"ptr %u",(self.WebService->ptr1).count);
    
    viewhistory=[[NSMutableArray alloc]init];
    for(int i=0 ;i<((self.WebService->ptr1).count);i++)
    {
        NSString *s1 =[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:i]valueForKey:@"CaseCode"]];
        NSLog(@"s1 =%@",s1);
        
        [viewhistory addObject:s1];
        NSLog(@"history %@",viewhistory);
        
    }
  

    
   // [self CallService:@"CaseId"];
  
    //[pickerview reloadComponent:0];
    
    [self GetAdvisedInvestigationDetail];
    }
    
}
-(void)GetAdvisedInvestigationDetail
{
    for (UIView* subView in scrollview.subviews)
    {
        if ([subView isKindOfClass:[UIButton class]])
            [subView removeFromSuperview];
        
        //      if ([subView isKindOfClass:[UILabel class]])
        //            [subView removeFromSuperview];
    }
    

     Shared *shared=[Shared sharedUser];
    NSLog(@"val %@",shared.Case_ID);
    
    
    if(shared.Case_ID!=NULL )
    {
        self.WebService=[[WebService alloc]init];
        
        
        NSLog(@"caseid is %@",self.WebService->patientCaseID=shared.Case_ID);
        
    }
   else
   {
        NSLog(@"patcode=%@",self.WebService->patientCaseID=[NSString stringWithFormat:@"%@",[[HistroyReport objectAtIndex:0]valueForKey:@"CaseId"]]);
       
    }
    
    [self.WebService CallServicePatientDetailsCaseID:@"http://192.168.1.202:81/LaboratoryModule/LISService.asmx/GetAdvisedInvestigationDetail" Object:NULL Handler:NULL];
    
    UILabel *PatientAdvisedDr=[[UILabel alloc]initWithFrame:CGRectMake(10,350,140,30)];
    PatientAdvisedDr.font = [UIFont systemFontOfSize:12.0];
    PatientAdvisedDr.backgroundColor=[UIColor whiteColor];
    [PatientAdvisedDr setText:@"Reffered By:"];
    [scrollview addSubview:PatientAdvisedDr];
    
    PatientAdvisedDrVal=[[UILabel alloc]initWithFrame:CGRectMake(150,350,170,30)];
    PatientAdvisedDrVal.userInteractionEnabled=YES;
    PatientAdvisedDrVal.font = [UIFont boldSystemFontOfSize:15.0];
    PatientAdvisedDrVal.backgroundColor=[UIColor whiteColor];
    [self CallService:@"AdvisedDoctor"];
    if([s isEqualToString:@"<null>"])
    {
        PatientAdvisedDrVal.text = @"";
    }
    else
    {
        PatientAdvisedDrVal.text = [NSString stringWithFormat:@"%@",s];
        
    }
    
    NSLog(@"item is %@",PatientAdvisedDrVal.text);
    [scrollview addSubview:PatientAdvisedDrVal];
    
    
    UILabel *PatientPanel =[[UILabel alloc]initWithFrame:CGRectMake(10,390,140,30)];
    PatientPanel.font = [UIFont systemFontOfSize:12.0];
    PatientPanel.backgroundColor=[UIColor whiteColor];
    [PatientPanel setText:@"Panel Name:"];
    [scrollview addSubview:PatientPanel];
    
    
    UILabel *PatientPanelVal=[[UILabel alloc]initWithFrame:CGRectMake(150,390,170,30)];
    PatientPanelVal.font = [UIFont boldSystemFontOfSize:15.0];
    PatientPanelVal.backgroundColor=[UIColor whiteColor];
    [self CallService:@"PanelCompany"];
    PatientPanelVal.text = [NSString stringWithFormat:@"%@",s];
    NSLog(@"item is %@",PatientPanelVal.text);
    [scrollview addSubview:PatientPanelVal];
    
    [self CallServiceWithIndex:@"IsTestCompleted"];
    TestCom=[NSMutableArray arrayWithArray:Sample];
    NSLog(@"testcom %@",TestCom);
    [self CallServiceWithIndex:@"IsSampleReceived"];
    SampleRec=[NSMutableArray arrayWithArray:Sample];
    NSLog(@"saml rec=%@",SampleRec);
    
    [self CallServiceWithIndex:@"LabNo"];
    
    Labno=[NSMutableArray arrayWithArray:Sample];
    NSLog(@"labno %@",Labno);
    NSLog(@"arrno=%d",(self.WebService->ptr1).count);
        
    int x=10,w=300,h=30, y=440;
    
    TestID=[[NSMutableArray alloc]init];
    
    for(int i=0 ;i<(self.WebService->ptr1).count ;i++)
    {
        
        Test1=[[UIButton alloc]initWithFrame:CGRectMake(x,y,w,h)];
        [Test1 addTarget:self action:@selector(TestDescription1:)forControlEvents:UIControlEventTouchUpInside];
        NSLog(@"val %@",[SampleRec objectAtIndex:i]);
        NSLog(@"val1 %@",[TestCom objectAtIndex:i]);
        NSLog(@"val2 %@",[Labno objectAtIndex:i]);
        Test1.autoresizingMask = UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
        if(([[SampleRec objectAtIndex:i]isEqualToString:@"0"]) && ([[TestCom objectAtIndex:i] isEqualToString:@"<null>"]) && ([[Labno objectAtIndex:i] isEqualToString:@"<null>"]))
        {
            // Test1.backgroundColor=[UIColor redColor];
            Test1.backgroundColor= [UIColor colorWithRed:166/256. green:20/256. blue:21/256. alpha:1];
            
            
        }
        else if(([SampleRec objectAtIndex:i]!=0) && ([[TestCom objectAtIndex:i] isEqualToString:@"<null>"]) && ([Labno objectAtIndex:i] != NULL))
            //   else if(([SampleReceived integerValue]==1) && ([TestComplted isEqualToString:@"<null>"]) && (LabNo!=NULL ))
        {
            // Test1.backgroundColor=[UIColor orangeColor];
            Test1.backgroundColor= [UIColor colorWithRed:246/256. green:138/256. blue:42/256. alpha:1];
            
        }
        else if(([SampleRec objectAtIndex:i]!=0) && (![[TestCom objectAtIndex:i] isEqualToString:@"<null>"]) && ([Labno objectAtIndex:i] != NULL))
            //   else if(([SampleReceived integerValue]==1) && ([TestComplted integerValue]==1) && (LabNo!=NULL ))
        {
            // Test1.backgroundColor=[UIColor greenColor];
            
            Test1.backgroundColor= [UIColor colorWithRed:79/256. green:196/256. blue:118/256. alpha:1];
            
        }
        
        Test1.tag=i;
        NSLog(@"test =%d",Test1.tag);
        NSString *s1 =[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:i]valueForKey:@"Description"]];
        NSLog(@"s1 =%@",s1);
        
        NSString *s2 =[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:i]valueForKey:@"TestId"]];
        NSLog(@"s2 =%@",s2);
        [TestID addObject:s2];
        NSLog(@"test id=%@",TestID);
        [Test1 setTitle:s1 forState:UIControlStateNormal];
        NSLog(@"test1 is %@",Test1);
        [scrollview addSubview:Test1];
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(TestDescription1:)];
        
        [Test1 addGestureRecognizer:tap];
        
        Test1.userInteractionEnabled=YES;
        
        tap.numberOfTapsRequired = 1;
        
        y=y+40;
        
    }
    TabBar.hidden=NO;
}

-(void)CallService:(NSString*)Str
{
    //  for(int i=0;i<(self.WebService->ptr1).count;i++)
    // {
    s =[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:0]valueForKey:Str]];
    NSLog(@"%@", s);
    // }
    // NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"()\""];
    // s = [[s componentsSeparatedByCharactersInSet:doNotWant]componentsJoinedByString:@""];
    //   NSLog(@"%@", s); // => foobarbazfoo
    //PatintCodeVal.text = [NSString stringWithFormat:@"%@",s];
}

-(IBAction)TestDescription1:(UITapGestureRecognizer *)reconizer
{
    PatientLabTestDesc1ViewController *PLTD=[[PatientLabTestDesc1ViewController alloc]init];
    UIButton *imv = (UIButton *)[reconizer view];
    NSLog(@"tag is %d",imv.tag);
    for(int i=0;i<(self.WebService->ptr1).count;i++)
    {
        PLTD.dictionary=(NSDictionary*)[self.WebService->ptr1 objectAtIndex:imv.tag];
        NSLog(@"desc is =%@",PLTD.dictionary);
        
        [self.navigationController pushViewController:PLTD animated:YES];
        
        break;
        
    }
}

-(IBAction)TestDescription2:(id)sender
{
    
    if([HistroyReport count]==0)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Check" message:@"No Record Found" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [alert show];
        
    }
    else
    {
        
 if(patientname.hidden==YES)
 {
   PTH=[[PatientTestHistoryViewController alloc]init];
 }

    NSLog(@"viewhistory is %@",viewhistory);
     NSLog(@"HistroyReport is %@",HistroyReport);
    PTH.History=[NSMutableArray arrayWithArray:viewhistory];
    NSLog(@"his %@",PTH.History);
    PTH.HistoryData=(NSMutableArray*)HistroyReport;
    NSLog(@"his %@",PTH.HistoryData);
    //  [PTH.table reloadData];
    
    [self.navigationController pushViewController:PTH animated:YES];
        
    }
    
}

-(IBAction)CallServiceWithIndex:(NSString*)Str
{
    
    Sample=[[NSMutableArray alloc]init];
    for(int i=0;i<(self.WebService->ptr1).count;i++)
    {
        s =[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:i]valueForKey:Str]];
        NSLog(@"%@", s);
        [Sample addObject:s];
        NSLog(@"sample is %@",Sample);
        
    }
}
-(void)ChargeDetails
{
    
    ChargeDetailsViewController *CDV=[[ChargeDetailsViewController alloc]init];
    //  UIButton *imv = (UIButton *)[reconizer view];
    // NSLog(@"tag is %d",imv.tag);
    
    for(int i=0;i<(self.WebService->ptr1).count;i++)
    {
        
        CDV.ChargeDetail_dictionary=(NSMutableDictionary*)[self.WebService->ptr1 objectAtIndex:0];
        NSLog(@"desc is =%@", CDV.ChargeDetail_dictionary);
        
        [self.navigationController pushViewController:CDV animated:YES];
        
        break;
        
    }
}

-(void)ViewContactDetails
{
    
    PatientContactDetailsViewController *PatientContactDetails=[[PatientContactDetailsViewController alloc]init];
    
    PatientContactDetails.PatientDetails=(NSMutableArray*)Patient_detail;
    // PatientContactDetails.PatientID1=[NSString stringWithFormat:@"%@",patient_id];
    // NSLog(@"patiiddddd %@",  PatientContactDetails.PatientID1);
    NSLog(@"patient detail %@", PatientContactDetails.PatientDetails);
    
    [self.navigationController pushViewController:PatientContactDetails animated:YES ];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// Do any additional setup after loading the view from its nib.




@end
