//
//  UpdatePatientDetailsViewController.m
//  HISWebService
//
//  Created by Rahul Sharma on 07/06/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import "UpdatePatientDetailsViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface UpdatePatientDetailsViewController ()

@end

@implementation UpdatePatientDetailsViewController
@synthesize WebService=_WebService,DOB,view1;

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
    str=@"";
    [super viewDidLoad];
    view1=[[UIView alloc]initWithFrame:CGRectMake(0,64,320,50)];
    view1.backgroundColor=[UIColor whiteColor];
    [view1 setIsAccessibilityElement:YES];
    view1.userInteractionEnabled=YES;
    view1.autoresizingMask = UIViewAutoresizingFlexibleWidth ;
    
    view1.layer.borderColor = [UIColor grayColor].CGColor;
    view1.layer.borderWidth = 2.0f;
    [self.view addSubview:view1];
    
    GenderList=[NSMutableArray arrayWithObjects:@"Male",@"Female", nil];
    
    // Do any additional setup after loading the view from its nib.
    self.WebService=[[WebService alloc]init];
    
    scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0,114,320,540)];
    
    [scrollview setContentSize:CGSizeMake(320,1200)];
    
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
    copyListOfItems = [[NSMutableArray alloc] init];

    
    UILabel *PatientSearch=[[UILabel alloc]initWithFrame:CGRectMake(20,10,120,30)];
    PatientSearch.font = [UIFont systemFontOfSize:15.0];
    PatientSearch.backgroundColor=[UIColor whiteColor];
    [PatientSearch setText:@"Search Patient:"];
    [view1 addSubview:PatientSearch];
    
    patientname=[[UITextField alloc]initWithFrame:CGRectMake(130,10,170,30)];
    patientname.font = [UIFont boldSystemFontOfSize:15.0];
    patientname.tag=1;
    //the horizontal alignment of the text
    patientname.textAlignment = NSTextAlignmentLeft;
    patientname.borderStyle = UITextBorderStyleBezel;
    patientname.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
    patientname.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    patientname.delegate =self;
    [view1 addSubview:patientname];
    
 
  //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SearchPatients:) name:UITextFieldTextDidChangeNotification object:patientname];
    
    [patientname addTarget:self action:@selector(SearchPatients:)forControlEvents:UIControlEventEditingChanged];
    
    tool.hidden=YES;
}

-(void)dismissKeyboard
{
    [patientname resignFirstResponder];
}

-(void)SearchPatients:(id)sender
{
   // searching = YES;
    letUserSelectRow = YES;
    [table_SearchPatient removeFromSuperview];
    
    NSString *text =patientname.text;
    NSLog(@"text %@",text);
   
    NSLog(@"patname %@",self.WebService->patientname=patientname.text);
    NSLog(@"count %@",self.WebService->count=@"0");
    
    
    table_SearchPatient=[[UITableView alloc]initWithFrame:CGRectMake(130,105,170,250)style:UITableViewStylePlain];
    table_SearchPatient.delegate=self;
    table_SearchPatient.dataSource=self;
    table_SearchPatient.layer.borderWidth = 2.0;
    table_SearchPatient.layer.borderColor = [UIColor grayColor].CGColor;
    [self.view addSubview:table_SearchPatient];

    
    [self.WebService CallServicePatientNames:@"http://192.168.1.202:81/PatientModule/PatientService.asmx/SearchPatientjquery" Object:NULL Handler:NULL];
    
    SearchPatientCode=(NSMutableArray*)[self.WebService->ptr1 valueForKey:@"PatientCode"];
    NSLog(@"item is %@",   SearchPatientCode);
    SearchPatientName  =(NSMutableArray *)[self.WebService->ptr1 valueForKey:@"Name"];
    NSLog(@"item is %@",SearchPatientName);

    
    
//    NSRange whiteSpaceRange = [text rangeOfCharacterFromSet:[NSCharacterSet whitespaceCharacterSet]];
//    if (whiteSpaceRange.location != NSNotFound)
//    {
//        NSLog(@"Found whitespace");
//      //  NSString *secondString = [text stringByReplacingOccurrencesOfString:@"[A-za-z]"withString:@""];
//      //  NSArray *seperate=[text componentsSeparatedByString:@" "];
//      //  NSLog(@"Found %@",seperate);
//       // NSString *string = @" this text has spaces before and after ";
//        NSString *trimmedString = [text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
//        NSLog(@"val %@",trimmedString);
//        
//        
//      //  NSCharacterSet *delimiterCharacterSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
//        //NSArray *firstWords = [[str componentsSeparatedByCharactersInSet:delimiterCharacterSet] subarrayWithRange:wordRange];
////        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF contains[cd] %@", text];
////        copyListOfItems = [NSMutableArray arrayWithArray:[SearchPatientName filteredArrayUsingPredicate:predicate]];
//        
//        //NSLog(@"result %@ ",copyListOfItems);
//    
//        
//      //  NSString *trimmedString = [text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
//        //NSLog(@"str %@",trimmedString);
//       // NSRange whiteSpaceRange = [trimmedString rangeOfCharacterFromSet:[NSCharacterSet whitespaceCharacterSet]];
//        
//        
//    }
//[SearchPatientName  filterUsingPredicate:[NSPredicate predicateWithFormat:@"SELF contains[cd] %@", text]];
//    copyListOfItems = [SearchPatientName filterUsingPredicate:[NSPredicate predicateWithFormat:@"contains[cd] '%@'", text]];    [table_SearchPatient reloadData];
//
    
 //   copyListOfItems = [NSMutableArray arrayWithArray:[SearchPatientName filterUsingPredicate:[NSPredicate predicateWithFormat:@"SELF contains[cd] %@", text]]];
   // NSMutableArray *tempArray = [NSMutableArray arrayWithObjects:@"bat man",@"bat and ball",@"ball", nil];
   // else
    //{
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF contains[cd] %@", text];
//        NSLog(@"result %@ ",predicate);
//   copyListOfItems = [NSMutableArray arrayWithArray:[SearchPatientName filteredArrayUsingPredicate:predicate]];
//    
//    NSLog(@"result %@ ",copyListOfItems);
//    
//	for (NSString *sTemp in SearchPatientName)
//	{
//		NSRange titleResultsRange = [sTemp rangeOfString:[NSString stringWithFormat:@"%@",predicate] options:NSCaseInsensitiveSearch];
//		
//		if (titleResultsRange.length > 0)
//        {
//			[copyListOfItems addObject:sTemp];
//            NSLog(@"result %@ ",copyListOfItems);
//        }
//	}
//    //[pickerView reloadAllComponents];
//	
//
//    [table_SearchPatient reloadData];
    
//    [table_SearchPatient removeFromSuperview];
//    PatientName=patientname.text;
//    NSLog(@"patname %@",PatientName);
//    Count=@"0";
//    //   [patientname resignFirstResponder];
//    NSLog(@"patname %@",self.WebService->patientname=PatientName);
//    NSLog(@"count %@",self.WebService->count=Count);
//    
//    [self.WebService CallServicePatientNames:@"http://192.168.1.202:81/PatientModule/PatientService.asmx/SearchPatientjquery" Object:NULL Handler:NULL];
//    
//    table_SearchPatient=[[UITableView alloc]initWithFrame:CGRectMake(130,40,170,250)style:UITableViewStylePlain];
//    table_SearchPatient.delegate=self;
//    table_SearchPatient.dataSource=self;
//    table_SearchPatient.layer.borderWidth = 2.0;
//    table_SearchPatient.layer.borderColor = [UIColor grayColor].CGColor;
//    [self.view addSubview:table_SearchPatient];
//    
//    //SearchPatientCode=[[NSMutableArray alloc]initWithObjects:@"Rahul Sharma",@"Amit kumar",@"anil sharma", nil];
//    SearchPatientName=[[NSMutableArray alloc]init];
//    NSLog(@"arr is %@",self.WebService->ptr1);
//    SearchPatientCode=(NSMutableArray*)[self.WebService->ptr1 valueForKey:@"PatientCode"];
//    NSLog(@"item is %@",   SearchPatientCode);
//    SearchPatientName  =(NSMutableArray *)[self.WebService->ptr1 valueForKey:@"Name"];
//    NSLog(@"item is %@",SearchPatientName);
//    
//    NSMutableString *sb = [[NSMutableString alloc] init];
//    
//    NSMutableString *sb1 = [[NSMutableString alloc] init];
//    AppendArray=[[NSMutableArray alloc]init];
//    for (int i=0; i < SearchPatientCode.count; i++)
//    {
//        sb=[NSMutableString stringWithFormat:@"%@",SearchPatientCode[i]];
//        
//        sb1=[NSMutableString stringWithFormat:@"%@",SearchPatientName[i]];
//        
//        [AppendArray addObject:[[sb stringByAppendingString:@""]stringByAppendingString:sb1]];
//        
//        NSLog(@"arr %@",AppendArray);
//    }
//    NSLog(@"arr %d",AppendArray.count);
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
    //return YES;
    
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [patientname resignFirstResponder];
}


-(IBAction)donebtn:(id)sender
{
    [patientname resignFirstResponder];
    
    for (UIView* subView in scrollview.subviews)
    {
        if ([subView isKindOfClass:[UITextField class]])
            [subView removeFromSuperview];
        
    }
    tool.hidden=NO;
    //  PatientCode=patientname.text;
    NSLog(@"patcode=%@",self.WebService->patientcode=PatientCode);
    [self.WebService CallServicePatientDetails:@"http://192.168.1.202:81/PatientModule/PatientService.asmx/GetPatient" Object:NULL Handler:NULL];
    NSLog(@"hello=%@",self.WebService->ptr1);
    
    Patient_detail=(NSMutableArray*)self.WebService->ptr1;
    
    NSLog(@"patdet %@",Patient_detail);
    
    UILabel *Patientcode=[[UILabel alloc]initWithFrame:CGRectMake(10,10,120,30)];
    Patientcode.font = [UIFont systemFontOfSize:12.0];
    Patientcode.backgroundColor=[UIColor whiteColor];
    [Patientcode setText:@"Patient Code:"];
    [scrollview addSubview:Patientcode];
    
    UILabel *PatientCodeVal=[[UILabel alloc]initWithFrame:CGRectMake(150,10,170,30)];
    PatientCodeVal.font =[UIFont boldSystemFontOfSize:12.0];
    PatientCodeVal.backgroundColor=[UIColor whiteColor];
    [self CallService:@"PatientCode"];
    
    PatientCodeVal.text = [NSString stringWithFormat:@"%@",PatientDetails];
    
    NSLog(@"item is %@",PatientCodeVal.text);
    //[PatCodeVal setText:arr3];
    [scrollview addSubview:PatientCodeVal];
    
    UILabel *DORegistration_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,50,120,30)];
    [DORegistration_lbl setText:@"DORegistration *"];
    DORegistration_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:DORegistration_lbl];
    
    DORegistration=[[UITextField alloc]initWithFrame:CGRectMake(150,50,150,30)];
    DORegistration.font = [UIFont boldSystemFontOfSize:12.0];
    // DORegistration.placeholder = @"<enter text>";
    //DORegistration.borderStyle = UITextBorderStyleLine;
  //  DORegistration.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    DORegistration.delegate =self;
    DORegistration.userInteractionEnabled=NO;
    [self CallService:@"DORegistration"];
   // DORegistration.text=[NSString stringWithFormat:@"%@",PatientDetails];
    NSLog(@"doreg %@",PatientDetails);
    
    [scrollview addSubview:DORegistration];
    
    dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setAMSymbol:@"AM"];
    [dateFormatter setPMSymbol:@"PM"];
    [dateFormatter setDateFormat:@"dd-MM-yyyy hh:mm:ss a"];
    myDate = [dateFormatter dateFromString:PatientDetails];
    
    NSLog(@"%@", [dateFormatter stringFromDate:myDate]);
    anotherDateFormatter = [[NSDateFormatter alloc] init];
    [anotherDateFormatter setDateFormat:@"dd/MM/yyyy HH:mm"];
    NSLog(@"%@", [anotherDateFormatter stringFromDate:myDate]);
    DORegistration.text=[anotherDateFormatter stringFromDate:myDate];
    //theDate=DORegistration.text;
    
    UILabel *Salutation_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,90,100,30)];
    [Salutation_lbl setText:@"Salutation *"];
    Salutation_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:Salutation_lbl];
    self.WebService->StringName=@"Salutations";
    [self.WebService CallServiceStringName:@"http://192.168.1.202:81/CommonMasterModule/UIService.asmx/GetCommonMasterXMLList1" Object:NULL Handler:NULL];
    
    Salutations=(NSMutableArray*)self.WebService->ptr1;
    Title_view=(NSMutableArray*)[Salutations valueForKey:@"name"];
    NSLog(@"sal is %@",Salutations);
    NSLog(@"sal is %@",Title_view);
    
  
    
    Salutation=[[UITextField alloc]initWithFrame:CGRectMake(150,90,150,30)];
    Salutation.font = [UIFont boldSystemFontOfSize:12.0];
    // Salutation.placeholder = @"<enter text>";
    Salutation.borderStyle = UITextBorderStyleLine;
    Salutation.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    Salutation.delegate =self;
    Salutation.tag=2;
    [self CallService:@"Salutation"];
    Salutation.text=[NSString stringWithFormat:@"%@",PatientDetails];
    [scrollview addSubview:Salutation];
    //[Salutation addTarget:self action:@selector(btnpress1:)forControlEvents:UIControlEventEditingDidBegin];
    
    
    UILabel *FirstName_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,130,100,30)];
    [FirstName_lbl setText:@"FirstName *"];
    FirstName_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:FirstName_lbl];
    
    FirstName=[[UITextField alloc]initWithFrame:CGRectMake(150,130,150,30)];
    FirstName.font = [UIFont boldSystemFontOfSize:12.0];
    //FirstName.placeholder = @"<enter text>";
    FirstName.borderStyle = UITextBorderStyleLine;
    FirstName.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    FirstName.delegate =self;
    FirstName.tag=3;
    [self CallService:@"FirstName"];
    FirstName.text=[NSString stringWithFormat:@"%@",PatientDetails];
    [scrollview addSubview:FirstName];
    
    
    UILabel *MiddleName_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,170,100,30)];
    [MiddleName_lbl setText:@"MiddleName"];
    MiddleName_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:MiddleName_lbl];
    
    MiddleName=[[UITextField alloc]initWithFrame:CGRectMake(150,170,150,30)];
    MiddleName.font = [UIFont boldSystemFontOfSize:12.0];
    MiddleName.borderStyle = UITextBorderStyleLine;
    // MiddleName.placeholder = @"<enter text>";
    MiddleName.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    MiddleName.delegate =self;
    MiddleName.tag=4;

    [self CallService:@"MiddleName"];
    MiddleName.text=[NSString stringWithFormat:@"%@",PatientDetails];
    [scrollview addSubview:MiddleName];
    
    
    UILabel *LastName_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,210,100,30)];
    [LastName_lbl setText:@"LastName *"];
    LastName_lbl.font=[UIFont systemFontOfSize:12.0];
    
    [scrollview addSubview:LastName_lbl];
    
    LastName=[[UITextField alloc]initWithFrame:CGRectMake(150,210,150,30)];
    LastName.font = [UIFont boldSystemFontOfSize:12.0];
    LastName.borderStyle = UITextBorderStyleLine;
    // LastName.placeholder = @"<enter text>";
    LastName.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    LastName.delegate =self;
    LastName.tag=5;

    [self CallService:@"LastName"];
    LastName.text=[NSString stringWithFormat:@"%@",PatientDetails];
    [scrollview addSubview:LastName];
    
    
    UILabel *DOB_lbl=[[UILabel alloc]initWithFrame:CGRectMake(25,250,100,30)];
    [DOB_lbl setText:@"Date of Birth"];
    DOB_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:DOB_lbl];
    
    Dob_button=[[UIButton alloc]initWithFrame:CGRectMake(05,250,20,30)];
    // Dob_button.tag=6;
    [Dob_button setImage:[UIImage imageNamed:@"images-20"] forState:UIControlStateNormal];
    [Dob_button setImage:[UIImage imageNamed:@"images-19"] forState:UIControlStateSelected];
    [Dob_button addTarget:self action:@selector(buttonPress)forControlEvents:UIControlEventTouchUpInside];
    
    [scrollview addSubview:Dob_button];
    
    UILabel *Age=[[UILabel alloc]initWithFrame:CGRectMake(115,250,50,30)];
    [Age setText:@"Age"];
    Age.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:Age];
    
    age_button=[[UIButton alloc]initWithFrame:CGRectMake(95,250,20,30)];
    //age_button.tag=2;
    age_button.selected=YES;
    [age_button setImage:[UIImage imageNamed:@"images-20"] forState:UIControlStateNormal];
    [age_button setImage:[UIImage imageNamed:@"images-19"] forState:UIControlStateSelected];
    [age_button addTarget:self action:@selector(buttonPress1)forControlEvents:UIControlEventTouchUpInside];
    [scrollview addSubview:age_button];

    
    
    myDate = [NSDate date];
    
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy HH:mm"];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
     Enddate = [NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:myDate]];
    NSLog(@"end %@",Enddate);
    
    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc] init];
    [dateFormat1 setDateFormat:@"dd/MM/yyyy HH:mm"];
    NSDate *endDate = [dateFormat1 dateFromString:Enddate];
    NSLog(@"Date: %@",endDate);

    
    
    DOB=[[UITextField alloc]initWithFrame:CGRectMake(150,250,150,30)];
    DOB.font = [UIFont boldSystemFontOfSize:12.0];
    DOB.tag=6;
    DOB.borderStyle = UITextBorderStyleLine;
    // DOB.placeholder = @"<enter text>";
    DOB.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    DOB.delegate =self;
    [self CallService:@"DOB"];
    dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setAMSymbol:@"AM"];
    [dateFormatter setPMSymbol:@"PM"];
    [dateFormatter setDateFormat:@"dd-MM-yyyy hh:mm:ss a"];
    NSDate *Startdate = [dateFormatter dateFromString:PatientDetails];
   // NSString *Startdate =[NSString stringWithFormat:@"%@",[dateFormatter dateFromString:PatientDetails]];
    NSLog(@"mydate %@",Startdate);
   
    
