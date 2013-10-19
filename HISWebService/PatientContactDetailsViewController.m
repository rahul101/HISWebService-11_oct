//
//  PatientContactDetailsViewController.m
//  HISWebService
//
//  Created by Rahul Sharma on 29/05/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import "PatientContactDetailsViewController.h"

@interface PatientContactDetailsViewController ()

@end

@implementation PatientContactDetailsViewController
@synthesize WebService=_WebService,PatientDetails,PatientID1;
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
    
    NSLog(@"patient detail %@",PatientDetails);
   // NSLog(@"patient detail %@",PatientID1);

    
  //  [self CallServicePatientDetails1:@"PatientId"];
    
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth  ;
    self.view.autoresizesSubviews = YES;

    [self CallServicePatientDetails:@"PatientId"];
    PatientID1=[NSString stringWithFormat:@"%@",PatientDetail];
       
    NSLog(@"paid %@",PatientID1);
    
    
    NSLog(@"patient id %@",self.WebService->patientID=PatientID1);
    
    UILabel *Email_Id=[[UILabel alloc]initWithFrame:CGRectMake(10,70,80,20)];
    Email_Id.font=[UIFont systemFontOfSize:12.0];
    Email_Id.backgroundColor=[UIColor whiteColor];
    [Email_Id setText:@"Email Id :"];
    [self.view addSubview:Email_Id];
    
    UILabel *EmailIdVal=[[UILabel alloc]initWithFrame:CGRectMake(120,70,200,20)];
    EmailIdVal.font =[UIFont boldSystemFontOfSize:12.0];
    EmailIdVal.backgroundColor=[UIColor whiteColor];
    [self.WebService CallServicePatientDetailsEmailID:@"http://192.168.1.202:81/PatientModule/PatientService.asmx/GetUserEmail" Object:NULL Handler:NULL];
    
     EmailIdVal.text = [NSString stringWithFormat:@"%@",self.WebService.ptr] ;
    
     NSLog(@"item is %@",EmailIdVal.text);
    
    //[PatCodeVal setText:arr3];
    [self.view addSubview:EmailIdVal];
       
    UILabel *ContactNo=[[UILabel alloc]initWithFrame:CGRectMake(10,100,120,20)];
    ContactNo.font=[UIFont systemFontOfSize:12.0];
    ContactNo.backgroundColor=[UIColor whiteColor];
    [ContactNo setText:@"Contact No. :"];
    [self.view addSubview:ContactNo];

    
    UILabel *ContactNoVal=[[UILabel alloc]initWithFrame:CGRectMake(120,100,170,20)];
    ContactNoVal.font =[UIFont boldSystemFontOfSize:12.0];
    ContactNoVal.backgroundColor=[UIColor whiteColor];
    [self CallServicePatientDetails:@"ContactNo"];
        
    ContactNoVal.text = [NSString stringWithFormat:@"%@",PatientDetail] ;
    [self.view addSubview:ContactNoVal];

    UILabel *Address=[[UILabel alloc]initWithFrame:CGRectMake(10,130,120,20)];
    Address.font=[UIFont systemFontOfSize:12.0];
    Address.backgroundColor=[UIColor whiteColor];
    [Address setText:@"Address :"];
    [self.view addSubview:Address];

       
    [self CallServicePatientDetails:@"AreaId"];
    
     area_id=[NSString stringWithFormat:@"%@",PatientDetail];
    
    NSLog(@"area is %@",self.WebService->Area_Id=area_id);
    
    [self.WebService CallServicePatientDetailsAreaID:@"http://192.168.1.202:81/CommonMasterModule/UIService.asmx/GetOthersFromArea" Object:NULL Handler:NULL];
    
    
    NSLog(@"web service is %@",self.WebService->ptr1);
    
    UILabel *addressVal=[[UILabel alloc]initWithFrame:CGRectMake(120,130,100,20)];
    addressVal.font =[UIFont boldSystemFontOfSize:12.0];
    addressVal.backgroundColor=[UIColor whiteColor];
  //  [self CallServicePatientDetailsAddress:@"AreaName"];
    [self CallServicePatientDetails:@"Address"];
      
    addressVal.text = [NSString stringWithFormat:@"%@,",PatientDetail] ;
    
    [self.view addSubview:addressVal];

    
    
    
    UILabel *AddressVal=[[UILabel alloc]initWithFrame:CGRectMake(150,130,170,20)];
    AddressVal.font =[UIFont boldSystemFontOfSize:12.0];
    AddressVal.backgroundColor=[UIColor whiteColor];
    [self CallServicePatientDetailsAddress:@"AreaName"];
    
    AddressVal.text = [NSString stringWithFormat:@"%@",PatientDetail] ;

     [self.view addSubview:AddressVal];
    
    NSLog(@"%f",floor(4.33));
    
    UILabel *CityVal=[[UILabel alloc]initWithFrame:CGRectMake(120,160,170,20)];
    CityVal.font =[UIFont boldSystemFontOfSize:12.0];
    CityVal.backgroundColor=[UIColor whiteColor];
    [self CallServicePatientDetailsAddress:@"Name"];
    
    CityVal.text = [NSString stringWithFormat:@"%@",PatientDetail] ;
    
    [self.view addSubview:CityVal];

    UILabel *StateVal=[[UILabel alloc]initWithFrame:CGRectMake(120,190,170,20)];
    StateVal.font =[UIFont boldSystemFontOfSize:12.0];
    StateVal.backgroundColor=[UIColor whiteColor];
    [self CallServicePatientDetailsAddress:@"Name1"];
    
    StateVal.text = [NSString stringWithFormat:@"%@",PatientDetail] ;
    [self.view addSubview:StateVal];
    
    UILabel *CountryVal=[[UILabel alloc]initWithFrame:CGRectMake(120,220,170,20)];
    CountryVal.font =[UIFont boldSystemFontOfSize:12.0];
    CountryVal.backgroundColor=[UIColor whiteColor];
    [self CallServicePatientDetailsAddress:@"Name2"];
    
    CountryVal.text = [NSString stringWithFormat:@"%@",PatientDetail] ;
    
    [self.view addSubview:CountryVal];
    
    
    
    
    
    UILabel *EmergencyContactDetails=[[UILabel alloc]initWithFrame:CGRectMake(10,250,200,20)];
    EmergencyContactDetails.font=[UIFont boldSystemFontOfSize:12.0];
    EmergencyContactDetails.backgroundColor=[UIColor whiteColor];
    [EmergencyContactDetails setText:@"Emergency Contact Details :"];
    [self.view addSubview:EmergencyContactDetails];

    
    UILabel *EmergencyContactName=[[UILabel alloc]initWithFrame:CGRectMake(10,280,120,20)];
    EmergencyContactName.font=[UIFont systemFontOfSize:12.0];
    EmergencyContactName.backgroundColor=[UIColor whiteColor];
    [EmergencyContactName setText:@"Contact Name :"];
    [self.view addSubview:EmergencyContactName];

    
    UILabel *EmergencyContactNameVal=[[UILabel alloc]initWithFrame:CGRectMake(120,280,170,20)];
    EmergencyContactNameVal.font =[UIFont boldSystemFontOfSize:12.0];
    EmergencyContactNameVal.backgroundColor=[UIColor whiteColor];
    [self CallServicePatientDetails:@"EmergencyContactName"];
    
    EmergencyContactNameVal.text = [NSString stringWithFormat:@"%@",PatientDetail] ;
    [self.view addSubview:EmergencyContactNameVal];
    
    
    UILabel *EmergencyContactNo=[[UILabel alloc]initWithFrame:CGRectMake(10,310,120,20)];
    EmergencyContactNo.font=[UIFont systemFontOfSize:12.0];
    EmergencyContactNo.backgroundColor=[UIColor whiteColor];
    [EmergencyContactNo setText:@"Contact No. :"];
    [self.view addSubview:EmergencyContactNo];

    UILabel *EmergencyContactNoVal=[[UILabel alloc]initWithFrame:CGRectMake(120,310,170,20)];
    EmergencyContactNoVal.font =[UIFont boldSystemFontOfSize:12.0];
    EmergencyContactNoVal.backgroundColor=[UIColor whiteColor];
    [self CallServicePatientDetails:@"EmergencyContactNo"];
    
    EmergencyContactNoVal.text = [NSString stringWithFormat:@"%@",PatientDetail] ;
    [self.view addSubview:EmergencyContactNoVal];
    

    UILabel *EmergencyContactAddress=[[UILabel alloc]initWithFrame:CGRectMake(10,340,120,20)];
    EmergencyContactAddress.font=[UIFont systemFontOfSize:12.0];
    EmergencyContactAddress.backgroundColor=[UIColor whiteColor];
    [EmergencyContactAddress setText:@"Address :"];
    [self.view addSubview:EmergencyContactAddress];

    UILabel *EmergencyContactAddressVal=[[UILabel alloc]initWithFrame:CGRectMake(120,340,170,20)];
    EmergencyContactAddressVal.font =[UIFont boldSystemFontOfSize:12.0];
    EmergencyContactAddressVal.backgroundColor=[UIColor whiteColor];
    [self CallServicePatientDetails:@"EmergencyContactAddress"];
    
    EmergencyContactAddressVal.text = [NSString stringWithFormat:@"%@",PatientDetail] ;
    [self.view addSubview:EmergencyContactAddressVal];
    

    
    
    
    // Do any additional setup after loading the view from its nib.
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
    
}
-(void)CallServicePatientDetails:(NSString *)Str
{
  PatientDetail =[NSString stringWithFormat:@"%@",[[PatientDetails objectAtIndex:0]valueForKey:Str]];
    NSLog(@"%@", PatientDetail);
  //  NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"()\""];
  //  PatientDetail = [[PatientDetail componentsSeparatedByCharactersInSet:doNotWant]componentsJoinedByString:@""];

      
}
-(void)CallServicePatientDetailsAddress:(NSString *)Str
{
    PatientDetail =[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:0]valueForKey:Str]];
    NSLog(@"%@", PatientDetail);
    

    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