//   NSLog(@"%@", [dateFormatter stringFromDate:myDate]);
//   NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
//  [dateFormat setDateFormat:@"dd-MM-yyyy HH:mm"];
//   NSLog(@"date %@",dateFormat);
//  
//   NSDate *startDate = (NSDate*)Startdate;
//   NSLog(@"Date: %@",startDate);

    
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSUInteger unitFlags = NSMonthCalendarUnit | NSDayCalendarUnit|NSYearCalendarUnit;
    
    NSDateComponents *components = [gregorian components:unitFlags fromDate:Startdate toDate:endDate options:0];
    NSInteger months = [components month];
    NSInteger days = [components day]; 
    NSInteger year=[components year];
    

    NSLog(@"There are %d days in between the two dates. and month %d and year %d", days,months,year);
    
  DOB.text=[NSString stringWithFormat:@"%d",year];
    [scrollview addSubview:DOB];
    
    
    UILabel *Sex_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,290,100,30)];
    [Sex_lbl setText:@"Sex *"];
    Sex_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:Sex_lbl];
    
    Sex=[[UITextField alloc]initWithFrame:CGRectMake(150,290,150,30)];
    Sex.font = [UIFont boldSystemFontOfSize:12.0];
    // Sex.placeholder = @"<enter text>";
    Sex.borderStyle = UITextBorderStyleLine;
    Sex.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    Sex.delegate =self;
    Sex.tag=7;
    [self CallService:@"Sex"];
    Sex.text=[NSString stringWithFormat:@"%@",PatientDetails];
    
    [scrollview addSubview:Sex];
    
  //[Sex addTarget:self action:@selector(btnpress1:)forControlEvents:UIControlEventEditingDidBegin];
    
    UILabel *BloodGroup_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,330,100,30)];
    [BloodGroup_lbl setText:@"BloodGroup"];
    BloodGroup_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:BloodGroup_lbl];
    self.WebService->StringName=@"BloodGroup";
    [self.WebService CallServiceStringName:@"http://192.168.1.202:81/CommonMasterModule/UIService.asmx/GetCommonMasterXMLList1" Object:NULL Handler:NULL];
    
    bloodgroup=(NSMutableArray*)self.WebService->ptr1;
    Bloodgroup_view=(NSMutableArray*)[bloodgroup valueForKey:@"name"];
    NSLog(@"sal is %@",bloodgroup);
    NSLog(@"sal is %@",Bloodgroup_view);
    

    
    BloodGroup=[[UITextField alloc]initWithFrame:CGRectMake(150,330,150,30)];
    BloodGroup.font = [UIFont boldSystemFontOfSize:12.0];
    BloodGroup.borderStyle = UITextBorderStyleLine;
    // BloodGroup.placeholder = @"<enter text>";
    BloodGroup.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    BloodGroup.delegate =self;
    BloodGroup.tag=8;
    [self CallService:@"BloodGroup"];
    if([PatientDetails isEqualToString:@"<null>"])
    {
        BloodGroup.text=@"";
    }
    else
    {
        BloodGroup.text=[NSString stringWithFormat:@"%@",PatientDetails];
    }
    [scrollview addSubview:BloodGroup];
    //[BloodGroup addTarget:self action:@selector(btnpress1:)forControlEvents:UIControlEventEditingDidBegin];

    UILabel *FatherName_lbl=[[UILabel alloc]initWithFrame:CGRectMake(25,370,30,30)];
    [FatherName_lbl setText:@"Father"];
    FatherName_lbl.font=[UIFont systemFontOfSize:10.0];
    UILabel *Husband_lbl=[[UILabel alloc]initWithFrame:CGRectMake(75,370,100,30)];
    [Husband_lbl setText:@"Husband Name"];
    Husband_lbl.font=[UIFont systemFontOfSize:10.0];
    [scrollview addSubview:Husband_lbl];
    
    _Fatherbutton=[[UIButton alloc]initWithFrame:CGRectMake(05,370,20,30)];
    _Fatherbutton.tag=1;
    _Fatherbutton.selected=YES;
    [_Fatherbutton setImage:[UIImage imageNamed:@"images-20"] forState:UIControlStateNormal];
    [_Fatherbutton setImage:[UIImage imageNamed:@"images-19"] forState:UIControlStateSelected];
    
    [_Fatherbutton addTarget:self action:@selector(buttonPress_Check:) forControlEvents:UIControlEventTouchUpInside];
    
    [scrollview addSubview:_Fatherbutton];
    
    
    _Husbutton=[[UIButton alloc]initWithFrame:CGRectMake(55,370,20,30)];
    _Husbutton.tag=2;
    [_Husbutton setImage:[UIImage imageNamed:@"images-20"] forState:UIControlStateNormal];
    [_Husbutton setImage:[UIImage imageNamed:@"images-19"] forState:UIControlStateSelected];
    
    
    [_Husbutton addTarget:self action:@selector(buttonPress_Check:) forControlEvents:UIControlEventTouchUpInside];
    
    [scrollview addSubview:_Husbutton];
    
    FatherName=[[UITextField alloc]initWithFrame:CGRectMake(150,370,150,30)];
    FatherName.font = [UIFont boldSystemFontOfSize:12.0];
    FatherName.borderStyle = UITextBorderStyleLine;
    FatherName.tag=9;
    //   FatherName.placeholder = @"<enter text>";
    FatherName.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    FatherName.delegate =self;
    [scrollview addSubview:FatherName];
    [scrollview addSubview:FatherName_lbl];

    UILabel *email_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,410,50,30)];
    [email_lbl setText:@"Email"];
    email_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:email_lbl];
    
    email=[[UITextField alloc]initWithFrame:CGRectMake(150,410,150,30)];
    email.font = [UIFont boldSystemFontOfSize:12.0];
    //  email.placeholder = @"<enter text>";
    email.borderStyle = UITextBorderStyleLine;
    email.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    email.delegate =self;
    email.tag=10;

    [self CallService:@"PatientId"];
    //Patientid=[NSString stringWithFormat:@"%@",PatientDetails];
    NSLog(@"patient id %@",self.WebService->patientID=PatientDetails);
    Patientid=[NSString stringWithFormat:@"%@",PatientDetails];
    [self.WebService CallServicePatientDetailsEmailID:@"http://192.168.1.202:81/PatientModule/PatientService.asmx/GetUserEmail" Object:NULL Handler:NULL];
    
    email.text = [NSString stringWithFormat:@"%@",self.WebService.ptr] ;
    [scrollview addSubview:email];
    EmailService=email.text;
    
    UILabel *ContactNo_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,450,100,30)];
    [ContactNo_lbl setText:@"ContactNo"];
    ContactNo_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:ContactNo_lbl];
    
    ContactNo=[[UITextField alloc]initWithFrame:CGRectMake(150,450,150,30)];
    ContactNo.font = [UIFont boldSystemFontOfSize:12.0];
    //  ContactNo.placeholder = @"<enter text>";
    ContactNo.borderStyle = UITextBorderStyleLine;
    ContactNo.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    ContactNo.delegate =self;
    ContactNo.tag=11;
    [self CallService:@"ContactNo"];
    if([PatientDetails isEqualToString:@"<null>"])
    {
        ContactNo.text=[NSString stringWithFormat:@""];
    }
    else
    {
        ContactNo.text=[NSString stringWithFormat:@"%@",PatientDetails];
    }
    
    [scrollview addSubview:ContactNo];
    
    UILabel *Religion_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,490,100,30)];
    [Religion_lbl setText:@"Religion"];
    Religion_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:Religion_lbl];
    self.WebService->StringName=@"Religion";
    [self.WebService CallServiceStringName:@"http://192.168.1.202:81/CommonMasterModule/UIService.asmx/GetCommonMasterXMLList1" Object:NULL Handler:NULL];
    
    ReligionDetail=(NSMutableArray*)self.WebService->ptr1;
    Religion_view=(NSMutableArray*)[ReligionDetail valueForKey:@"name"];
    NSLog(@"sal is %@",ReligionDetail);
    NSLog(@"sal is %@",Religion_view);
    [Salutation resignFirstResponder];
    
    
    
    Religion=[[UITextField alloc]initWithFrame:CGRectMake(150,490,150,30)];
    Religion.font = [UIFont boldSystemFontOfSize:12.0];
    //  Religion.placeholder = @"<enter text>";
    Religion.borderStyle = UITextBorderStyleLine;
    Religion.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    Religion.delegate =self;
    Religion.tag=12;
    [self CallService:@"Religion"];
    Religion.text=[NSString stringWithFormat:@"%@",PatientDetails];
    [scrollview addSubview:Religion];
  //  [Religion addTarget:self action:@selector(btnpress1:)forControlEvents:UIControlEventEditingDidBegin];
    
    UILabel *Comments_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,530,100,30)];
    [Comments_lbl setText:@"Comments"];
    Comments_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:Comments_lbl];
    comments=[[UITextField alloc]initWithFrame:CGRectMake(150,530,150,30)];
    comments.font = [UIFont boldSystemFontOfSize:12.0];
    // comments.placeholder = @"<enter text>";
    comments.borderStyle = UITextBorderStyleLine;
    comments.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    comments.delegate =self;
    comments.tag=13;
    [self CallService:@"Comments"];
    comments.text=[NSString stringWithFormat:@"%@",PatientDetails];
    
    [scrollview addSubview:comments];

    UILabel *UId1_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,570,100,30)];
    [UId1_lbl setText:@"UId1"];
    UId1_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:UId1_lbl];
    
    UId1=[[UITextField alloc]initWithFrame:CGRectMake(150,570,150,30)];
    UId1.font = [UIFont boldSystemFontOfSize:12.0];
    //  UId1.placeholder = @"<enter text>";
    UId1.borderStyle = UITextBorderStyleLine;
    UId1.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    UId1.delegate =self;
    UId1.tag=14;

    [self CallService:@"UId1"];
    UId1.text=[NSString stringWithFormat:@"%@",PatientDetails];
    
    [scrollview addSubview:UId1];
    
    [self CallService:@"NationID"];
    nationId=[NSString stringWithFormat:@"%@",PatientDetails];
    
    UILabel *Alias_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,610,100,30)];
    [Alias_lbl setText:@"Alias"];
    Alias_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:Alias_lbl];
    
    alias=[[UITextField alloc]initWithFrame:CGRectMake(150,610,150,30)];
    alias.font = [UIFont boldSystemFontOfSize:12.0];
    // alias.placeholder = @"<enter text>";
    alias.borderStyle = UITextBorderStyleLine;
    alias.tag=15;

    alias.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    alias.delegate =self;
    NSLog(@"area is %@",self.WebService->patientID=Patientid);
    
    alias.text=[NSString stringWithFormat:@""];
    [scrollview addSubview:alias];
    [scrollview addSubview:Alias_lbl];
    
    NSLog(@"area is %@",self.WebService->Staff_id=Patientid);
    
    [self.WebService CallServiceGetAliasfromId:@"http://192.168.1.202:81/StaffModule/StaffService.asmx/GetAliasfromID" Object:NULL Handler:NULL];
    
    if([self.WebService.ptr isEqualToString:@""])
    {
        alias.text=@"";
    }
    else
    {
        alias.text=[NSString stringWithFormat:@"%@",self.WebService.ptr];
        
    }
    Aliascheck=alias.text;

    
    UILabel *NationId_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,650,100,30)];
    [NationId_lbl setText:@"Nationality"];
    NationId_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:NationId_lbl];
    
    NationId=[[UITextField alloc]initWithFrame:CGRectMake(150,650,150,30)];
    NationId.font = [UIFont boldSystemFontOfSize:12.0];
   // NationId.placeholder = @"<enter text>";
    NationId.borderStyle = UITextBorderStyleLine;
    NationId.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    NationId.delegate =self;
    NationId.tag=16;
    
    if([nationId isEqualToString:@"<null>"])
    {
        NationId.text=@"";
        
    }
    else
    {
    NSLog(@"area is %@",self.WebService->nationality=nationId);
    
    [self.WebService CallServicePatientDetailsNationality:@"http://192.168.1.202:81/CommonMasterModule/UIService.asmx/GetNationality" Object:NULL Handler:NULL];
    
    // [self CallService:@"Nationality"];
    Nationid =[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:0]valueForKey:@"Nationality"]];
    NSLog(@"natin is %@",Nationid);
    if([Nationid isEqualToString:@"(null)"])
    {
        NationId.text=@"";
        
    }
    else
    {
        NationId.text=[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:0]valueForKey:@"Nationality"]];
        
    }
    }
    [scrollview addSubview:NationId];
    [scrollview addSubview:NationId_lbl];
  //  [NationId addTarget:self action:@selector(btnpress1:)forControlEvents:UIControlEventEditingDidBegin];
    //[patientname addTarget:self action:@selector(SearchPatients:)forControlEvents:UIControlEventEditingChanged];

    
    UILabel *Address_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,690,100,30)];
    [Address_lbl setText:@"Address"];
    Address_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:Address_lbl];
    Address=[[UITextField alloc]initWithFrame:CGRectMake(150,690,150,30)];
    Address.font = [UIFont boldSystemFontOfSize:12.0];
    // Address.placeholder = @"<enter text>";
    Address.borderStyle = UITextBorderStyleLine;
    Address.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    Address.delegate =self;
    Address.tag=17;
    [self CallService:@"Address"];
    Address.text=[NSString stringWithFormat:@"%@",PatientDetails];
    [scrollview addSubview:Address];
    
    UILabel *AreaId_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,730,100,30)];
    [AreaId_lbl setText:@"Area *"];
    AreaId_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:AreaId_lbl];
    AreaId=[[UITextField alloc]initWithFrame:CGRectMake(150,730,150,30)];
    AreaId.font = [UIFont boldSystemFontOfSize:12.0];
    AreaId.borderStyle = UITextBorderStyleLine;
    // AreaId.placeholder = @"<enter text>";
    // AreaId.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    AreaId.delegate =self;
    AreaId.tag=18;
    [self CallService:@"AreaId"];
    NSLog(@"area is %@",self.WebService->Area_Id=PatientDetails);
    
    [self.WebService CallServicePatientDetailsAreaID:@"http://192.168.1.202:81/CommonMasterModule/UIService.asmx/GetOthersFromArea" Object:NULL Handler:NULL];
    
    // Area_ID=[[NSMutableArray alloc]init];
    
    Area_ID=(NSMutableArray*)self.WebService->ptr1;
    NSLog(@"areaid is %@",Area_ID);
    
    
    NSLog(@"web service is %@",self.WebService->ptr1);
    
    [self CallService1:@"AreaName"];
    AreaId.text=[NSString stringWithFormat:@"%@",PatientDetails];
    
    [scrollview addSubview:AreaId];
    //[AreaId addTarget:self action:@selector(btnpress1:)forControlEvents:UIControlEventEditingDidBegin];
    
       
    UILabel *CityId_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,770,100,30)];
    [CityId_lbl setText:@"City *"];
    CityId_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:CityId_lbl];
    
    CityId=[[UITextField alloc]initWithFrame:CGRectMake(150,770,150,30)];
    CityId.font = [UIFont boldSystemFontOfSize:12.0];
    // CityId.placeholder = @"<enter text>";
    CityId.borderStyle = UITextBorderStyleLine;
    CityId.delegate =self;
    CityId.tag=19;
    [self CallService1:@"Name"];
    CityId.text=[NSString stringWithFormat:@"%@",PatientDetails];
    
    [scrollview addSubview:CityId];
    
    //[CityId addTarget:self action:@selector(btnpress1:)forControlEvents:UIControlEventEditingDidBegin];

    
    
    UILabel *StateId_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,810,100,30)];
    [StateId_lbl setText:@"State *"];
    StateId_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:StateId_lbl];
    
    StateId=[[UITextField alloc]initWithFrame:CGRectMake(150,810,150,30)];
    StateId.font = [UIFont boldSystemFontOfSize:12.0];
    StateId.borderStyle = UITextBorderStyleLine;
    // StateId.placeholder = @"<enter text>";
    StateId.delegate =self;
    StateId.tag=20;
    [self CallService1:@"Name1"];
    StateId.text=[NSString stringWithFormat:@"%@",PatientDetails];
    [scrollview addSubview:StateId];
   // [StateId addTarget:self action:@selector(btnpress1:)forControlEvents:UIControlEventEditingDidBegin];
    
    UILabel *CountryId_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,850,100,30)];
    [CountryId_lbl setText:@"Country *"];
    CountryId_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:CountryId_lbl];
    
    CountryId=[[UITextField alloc]initWithFrame:CGRectMake(150,850,150,30)];
    CountryId.font = [UIFont boldSystemFontOfSize:12.0];
    CountryId.borderStyle = UITextBorderStyleLine;
    // CountryId.placeholder = @"<enter text>";
    CountryId.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    CountryId.delegate =self;
    CountryId.tag=21;
    [self CallService1:@"Name2"];
    CountryId.text=[NSString stringWithFormat:@"%@",PatientDetails];
    
    [scrollview addSubview:CountryId];
    
   // [CountryId addTarget:self action:@selector(btnpress1:)forControlEvents:UIControlEventEditingDidBegin];

    
        
    UILabel *PinCode_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,890,100,30)];
    [PinCode_lbl setText:@"PinCode *"];
    PinCode_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:PinCode_lbl];
    PinCode=[[UITextField alloc]initWithFrame:CGRectMake(150,890,150,30)];
    PinCode.font = [UIFont boldSystemFontOfSize:12.0];
   // PinCode.placeholder = @"<enter text>";
    PinCode.borderStyle = UITextBorderStyleLine;
    //  PinCode.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    PinCode.delegate =self;
    PinCode.tag=22;
    [self CallService1:@"PinCode"];
    PinCode.text=[NSString stringWithFormat:@"%@",PatientDetails];
    
    [scrollview addSubview:PinCode];
    
    
    [self.WebService CallServiceCountryList:@"http://192.168.1.202:81/CommonMasterModule/UIService.asmx/GetCountryList" Object:NULL Handler:NULL];
    
    NSLog(@"dictonary is %@",self.WebService->ptr1);
    Dict=[[NSMutableArray alloc]init];
    Dict123=[[NSMutableArray alloc]init];
    Dict=(NSMutableArray*)self.WebService->ptr1;
    NSLog(@"dict is %@",Dict);
    Dict123=[Dict valueForKey:@"Name"];
    NSLog(@"dict is %@",Dict123);

   
    UIButton *Update=[[UIButton alloc]initWithFrame:CGRectMake(50,970,100,30)];
    Update.backgroundColor=[UIColor blueColor];
    [Update setTitle:@"Update" forState:UIControlStateNormal];
    [Update addTarget:self action:@selector(UpdateButton:) forControlEvents:UIControlEventTouchUpInside];
    [scrollview addSubview:Update];
    
    UIButton *cancle=[[UIButton alloc]initWithFrame:CGRectMake(170,970,100,30)];
    cancle.backgroundColor=[UIColor redColor];
    [cancle setTitle:@"Cancel" forState:UIControlStateNormal];
    [cancle addTarget:self action:@selector(CancelButton:) forControlEvents:UIControlEventTouchUpInside];
    [scrollview addSubview:cancle];
    
    
//    if ([[UIScreen mainScreen] bounds].size.height >480)
//    {
//        pickerview_sex=[[UIPickerView alloc]initWithFrame:CGRectMake(0,350,320,50)];
//        
//    }
//    else
//    {
//        pickerview_sex=[[UIPickerView alloc]initWithFrame:CGRectMake(0,270,320,50)];
//        
//    }
//    pickerview_sex.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
//    pickerview_sex.dataSource=self;
//    pickerview_sex.delegate=self;
//    pickerview_sex.showsSelectionIndicator=YES;
//    [self.view addSubview:pickerview_sex];
//    
//    pickerview_sex.hidden=YES;
    [self.WebService CallServiceNationalityList:@"http://192.168.1.202:81/CommonMasterModule/UIService.asmx/GetAllNationality" Object:NULL Handler:NULL];
    
    [NationId resignFirstResponder];
    
    Nationality_View=[[NSMutableArray alloc]init];
    Nationality_ID=[[NSMutableArray alloc]init];
    
    Nationality_View=(NSMutableArray*)self.WebService->ptr1;
    
    Nationality_ID=[Nationality_View valueForKey:@"Nationality"];
    
    NSLog(@"nationalityid is %@",Nationality_ID);
//    
//    if ([[UIScreen mainScreen] bounds].size.height >480)
//    {
//        Pickerview_Nationality=[[UIPickerView alloc]initWithFrame:CGRectMake(0,350,320,50)];
//    }
//    else
//    {
//        Pickerview_Nationality=[[UIPickerView alloc]initWithFrame:CGRectMake(0,270,320,50)];
//        
//    }
//    Pickerview_Nationality.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
//    Pickerview_Nationality.dataSource=self;
//    Pickerview_Nationality.delegate=self;
//    Pickerview_Nationality.showsSelectionIndicator=YES;
//    [self.view addSubview:Pickerview_Nationality];
//    
//    Pickerview_Nationality.hidden=YES;
    
}
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;   // return NO to not change text
//{
//    
//    [copyListOfItems removeAllObjects];
//	
//	if([string length] > 0) {
//        
//		searching = YES;
//		letUserSelectRow = YES;
//             NSLog(@"sea %@",  string);
//        str = [str stringByAppendingString:string];
//        NSLog(@"sea %@",  str);
//        
//        
//        //NSMutableArray *searchArray = [[NSMutableArray alloc] init];
//        
//        NSLog(@"sea %@",SearchPatientName);
//        
//        for (NSString *sTemp in SearchPatientName)
//        {
//            NSLog(@"stem %@",sTemp);
//            
//            NSRange titleResultsRange = [sTemp rangeOfString:str options:NSCaseInsensitiveSearch];
//            
//           // NSLog(@"cpy %@",titleResultsRange);
//
//            if (titleResultsRange.length > 0)
//            {
//                [copyListOfItems addObject:sTemp];
//            }
//        
//        }
//    }
//	else {
//		
//		searching = NO;
//		letUserSelectRow = NO;
//        
//	}
//	
//	//NSLog(@"cpy %@",copyListOfItems);
//    
//
//    
//   [table_SearchPatient reloadData];
//   
//   // [ reloadAllComponents];
//    
//    return  YES;
//    
//}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    tool.hidden=NO;
    
    text_tag=textField.tag;
    
       if (textField.tag==1)
    {
         tool.hidden=YES;
        
//        table_SearchPatient=[[UITableView alloc]initWithFrame:CGRectMake(130,105,170,250)style:UITableViewStylePlain];
//        table_SearchPatient.delegate=self;
//        table_SearchPatient.dataSource=self;
//        table_SearchPatient.layer.borderWidth = 2.0;
//        table_SearchPatient.layer.borderColor = [UIColor grayColor].CGColor;
//        [self.view addSubview:table_SearchPatient];
        searching = NO;
        letUserSelectRow = NO;
        

    }
    
    if (textField.tag==2)
    {
        NSArray *items=[tool items];
        UIBarButtonItem *Prev=[items objectAtIndex:0];
        Prev.enabled=NO;
        
        Pickerview_Salutations=[[UIPickerView alloc]initWithFrame:CGRectMake(0,332,320,216)];
        
        Pickerview_Salutations.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin ;
        Pickerview_Salutations.dataSource=self;
        Pickerview_Salutations.delegate=self;
        Pickerview_Salutations.showsSelectionIndicator=YES;
        [self.view addSubview:Pickerview_Salutations];
               
        tool.hidden=NO;
        NSLog(@" fpicker %@",Pickerview_Salutations);
        NSLog(@" tool %@",tool);
            
    }
    else
    {
        NSArray *items=[tool items];
        UIBarButtonItem *Prev=[items objectAtIndex:0];
        Prev.enabled=YES;
    }
          if (textField.tag==6)
    {
        if (Dob_button.selected)
        {
            age_button.selected=NO;
            
            tool.hidden=NO;
            DatePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0,332,320,216)];
            DatePicker.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
            DatePicker.datePickerMode = UIDatePickerModeDate;
            //  DatePicker.datePickerMode = UIDatePickerModeDateAndTime;
            DatePicker.date = [NSDate date];
            
            //done.hidden=NO;
            
            DatePicker.userInteractionEnabled=YES;
            //DatePicker.hidden=YES;
            // [self.DOB setInputView:DatePicker];
            [self.view addSubview:DatePicker];
            //DatePicker.hidden=YES;
            
            Pickerview_Salutations.hidden=YES;
            pickerview_sex.hidden=YES;
            Pickerview_BloodGroup.hidden=YES;
            Pickerview_Religion.hidden=YES;
            Pickerview_Nationality.hidden=YES;
            pickerview_area.hidden=YES;
            pickerview_city.hidden=YES;
            pickerview_state.hidden=YES;
            pickerview_country.hidden=YES;
            
            //[DOB resignFirstResponder];
        }
        
        else if (age_button.selected)
        {
            
            Dob_button.selected=NO;
            tool.hidden=NO;
            Pickerview_Salutations.hidden=YES;
            DatePicker.hidden=YES;
            pickerview_sex.hidden=YES;
            Pickerview_BloodGroup.hidden=YES;
            Pickerview_Religion.hidden=YES;
            Pickerview_Nationality.hidden=YES;
            pickerview_area.hidden=YES;
            pickerview_city.hidden=YES;
            pickerview_state.hidden=YES;
            pickerview_country.hidden=YES;
            //[DOB resignFirstResponder];
            // [DatePicker removeFromSuperview];
            
        }
        
    }
    
    if(textField.tag==7)
    {
        tool.hidden=NO;
        pickerview_sex=[[UIPickerView alloc]initWithFrame:CGRectMake(0,332,320,216)];
      //  PickerTag=pickerview_sex.tag=3;
        pickerview_sex.autoresizingMask = UIViewAutoresizingFlexibleWidth ;
        pickerview_sex.dataSource=self;
        pickerview_sex.delegate=self;
        //pickerview_sex.hidden=NO;
        pickerview_sex.showsSelectionIndicator=YES;
        [self.view addSubview:pickerview_sex];
        
    }
    if (textField.tag==8)
    {
        tool.hidden=NO;
        Pickerview_BloodGroup=[[UIPickerView alloc]initWithFrame:CGRectMake(0,332,320,216)];
        Pickerview_BloodGroup.autoresizingMask = UIViewAutoresizingFlexibleWidth  ;
        Pickerview_BloodGroup.tag=4;
        Pickerview_BloodGroup.dataSource=self;
        Pickerview_BloodGroup.delegate=self;
        Pickerview_BloodGroup.showsSelectionIndicator=YES;
        [self.view addSubview:Pickerview_BloodGroup];
        
        //  Pickerview_BloodGroup.hidden=NO;
        
        // Pickerview_Nationality.hidden=NO;
        Pickerview_Nationality.hidden=YES;
        pickerview_city.hidden=YES;
        pickerview_sex.hidden=YES;
        pickerview_country.hidden=YES;
        pickerview_state.hidden=YES;
        pickerview_area.hidden=YES;
        
    }
    
       if (textField.tag==12)
    {
        tool.hidden=NO;
        
        Pickerview_Religion=[[UIPickerView alloc]initWithFrame:CGRectMake(0,332,320,216)];
        
        Pickerview_Religion.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        Pickerview_Religion.tag=5;
        Pickerview_Religion.dataSource=self;
        Pickerview_Religion.delegate=self;
        Pickerview_Religion.showsSelectionIndicator=YES;
        [self.view addSubview:Pickerview_Religion];
        // Pickerview_Religion.hidden=NO;
        Pickerview_Nationality.hidden=YES;
        pickerview_city.hidden=YES;
        pickerview_sex.hidden=YES;
        pickerview_country.hidden=YES;
        pickerview_state.hidden=YES;
        pickerview_area.hidden=YES;
    }
        
    if (textField.tag==16)
    {
        check=3;
        [email resignFirstResponder];
        [FirstName resignFirstResponder];
        [MiddleName resignFirstResponder];
        [LastName resignFirstResponder];
        [DOB resignFirstResponder];
        [FatherName resignFirstResponder];
        [ContactNo resignFirstResponder];
        [comments resignFirstResponder];
        [UId1 resignFirstResponder];
        [alias resignFirstResponder];
        [Address resignFirstResponder];
        tool.hidden=YES;
              
        if ([[UIScreen mainScreen] bounds].size.height >480)
        {
            objYHCPickerView = [[PickerView alloc] initWithFrame:CGRectMake(0, 100, 320, 480)withNSArray:Nationality_ID ];
        }
        else
        {
            objYHCPickerView = [[PickerView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)withNSArray:Nationality_ID ];
            
        }
        NSLog(@"view %f",self.view.frame.origin.y);
        CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y);
        [scrollview setContentOffset:scrollPoint animated:YES];
        
        objYHCPickerView.delegate = self;
        [self.view addSubview:objYHCPickerView];
        [objYHCPickerView showPicker];
        
    }
      
    if (textField.tag==21)
    {
        NSArray *items=[tool items];
        UIBarButtonItem *Next=[items objectAtIndex:1];
        Next.enabled=NO;
        
        [email resignFirstResponder];
        [FirstName resignFirstResponder];
        [MiddleName resignFirstResponder];
        [LastName resignFirstResponder];
        [DOB resignFirstResponder];
        [FatherName resignFirstResponder];
        [ContactNo resignFirstResponder];
        [comments resignFirstResponder];
        [UId1 resignFirstResponder];
        [alias resignFirstResponder];
        [Address resignFirstResponder];
        pickerview_country=[[UIPickerView alloc]initWithFrame:CGRectMake(0,332,320,216)];
        pickerview_country.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        pickerview_country.dataSource=self;
        pickerview_country.tag=7;
        pickerview_country.delegate=self;
        pickerview_country.showsSelectionIndicator=YES;
        [self.view addSubview:pickerview_country];
        
        pickerview_country.hidden=NO;
        pickerview_sex.hidden=YES;
        pickerview_state.hidden=YES;
        pickerview_city.hidden=YES;
        pickerview_area.hidden=YES;
        Pickerview_Nationality.hidden=YES;    }
    else
    {
        NSArray *items=[tool items];
        UIBarButtonItem *Next=[items objectAtIndex:1];
        Next.enabled=YES;
        
    }
    if (textField.tag==20)
    {
        
        check=1;
        [email resignFirstResponder];
        [FirstName resignFirstResponder];
        [MiddleName resignFirstResponder];
        [LastName resignFirstResponder];
        [DOB resignFirstResponder];
        [FatherName resignFirstResponder];
        [ContactNo resignFirstResponder];
        [comments resignFirstResponder];
        [UId1 resignFirstResponder];
        [alias resignFirstResponder];
        [Address resignFirstResponder];
        [CountryId resignFirstResponder];
        [CityId resignFirstResponder];
        
        
        tool.hidden=YES;
        //     Pickerview_Salutations.hidden=YES;
        //     DatePicker.hidden=YES;
        //     pickerview_sex.hidden=YES;
        //     Pickerview_BloodGroup.hidden=YES;
        //     Pickerview_Religion.hidden=YES;
        //     Pickerview_Nationality.hidden=YES;
        //     pickerview_area.hidden=YES;
        //     pickerview_city.hidden=YES;
        //     pickerview_state.hidden=YES;
        //     pickerview_country.hidden=YES;
        
        if([country integerValue]==0)
        {
            alert=[[UIAlertView alloc]initWithTitle:@"Check" message:@"First Select area or Country" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
            [alert show];
            tool.hidden=YES;
        }
        else
        {
            NSLog(@"country id is %@",self.WebService->country_id=country);
            
            [self.WebService CallServiceStateList:@"http://192.168.1.202:81/CommonMasterModule/UIService.asmx/GetStateList" Object:NULL Handler:NULL];
            State_Detail=[[NSMutableArray alloc]init];
            View_StateID=[[NSMutableArray alloc]init];
            
            State_Detail=(NSMutableArray*)self.WebService->ptr1;
            if(State_Detail.count==0)
            {
                alert=[[UIAlertView alloc]initWithTitle:@"Check" message:@"No State Found" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
                [alert show];
                state=@"0";
                
            }
            else
            {
                NSLog(@"dict is %@",State_Detail);
                View_StateID=[State_Detail valueForKey:@"Name"];
                
                NSLog(@"dict is %@",View_StateID);
                
                if ([[UIScreen mainScreen] bounds].size.height >480)
                {
                    objYHCPickerView = [[PickerView alloc] initWithFrame:CGRectMake(0, 100, 320, 480)withNSArray:View_StateID ];
                }
                else
                {
                    objYHCPickerView = [[PickerView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)withNSArray:View_StateID ];
                    
                    
                }
                NSLog(@"view %f",self.view.frame.origin.y);
                CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y);
                [scrollview setContentOffset:scrollPoint animated:YES];
                objYHCPickerView.delegate = self;
                [self.view addSubview:objYHCPickerView];
                [objYHCPickerView showPicker];
            }
        }
    }
    if (textField.tag==19)
    {
        tool.hidden=NO;
        [email resignFirstResponder];
        [FirstName resignFirstResponder];
        [MiddleName resignFirstResponder];
        [LastName resignFirstResponder];
        [DOB resignFirstResponder];
        [FatherName resignFirstResponder];
        [ContactNo resignFirstResponder];
        [comments resignFirstResponder];
        [UId1 resignFirstResponder];
        [alias resignFirstResponder];
        [Address resignFirstResponder];
        
        if([state integerValue]==0)
        {
            
            alert=[[UIAlertView alloc]initWithTitle:@"Check" message:@"First Select area or Country" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
            [alert show];
            tool.hidden=YES;
            
        }
        else
        {
            NSLog(@"state id is %@",self.WebService->state_id=state);
            
            
            [self.WebService CallServiceCityList:@"http://192.168.1.202:81/CommonMasterModule/UIService.asmx/GetCityList" Object:NULL Handler:NULL];
            
            State_Detail=[[NSMutableArray alloc]init];
            View_StateID=[[NSMutableArray alloc]init];
            
            State_Detail=(NSMutableArray*)self.WebService->ptr1;
            NSLog(@"dict is %@",State_Detail);
            View_StateID=[State_Detail valueForKey:@"Name"];
            
            NSLog(@"dict is %@",View_StateID);
            
            // NSLog(@"dict is %@",View_City);
            
            pickerview_city=[[UIPickerView alloc]initWithFrame:CGRectMake(0,332,320,216)];
            pickerview_city.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
            pickerview_city.showsSelectionIndicator=YES;
            pickerview_city.delegate=self;
            pickerview_city.dataSource=self;
            // pickerview_city.hidden=YES;
            [self.view addSubview:pickerview_city];
            // pickerview_city.hidden=YES;
            //pickerview.hidden=NO;
            
                   }
    }
    if (textField.tag==18)
    {
        check=2;
        [email resignFirstResponder];
        [FirstName resignFirstResponder];
        [MiddleName resignFirstResponder];
        [LastName resignFirstResponder];
        [DOB resignFirstResponder];
        [FatherName resignFirstResponder];
        [ContactNo resignFirstResponder];
        [comments resignFirstResponder];
        [UId1 resignFirstResponder];
        [alias resignFirstResponder];
        [Address resignFirstResponder];
        [CityId resignFirstResponder];
        
        tool.hidden=YES;
               
        if(([city integerValue]==0)||([state integerValue]==0)||([country integerValue]==0))
        {
            //  alert = [[UIAlertView alloc] initWithTitle:@"Check" message:@"Select Country First" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
            
            //   [alert show];
            
            [self.WebService CallServiceGetAllArea:@"http://192.168.1.202:81/CommonMasterModule/UIService.asmx/GetAllArea" Object:NULL Handler:NULL];
            
            Area_Detail=(NSMutableArray*)self.WebService->ptr1;
            NSLog(@"dict is %@",Area_Detail);
            View_Area=[Area_Detail valueForKey:@"AreaName"];
            
            NSLog(@"dict is %@",View_Area);
            // NSDictionary *dictValue=[[NSDictionary alloc]initWithObjectsAndKeys:[NSString stringWithFormat:@"%@",[Area_Detail valueForKey:@"AreaName"]],@"AreaName",[NSString stringWithFormat:@"%@",[Area_Detail valueForKey:@"CityId"]],@"CityId", nil];
            
            
            if ([[UIScreen mainScreen] bounds].size.height >480)
            {
                objYHCPickerView = [[PickerView alloc] initWithFrame:CGRectMake(0, 100, 320, 480)withNSArray:View_Area];
            }
            else
            {
                objYHCPickerView = [[PickerView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)withNSArray:View_Area];
                
                
            }
            NSLog(@"view %f",self.view.frame.origin.y);
            CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y);
            [scrollview setContentOffset:scrollPoint animated:YES];
            objYHCPickerView.delegate = self;
            [self.view addSubview:objYHCPickerView];
            [objYHCPickerView showPicker];
            
            
        }
        else
        {
            //tool.hidden=NO;
            NSLog(@"state id is %@",self.WebService->city_id=city);
            
            [self.WebService CallServiceAreaList:@"http://192.168.1.202:81/CommonMasterModule/UIService.asmx/GetAreaList" Object:NULL Handler:NULL];
            
            Area_Detail=(NSMutableArray*)self.WebService->ptr1;
            NSLog(@"dict is %@",Area_Detail);
            View_Area=[Area_Detail valueForKey:@"AreaName"];
            
            NSLog(@"dict is %@",View_Area);
            if(Area_Detail.count==0)
            {
                alert=[[UIAlertView alloc]initWithTitle:@"Check" message:@"Add Area" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
                [alert show];
                
            }
            
            else
            {
                if ([[UIScreen mainScreen] bounds].size.height >480)
                {
                    objYHCPickerView = [[PickerView alloc] initWithFrame:CGRectMake(0, 100, 320, 480)withNSArray:View_Area ];
                }
                else
                {
                    objYHCPickerView = [[PickerView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)withNSArray:View_Area ];
                    
                    
                }
                NSLog(@"view %f",self.view.frame.origin.y);
                CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y);
                [scrollview setContentOffset:scrollPoint animated:YES];
                
                objYHCPickerView.delegate = self;
                [self.view addSubview:objYHCPickerView];
                [objYHCPickerView showPicker];
                
            }
        }
    }
    
    return YES;
    
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
   // [scrollview setContentOffset:CGPointZero animated:YES];
    
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)aTextField
{
    if (aTextField.tag==6)
    {
        if (Dob_button.selected)
        {
            [aTextField becomeFirstResponder];
            
            DOB.inputView=DatePicker;
            
        }
        else if (age_button.selected)
        {
            // [aTextField becomeFirstResponder];
            DOB.inputView=nil;
            
        }
    }
    
    if(aTextField==email)
    {
        emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
        //Valid email address
        if ([emailTest evaluateWithObject:email.text] == YES)
        {
            if(![EmailService isEqualToString:[NSString stringWithFormat:@"%@",email.text]])
            {
            self.WebService->Email1=[NSString stringWithFormat:@"%@",email.text];
            self.WebService->patientcode=PatientCode;
            [self.WebService CallServiceCheckEmailIdIsExist:@"http://192.168.1.202:81//PatientModule/PatientService.asmx/CheckEmailIdIsExist" Object:NULL Handler:NULL];
            NSLog(@"email is %@",self.WebService.ptr);
            EmailCheck=self.WebService.ptr;
            
            if([self.WebService.ptr isEqualToString:@"true"])
            {
                alert = [[UIAlertView alloc] initWithTitle:@"Check" message:@"Email id already Exist" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
                
                [alert show];
                //return NO;
            }
            }
            
        }
        else if (email.text==NULL || [email.text isEqual:@""])
        {
            return YES;
            
        }
        else
        {
            
            alert = [[UIAlertView alloc] initWithTitle:@"Check" message:@"Invalid Email Id" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
            
            [alert show];
            return [emailTest evaluateWithObject:email.text];
        }
        
        // return [emailTest evaluateWithObject:email.text]; // Change validateEmail to validatePhone for phone validation.
    }
    else if (aTextField==FirstName )
    {
        emailRegEx=@"^[A-Z  a-z]*+$";
        emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
        if ([emailTest evaluateWithObject:FirstName.text] == YES)
        {
            
        }
        else if (FirstName.text==NULL || [FirstName.text isEqual:@""])
        {
            
            alert = [[UIAlertView alloc] initWithTitle:@"Check" message:@"This field is Required" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
            
            [alert show];
            // return NO;
            
        }
        else
        {
            alert = [[UIAlertView alloc] initWithTitle:@"Check" message:@"Numbmer and Special Characters not allowed in first name" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
            
            [alert show];
            //return NO;
            
        }
        return YES;
        //  return [emailTest evaluateWithObject:FirstName.text];
        
    }
    if (aTextField==LastName)
    {
        emailRegEx=@"^[A-Z  a-z]+$";
        emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
        if ([emailTest evaluateWithObject:LastName.text] == YES)
        {
            
        }
        else if (LastName.text==NULL || [LastName.text isEqual:@""])
        {
            
            alert = [[UIAlertView alloc] initWithTitle:@"Check" message:@"This field is Required" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
            
            [alert show];
            // return NO;
            
        }
        else
        {
            alert = [[UIAlertView alloc] initWithTitle:@"Check" message:@"Numbmer and Special Characters not allowed in last name" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
            
            [alert show];
            // return NO;
            
        }
        return YES;
        //  return [emailTest evaluateWithObject:LastName.text];
        
    }
    if (aTextField==alias)
    {
        if((alias.text == NULL)||[alias.text isEqual:@""])
        {
            return YES;
        }
        else if ([Aliascheck isEqualToString:[NSString stringWithFormat:@"%@",alias.text]])
        {
            
            
        }
        else
        {
            self.WebService->Alias1=alias.text;
            
            [self.WebService CallServiceCheckAlias:@"http://192.168.1.202:81/CommonMasterModule/CommonMasterService.asmx/checkAliasExist" Object:NULL Handler:NULL];
            
            // NSString *codeR = [NSString stringWithFormat:@"%@",self.WebService.ptr];
            NSLog(@"alias is %@",self.WebService.ptr);
            
            [self.WebService.ptr integerValue];
            AliasCheck=self.WebService.ptr;
            
            if([self.WebService.ptr intValue]==1)
            {
                
                alert = [[UIAlertView alloc] initWithTitle:@"Check" message:@"Alias Already Exist" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
                
                [alert show];
                
                //return NO;
            }
            
        }
        
    }
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if ([[UIScreen mainScreen] bounds].size.height >480)
    {
        
        if (textField.tag>=5)
        {
            NSLog(@"view %f",self.view.frame.origin.y);
            CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y);
            [scrollview setContentOffset:scrollPoint animated:YES];
        }
    }
    else
    {
        if (textField.tag>=2)
        {
            NSLog(@"view %f",self.view.frame.origin.y);
            CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y);
            [scrollview setContentOffset:scrollPoint animated:YES];
        }
        
        
    }
    [textField setInputAccessoryView:tool];
    
    if(textField.tag==1)
    {
        
         [textField setInputAccessoryView:nil];
    }
    
    if (textField.tag==6)
    {
        
        if (Dob_button.selected)
        {
            age_button.selected=NO;
            
            if(textField == DOB)
            {
                // [textField resignFirstResponder];
                textField.inputView=DatePicker;
            }
        }
        else if (age_button.selected)
        {
            DOB.selected=NO;
            DOB.inputView=nil;
            
            textField.keyboardType=UIKeyboardTypeNumberPad;
            [textField reloadInputViews];
            
            //     [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(keyboardDidShowOrHide:)name: UIKeyboardDidShowNotification object:nil];
            
            //[textField becomeFirstResponder];
            
        }
        
    }
    if(textField == Salutation)
    {
        //[textField setInputAccessoryView:tool];
        
        //textField.keyboardType=UIKeyboardTypeNamePhonePad;
        textField.inputView=Pickerview_Salutations;
        // [textField resignFirstResponder];
        //  Pickerview_Salutations.hidden=NO;
    }
    if(textField == Sex)
    {
        textField.inputView=pickerview_sex;
        
        //[textField setInputAccessoryView:tool];
        // [textField resignFirstResponder];
    }
    if(textField == CountryId)
    {
        textField.inputView=pickerview_country;
        
        // [textField resignFirstResponder];
    }
    if(textField == StateId)
    {
        // StateId.inputView=pickerview_state;
        
        [textField resignFirstResponder];
    }
    if(textField == CityId)
    {
        CityId.inputView=pickerview_city;
        if([state integerValue]==0)
        {
            [textField resignFirstResponder];
        }
        
        
    }
    if(textField == AreaId)
    {
        // AreaId.inputView=pickerview_area;
        
        [textField resignFirstResponder];
        
    }
    if(textField == Religion)
    {
        textField.inputView=Pickerview_Religion;
        
        // [textField resignFirstResponder];
    }
    if(textField ==BloodGroup)
    {
        textField.inputView=Pickerview_BloodGroup;
        
        //[textField resignFirstResponder];
    }
    
    if(textField == NationId)
    {
        [textField resignFirstResponder];
        // NationId.inputView=Pickerview_Nationality;
        
    }
    
    if(textField==DORegistration)
    {
        [DORegistration setUserInteractionEnabled:NO];
    }
    if(textField==PinCode)
    {
        [PinCode setUserInteractionEnabled:NO];
    }
    
}
-(void)selectedRow:(int)row withString:(NSString *)text
{
    NSLog(@"%d",row);
    if(check==1)
    {
        if(row==-1)
        {
            StateId.text=text;
        }
        else
        {
            StateId.text = text;
            state=[NSString stringWithFormat:@"%@",[[State_Detail objectAtIndex:row] valueForKey:@"StateId"]];
            NSLog(@"stae is %@",state);
            if(![[NSString stringWithFormat:@"%@",[[AreaList objectAtIndex:0] valueForKey:@"StateId"]]isEqualToString:state])
            {
                AreaId.text=@"--select Area--";
                CityId.text=@"--select City--";
                PinCode.text=@"";
                city=@"0";
            }
        }
    }
    else if(check==2)
    {
        if(row==-1)
        {
            AreaId.text=text;
        }
        else
        {
            AreaId.text=text;
            
            NSLog(@"area is %@",self.WebService->Area_Id=[NSString stringWithFormat:@"%@",[[Area_Detail objectAtIndex:row] valueForKey:@"AreaId"]]);
            
            [self.WebService CallServicePatientDetailsAreaID:@"http://192.168.1.202:81/CommonMasterModule/UIService.asmx/GetOthersFromArea" Object:NULL Handler:NULL];
            
            NSLog(@"res %@",self.WebService->ptr1);
            AreaList=(NSMutableArray*)self.WebService->ptr1;
            
            CityId.text=[NSString stringWithFormat:@"%@",[[AreaList objectAtIndex:0] valueForKey:@"Name"]];
            StateId.text=[NSString stringWithFormat:@"%@",[[AreaList objectAtIndex:0] valueForKey:@"Name1"]];
            CountryId.text=[NSString stringWithFormat:@"%@",[[AreaList objectAtIndex:0] valueForKey:@"Name2"]];
            PinCode.text=[NSString stringWithFormat:@"%@",[[AreaList objectAtIndex:0] valueForKey:@"PinCode"]];
            area=[NSString stringWithFormat:@"%@",[[AreaList objectAtIndex:0] valueForKey:@"AreaId"]];
            city=[NSString stringWithFormat:@"%@",[[AreaList objectAtIndex:0] valueForKey:@"CityId"]];
            state=[NSString stringWithFormat:@"%@",[[AreaList objectAtIndex:0] valueForKey:@"StateId"]];
            country=[NSString stringWithFormat:@"%@",[[AreaList objectAtIndex:0] valueForKey:@"CountryId"]];
            Pincode=PinCode.text;
            NSLog(@"city %@",city);
        }
    }
    else if (check==3)
    {
        if(row==-1)
        {
            NationId.text=text;
        }
        else
        {
            NationId.text=text;
            Nationality=[NSString stringWithFormat:@"%@",[[Nationality_View objectAtIndex:row]valueForKey:@"NationId"]];
            NSLog(@"nation id %@",Nationality);
        }
        
    }
}
-(IBAction)next:(id)sender
{
    
    UITextField *text=(UITextField*)[scrollview viewWithTag:text_tag];
    
    
    NSLog(@"tag %d",text_tag);
    
    NSInteger nextTag = text_tag + 1;
    NSLog(@" tag %d",nextTag);
    
    // Try to find next responder
    
    
    UIResponder* nextResponder = [text.superview viewWithTag:nextTag];
    
    NSLog(@"res %@",nextResponder);
    if (nextResponder)
    {
        
        if ([nextResponder isKindOfClass:[UITextField class]]) {
            // nextTag=nextTag+1;
            // NSLog(@"nn %d",  nextTag+1);
            [nextResponder becomeFirstResponder];
            
        }
        // Found next responder, so set it.
        
    }
    else
    {
        // Not found, so remove keyboard.
        [text resignFirstResponder];
    }
    
}

-(IBAction)previous:(id)sender
{
    
    UITextField *text=(UITextField*)[scrollview viewWithTag:text_tag];
    
    
    NSLog(@"tag %d",text_tag);
    
    NSInteger nextTag = text_tag - 1;
    NSLog(@" tag %d",nextTag);
    
    // Try to find next responder
    
    UIResponder* nextResponder = [text.superview viewWithTag:nextTag];
    
    NSLog(@"res %@",nextResponder);
    if (nextResponder)
    {
        
        if ([nextResponder isKindOfClass:[UITextField class]]) {
            // nextTag=nextTag+1;
            // NSLog(@"nn %d",  nextTag+1);
            [nextResponder becomeFirstResponder];
        }
        else
        {
            //NSInteger nextTag = View_Tag + 1;
            NSLog(@" tag %d",nextTag);
            
            // UIResponder* nextResponder = [textView.superview viewWithTag:nextTag];
            //if ([nextResponder isKindOfClass:[UITextView class]])
            
            //  nextTag=nextTag+1;
            // NSLog(@"nn %d",  nextTag+1);
            [nextResponder becomeFirstResponder];
            
        }
        // Found next responder, so set it.
        
    }
    else
    {
        // Not found, so remove keyboard.
        [text resignFirstResponder];
    }
    
}
-(IBAction)donebutton:(id)sender
{
    NSLog(@"picker %d",text_tag);
    
    // UIPickerView *PickerValue=(UIPickerView*)[self.view viewWithTag:PickerTag];
    //  NSLog(@"tag %@",PickerValue);
    
    if(text_tag==2)
    {
        [Salutation setText:[NSString stringWithFormat:@"%@",[Title_view objectAtIndex:[Pickerview_Salutations selectedRowInComponent:0]]]];
        //Pickerview_Salutations.hidden=YES;
        // done4.hidden=YES;
        NSLog(@"sate %@",Salutation.text);
        if([Salutation.text isEqual:@"Mr."]||[Salutation.text isEqual:@"Master"])
        {
            Sex.font = [UIFont boldSystemFontOfSize:12.0];
            Sex.text=[NSString stringWithFormat:@"%@",[GenderList objectAtIndex:0]];
        }
        else if([Salutation.text isEqual:@"Mrs."]||[Salutation.text isEqual:@"Ms."]||[Salutation.text isEqual:@"Miss"])
        {
            Sex.font = [UIFont boldSystemFontOfSize:12.0];
            Sex.text=[NSString stringWithFormat:@"%@",[GenderList objectAtIndex:1]];
            
        }
        else
        {
            Sex.font = [UIFont boldSystemFontOfSize:12.0];
            
            Sex.text=[NSString stringWithFormat:@"--Select Sex--"];
            
        }
        [Salutation resignFirstResponder ];
        
        // Pickerview_Salutations.hidden=YES;
        tool.hidden=YES;
        
        
    }
    else if (text_tag==6)
    {
        
        NSLog(@"here");
        if(Dob_button.selected)
        {
        DOB.text = [NSString stringWithFormat:@"%@",DatePicker.date];
         dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss +HHmm"];
         myDate = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@",DOB.text]];
        NSLog(@"%@", [dateFormatter stringFromDate:myDate]);
        
         anotherDateFormatter = [[NSDateFormatter alloc] init];
        [anotherDateFormatter setDateFormat:@"dd/MM/yyyy"];
        NSLog(@"%@", [anotherDateFormatter stringFromDate:myDate]);
        
        DOB.text =[anotherDateFormatter stringFromDate:myDate];
        Dob=[NSString stringWithFormat:@"%@",DOB.text];
        }
        [DOB resignFirstResponder ];
        //DatePicker.hidden=YES;
        tool.hidden=YES;
    }
    else if(text_tag==7)
    {
        [Sex setText:[NSString stringWithFormat:@"%@",[GenderList objectAtIndex:[pickerview_sex selectedRowInComponent:0]]]];
        //   pickerview_sex.hidden=YES;
        [Sex resignFirstResponder ];
        
        tool.hidden=YES;
    }
    else if (text_tag==21)
    {
        [CountryId setText:[NSString stringWithFormat:@"%@",[Dict123 objectAtIndex:[pickerview_country selectedRowInComponent:0]]]];
        //pickerview_country.hidden=YES;
        
        StateId.text=@"";
        CityId.text=@"";
        AreaId.text=@"";
        PinCode.text=@"";
        [CountryId resignFirstResponder];
        
        //pickerview_country.hidden=YES;
        tool.hidden=YES;
        
    }
    else if (text_tag==19)
    {
        [CityId setText:[NSString stringWithFormat:@"%@",[View_StateID objectAtIndex:[pickerview_city selectedRowInComponent:0]]]];
        //pickerview_city.hidden=YES;
        // done4.hidden=YES;
        NSLog(@"sate %@",CityId);
        //   pickerview_city.hidden=YES;
        [CityId resignFirstResponder ];
        
        tool.hidden=YES;
        NSLog(@"city %@",city);
        NSLog(@"city is %@",[[AreaList objectAtIndex:0]valueForKey:@"CityId"]);
        
        if(![[NSString stringWithFormat:@"%@",[[AreaList objectAtIndex:0]valueForKey:@"CityId"]] isEqualToString:city])
        {
            AreaId.text=@"--Select Area--";
            PinCode.text=@"";
            
        }
        
    }
    else if (text_tag==12)
    {
        [Religion setText:[NSString stringWithFormat:@"%@",[Religion_view objectAtIndex:[Pickerview_Religion selectedRowInComponent:0]]]];
        //Pickerview_Religion.hidden=YES;
        // done4.hidden=YES;
        NSLog(@"sate %@",Religion);
        //  Pickerview_Religion.hidden=YES;
        [Religion resignFirstResponder];
        
        tool.hidden=YES;
        
        
    }
    else if (text_tag==8)
    {
        [BloodGroup setText:[NSString stringWithFormat:@"%@",[Bloodgroup_view objectAtIndex:[Pickerview_BloodGroup selectedRowInComponent:0]]]];
        //Pickerview_BloodGroup.hidden=YES;
        // done4.hidden=YES;
        NSLog(@"sate %@",BloodGroup);
        //   Pickerview_BloodGroup.hidden=YES;
        [BloodGroup resignFirstResponder];
        tool.hidden=YES;
        
    }
    else
    {
        tool.hidden=YES;
        [email resignFirstResponder];
        [FirstName resignFirstResponder];
        [LastName resignFirstResponder];
        [MiddleName resignFirstResponder];
        [DOB resignFirstResponder];
        [FatherName resignFirstResponder];
        [ContactNo resignFirstResponder];
        [comments resignFirstResponder];
        [UId1 resignFirstResponder];
        [alias resignFirstResponder];
        [Address resignFirstResponder];
        
    }
 }
-(void)CallService:(NSString*)Str
{
    PatientDetails =[NSString stringWithFormat:@"%@",[[Patient_detail objectAtIndex:0] valueForKey:Str]];
    NSLog(@"%@", PatientDetails);
}

-(void)CallService1:(NSString*)Str
{
    PatientDetails =[NSString stringWithFormat:@"%@",[[Area_ID objectAtIndex:0] valueForKey:Str]];
    NSLog(@"%@", PatientDetails);
}

-(void)buttonPress
{
    Dob_button.selected=YES;
    age_button.selected=NO;
    //  DatePicker.hidden=NO;
    
    //  tool.hidden=NO;
    // [DOB setInputAccessoryView:tool];
    // [doneButton removeFromSuperview];
    // doneButton.hidden=YES;
    [DOB resignFirstResponder];
    
    //   DOB.inputView=DatePicker;
    
    
    if([DOB.text isEqualToString:@""]||(DOB.text==NULL))
    {
        
        
    }
    else
    {
        NSDate *currentDate = [NSDate date];
        NSCalendar* calendar = [NSCalendar currentCalendar];
        NSDateComponents *components1 = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:currentDate]; // Get necessary date components
        
        [components1 month]; //gives you month
        [components1 day] ;//gives you day
        [components1 year] ;//gives you year
        
        DOB.text=[NSString stringWithFormat:@"%d/%d/%d",[components1 day],[components1 month],([components1 year]-[DOB.text integerValue])];
      
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"dd/MM/yyyy"];
        myDate = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@",DOB.text]];
        NSLog(@"%@", [dateFormatter stringFromDate:myDate]);
        
        anotherDateFormatter = [[NSDateFormatter alloc] init];
        [anotherDateFormatter setDateFormat:@"dd/MM/yyyy"];
        NSLog(@"%@", [anotherDateFormatter stringFromDate:myDate]);
        DOB.text=[anotherDateFormatter stringFromDate:myDate];
        Dob=[NSString stringWithFormat:@"%@",DOB.text];
        NSLog(@"dob %@",Dob);
    }
    //    done=[[UIButton alloc]initWithFrame:CGRectMake(250, 220,50,20)];
    //    done.backgroundColor=[UIColor redColor];
    //    [done setTitle:@"Done" forState:UIControlStateNormal];
    //    [done addTarget:self action:@selector(UpdatePicker:)forControlEvents:UIControlEventTouchUpInside];
    //    done.hidden=YES;
    
    // [scrollview addSubview:done];
    
    
    // [DOB addTarget:self action:@selector(btnpress1:)forControlEvents:UIControlEventEditingDidBegin];
    
}
-(void)buttonPress1
{
    
    tool.hidden=YES;
    //DatePicker.hidden=YES;
    [DOB resignFirstResponder];
    //  [DOB becomeFirstResponder];
    // [DatePicker removeFromSuperview];
    
    Dob_button.selected=NO;
    age_button.selected=YES;
    if([DOB.text isEqualToString:@""]||(DOB.text==NULL))
    {
        
        
    }
    else
    {
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"dd/MM/yyyy"];
        NSDate *startDate = [dateFormat dateFromString:[NSString stringWithFormat:@"%@",DOB.text]];
        NSLog(@"star %@",startDate);
        
        NSLog(@"Date: %@", [dateFormat stringFromDate:startDate]);
        // DOB.tag=1;
        NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc] init];
        [dateFormat1 setDateFormat:@"dd/MM/yyyy HH:mm"];
        NSDate *endDate = [dateFormat1 dateFromString:Enddate];
        NSLog(@"Date: %@", [dateFormat1 stringFromDate:endDate]);
        NSLog(@"endDate %@",endDate);
        
        NSCalendar *gregorian = [[NSCalendar alloc]
                                 initWithCalendarIdentifier:NSGregorianCalendar];
        
        NSUInteger unitFlags = NSMonthCalendarUnit | NSDayCalendarUnit|NSYearCalendarUnit;
        
        NSDateComponents *components = [gregorian components:unitFlags
                                                    fromDate:startDate
                                                      toDate:endDate options:0];
        NSInteger months = [components month];
        NSInteger days = [components day];
        NSInteger year=[components year];
        
        NSLog(@"There are %d days in between the two dates. and month %d and year %d", days,months,year);
        
        DOB.text=[NSString stringWithFormat:@"%d",year];
    }
    
}

//-(IBAction)UpdatePicker:(id)sender
//{
//    UIDatePicker *picker = (UIDatePicker*)self.DOB.inputView;
//    
//    self.DOB.text = [NSString stringWithFormat:@"%@",picker.date];
//    dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss +HHmm"];
//    myDate = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@",DOB.text]];
//    NSLog(@"%@", [dateFormatter stringFromDate:myDate]);
//    
//    anotherDateFormatter = [[NSDateFormatter alloc] init];
//    [anotherDateFormatter setDateFormat:@"dd/MM/yyyy"];
//    NSLog(@"%@", [anotherDateFormatter stringFromDate:myDate]);
//    
//    DOB.text =[anotherDateFormatter stringFromDate:myDate];
//    
//    DatePicker.hidden=YES;
//    done.hidden=YES;
//    
//}
//
//-(IBAction)btnpress1:(id)sender
//{
//    singleTap = [[UITapGestureRecognizer alloc]init];
//    
//    switch(((UITextField*)sender).tag)
//    {
//            
//        case 1:
//        {
//            if ([[UIScreen mainScreen] bounds].size.height >480)
//            {
//                DatePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0,350,320,50)];
//            }
//            else
//            {
//                DatePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0,270,320,50)];
//            }
//            DatePicker.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
//            DatePicker.datePickerMode = UIDatePickerModeDate;
//            
//            DatePicker.date = [NSDate date];
//            [self.DOB setInputView:DatePicker];
//            done.hidden=NO;
//            [DOB resignFirstResponder];
//            DatePicker.userInteractionEnabled=YES;
//            [self.view addSubview:DatePicker];
//            
//            break;
//            
//            
//        }
//        case 2:
//        {
//            
//            [Sex resignFirstResponder];
//            
//            pickerview_country.hidden=YES;
//            pickerview_state.hidden=YES;
//            pickerview_sex.hidden=NO;
//            pickerview_city.hidden=YES;
//            pickerview_area.hidden=YES;
//            Pickerview_Nationality.hidden=YES;
//            
//            [singleTap addTarget:self action:@selector(tapInPickerView:)];
//            [singleTap setNumberOfTapsRequired:1];
//            [singleTap setNumberOfTouchesRequired:1];
//            [pickerview_sex addGestureRecognizer:singleTap];
//            
//            break;
//            
//            
//        }
//        case 3:
//        {
//            [self.WebService CallServiceCountryList:@"http://192.168.1.202:81/CommonMasterModule/UIService.asmx/GetCountryList" Object:NULL Handler:NULL];
//            
//            [CountryId resignFirstResponder];
//            NSLog(@"dictonary is %@",self.WebService->ptr1);
//            Dict=[[NSMutableArray alloc]init];
//            Dict123=[[NSMutableArray alloc]init];
//            
//            Dict=(NSMutableArray*)self.WebService->ptr1;
//            NSLog(@"dict is %@",Dict);
//            Dict123=[Dict valueForKey:@"Name"];
//            
//            NSLog(@"dict is %@",Dict123);
//            if ([[UIScreen mainScreen] bounds].size.height >480)
//            {
//                pickerview_country=[[UIPickerView alloc]initWithFrame:CGRectMake(0,350,320,50)];
//            }
//            else
//            {
//                pickerview_country=[[UIPickerView alloc]initWithFrame:CGRectMake(0,270,320,50)];
//                
//            }
//            pickerview_country.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
//            pickerview_country.dataSource=self;
//            pickerview_country.delegate=self;
//            pickerview_country.showsSelectionIndicator=YES;
//            
//            [self.view addSubview:pickerview_country];
//            
//            pickerview_sex.hidden=YES;
//            pickerview_state.hidden=YES;
//            pickerview_city.hidden=YES;
//            pickerview_area.hidden=YES;
//            Pickerview_Nationality.hidden=YES;
//            [singleTap addTarget:self action:@selector(tapInPickerView:)];
//            
//            [singleTap setNumberOfTapsRequired:1];
//            [singleTap setNumberOfTouchesRequired:1];
//            [pickerview_country addGestureRecognizer:singleTap];
//            
//            break;
//            
//        }
//        case 4:
//        {
//            
//            NSLog(@"country id is %@",self.WebService->country_id=country);
//            
//            [self.WebService CallServiceStateList:@"http://192.168.1.202:81/CommonMasterModule/UIService.asmx/GetStateList" Object:NULL Handler:NULL];
//            
//            [StateId resignFirstResponder];
//            State_Detail=[[NSMutableArray alloc]init];
//            View_StateID=[[NSMutableArray alloc]init];
//            
//            State_Detail=(NSMutableArray*)self.WebService->ptr1;
//            NSLog(@"dict is %@",State_Detail);
//            View_StateID=[State_Detail valueForKey:@"Name"];
//            
//            NSLog(@"dict is %@",View_StateID);
//            if ([[UIScreen mainScreen] bounds].size.height >480)
//            {
//                pickerview_state=[[UIPickerView alloc]initWithFrame:CGRectMake(0,350,320,50)];
//            }
//            else
//            {
//                pickerview_state=[[UIPickerView alloc]initWithFrame:CGRectMake(0,270,320,50)];
//                
//            }
//            pickerview_state.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
//            pickerview_state.dataSource=self;
//            pickerview_state.delegate=self;
//            pickerview_state.showsSelectionIndicator=YES;
//            [self.view addSubview:pickerview_state];
//            
//            //pickerview.hidden=NO;
//            pickerview_sex.hidden=YES;
//            pickerview_country.hidden=YES;
//            pickerview_city.hidden=YES;
//            pickerview_area.hidden=YES;
//            Pickerview_Nationality.hidden=YES;
//            // UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapInPickerView:)];
//            [singleTap addTarget:self action:@selector(tapInPickerView:)];
//            
//            [singleTap setNumberOfTapsRequired:1];
//            [singleTap setNumberOfTouchesRequired:1];
//            [pickerview_state addGestureRecognizer:singleTap];
//            
//            // done3.hidden=NO;
//            break;
//            
//            
//        }
//        case 5:
//        {
//            
//            NSLog(@"state id is %@",self.WebService->state_id=state);
//            
//            [self.WebService CallServiceCityList:@"http://192.168.1.202:81/CommonMasterModule/UIService.asmx/GetCityList" Object:NULL Handler:NULL];
//            
//            [CityId resignFirstResponder];
//            
//            State_Detail=[[NSMutableArray alloc]init];
//            View_StateID=[[NSMutableArray alloc]init];
//            
//            State_Detail=(NSMutableArray*)self.WebService->ptr1;
//            NSLog(@"dict is %@",State_Detail);
//            View_StateID=[State_Detail valueForKey:@"Name"];
//            
//            NSLog(@"dict is %@",View_StateID);
//            
//            // NSLog(@"dict is %@",View_City);
//            if ([[UIScreen mainScreen] bounds].size.height >480)
//            {
//                pickerview_city=[[UIPickerView alloc]initWithFrame:CGRectMake(0,350,320,50)];
//            }
//            else
//            {
//                pickerview_city=[[UIPickerView alloc]initWithFrame:CGRectMake(0,270,320,50)];
//                
//            }
//            pickerview_city.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
//            
//            pickerview_city.dataSource=self;
//            pickerview_city.delegate=self;
//            pickerview_city.showsSelectionIndicator=YES;
//            [self.view addSubview:pickerview_city];
//            
//            //pickerview.hidden=NO;
//            pickerview_sex.hidden=YES;
//            pickerview_country.hidden=YES;
//            pickerview_state.hidden=YES;
//            pickerview_area.hidden=YES;
//            Pickerview_Nationality.hidden=YES;
//            // UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapInPickerView:)];
//            [singleTap addTarget:self action:@selector(tapInPickerView:)];
//            
//            [singleTap setNumberOfTapsRequired:1];
//            [singleTap setNumberOfTouchesRequired:1];
//            [pickerview_city addGestureRecognizer:singleTap];
//            
//            // done4.hidden=NO;
//            break;
//            
//            
//        }
//        case 6:
//        {
//            
//            NSLog(@"state id is %@",self.WebService->city_id=city);
//            
//            [self.WebService CallServiceAreaList:@"http://192.168.1.202:81/CommonMasterModule/UIService.asmx/GetAreaList" Object:NULL Handler:NULL];
//            
//            
//            [AreaId resignFirstResponder];
//            Area_Detail=[[NSMutableArray alloc]init];
//            View_Area=[[NSMutableArray alloc]init];
//            
//            Area_Detail=(NSMutableArray*)self.WebService->ptr1;
//            NSLog(@"dict is %@",Area_Detail);
//            View_Area=[Area_Detail valueForKey:@"AreaName"];
//            
//            NSLog(@"dict is %@",View_Area);
//            if ([[UIScreen mainScreen] bounds].size.height >480)
//            {
//                pickerview_area=[[UIPickerView alloc]initWithFrame:CGRectMake(0,350,320,50)];
//            }
//            else
//            {
//                pickerview_area=[[UIPickerView alloc]initWithFrame:CGRectMake(0,270,320,50)];
//                
//            }
//            pickerview_area.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
//            
//            pickerview_area.dataSource=self;
//            pickerview_area.delegate=self;
//            pickerview_area.showsSelectionIndicator=YES;
//            [self.view addSubview:pickerview_area];
//            
//            //pickerview.hidden=NO;
//            pickerview_city.hidden=YES;
//            pickerview_sex.hidden=YES;
//            pickerview_country.hidden=YES;
//            pickerview_state.hidden=YES;
//            Pickerview_Nationality.hidden=YES;
//            // UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapInPickerView:)];
//            [singleTap addTarget:self action:@selector(tapInPickerView:)];
//            
//            [singleTap setNumberOfTapsRequired:1];
//            [singleTap setNumberOfTouchesRequired:1];
//            [pickerview_area addGestureRecognizer:singleTap];
//            
//            // done4.hidden=NO;
//            break;
//            
//            
//        }
//            
//        case 7:
//        {
//            
//            [NationId resignFirstResponder];
//            Pickerview_Nationality.hidden=NO;
//            
//            pickerview_city.hidden=YES;
//            pickerview_sex.hidden=YES;
//            pickerview_country.hidden=YES;
//            pickerview_state.hidden=YES;
//            pickerview_area.hidden=YES;
//            [singleTap addTarget:self action:@selector(tapInPickerView:)];
//            
//            [singleTap setNumberOfTapsRequired:1];
//            [singleTap setNumberOfTouchesRequired:1];
//            [Pickerview_Nationality addGestureRecognizer:singleTap];
//            
//            // done4.hidden=NO;
//            break;
//            
//        }
//        case 8:
//        {
//            [Salutation resignFirstResponder];
//            
//            Pickerview_Salutations.hidden=NO;
//            
//            // Pickerview_Nationality.hidden=NO;
//            
//            pickerview_city.hidden=YES;
//            pickerview_sex.hidden=YES;
//            pickerview_country.hidden=YES;
//            pickerview_state.hidden=YES;
//            pickerview_area.hidden=YES;
//            // UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapInPickerView:)];
//            [singleTap addTarget:self action:@selector(tapInPickerView:)];
//            
//            [singleTap setNumberOfTapsRequired:1];
//            [singleTap setNumberOfTouchesRequired:1];
//            [Pickerview_Salutations addGestureRecognizer:singleTap];
//            
//            // done4.hidden=NO;
//            break;
//            
//        }
//        case 9:
//        {
//            [BloodGroup resignFirstResponder];
//            
//            Pickerview_BloodGroup.hidden=NO;
//            
//            // Pickerview_Nationality.hidden=NO;
//            
//            pickerview_city.hidden=YES;
//            pickerview_sex.hidden=YES;
//            pickerview_country.hidden=YES;
//            pickerview_state.hidden=YES;
//            pickerview_area.hidden=YES;
//            // UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapInPickerView:)];
//            [singleTap addTarget:self action:@selector(tapInPickerView:)];
//            
//            [singleTap setNumberOfTapsRequired:1];
//            [singleTap setNumberOfTouchesRequired:1];
//            [Pickerview_BloodGroup addGestureRecognizer:singleTap];
//            
//            // done4.hidden=NO;
//            break;
//            
//        }
//            
//        case 10:
//        {
//            [Religion resignFirstResponder];
//            
//            Pickerview_Religion.hidden=NO;
//            
//            // Pickerview_Nationality.hidden=NO;
//            
//            pickerview_city.hidden=YES;
//            pickerview_sex.hidden=YES;
//            pickerview_country.hidden=YES;
//            pickerview_state.hidden=YES;
//            pickerview_area.hidden=YES;
//            // UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapInPickerView:)];
//            [singleTap addTarget:self action:@selector(tapInPickerView:)];
//            
//            [singleTap setNumberOfTapsRequired:1];
//            [singleTap setNumberOfTouchesRequired:1];
//            [Pickerview_Religion addGestureRecognizer:singleTap];
//            
//            // done4.hidden=NO;
//            break;
//            
//        }
//            
//            
//        default:
//            
//            break;
//            
//    }
//    
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	// There is only one section.
	return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (searching)
    {
        NSLog(@"copy %d",copyListOfItems.count);
        
        return copyListOfItems.count;
    }
    else
    {
        return [SearchPatientCode count];
    }
    
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

//        if (searching)
//        {
//            cell.textLabel.numberOfLines=2;
//            cell.textLabel.text =[NSString stringWithFormat:@"%@  %@",[SearchPatientCode objectAtIndex:indexPath.row],[copyListOfItems objectAtIndex:indexPath.row]];
//            cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12.0f];
//
//            
//        }
//        else
        {
            cell.textLabel.numberOfLines=2;
            cell.textLabel.text =[NSString stringWithFormat:@"%@  %@",[SearchPatientCode objectAtIndex:indexPath.row],[SearchPatientName objectAtIndex:indexPath.row]];
            cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12.0f];
        }
        

        
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(tableView==table_SearchPatient)
    {
        // [patientname resignFirstResponder];s
        
        [patientname setText:[NSString stringWithFormat:@"%@",[SearchPatientName objectAtIndex:indexPath.row]]];
        NSLog(@"patient name %@",patientname.text);
        
        
        PatientCode=[NSString stringWithFormat:@"%@",[SearchPatientCode objectAtIndex:indexPath.row]];
        NSLog(@"patient code %@",PatientCode);
        
        //    Patientid=[NSString stringWithFormat:@"%@",[[SearchPatientDetail objectAtIndex:indexPath.row]valueForKey:@"PatientId"]];
        
        NSLog(@"patient code %@",Patientid);
        // [table_SearchPatient reloadData];
        table_SearchPatient.hidden=YES;
        [self donebtn:nil];
        
    }
    
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    if(pickerView== pickerview_country || pickerView==pickerview_sex || pickerView==pickerview_state || pickerView==pickerview_city || pickerView== pickerview_area || pickerView==Pickerview_Nationality||pickerView==Pickerview_Salutations||pickerView==Pickerview_Religion||pickerView==Pickerview_BloodGroup)
        return 1;
    else
        return 0;
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
	NSString *returnStr = @"";
	
	// note: custom picker doesn't care about titles, it uses custom views
	if(pickerView==pickerview_country)
    {
        
        if(component==0)
        {
            country=[NSString stringWithFormat:@"%@",[[Dict objectAtIndex:0]valueForKey:@"CountryId"]];
            //NSLog(@" country %@",country);
            returnStr=[Dict123 objectAtIndex:row];
            
        }
    }
    else if (pickerView==Pickerview_BloodGroup)
    {
        
        if(component==0)
        {
            
            returnStr=[Bloodgroup_view objectAtIndex:row];
            
        }
    }
    else if (pickerView==Pickerview_Religion)
    {
        
        if(component==0)
        {
            
            returnStr=[Religion_view objectAtIndex:row];
            
        }
    }
    
    
    else if (pickerView==pickerview_sex)
    {
        
        if(component==0)
        {
            
            returnStr=[GenderList objectAtIndex:row];
            
        }
    }
    else if (pickerView==Pickerview_Salutations)
    {
        
        if(component==0)
        {
            Title=[NSString stringWithFormat:@"%@",[[Salutations objectAtIndex:0]valueForKey:@"name"]];
            returnStr=[Title_view objectAtIndex:row];
            
        }
    }
    
    else if (pickerView==pickerview_state)
    {
        if(component==0)
        {
            state=[NSString stringWithFormat:@"%@",[[State_Detail objectAtIndex:0]valueForKey:@"StateId"]];
            returnStr=[View_StateID objectAtIndex:row];
        }
    }
    else if (pickerView==pickerview_city)
    {
        if(component==0)
        {
            city=[NSString stringWithFormat:@"%@",[[State_Detail objectAtIndex:0]valueForKey:@"CityId"]];
            
            returnStr=[View_StateID objectAtIndex:row];
        }
    }
    else if (pickerView==pickerview_area)
    {
        if(component==0)
        {
            Pincode=[NSString stringWithFormat:@"%@",[[Area_Detail objectAtIndex:0]valueForKey:@"PinCode"]];
            area=[NSString stringWithFormat:@"%@",[[Area_Detail objectAtIndex:0]valueForKey:@"AreaId"]];
            returnStr=[View_Area objectAtIndex:row];
        }
    }
    
    else if (pickerView==Pickerview_Nationality)
    {
        if(component==0)
        {
            
            returnStr=[Nationality_ID objectAtIndex:row];
        }
    }
    
    
    //returnStr =[[menu objectAtIndex:indexpath.row]valueForKey:@"Table"];
    // NSLog(@"val is %@",returnStr);
	
    return returnStr;
    
}

//- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
//{
//	CGFloat componentWidth = 0.0;
//
//	if (component == 0)
//		componentWidth = 300.0;	// first column size is wider to hold names
//	else if(component==1)
//		componentWidth = 50.0;	// second column is narrower to show numbers
//    else
//        componentWidth=100.0;
//
//    return componentWidth;
//}
//
//- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
//{
//	return 40.0;
//}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(pickerView==pickerview_country)
    {
        
        // NSLog(@"arr is= %d",self.WebService->arr.count);
        return [Dict123 count];
        //[pickerview selectRow:0 inComponent:0 animated:YES];
        
    }
    else if (pickerView==pickerview_sex)
    {
        return [GenderList count];
        
    }
    
    else if (pickerView==Pickerview_Salutations)
    {
        return [Title_view count];
        
    }
    else if (pickerView==Pickerview_BloodGroup)
    {
        return [Bloodgroup_view count];
        
    }
    else if (pickerView==Pickerview_Religion)
    {
        return [Religion_view count];
        
    }
    
    
    else if (pickerView==pickerview_state)
    {
        return [View_StateID count];
        
    }
    else if (pickerView==pickerview_city)
    {
        return [View_StateID count];
        
    }
    else if (pickerView==pickerview_area)
    {
        return [View_Area count];
        
    }
    else if (pickerView==Pickerview_Nationality)
    {
        return [Nationality_ID count];
        
    }
    else
    {
        return 0;
    }
    
}


//- (void)tapInPickerView:(UIGestureRecognizer *)sender
//{
//    
//    if (pickerview_sex.hidden==FALSE)
//    {
//        [Sex setText:[NSString stringWithFormat:@"%@",[GenderList objectAtIndex:[pickerview_sex selectedRowInComponent:0]]]];
//        pickerview_sex.hidden=YES;
//        // done1.hidden=YES;
//    }
//    else if(Pickerview_Salutations.hidden==FALSE)
//    {
//        [Salutation setText:[NSString stringWithFormat:@"%@",[Title_view objectAtIndex:[Pickerview_Salutations selectedRowInComponent:0]]]];
//        Pickerview_Salutations.hidden=YES;
//        // done4.hidden=YES;
//        NSLog(@"sate %@",Salutation);
//        // PinCode.text=Pincode;
//        
//    }
//    else if(Pickerview_BloodGroup.hidden==FALSE)
//    {
//        [BloodGroup setText:[NSString stringWithFormat:@"%@",[Bloodgroup_view objectAtIndex:[Pickerview_BloodGroup selectedRowInComponent:0]]]];
//        Pickerview_BloodGroup.hidden=YES;
//        // done4.hidden=YES;
//        NSLog(@"sate %@",BloodGroup);
//        // PinCode.text=Pincode;
//        
//    }
//    
//    else if(Pickerview_Religion.hidden==FALSE)
//    {
//        [Religion setText:[NSString stringWithFormat:@"%@",[Religion_view objectAtIndex:[Pickerview_Religion selectedRowInComponent:0]]]];
//        Pickerview_Religion.hidden=YES;
//        // done4.hidden=YES;
//        NSLog(@"sate %@",Religion);
//        // PinCode.text=Pincode;
//        
//    }
//    
//    else if(Pickerview_Nationality.hidden==FALSE)
//    {
//        [NationId setText:[NSString stringWithFormat:@"%@",[Nationality_ID objectAtIndex:[Pickerview_Nationality selectedRowInComponent:0]]]];
//        Pickerview_Nationality.hidden=YES;
//        // done4.hidden=YES;
//        NSLog(@"sate %@",NationId);
//        // PinCode.text=Pincode;
//        
//    }
//    
//    else if(pickerview_country.hidden==FALSE)
//    {
//        //[DOB setText:[NSString stringWithFormat:@"%@/%@/%@",[Date objectAtIndex:[pickerview selectedRowInComponent:0]],[Month objectAtIndex:[pickerview selectedRowInComponent:1]],[Year objectAtIndex:[pickerview selectedRowInComponent:2]]]];
//        
//        [CountryId setText:[NSString stringWithFormat:@"%@",[Dict123 objectAtIndex:[pickerview_country selectedRowInComponent:0]]]];
//        pickerview_country.hidden=YES;
//        
//        StateId.text=@"";
//        CityId.text=@"";
//        AreaId.text=@"";
//        PinCode.text=@"";
//        
//        // done2.hidden=YES;
//    }
//    else if(pickerview_state.hidden==FALSE)
//    {
//        [StateId setText:[NSString stringWithFormat:@"%@",[View_StateID objectAtIndex:[pickerview_state selectedRowInComponent:0]]]];
//        pickerview_state.hidden=YES;
//        //done3.hidden=YES;
//        NSLog(@"sate %@",StateId);
//        
//    }
//    else if(pickerview_city.hidden==FALSE)
//    {
//        [CityId setText:[NSString stringWithFormat:@"%@",[View_StateID objectAtIndex:[pickerview_city selectedRowInComponent:0]]]];
//        pickerview_city.hidden=YES;
//        // done4.hidden=YES;
//        NSLog(@"sate %@",CityId);
//        
//    }
//    else if(pickerview_area.hidden==FALSE)
//    {
//        [AreaId setText:[NSString stringWithFormat:@"%@",[View_Area objectAtIndex:[pickerview_area selectedRowInComponent:0]]]];
//        pickerview_area.hidden=YES;
//        // done4.hidden=YES;
//        NSLog(@"sate %@",AreaId);
//        PinCode.text=Pincode;
//        
//    }
//    
//}
//
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (pickerView==pickerview_sex)
    {
        [GenderList objectAtIndex:[pickerview_sex selectedRowInComponent:0]];
        [Sex setText:[NSString stringWithFormat:@"%@",[GenderList objectAtIndex:[pickerview_sex selectedRowInComponent:0]]]];
        // pickerview_sex.hidden=YES;
    }
    
    else if(pickerView==Pickerview_Salutations)
    {
        [Title_view objectAtIndex:[Pickerview_Salutations selectedRowInComponent:0]];
        NSLog(@"Selected Color: %@. Index of selected color: %i", [Title_view objectAtIndex:row], row);
        Title=[NSString stringWithFormat:@"%@",[[Salutations objectAtIndex:row]valueForKey:@"name"]];
        // tag=[NSString stringWithFormat:@"%d",++row];
        //  tag =++row;
        
        NSLog(@"row %@",Title);
        [Salutation setText:[NSString stringWithFormat:@"%@",Title]];
        //Pickerview_Salutations.hidden=YES;
        // done4.hidden=YES;
        NSLog(@"sate %@",Salutation.text);
        if([Salutation.text isEqual:@"Mr."]||[Salutation.text isEqual:@"Master"])
        {
            Sex.font = [UIFont boldSystemFontOfSize:12.0];
            Sex.text=[NSString stringWithFormat:@"%@",[GenderList objectAtIndex:0]];
        }
        else if([Salutation.text isEqual:@"Mrs."]||[Salutation.text isEqual:@"Ms."]||[Salutation.text isEqual:@"Miss"])
        {
            Sex.font = [UIFont boldSystemFontOfSize:12.0];
            Sex.text=[NSString stringWithFormat:@"%@",[GenderList objectAtIndex:1]];
            
        }
        else
        {
            Sex.font = [UIFont boldSystemFontOfSize:12.0];
            
            Sex.text=[NSString stringWithFormat:@"--Select Sex--"];
            
        }
        
        
    }
    else if(pickerView==Pickerview_BloodGroup)
    {
        [Bloodgroup_view objectAtIndex:[Pickerview_BloodGroup selectedRowInComponent:0]];
        NSLog(@"Selected Color: %@. Index of selected color: %i", [Bloodgroup_view objectAtIndex:row], row);
        Bloodgroup=[NSString stringWithFormat:@"%@",[[bloodgroup objectAtIndex:row]valueForKey:@"name"]];
        // tag=[NSString stringWithFormat:@"%d",++row];
        //  tag =++row;
        NSLog(@"row %@",Bloodgroup);
        [BloodGroup setText:Bloodgroup];
        
    }
    else if(pickerView==Pickerview_Religion)
    {
        [Religion_view objectAtIndex:[Pickerview_Religion selectedRowInComponent:0]];
        NSLog(@"Selected Color: %@. Index of selected color: %i", [Title_view objectAtIndex:row], row);
        religion=[NSString stringWithFormat:@"%@",[[ReligionDetail objectAtIndex:row]valueForKey:@"name"]];
        // tag=[NSString stringWithFormat:@"%d",++row];
        //  tag =++row;
        NSLog(@"row %@",religion);
        [Religion setText:religion];
        
    }
    
    else if(pickerView==pickerview_country)
    {
        [Dict123 objectAtIndex:[pickerview_country selectedRowInComponent:0]];
        NSLog(@"Selected Color: %@. Index of selected color: %i", [Dict123 objectAtIndex:row], row);
        country=[NSString stringWithFormat:@"%@",[[Dict objectAtIndex:row]valueForKey:@"CountryId"]];
        // tag=[NSString stringWithFormat:@"%d",++row];
        //  tag =++row;
        NSLog(@"row %@",country);
        [CountryId setText:[[Dict objectAtIndex:row]valueForKey:@"Name"]];
        StateId.text=@"--Select State--";
        CityId.text=@"--Select City--";
        AreaId.text=@"--Select Area--";
        PinCode.text=@"";
        
    }
    
    else if (pickerView==pickerview_city)
    {
        
        [View_StateID objectAtIndex:[pickerview_city selectedRowInComponent:0]];
        NSLog(@"Selected Color: %@. Index of selected color: %i", [State_Detail objectAtIndex:row], row);
        
        city=[NSString stringWithFormat:@"%@",[[State_Detail objectAtIndex:row]valueForKey:@"CityId"]];
        NSLog(@"row %@",city);
        [CityId setText:[[State_Detail objectAtIndex:row]valueForKey:@"Name"]];
        if(![[NSString stringWithFormat:@"%@",[[AreaList objectAtIndex:0]valueForKey:@"CityId"]] isEqualToString:city])
        {
            AreaId.text=@"--Select Area--";
            PinCode.text=@"";
            
        }
               
    }
    else if (pickerView==pickerview_area)
    {
        [View_Area objectAtIndex:[pickerview_city selectedRowInComponent:0]];
        NSLog(@"Selected Color: %@. Index of selected color: %i", [Area_Detail objectAtIndex:row], row);
        
        area=[NSString stringWithFormat:@"%@",[[Area_Detail objectAtIndex:row]valueForKey:@"AreaId"]];
        NSLog(@"row %@",area);
        Pincode=[NSString stringWithFormat:@"%@",[[Area_Detail objectAtIndex:row]valueForKey:@"PinCode"]];
        NSLog(@"row %@",Pincode);
        [AreaId setText:area];
        
    }
}

-(IBAction)UpdateButton:(id)sender
{
    
    NSLog(@"che%c",age_button.selected);
    
    
    if(age_button.selected)
    {
        NSDate *currentDate = [NSDate date];
        NSCalendar* calendar = [NSCalendar currentCalendar];
        NSDateComponents *components1 = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:currentDate]; // Get necessary date components
        
        [components1 month]; //gives you month
        [components1 day] ;//gives you day
        [components1 year] ;//gives you year
        
        
        Dob=[NSString stringWithFormat:@"%d/%d/%d",[components1 day],[components1 month],([components1 year]-[DOB.text integerValue])];
        
    }

    
    
    if((email.text == NULL)||[email.text isEqual:@""])
    {
        Email=@"";
    }
    else
    {
        Email=email.text;
    }
    if(Title == NULL)
    {
        Title=Salutation.text;
    }
    else
    {
        NSLog(@"title is %@",Title);
    }
    
    
    NSLog(@"title is %@",Title);
    //Title=Salutation.text;
    Firstname=FirstName.text;
    if((MiddleName.text ==NULL)||[MiddleName.text isEqual:@""])
    {
        Middlename=@"";
    }
    else
    {
        Middlename=MiddleName.text;
    }
    Lastname=LastName.text;
    
    
    sex=Sex.text;
    NSLog(@"secx is %@",sex);
    
    if([BloodGroup.text isEqual:@""]||(BloodGroup.text==NULL))
    {
        Bloodgroup=@"";
    }
    else if(((BloodGroup.text!=NULL)||(![BloodGroup.text isEqual:@""]))&&(Bloodgroup!=NULL))
    {
        NSLog(@"blood is %@",Bloodgroup);
    }
    else
    {
        Bloodgroup=BloodGroup.text;
        
    }
    
    NSLog(@"blood is %@",Bloodgroup);
    if((FatherName.text==NULL)||[FatherName.text isEqual:@""])
    {
        if(HusbandName==(NSString*)[NSNull null])
        {
            Fathername=@"";
            
        }
        else if(Fathername==(NSString*)[NSNull null])
        {
            HusbandName=@"";
        }
        else
        {
            Fathername=@"";
            HusbandName=(NSString*)[NSNull null];
            
        }
    }
    else
    {
        if(HusbandName==(NSString*)[NSNull null])
        {
            Fathername=FatherName.text;
        }
        else if(Fathername==(NSString*)[NSNull null])
        {
            HusbandName=FatherName.text;
        }
        else
        {
            
        }
        
    }
    NSLog(@"F/H %@",Fathername);
    NSLog(@"F/H %@",HusbandName);
    
    
    if((ContactNo.text==NULL)||[ContactNo.text isEqual:@""])
    {
        Contactno=@"";
    }
    else
    {
        Contactno=ContactNo.text;
        
    }
    if((Address.text==NULL)||[Address.text isEqual:@""])
        
    {
        address=@"";
    }
    else
    {
        address=Address.text;
        
    }
    
    NSLog(@"%d",[Cityid integerValue]);
    //  religion=Religion.text;
    
    if(Religion.text == NULL)
    {
        religion=@"";
    }
    else if((Religion.text!=NULL)&&(religion!=NULL))
    {
        NSLog(@"religion is %@",religion);
    }
    else
    {
        religion=Religion.text;
        NSLog(@"religion is %@",religion);
        
    }
    
    if((UId1.text == NULL)||[UId1.text isEqual:@""])
    {
        ud1=@"";
    }
    else
    {
        ud1=UId1.text;
        
    }
    if((alias.text == NULL)||[alias.text isEqual:@""])
    {
        Alias=@"";
    }
    else
    {
        Alias=alias.text;
        
    }
    
    NSLog(@"the date is %@",DOB.text);
    //  Doregistration=(NSDate*)DORegistration.text;
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    myDate = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@",Dob]];
    NSLog(@"%@", [dateFormatter stringFromDate:myDate]);
    
    anotherDateFormatter = [[NSDateFormatter alloc] init];
    [anotherDateFormatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    NSLog(@"%@", [anotherDateFormatter stringFromDate:myDate]);
    
    //DOB.text =[anotherDateFormatter stringFromDate:myDate];
    
    
    dob=(NSDate*)[anotherDateFormatter stringFromDate:myDate];
    
    NSLog(@"the dob is %@",dob);
    
    NSLog(@"the date is %@",DORegistration.text);
    //  Doregistration=(NSDate*)DORegistration.text;
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy HH:mm"];
    myDate = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@",DORegistration.text]];
    NSLog(@"%@", [dateFormatter stringFromDate:myDate]);
    
    anotherDateFormatter = [[NSDateFormatter alloc] init];
    [anotherDateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
    NSLog(@"%@", [anotherDateFormatter stringFromDate:myDate]);
    //  DORegistration.text=[anotherDateFormatter stringFromDate:myDate];
    theDate=[anotherDateFormatter stringFromDate:myDate];
    
  
    NSLog(@"date %@",theDate);
    
    
    NSLog(@"country is %@",CountryId.text);
    NSLog(@"country is %d",[country intValue]);
    NSLog(@"country is %d",[state intValue]);
    NSLog(@"country is %d",[city intValue]);
    if([country intValue]==0)
    {
        Countryid=[NSString stringWithFormat:@"%@",[[Area_ID objectAtIndex:0]valueForKey:@"CountryId"] ];
        NSLog(@"country is %@",Countryid);
        
        
    }
    else
    {
        
        Countryid=country;
        
        
    }
    if([state intValue]==0)
    {
        Stateid=[NSString stringWithFormat:@"%@",[[Area_ID objectAtIndex:0]valueForKey:@"StateId"] ];
        NSLog(@"country is %@",Stateid);
        
        
    }
    else
    {
        
        Stateid=state;
        
        
    }
    if([city intValue]==0)
    {
        Cityid=[NSString stringWithFormat:@"%@",[[Area_ID objectAtIndex:0]valueForKey:@"CityId"] ];
        NSLog(@"country is %@",Cityid);
        
        
    }
    else
    {
        
        Cityid=city;
        
    }
    
    NSLog(@"country is %@",Countryid);
    
    
    // Stateid=state;
    //  Cityid=city;
    NSLog(@"%@",Stateid);
    NSLog(@"%@",Cityid);
    // religion=Religion.text;
    //  ud1=UId1.text;
    
    
    NSLog(@"area is %@",area);
    NSLog(@"pincode is %@",Pincode);
    if(area ==NULL)
    {
        Areaid=[NSString stringWithFormat:@"%@",[[Area_ID objectAtIndex:0]valueForKey:@"AreaId"]];
        Pincode=[NSString stringWithFormat:@"%@",[[Area_ID objectAtIndex:0]valueForKey:@"PinCode"]];
        
        NSLog(@"country is %@",Areaid);
    }
    else
    {
        Areaid=area;
    }
    NSLog(@"pincoe %@",Pincode);
    NSLog(@"area is %@",Areaid);
    if((comments.text == NULL)||[comments.text isEqual:@""])
    {
        comment=@"";
    }
    else
    {
        comment=comments.text;
        
    }
    
    NSLog(@"nation %@",NationId.text);
    
    if([NationId.text isEqual:@""]||(NationId.text == NULL))
    {
        Nationid=@"";
        
    }
    else if((Nationality==NULL)&&((![NationId.text isEqual:@""])||(NationId.text != NULL)))
    {
        
        NSLog(@"%@",self.WebService->Nation_ID=NationId.text);
        
        [self.WebService CallServiceNationID:@"http://192.168.1.202:81/CommonMasterModule/UIService.asmx/GetNationId" Object:NULL Handler:NULL];
        Nationid=[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:0]valueForKey:@"NationId"]];
        
    }
    else
    {
        Nationid=Nationality;
    }
    NSLog(@"nationid is %@",Nationid);
    
    
    NSLog(@"nationid %@",Nationid);
    //optional
    EmergencyContactNo=@"";
    EmergencyContactName=@"";
    EmergencyContactRelation=@"";
    EmergencyContactAddress=@"";
    EmergencyContactCountryId=(NSString*)[NSNull null];
    EmergencyContactStateId=(NSString*)[NSNull null];
    EmergencyContactCityId=(NSString*)[NSNull null];
    Status=@"1";
    UId2=(NSString*)[NSNull null];
    PatientAlert=(NSString*)[NSNull null];
    //Alias=alias.text;
    
    [Countryid integerValue];
    [Stateid integerValue];
    [Cityid integerValue];
    NSLog(@"nation id is %@",Nationid);
    if([Nationid isEqual:@""])
    {
        Nationid=(NSString*)[NSNull null];
    }
    else
    {
        [Nationid integerValue];
    }
    
    [Status integerValue];
    NSLog(@"val %d",[AliasCheck integerValue]);
      NSLog(@"val %@",EmailCheck);
    
    
   NSDictionary *PatientRegistration=[[NSDictionary alloc]initWithObjectsAndKeys:PatientCode,@"PatientCode", Email,@"Email",Title,@"Salutation",Firstname,@"FirstName",Middlename,@"MiddleName",Lastname,@"LastName",dob,@"DOB",sex,@"Sex",Bloodgroup,@"BloodGroup",Fathername,@"FatherName",HusbandName,@"HusbandName",theDate,@"DORegistration",Contactno,@"ContactNo",address,@"Address",Countryid,@"CountryId",Stateid,@"StateId",Cityid,@"CityId",EmergencyContactNo,@"EmergencyContactNo",EmergencyContactName,@"EmergencyContactName",comment,@"Comments",religion,@"Religion",EmergencyContactRelation,@"EmergencyContactRelation",EmergencyContactAddress,@"EmergencyContactAddress",EmergencyContactCountryId,@"EmergencyContactCountryId",EmergencyContactStateId,@"EmergencyContactStateId",EmergencyContactCityId,@"EmergencyContactCityId",Status,@"Status",ud1,@"UId1",UId2,@"UId2",PatientAlert,@"PatientAlerts",Areaid,@"AreaId",Pincode,@"PinCode",Nationid,@"NationId",Alias,@"Alias", nil];
    
    NSLog(@"name %@",self.WebService->Get_PatientRegistraion=(NSMutableDictionary*)PatientRegistration);
    
   if([Title isEqualToString:NULL]||(Firstname==NULL)||(Lastname ==NULL)||(dob==NULL )||[sex isEqualToString:NULL]||(theDate==NULL)||([Countryid integerValue]==0)||([Stateid integerValue]==0)|| ([Cityid integerValue]==0)||(Areaid ==NULL)||([Pincode integerValue]==0)||([AliasCheck integerValue]==1)||([EmailCheck isEqualToString:@"true"]))
   {
        alert = [[UIAlertView alloc] initWithTitle:@"Check" message:@"Mandatory(*)Fields Required" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        
        
        [alert show];
    }
    
    else 
    {
        
        [self.WebService CallServicePatientUpdate:@"http://192.168.1.202:81/PatientModule/PatientService.asmx/UpdatePatient" Object:NULL Handler:NULL];
        
        NSLog(@"webservice is %@",self.WebService.ptr);
        
        if([self.WebService.ptr isEqualToString:@"Updated Successfully"])
        {
        alert = [[UIAlertView alloc] initWithTitle:@"Patient Update Successfully" message:PatientCode delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        
        
        [alert show];
        }
        
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
