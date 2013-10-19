//
//  PatientRegistraionViewController.m
//  HISWebService
//
//  Created by Rahul Sharma on 06/06/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import "PatientRegistraionViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface PatientRegistraionViewController ()

@end

@implementation PatientRegistraionViewController
@synthesize WebService=_WebService;

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
    
    // self.view.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    // self.view.autoresizesSubviews = YES;
    //tool.hidden=YES;
    NSLog(@"navi %f",self.navigationController.navigationBar.frame.size.height);
    
    self.WebService=[[WebService alloc]init];
    GenderList=[NSMutableArray arrayWithObjects:@"Male",@"Female", nil];
    
    scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0,64,320,568)];
    
    [scrollview setContentSize:CGSizeMake(320, 1050)];
  //  scrollview.backgroundColor=[UIColor greenColor];
    scrollview.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    scrollview.autoresizesSubviews = YES;
    
    scrollview.scrollEnabled = YES;
    
    scrollview.directionalLockEnabled = YES;
    
    scrollview.showsVerticalScrollIndicator = YES;
    
    scrollview.showsHorizontalScrollIndicator = YES;
    
    scrollview.autoresizesSubviews = YES;
   // scrollview.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:scrollview];
    
       copyListOfItems=[[NSMutableArray alloc]init];
  //  pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0.0, 200, 320.0, 0.0)];
    
    //[picketView addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    
//    ToolSearch = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 156, 320, 44)];
//    
//    ToolSearch.barStyle = UIBarStyleBlackOpaque;
//    [ToolSearch sizeToFit];
//    [self.view addSubview:ToolSearch];
    

//    txtSearch = [[UISearchBar alloc] initWithFrame:CGRectMake(15, 7, 240, 31)];
//    txtSearch.tag = 1;
//    txtSearch.barStyle = UIBarStyleBlackTranslucent;
//    txtSearch.backgroundColor = [UIColor clearColor];
//    txtSearch.delegate = self;
//    txtSearch.userInteractionEnabled = TRUE;
//    
//    for (UIView *subview in txtSearch.subviews)
//    {
//        if ([subview isKindOfClass:NSClassFromString(@"UISearchBarBackground")])
//        {
//            [subview removeFromSuperview];
//            break;
//        }
//    }
//    
//    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
//    
//    UIBarButtonItem *btnDone = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(btnDoneClick)];
//    [ToolSearch addSubview:txtSearch];
//    NSArray *arrBarButtoniTems = [[NSArray alloc] initWithObjects:flexible,btnDone, nil];
//    [ToolSearch setItems:arrBarButtoniTems];
//    [self.view addSubview:ToolSearch];
  
    
     // UISearchBar *Search=[UISearchBar alloc]initWithFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    
   

    //    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 20)];
    //
    //    // [btn1 setImage:[UIImage imageNamed:@"Charge1.png"] forState:UIControlStateNormal];
    //
    //    [btn setTitle:@"Charge Details" forState:UIControlStateNormal];
    //    btn.titleLabel.font=[UIFont boldSystemFontOfSize:10.0];
    //    //   btn1.tag=1;
    //
    //    [btn addTarget:self action:@selector(ChargeDetails) forControlEvents:UIControlEventTouchUpInside];
    //
    //    UIBarButtonItem *button1 = [[UIBarButtonItem alloc]initWithCustomView:btn];
    //    button1.style=UIBarButtonItemStyleBordered;
    //
    //    UIButton *btn2=[[UIButton alloc]initWithFrame:CGRectMake(50,0,40,40)];
    //    btn2.titleLabel.font=[UIFont boldSystemFontOfSize:10.0];
    //    // [btn2 setImage:[UIImage imageNamed:@"save.png"] forState:UIControlStateNormal];
    //    [btn2 setTitle:@"View Contact Details"  forState:UIControlStateNormal];
    //
    //    [btn2 addTarget:self action:@selector(ViewContactDetails) forControlEvents:UIControlEventTouchUpInside];
    //
    //    UIBarButtonItem *button2 = [[UIBarButtonItem alloc]initWithCustomView:btn2];
    //      button2.style=UIBarButtonItemStyleBordered;
    //
    //
    //
    //
    //  UIBarButtonItem *barbutton=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(donebtn:)];
    
    //  barbutton.image=[UIImage imageNamed:@"<#string#>"]
    //    UIBarButtonItem *barbutton=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(donebtn:)];
    //   // barbutton.tintColor=[UIColor blueColor];
    //
    //    UIBarButtonItem *fixedSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    //        [fixedSpace setWidth:250];
    //
    ////    NSMutableArray* button =[[NSMutableArray alloc]initWithCapacity:2];
    ////    [button addObject:fixedSpace];
    ////    [button addObject:barbutton];
    //
    //    tool=[[UIToolbar alloc]initWithFrame:CGRectMake(0,288,320,44)];
    //
    //    tool.autoresizingMask =UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    //
    //    //  tool.autoresizesSubviews = YES;
    //
    //  //  [tool setBarStyle:UIBarStyleBlackOpaque];
    //   // tool.backgroundColor=[UIColor blackColor];
    //    tool.userInteractionEnabled=YES;
    //   // [tool setItems:button animated:NO];
    
    //    tool.items=[NSArray arrayWithObjects:button1,button2,fixedSpace,barbutton,nil];
    //
    [self.view addSubview:tool];
    tool.hidden=YES;
    
    [self.view addSubview:ToolSearch];
    ToolSearch.hidden=YES;

    
    UILabel *DORegistration_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,-50,120,30)];
    [DORegistration_lbl setText:@"DORegistration *"];
    DORegistration_lbl.font=[UIFont systemFontOfSize:12.0];
    DORegistration=[[UITextField alloc]initWithFrame:CGRectMake(150,-50,150,30)];
    DORegistration.tag=1;
    DORegistration.userInteractionEnabled=NO;
    DORegistration.font = [UIFont boldSystemFontOfSize:15.0];
    // DORegistration.borderStyle = UITextBorderStyleLine;
    // DORegistration.placeholder = @"<enter text>";
    // DORegistration.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    DORegistration.delegate =self;
    
    [scrollview addSubview:DORegistration];
    [scrollview addSubview:DORegistration_lbl];
    date = [NSDate date];
    
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MM/yyyy HH:mm"];
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    DORegistration.text = [formatter stringFromDate:date];
    [formatter setDateFormat:@"yyyy/MM/dd HH:mm"];
    theDate = [formatter stringFromDate:date];
    NSLog(@"date %@",theDate);
    
    UILabel *Salutation_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,-10,100,30)];
    [Salutation_lbl setText:@"Salutation *"];
    Salutation_lbl.font=[UIFont systemFontOfSize:12.0];
    
    self.WebService->StringName=@"Salutations";
    [self.WebService CallServiceStringName:@"http://192.168.1.202:81/CommonMasterModule/UIService.asmx/GetCommonMasterXMLList1" Object:NULL Handler:NULL];
    
    Salutations=(NSMutableArray*)self.WebService->ptr1;
    Title_view=(NSMutableArray*)[Salutations valueForKey:@"name"];
    NSLog(@"sal is %@",Salutations);
    NSLog(@"sal is %@",Title_view);
    

    Salutation=[[UITextField alloc]initWithFrame:CGRectMake(150,-10,150,30)];
    Salutation.tag=2;
  //  Salutation.inputView=Pickerview_Salutations;
    Salutation.font = [UIFont boldSystemFontOfSize:12.0];
    Salutation.borderStyle = UITextBorderStyleLine;
    // Salutation.placeholder = @"<enter text>";
    // Salutation.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    Salutation.delegate =self;
    Salutation.text=[[Salutations objectAtIndex:0]valueForKey:@"name"];
    NSLog(@"sal %@",Salutation.text);
    
    [scrollview addSubview:Salutation];
    [scrollview addSubview:Salutation_lbl];
    //[Salutation addTarget:self action:@selector(btnpress1:)forControlEvents:UIControlEventEditingDidBegin];
    
    UILabel *FirstName_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,30,100,30)];
    [FirstName_lbl setText:@"FirstName *"];
    FirstName_lbl.font=[UIFont systemFontOfSize:12.0];
    FirstName=[[UITextField alloc]initWithFrame:CGRectMake(150,30,150,30)];
    FirstName.tag=3;
    FirstName.font = [UIFont boldSystemFontOfSize:12.0];
    FirstName.borderStyle = UITextBorderStyleLine;
    FirstName.keyboardType=UIKeyboardTypeDefault;
    
    // FirstName.placeholder = @"<enter text>";
    // [FirstName setKeyboardType: UIKeyboardTypeNamePhonePad];
    FirstName.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    FirstName.delegate =self;
    [scrollview addSubview:FirstName];
    [scrollview addSubview:FirstName_lbl];
    UILabel *MiddleName_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,70,100,30)];
    [MiddleName_lbl setText:@"MiddleName"];
    MiddleName_lbl.font=[UIFont systemFontOfSize:12.0];
    MiddleName=[[UITextField alloc]initWithFrame:CGRectMake(150,70,150,30)];
    MiddleName.tag=4;
    MiddleName.font = [UIFont boldSystemFontOfSize:12.0];
    MiddleName.borderStyle = UITextBorderStyleLine;
    // MiddleName.placeholder = @"<enter text>";
    MiddleName.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    MiddleName.delegate =self;
    [scrollview addSubview:MiddleName];
    [scrollview addSubview:MiddleName_lbl];
    UILabel *LastName_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,110,100,30)];
    [LastName_lbl setText:@"LastName *"];
    LastName_lbl.font=[UIFont systemFontOfSize:12.0];
    
    LastName=[[UITextField alloc]initWithFrame:CGRectMake(150,110,150,30)];
    LastName.tag=5;
    LastName.font = [UIFont boldSystemFontOfSize:12.0];
    [LastName setKeyboardType: UIKeyboardTypeDefault];
    LastName.borderStyle = UITextBorderStyleLine;
    //  LastName.placeholder = @"<enter text>";
    LastName.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    LastName.delegate =self;
    [scrollview addSubview:LastName];
    [scrollview addSubview:LastName_lbl];
    
    UILabel *DOB_lbl=[[UILabel alloc]initWithFrame:CGRectMake(25,150,100,30)];
    [DOB_lbl setText:@"Date of Birth"];
    DOB_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:DOB_lbl];
    
    Dob_button=[[UIButton alloc]initWithFrame:CGRectMake(05,150,20,30)];
    // Dob_button.tag=6;
    [Dob_button setImage:[UIImage imageNamed:@"images-20"] forState:UIControlStateNormal];
    [Dob_button setImage:[UIImage imageNamed:@"images-19"] forState:UIControlStateSelected];
    [Dob_button addTarget:self action:@selector(buttonPress)forControlEvents:UIControlEventTouchUpInside];
    
    [scrollview addSubview:Dob_button];
    
    UILabel *Age=[[UILabel alloc]initWithFrame:CGRectMake(115,150,50,30)];
    [Age setText:@"Age"];
    Age.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:Age];
    
    age_button=[[UIButton alloc]initWithFrame:CGRectMake(95,150,20,30)];
    //age_button.tag=2;
    age_button.selected=YES;
    [age_button setImage:[UIImage imageNamed:@"images-20"] forState:UIControlStateNormal];
    [age_button setImage:[UIImage imageNamed:@"images-19"] forState:UIControlStateSelected];
    [age_button addTarget:self action:@selector(buttonPress1)forControlEvents:UIControlEventTouchUpInside];
    [scrollview addSubview:age_button];
    

    DOB=[[UITextField alloc]initWithFrame:CGRectMake(150,150,150,30)];
    DOB.font = [UIFont boldSystemFontOfSize:12.0];
    DOB.tag=6;
    DOB.borderStyle = UITextBorderStyleLine;
    //DOB.placeholder = @"<enter text>";
   // DOB.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    DOB.delegate =self;
    //   [scrollview addSubview:rb3];
    // [scrollview addSubview:rb4];
    [scrollview addSubview:DOB];
    
    
    UILabel *Sex_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,190,100,30)];
    [Sex_lbl setText:@"Sex *"];
    Sex_lbl.font=[UIFont systemFontOfSize:12.0];
    
    Sex=[[UITextField alloc]initWithFrame:CGRectMake(150,190,150,30)];
    Sex.tag=7;
    Sex.inputView=pickerview_sex;

    Sex.font = [UIFont boldSystemFontOfSize:12.0];
    Sex.borderStyle = UITextBorderStyleLine;
    // Sex.placeholder = @"<enter text>";
    Sex.text=[NSString stringWithFormat:@"%@",[GenderList objectAtIndex:0]];
    //Sex.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    Sex.delegate =self;
    [scrollview addSubview:Sex];
    [scrollview addSubview:Sex_lbl];
    //[Sex addTarget:self action:@selector(btnpress1:)forControlEvents:UIControlEventEditingDidBegin];
//    pickerview_sex=[[UIPickerView alloc]initWithFrame:CGRectMake(0,332,320,216)];
//    
//    pickerview_sex.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
////   pickerview_sex.dataSource=self;
////   pickerview_sex.delegate=self;
//    pickerview_sex.showsSelectionIndicator=YES;
//    [self.view addSubview:pickerview_sex];
//    pickerview_sex.hidden=YES;
    
    UILabel *BloodGroup_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,230,100,30)];
    [BloodGroup_lbl setText:@"BloodGroup"];
    BloodGroup_lbl.font=[UIFont systemFontOfSize:12.0];
    
    self.WebService->StringName=@"BloodGroup";
    [self.WebService CallServiceStringName:@"http://192.168.1.202:81/CommonMasterModule/UIService.asmx/GetCommonMasterXMLList1" Object:NULL Handler:NULL];
    
    bloodgroup=(NSMutableArray*)self.WebService->ptr1;
    Bloodgroup_view=(NSMutableArray*)[bloodgroup valueForKey:@"name"];
    NSLog(@"sal is %@",bloodgroup);
    NSLog(@"sal is %@",Bloodgroup_view);
//    Pickerview_BloodGroup=[[UIPickerView alloc]initWithFrame:CGRectMake(0,332,320,216)];
//    Pickerview_BloodGroup.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin ;
////    Pickerview_BloodGroup.dataSource=self;
////    Pickerview_BloodGroup.delegate=self;
//    Pickerview_BloodGroup.showsSelectionIndicator=YES;
//    [self.view addSubview:Pickerview_BloodGroup];
////    
//   Pickerview_BloodGroup.hidden=YES;
//    
    BloodGroup=[[UITextField alloc]initWithFrame:CGRectMake(150,230,150,30)];
    BloodGroup.tag=8;
    BloodGroup.inputView=Pickerview_BloodGroup;

    BloodGroup.font = [UIFont boldSystemFontOfSize:12.0];
    BloodGroup.borderStyle = UITextBorderStyleLine;
    
    //  BloodGroup.placeholder = @"<enter text>";
    //BloodGroup.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    BloodGroup.delegate =self;
    [scrollview addSubview:BloodGroup];
    [scrollview addSubview:BloodGroup_lbl];
    // [BloodGroup addTarget:self action:@selector(btnpress1:)forControlEvents:UIControlEventEditingDidBegin];
    
    UILabel *FatherName_lbl=[[UILabel alloc]initWithFrame:CGRectMake(25,270,30,30)];
    [FatherName_lbl setText:@"Father"];
    FatherName_lbl.font=[UIFont systemFontOfSize:10.0];
    UILabel *Husband_lbl=[[UILabel alloc]initWithFrame:CGRectMake(75,270,100,30)];
    [Husband_lbl setText:@"Husband Name"];
    Husband_lbl.font=[UIFont systemFontOfSize:10.0];
    [scrollview addSubview:Husband_lbl];
    
    _Fatherbutton=[[UIButton alloc]initWithFrame:CGRectMake(05,270,20,30)];
    _Fatherbutton.tag=1;
    _Fatherbutton.selected=YES;
    [_Fatherbutton setImage:[UIImage imageNamed:@"images-20"] forState:UIControlStateNormal];
    [_Fatherbutton setImage:[UIImage imageNamed:@"images-19"] forState:UIControlStateSelected];
    
    [_Fatherbutton addTarget:self action:@selector(buttonPress_Check:) forControlEvents:UIControlEventTouchUpInside];
    
    [scrollview addSubview:_Fatherbutton];
    
    
    _Husbutton=[[UIButton alloc]initWithFrame:CGRectMake(55,270,20,30)];
    _Husbutton.tag=2;
    [_Husbutton setImage:[UIImage imageNamed:@"images-20"] forState:UIControlStateNormal];
    [_Husbutton setImage:[UIImage imageNamed:@"images-19"] forState:UIControlStateSelected];
    
    
    [_Husbutton addTarget:self action:@selector(buttonPress_Check:) forControlEvents:UIControlEventTouchUpInside];
    
    [scrollview addSubview:_Husbutton];
    
    FatherName=[[UITextField alloc]initWithFrame:CGRectMake(150,270,150,30)];
    FatherName.font = [UIFont boldSystemFontOfSize:12.0];
    FatherName.borderStyle = UITextBorderStyleLine;
    FatherName.tag=9;
    //   FatherName.placeholder = @"<enter text>";
    FatherName.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    FatherName.delegate =self;
    [scrollview addSubview:FatherName];
    [scrollview addSubview:FatherName_lbl];
    
    UILabel *email_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,310,50,30)];
    [email_lbl setText:@"Email"];
    email_lbl.font=[UIFont systemFontOfSize:12.0];
    
    email=[[UITextField alloc]initWithFrame:CGRectMake(150,310,150,30)];
    email.tag=10;
    [email setKeyboardType: UIKeyboardTypeEmailAddress];
    email.font = [UIFont boldSystemFontOfSize:12.0];
    email.borderStyle = UITextBorderStyleLine;
    // email.placeholder = @"<enter text>";
    email.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    email.delegate =self;
    [scrollview addSubview:email];
    [scrollview addSubview:email_lbl];
    
    UILabel *ContactNo_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,350,100,30)];
    [ContactNo_lbl setText:@"ContactNo"];
    ContactNo_lbl.font=[UIFont systemFontOfSize:12.0];
    
    ContactNo=[[UITextField alloc]initWithFrame:CGRectMake(150,350,150,30)];
    ContactNo.tag=11;
     ContactNo.keyboardType=UIKeyboardTypeNumberPad;
    ContactNo.font = [UIFont boldSystemFontOfSize:12.0];
    ContactNo.borderStyle = UITextBorderStyleLine;
    // ContactNo.placeholder = @"<enter text>";
    ContactNo.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    ContactNo.delegate =self;
    [scrollview addSubview:ContactNo];
    [scrollview addSubview:ContactNo_lbl];
    
    
    UILabel *Religion_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,390,100,30)];
    [Religion_lbl setText:@"Religion"];
    Religion_lbl.font=[UIFont systemFontOfSize:12.0];
    self.WebService->StringName=@"Religion";
    [self.WebService CallServiceStringName:@"http://192.168.1.202:81/CommonMasterModule/UIService.asmx/GetCommonMasterXMLList1" Object:NULL Handler:NULL];
    
    ReligionDetail=(NSMutableArray*)self.WebService->ptr1;
    Religion_view=(NSMutableArray*)[ReligionDetail valueForKey:@"name"];
    NSLog(@"sal is %@",ReligionDetail);
    NSLog(@"sal is %@",Religion_view);
    
    
//    Pickerview_Religion=[[UIPickerView alloc]initWithFrame:CGRectMake(0,332,320,216)];
//    
//    Pickerview_Religion.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin ;
////    Pickerview_Religion.dataSource=self;
////    Pickerview_Religion.delegate=self;
//    Pickerview_Religion.showsSelectionIndicator=YES;
//    [self.view addSubview:Pickerview_Religion];
////    
//    Pickerview_Religion.hidden=YES;
    
    Religion=[[UITextField alloc]initWithFrame:CGRectMake(150,390,150,30)];
    Religion.tag=12;
    Religion.inputView=Pickerview_Religion;

    Religion.font = [UIFont boldSystemFontOfSize:12.0];
    Religion.borderStyle = UITextBorderStyleLine;
    
    //BloodGroup.placeholder = @"<enter text>";
    //BloodGroup.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    Religion.delegate =self;
    [scrollview addSubview:Religion];
    [scrollview addSubview:Religion_lbl];
    // [Religion addTarget:self action:@selector(btnpress1:)forControlEvents:UIControlEventEditingDidBegin];
   // Religion.text=[NSString stringWithFormat:@"%@",[[ReligionDetail objectAtIndex:0]valueForKey:@"name"]];
    
    
    UILabel *Comment_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,430,100,40)];
    [Comment_lbl setText:@"Comments"];
    Comment_lbl.font=[UIFont systemFontOfSize:12.0];
    Comment=[[UITextField alloc]initWithFrame:CGRectMake(150,430,150,40)];
    Comment.font = [UIFont boldSystemFontOfSize:12.0];
    Comment.tag=13;
    
    imageLayer = Comment.layer;
    [imageLayer setCornerRadius:02];
    [imageLayer setBorderWidth:1];
    imageLayer.borderColor=[[UIColor blackColor] CGColor];
    //Comment1.borderStyle = UITextBorderStyleLine;
    
    // Comment.placeholder = @"<enter text>";
    // Comment1.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    Comment.delegate =self;
    [scrollview addSubview:Comment];
    [scrollview addSubview:Comment_lbl];
    
    UILabel *UId1_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,480,100,30)];
    [UId1_lbl setText:@"UId1"];
    UId1_lbl.font=[UIFont systemFontOfSize:12.0];
    UId1=[[UITextField alloc]initWithFrame:CGRectMake(150,480,150,30)];
    UId1.tag=14;
    
    UId1.font = [UIFont boldSystemFontOfSize:12.0];
    UId1.borderStyle = UITextBorderStyleLine;
    //  UId1.placeholder = @"<enter text>";
    UId1.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    UId1.delegate =self;
    [scrollview addSubview:UId1];
    [scrollview addSubview:UId1_lbl];
    
    //  [AreaId addTarget:self action:@selector(btnpress1:)forControlEvents:UIControlEventEditingDidBegin];
    
    UILabel *Alias_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,520,100,30)];
    [Alias_lbl setText:@"Alias"];
    Alias_lbl.font=[UIFont systemFontOfSize:12.0];
    
    alias=[[UITextField alloc]initWithFrame:CGRectMake(150,520,150,30)];
    alias.tag=15;
    
    alias.font = [UIFont boldSystemFontOfSize:12.0];
    alias.borderStyle = UITextBorderStyleLine;
    //alias.placeholder = @"<enter text>";
    alias.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    alias.delegate =self;
    [scrollview addSubview:alias];
    [scrollview addSubview:Alias_lbl];
    [alias addTarget:self action:nil forControlEvents:UIControlEventEditingChanged];
    
    
    UILabel *NationId_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,560,100,30)];
    [NationId_lbl setText:@"Nationality"];
    NationId_lbl.font=[UIFont systemFontOfSize:12.0];
    NationId=[[UITextField alloc]initWithFrame:CGRectMake(150,560,150,30)];
    
    
    NationId.borderStyle = UITextBorderStyleLine;
    NationId.font = [UIFont boldSystemFontOfSize:12.0];
    // NationId.placeholder = @"<enter text>";
   NationId.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    NationId.delegate =self;
    NationId.tag=16;
    [scrollview addSubview:NationId];
    [scrollview addSubview:NationId_lbl];
    [self.WebService CallServiceNationalityList:@"http://192.168.1.202:81/CommonMasterModule/UIService.asmx/GetAllNationality" Object:NULL Handler:NULL];
    
    [NationId resignFirstResponder];
    
    Nationality_View=[[NSMutableArray alloc]init];
    Nationality_ID=[[NSMutableArray alloc]init];
    
    Nationality_View=(NSMutableArray*)self.WebService->ptr1;
    
    Nationality_ID=[Nationality_View valueForKey:@"Nationality"];
    
    NSLog(@"nationalityid is %@",Nationality_ID);

    
    UILabel *Address_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,600,100,40)];
    [Address_lbl setText:@"Address"];
    Address_lbl.font=[UIFont systemFontOfSize:12.0];
    Address=[[UITextField alloc]initWithFrame:CGRectMake(150,600,150,40)];
    
    Address.font = [UIFont boldSystemFontOfSize:12.0];
    Address.tag=17;
    imageLayer = Address.layer;
    [imageLayer setCornerRadius:02];
    [imageLayer setBorderWidth:1];
    imageLayer.borderColor=[[UIColor blackColor] CGColor];
    
    // Address1.borderStyle = UITextBorderStyleLine;
    
    // Address.placeholder = @"<enter text>";
    //  Address1.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    Address.delegate =self;
    [scrollview addSubview:Address];
    [scrollview addSubview:Address_lbl];
    
    UILabel *AreaId_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,650,100,30)];
    [AreaId_lbl setText:@"Area *"];
    AreaId_lbl.font=[UIFont systemFontOfSize:12.0];
    AreaId=[[UITextField alloc]initWithFrame:CGRectMake(150,650,150,30)];
    
    AreaId.font = [UIFont boldSystemFontOfSize:12.0];
    AreaId.borderStyle = UITextBorderStyleLine;
    //AreaId.placeholder = @"<enter text>";
    // AreaId.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    AreaId.delegate =self;
    AreaId.tag=18;
    [scrollview addSubview:AreaId];
    [scrollview addSubview:AreaId_lbl];
    
    //    if ([[UIScreen mainScreen] bounds].size.height >480)
    //    {
    //        pickerview_area=[[UIPickerView alloc]initWithFrame:CGRectMake(0,345,320,50)];
    //    }
    //    else
    //    {
    //        pickerview_area=[[UIPickerView alloc]initWithFrame:CGRectMake(0,265,320,50)];
    //
    //    }
    //    [self.view addSubview:pickerview_area];
    //    pickerview_area.hidden=YES;
    
    UILabel *CityId_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,690,100,30)];
    [CityId_lbl setText:@"City *"];
    CityId_lbl.font=[UIFont systemFontOfSize:12.0];
    
    CityId=[[UITextField alloc]initWithFrame:CGRectMake(150,690,150,30)];
    CityId.font = [UIFont boldSystemFontOfSize:12.0];
    CityId.borderStyle = UITextBorderStyleLine;
    // CityId.placeholder = @"<enter text>";
    CityId.delegate =self;
    CityId.tag=19;
    [scrollview addSubview:CityId];
    [scrollview addSubview:CityId_lbl];
    // [CityId addTarget:self action:@selector(btnpress1:)forControlEvents:UIControlEventEditingDidBegin];
    

    
    UILabel *StateId_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,730,100,30)];
    [StateId_lbl setText:@"State *"];
    StateId_lbl.font=[UIFont systemFontOfSize:12.0];
    StateId=[[UITextField alloc]initWithFrame:CGRectMake(150,730,150,30)];
    
    StateId.font = [UIFont boldSystemFontOfSize:12.0];
    StateId.borderStyle = UITextBorderStyleLine;
    // StateId.placeholder = @"<enter text>";
    StateId.delegate =self;
    StateId.tag=20;
    [scrollview addSubview:StateId];
    [scrollview addSubview:StateId_lbl];
    
    UILabel *CountryId_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,770,100,30)];
    [CountryId_lbl setText:@"Country *"];
    CountryId_lbl.font=[UIFont systemFontOfSize:12.0];
    
    CountryId=[[UITextField alloc]initWithFrame:CGRectMake(150,770,150,30)];
    CountryId.font = [UIFont boldSystemFontOfSize:12.0];
    CountryId.borderStyle = UITextBorderStyleLine;
    // CountryId.placeholder = @"<enter text>";
    //CountryId.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    CountryId.delegate =self;
    CountryId.tag=21;
    CountryId.inputView=pickerview_country;
    
    [scrollview addSubview:CountryId];
    [scrollview addSubview:CountryId_lbl];
    
    UILabel *PinCode_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,810,100,30)];
    [PinCode_lbl setText:@"PinCode *"];
    PinCode_lbl.font=[UIFont systemFontOfSize:12.0];
    PinCode=[[UITextField alloc]initWithFrame:CGRectMake(150,810,150,30)];
    
    PinCode.font = [UIFont boldSystemFontOfSize:12.0];
    PinCode.tag=22;
    PinCode.borderStyle = UITextBorderStyleLine;
    // PinCode.placeholder = @"<enter text>";
   // PinCode.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    PinCode.delegate =self;
    PinCode.userInteractionEnabled=NO;
    [scrollview addSubview:PinCode];
    [scrollview addSubview:PinCode_lbl];
    
//    pickerview_country=[[UIPickerView alloc]initWithFrame:CGRectMake(0,332,320,216)];
//    pickerview_country.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
//    
//    pickerview_country.showsSelectionIndicator=YES;
//    [self.view addSubview:pickerview_country];
//    pickerview_country.hidden=YES;
    
    [self.WebService CallServiceCountryList:@"http://192.168.1.202:81/CommonMasterModule/UIService.asmx/GetCountryList" Object:NULL Handler:NULL];
    
    NSLog(@"dictonary is %@",self.WebService->ptr1);
    Dict=[[NSMutableArray alloc]init];
    Dict123=[[NSMutableArray alloc]init];
    Dict=(NSMutableArray*)self.WebService->ptr1;
    NSLog(@"dict is %@",Dict);
    Dict123=[Dict valueForKey:@"Name"];
    NSLog(@"dict is %@",Dict123);
    
    // [CountryId addTarget:self action:@selector(btnpress1:)forControlEvents:UIControlEventEditingDidBegin];
    
    
    //  [StateId addTarget:self action:@selector(btnpress1:)forControlEvents:UIControlEventEditingDidBegin];
    
    //  [NationId addTarget:self action:@selector(btnpress1:)forControlEvents:UIControlEventEditingDidBegin];
    
    UIButton *add=[[UIButton alloc]initWithFrame:CGRectMake(50,920,100,40)];
    add.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
    [add setTitle:@"Add" forState:UIControlStateNormal];
    [add addTarget:self action:@selector(AddButton:) forControlEvents:UIControlEventTouchUpInside];
    [scrollview addSubview:add];
    
    UIButton *Reset=[[UIButton alloc]initWithFrame:CGRectMake(170,920,100,40)];
    Reset.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
    [Reset setTitle:@"Reset" forState:UIControlStateNormal];
    [Reset addTarget:self action:@selector(ResetButton:) forControlEvents:UIControlEventTouchUpInside];
    [scrollview addSubview:Reset];
    
    
        
    
    //    Pickerview_Nationality=[[UIPickerView alloc]initWithFrame:CGRectMake(0,332,320,216)];
    //
    //    Pickerview_Nationality.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    //    Pickerview_Nationality.dataSource=self;
    //    Pickerview_Nationality.delegate=self;
    //    Pickerview_Nationality.showsSelectionIndicator=YES;
    //    [self.view addSubview:Pickerview_Nationality];
    //
    //    Pickerview_Nationality.hidden=YES;
    
    NationId.text=[NSString stringWithFormat:@"%@",[[Nationality_View objectAtIndex:7]valueForKey:@"Nationality"]];
    Nationality=[NSString stringWithFormat:@"%@",[[Nationality_View objectAtIndex:7]valueForKey:@"NationId"]];
    
}
- (void) viewWillAppear:(BOOL)animated
{
//   //show the cancel button in your search bar
//  txtSearch.showsCancelButton = YES;
//   //Iterate the searchbar sub views
//   for (UIView *subView in txtSearch.subviews) {
//   //Find the button
//  if([subView isKindOfClass:[UIButton class]])
//  {
// //Change its properties
// UIButton *DoneButton = (UIButton *)[txtSearch.subviews lastObject];
// [DoneButton setTitle:@"Done" forState:normal];
//      
//      [DoneButton addTarget:self action:@selector(donebtn:) forControlEvents:UIControlEventTouchUpInside];
//      
//// cancelButton.titleLabel.text = @"Changed";
//    }
// }
}
-(IBAction)buttonPress_Check:(id)sender
{
    
    UIButton *buttonTag=(UIButton *)sender;
    NSLog(@"but %ld",(long)buttonTag.tag);
    
    if(buttonTag.tag==1)
    {
        
        _Fatherbutton.selected=YES;
        _Husbutton.selected=NO;
        
        HusbandName=(NSString*)[NSNull null];
        NSLog(@"husband %@",HusbandName);
        Fathername=@"";
    }
    
    else if (buttonTag.tag==2)
    {
        _Fatherbutton.selected=NO;
        _Husbutton.selected=YES;
        //_Husbutton.selected=NO;
        Fathername=(NSString*)[NSNull null];
        HusbandName=@"";
        
    }
    
}
//-(void)buttonPress_Check1
//{
//    [_button setImage:[UIImage imageNamed:@"images-20"] forState:UIControlStateNormal];
//    [_button1 setImage:[UIImage imageNamed:@"images-19"] forState:UIControlStateNormal];
//    Fathername=(NSString*)[NSNull null];
//    HusbandName=@"";
//
//}

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
        
        DOB.text=[NSString stringWithFormat:@"%ld/%ld/%d",(long)[components1 day],(long)[components1 month],([components1 year]-[DOB.text integerValue])];
       NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"dd/MM/yyyy"];
        NSDate  *myDate = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@",DOB.text]];
        NSLog(@"%@", [dateFormatter stringFromDate:myDate]);
        
       NSDateFormatter  *anotherDateFormatter = [[NSDateFormatter alloc] init];
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
        NSDate *endDate = [dateFormat1 dateFromString:[NSString stringWithFormat:@"%@",DORegistration.text]];
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
        
        NSLog(@"There are %ld days in between the two dates. and month %ld and year %ld", (long)days,(long)months,(long)year);
        
        DOB.text=[NSString stringWithFormat:@"%ld",(long)year];
    }
    
}

//-(BOOL)NSStringIsValidEmail:(NSString *)checkString
//{
//    BOOL stricterFilter = YES; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
//    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
//    NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
//    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
//    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
//    return [emailTest evaluateWithObject:checkString];
//    NSLog(@"email test is %@",emailTest);
//}

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
//        else
//        {
//            //NSInteger nextTag = View_Tag + 1;
//            NSLog(@" tag %d",nextTag);
//            
//            // UIResponder* nextResponder = [textView.superview viewWithTag:nextTag];
//            //if ([nextResponder isKindOfClass:[UITextView class]])
//            
//            //  nextTag=nextTag+1;
//            // NSLog(@"nn %d",  nextTag+1);
//            [nextResponder becomeFirstResponder];
//            
//        }
//        // Found next responder, so set it.
        
    }
    else
    {
        // Not found, so remove keyboard.
        [text resignFirstResponder];
    }
    
    
    
}

/*-(void)radioButtonSelectedAtIndex:(NSUInteger)index inGroup:(NSString *)groupId
 {
 NSLog(@"changed to %d in %@",index,groupId);
 if(index==0)
 {
 HusbandName=(NSString*)[NSNull null];
 NSLog(@"husband %@",HusbandName);
 }
 if(index==1)
 {
 Fathername=(NSString*)[NSNull null];
 }
 if(index==2)
 {
 
 }
 else if(index==3)
 {
 
 formatter = [[NSDateFormatter alloc] init];
 [formatter setDateFormat:@"yyyy"];
 [formatter setTimeZone:[NSTimeZone localTimeZone]];
 
 NSString *todaydate = [formatter stringFromDate:date];
 NSLog(@"today day is %d",[todaydate integerValue]);
 NSString *age=[NSString stringWithFormat:@"%@",DOB.text];
 NSLog(@"age is %d",[age integerValue]);
 
 // DOB.text=[NSString stringWithFormat:@"%@",[todaydate-DOB.text]];
 
 
 }
 
 }*/
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    searching = NO;
    tool.hidden=YES;
   // NationId.inputView=Pickerview_Nationality;
    NSLog(@"arr is %@",self.WebService->ptr1);
//    SearchPatientCode=(NSMutableArray*)[self.WebService->ptr1 valueForKey:@"PatientCode"];
//    NSLog(@"item is %@",SearchPatientCode);
//    SearchPatientName  =(NSMutableArray *)[self.WebService->ptr1 valueForKey:@"Name"];
//    NSLog(@"item is %@",SearchPatientName);
    
    
//    table_SearchPatient=[[UITableView alloc]initWithFrame:CGRectMake(7,44,233,240)style:UITableViewStylePlain];
//    table_SearchPatient.delegate=self;
//    table_SearchPatient.dataSource=self;
//    table_SearchPatient.layer.borderWidth = 2.0;
//    table_SearchPatient.layer.borderColor = [UIColor grayColor].CGColor;
//    [self.view addSubview:table_SearchPatient];
//    
    //[searchBar setShowsCancelButton:YES animated:YES];
    searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
    NSLog(@"rect %@",txtSearch);
    NSLog(@"rect %@",Pickerview_Nationality);
    
    
//    CGRect rect1=txtSearch.frame;
//    rect1.origin.y=40;
//    NSLog(@"rect %@",NSStringFromCGRect(rect1));
    
   // txtSearch.frame=rect1;
    CGRect rect=Pickerview_Nationality.frame;
    rect.origin.y=80;
    NSLog(@"rect %@",NSStringFromCGRect(rect));
    
    Pickerview_Nationality.frame=rect;
    NSLog(@"rect %@",NSStringFromCGRect(Pickerview_Nationality.frame));

    
    
}
- (void)searchBar:(UISearchBar *)theSearchBar textDidChange:(NSString *)searchText
{
    
	//Remove all objects first.
    
	[copyListOfItems removeAllObjects];
	
	if([searchText length] > 0) {
        
		searching = YES;
		//letUserSelectRow = YES;
        
		NSString *searchText = txtSearch.text;
        
        //NSMutableArray *searchArray = [[NSMutableArray alloc] init];
        
        
        for (NSString *sTemp in Nationality_ID)
        {
            NSRange titleResultsRange = [sTemp rangeOfString:searchText options:NSCaseInsensitiveSearch];
            
            if (titleResultsRange.length > 0){
                [copyListOfItems addObject:sTemp];
            }
        }
      //  [pickerView reloadAllComponents];
        

	}
	else {
		
		searching = NO;
		//letUserSelectRow = NO;
        
	}
	
	[Pickerview_Nationality reloadAllComponents];
}

//- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
//{
//  searching = NO;
//  txtSearch.text=@"";
//  self.navigationItem.rightBarButtonItem=nil;
//
// [txtSearch setShowsCancelButton:NO animated:YES];
//      self.navigationItem.titleView=nil;
// [txtSearch resignFirstResponder];
//    Pickerview_Nationality.hidden=YES;
// //[table_SearchPatient reloadData];
// //[table_SearchPatient removeFromSuperview];
// 
// 
//}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
    [self donebtn:nil];
    
//     NSString *strSelectedValue;
//    if (searching )
//    {
//        if (copyListOfItems.count > 0)
//        {
//            NSLog(@"copy lis %@",copyListOfItems);
//           // NSLog(@"copy lis %@",arrRecords);
//           // NSLog(@"copy lis %d",[pickerView selectedRowInComponent:0]);
//            //        NSLog(@"call %@",[pickerView selectRow:0 inComponent:0 animated:YES]);
//            NationId.text = [copyListOfItems objectAtIndex:[Pickerview_Nationality selectedRowInComponent:0]];
//            NSLog(@"index %@",strSelectedValue);
//            Nationality=[NSString stringWithFormat:@"%@",[[Nationality_View objectAtIndex:[Pickerview_Nationality selectedRowInComponent:0]]valueForKey:@"NationId"]];
//            NSLog(@"nation id %@",Nationality);
//
//        }
//    }
//    searching = NO;
//    txtSearch.text=@"";
//    self.navigationItem.rightBarButtonItem=nil;
//    
//    [txtSearch setShowsCancelButton:NO animated:YES];
//    self.navigationItem.titleView=nil;
//    [txtSearch resignFirstResponder];
//    Pickerview_Nationality.hidden=YES;
//    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
//    [nc removeObserver:self name: UIKeyboardWillShowNotification object:nil];
//    [nc removeObserver:self name: UIKeyboardWillHideNotification object:nil];
//    [self removeFromSuperview];
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    text_tag=textField.tag;
//    [txtSearch resignFirstResponder];
//    self.navigationItem.titleView=nil;
    tool.hidden=NO;
  //  self.navigationItem.rightBarButtonItem=nil;
   
 //   [Pickerview_Nationality removeFromSuperview];
    
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
            //Pickerview_Salutations.showsSelectionIndicator=YES;
       // [self.view addSubview:Pickerview_Salutations];
        
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
            DatePicker.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];;
            DatePicker.tintColor=[UIColor blueColor];
            
            //  DatePicker.datePickerMode = UIDatePickerModeDateAndTime;
            DatePicker.date = [NSDate date];
            
            //done.hidden=NO;
            
            DatePicker.userInteractionEnabled=YES;
            //DatePicker.hidden=YES;
            // [self.DOB setInputView:DatePicker];
            [self.view addSubview:DatePicker];
            //DatePicker.hidden=YES;

//            Pickerview_Salutations.hidden=YES;
//            pickerview_sex.hidden=YES;
//            Pickerview_BloodGroup.hidden=YES;
//            Pickerview_Religion.hidden=YES;
//            Pickerview_Nationality.hidden=YES;
//            pickerview_area.hidden=YES;
//            pickerview_city.hidden=YES;
//            pickerview_state.hidden=YES;
//            pickerview_country.hidden=YES;
            
            //[DOB resignFirstResponder];
        }
        
        else if (age_button.selected)
        {
            
            Dob_button.selected=NO;
            tool.hidden=NO;
           // Pickerview_Salutations.hidden=YES;
            DatePicker.hidden=YES;
//            pickerview_sex.hidden=YES;
//            Pickerview_BloodGroup.hidden=YES;
//            Pickerview_Religion.hidden=YES;
//            Pickerview_Nationality.hidden=YES;
//            pickerview_area.hidden=YES;
//            pickerview_city.hidden=YES;
//            pickerview_state.hidden=YES;
//            pickerview_country.hidden=YES;
            //[DOB resignFirstResponder];
           // [DatePicker removeFromSuperview];
            
        }
        
    }
    
    if(textField.tag==7)
    {
        tool.hidden=NO;
        pickerview_sex=[[UIPickerView alloc]initWithFrame:CGRectMake(0,332,320,216)];
       PickerTag=pickerview_sex.tag=3;
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
//        Pickerview_Nationality.hidden=YES;
//        pickerview_city.hidden=YES;
//        pickerview_sex.hidden=YES;
//        pickerview_country.hidden=YES;
//        pickerview_state.hidden=YES;
//        pickerview_area.hidden=YES;
//        
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
//        Pickerview_Nationality.hidden=YES;
//        pickerview_city.hidden=YES;
//        pickerview_sex.hidden=YES;
//        pickerview_country.hidden=YES;
//        pickerview_state.hidden=YES;
//        pickerview_area.hidden=YES;
    }

    if (textField.tag==16)
    {
        check=3;
       //[Pickerview_Nationality removeFromSuperview];
     
      // [textField resignFirstResponder];
     // tool.hidden=NO;
//        [tool removeFromSuperview];
      // txtSearch.hidden=NO;
       
//        UIBarButtonItem *button1 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(donebtn:)];
//        //txtSearch = [[UISearchBar alloc] init];
//              self.navigationItem.rightBarButtonItem=button1;
//  
//            txtSearch = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 256,320,44)];
//           
//            
////        }
////        else
////        {
////            txtSearch = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 156,320,44)];
////            Pickerview_Nationality=[[UIPickerView alloc]initWithFrame:CGRectMake(0,200,320,216)];
////        }
//        
//       txtSearch.tag = 1;
//       txtSearch.barStyle = UIBarStyleBlackOpaque;
//       txtSearch.backgroundColor = [UIColor clearColor];
//       txtSearch.delegate = self;
//       txtSearch.userInteractionEnabled = TRUE;
//       self.navigationItem.titleView=txtSearch;
//
        Pickerview_Nationality=[[UIPickerView alloc]initWithFrame:CGRectMake(0,332,320,216)];
       Pickerview_Nationality.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin ;
       Pickerview_Nationality.dataSource=self;
       Pickerview_Nationality.delegate=self;
       Pickerview_Nationality.showsSelectionIndicator=YES;
       
       [self.view addSubview:Pickerview_Nationality];
//
       // Pickerview_Nationality.hidden=YES;

        //[self.view addSubview:txtSearch];
        
    


       //
//        if ([[UIScreen mainScreen] bounds].size.height >480)
//        {
//            objYHCPickerView = [[PickerView alloc] initWithFrame:CGRectMake(0, 100, 320, 480)withNSArray:Nationality_ID ];
//        }
//        else
//        {
//            objYHCPickerView = [[PickerView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)withNSArray:Nationality_ID ];
//            
//       // }
//        NSLog(@"view %f",self.view.frame.origin.y);
//        CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y);
//        [scrollview setContentOffset:scrollPoint animated:YES];
//
//        objYHCPickerView.delegate = self;
//        [self.view addSubview:objYHCPickerView];
//        [objYHCPickerView showPicker];
        
    }
    
    if (textField.tag==21)
    {
        NSArray *items=[tool items];
        UIBarButtonItem *Next=[items objectAtIndex:1];
        Next.enabled=NO;
      
//      [email resignFirstResponder];
//      [FirstName resignFirstResponder];
//      [MiddleName resignFirstResponder];
//      [LastName resignFirstResponder];
//      [DOB resignFirstResponder];
//      [FatherName resignFirstResponder];
//      [ContactNo resignFirstResponder];
//      [Comment resignFirstResponder];
//      [UId1 resignFirstResponder];
//      [alias resignFirstResponder];
//      [Address resignFirstResponder];
        pickerview_country=[[UIPickerView alloc]initWithFrame:CGRectMake(0,332,320,216)];
        pickerview_country.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        pickerview_country.dataSource=self;
        pickerview_country.tag=7;
        pickerview_country.delegate=self;
        pickerview_country.showsSelectionIndicator=YES;
        [self.view addSubview:pickerview_country];
//        
//        pickerview_country.hidden=NO;
//        pickerview_sex.hidden=YES;
//        pickerview_state.hidden=YES;
//        pickerview_city.hidden=YES;
//        pickerview_area.hidden=YES;
//        Pickerview_Nationality.hidden=YES;
    }
    else
    {
        NSArray *items=[tool items];
        UIBarButtonItem *Next=[items objectAtIndex:1];
        Next.enabled=YES;
        
    }
    if (textField.tag==20)
    {
        
//      check=1;
//      [email resignFirstResponder];
//      [FirstName resignFirstResponder];
//      [MiddleName resignFirstResponder];
//      [LastName resignFirstResponder];
//      [DOB resignFirstResponder];
//      [FatherName resignFirstResponder];
//      [ContactNo resignFirstResponder];
//      [Comment resignFirstResponder];
//      [UId1 resignFirstResponder];
//      [alias resignFirstResponder];
//      [Address resignFirstResponder];
//      [CountryId resignFirstResponder];
//        [CityId resignFirstResponder];
//    
//     tool.hidden=YES;
               //

        if([country integerValue]==0)
        {
            alert=[[UIAlertView alloc]initWithTitle:@"Check" message:@"First Select area or Country" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
            [alert show];
            //tool.hidden=YES;
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
                
                pickerview_state=[[UIPickerView alloc]initWithFrame:CGRectMake(0,332,320,216)];
                pickerview_state.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
                pickerview_state.dataSource=self;
                pickerview_state.tag=7;
                pickerview_state.delegate=self;
                pickerview_state.showsSelectionIndicator=YES;
                [self.view addSubview:pickerview_state];
                

                
//                if ([[UIScreen mainScreen] bounds].size.height >480)
//                {
//                    objYHCPickerView = [[PickerView alloc] initWithFrame:CGRectMake(0, 100, 320, 480)withNSArray:View_StateID ];
//                }
//                else
//                {
//                    objYHCPickerView = [[PickerView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)withNSArray:View_StateID ];
//                    
//                    
//                }
//                NSLog(@"view %f",self.view.frame.origin.y);
//                CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y);
//                [scrollview setContentOffset:scrollPoint animated:YES];
//
//                objYHCPickerView.delegate = self;
//                [self.view addSubview:objYHCPickerView];
//                [objYHCPickerView showPicker];
            }
        }
    }
    if (textField.tag==19)
    {
      // tool.hidden=NO;
//      [email resignFirstResponder];
//      [FirstName resignFirstResponder];
//      [MiddleName resignFirstResponder];
//      [LastName resignFirstResponder];
//      [DOB resignFirstResponder];
//      [FatherName resignFirstResponder];
//      [ContactNo resignFirstResponder];
//      [Comment resignFirstResponder];
//      [UId1 resignFirstResponder];
//      [alias resignFirstResponder];
//      [Address resignFirstResponder];
      
        if([state integerValue]==0)
        {
            
            alert=[[UIAlertView alloc]initWithTitle:@"Check" message:@"First Select area or Country" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
            [alert show];
           // tool.hidden=YES;
            
        }
        else
        {
            NSLog(@"state id is %@",self.WebService->state_id=state);
            
            
            [self.WebService CallServiceCityList:@"http://192.168.1.202:81/CommonMasterModule/UIService.asmx/GetCityList" Object:NULL Handler:NULL];
            
            City_Detail=[[NSMutableArray alloc]init];
            View_CityID=[[NSMutableArray alloc]init];
            
            City_Detail=(NSMutableArray*)self.WebService->ptr1;
            NSLog(@"dict is %@",State_Detail);
            View_CityID=[City_Detail valueForKey:@"Name"];
            
            NSLog(@"dict is %@",View_CityID);
            
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
            
//            Pickerview_Salutations.hidden=YES;
//            DatePicker.hidden=YES;
//            pickerview_sex.hidden=YES;
//            Pickerview_BloodGroup.hidden=YES;
//            Pickerview_Religion.hidden=YES;
//            Pickerview_Nationality.hidden=YES;
//            pickerview_area.hidden=YES;
//            pickerview_state.hidden=YES;
//            pickerview_country.hidden=YES;
        }
    }
    if (textField.tag==18)
    {
//        check=2;
//      [email resignFirstResponder];
//      [FirstName resignFirstResponder];
//      [MiddleName resignFirstResponder];
//      [LastName resignFirstResponder];
//      [DOB resignFirstResponder];
//      [FatherName resignFirstResponder];
//      [ContactNo resignFirstResponder];
//      [Comment resignFirstResponder];
//      [UId1 resignFirstResponder];
//      [alias resignFirstResponder];
//      [Address resignFirstResponder];
//      [CityId resignFirstResponder];
//        
//      tool.hidden=YES;
//       Pickerview_Salutations.hidden=YES;
//       DatePicker.hidden=YES;
//       pickerview_sex.hidden=YES;
//       Pickerview_BloodGroup.hidden=YES;
//       Pickerview_Religion.hidden=YES;
//       Pickerview_Nationality.hidden=YES;
//       pickerview_area.hidden=YES;
//       pickerview_city.hidden=YES;
//       pickerview_state.hidden=YES;
//       pickerview_country.hidden=YES;
        
       
    //    [pickerview_area removeFromSuperview];
        
        
       // if(([city integerValue]==0)||([state integerValue]==0)||([country integerValue]==0))
        {
            //  alert = [[UIAlertView alloc] initWithTitle:@"Check" message:@"Select Country First" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
            
            //   [alert show];
            
            [self.WebService CallServiceGetAllArea:@"http://192.168.1.202:81/CommonMasterModule/UIService.asmx/GetAllArea" Object:NULL Handler:NULL];
            
            Area_Detail=(NSMutableArray*)self.WebService->ptr1;
            NSLog(@"dict is %@",Area_Detail);
            View_Area=[Area_Detail valueForKey:@"AreaName"];
            
            NSLog(@"dict is %@",View_Area);
            // NSDictionary *dictValue=[[NSDictionary alloc]initWithObjectsAndKeys:[NSString stringWithFormat:@"%@",[Area_Detail valueForKey:@"AreaName"]],@"AreaName",[NSString stringWithFormat:@"%@",[Area_Detail valueForKey:@"CityId"]],@"CityId", nil];
            
            pickerview_area=[[UIPickerView alloc]initWithFrame:CGRectMake(0,332,320,216)];
            pickerview_area.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
            pickerview_area.showsSelectionIndicator=YES;
            pickerview_area.delegate=self;
            pickerview_area.dataSource=self;
            // pickerview_city.hidden=YES;
            [self.view addSubview:pickerview_area];

//            if ([[UIScreen mainScreen] bounds].size.height >480)
//            {
//                objYHCPickerView = [[PickerView alloc] initWithFrame:CGRectMake(0, 100, 320, 480)withNSArray:View_Area];
//            }
//            else
//            {
//                objYHCPickerView = [[PickerView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)withNSArray:View_Area];
//            }
//            NSLog(@"view %f",self.view.frame.origin.y);
//            CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y);
//            [scrollview setContentOffset:scrollPoint animated:YES];
//
//            objYHCPickerView.delegate = self;
//            [self.view addSubview:objYHCPickerView];
//            [objYHCPickerView showPicker];
            
           
            
        }
//        else
//        {
//            //tool.hidden=NO;
//            NSLog(@"state id is %@",self.WebService->city_id=city);
//            
//            [self.WebService CallServiceAreaList:@"http://192.168.1.202:81/CommonMasterModule/UIService.asmx/GetAreaList" Object:NULL Handler:NULL];
//            
//            Area_Detail=(NSMutableArray*)self.WebService->ptr1;
//            NSLog(@"dict is %@",Area_Detail);
//            View_Area=[Area_Detail valueForKey:@"AreaName"];
//            
//            NSLog(@"dict is %@",View_Area);
//             [pickerview_area reloadAllComponents];
//           if(Area_Detail.count==0)
//           {
//               alert=[[UIAlertView alloc]initWithTitle:@"Check" message:@"Add Area" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
//               [alert show];
//               
//               [AreaId resignFirstResponder];
//               
//           }
//           
//            else
//            {
//                pickerview_area=[[UIPickerView alloc]initWithFrame:CGRectMake(0,332,320,216)];
//                pickerview_area.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
//                pickerview_area.showsSelectionIndicator=YES;
//                pickerview_area.delegate=self;
//                pickerview_area.dataSource=self;
//                // pickerview_city.hidden=YES;
//                [self.view addSubview:pickerview_area];
//                
//////                if ([[UIScreen mainScreen] bounds].size.height >480)
//////                {
//////                    objYHCPickerView = [[PickerView alloc] initWithFrame:CGRectMake(0, 100, 320, 480)withNSArray:View_Area ];
//////                }
//////                else
//////                {
//////                    objYHCPickerView = [[PickerView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)withNSArray:View_Area ];
//////                    
//////                    
//////                }
//////                NSLog(@"view %f",self.view.frame.origin.y);
//////                CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y);
//////                [scrollview setContentOffset:scrollPoint animated:YES];
//////
//////                objYHCPickerView.delegate = self;
//////                [self.view addSubview:objYHCPickerView];
//////                [objYHCPickerView showPicker];
////                
////            }
//        }
                   //[pickerview_area reloadAllComponents];
        
  //  }
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
            
            self.WebService->Email1=[NSString stringWithFormat:@"%@",email.text];
            self.WebService->patientcode=@"";
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
        emailRegEx=@"^[A-Z  a-z]+$";
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
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;   // return NO to not change text
//{
//    NSLog(@"textView:shouldChangeTextInRange:replacementText:");
//
//    NSLog(@"textView.text.length -- %i",textField.text.length);
//    NSLog(@"text.length         -- %i",string.length);
//    //NSLog(@"textView.text.length + text.length-- %i",textView.text.length + text.length);
//
//    /*--
//     * This method is called just before text in the textView is displayed
//     * This is a good place to disallow certain characters
//     * Limit textView to 140 characters
//     * Resign keypad if done button pressed comparing the incoming text against the newlineCharacterSet
//     * Return YES to update the textView otherwise return NO
//     --*/
//
//    NSCharacterSet *doneButtonCharacterSet = [NSCharacterSet newlineCharacterSet];
//    NSRange replacementTextRange = [string rangeOfCharacterFromSet:doneButtonCharacterSet];
//    NSUInteger location1 = replacementTextRange.location;
//
//    if (textField.text.length + string.length > 140){//140 characters are in the textView
//        if (location1 != NSNotFound){ //Did not find any newline characters
//            [textField resignFirstResponder];
//        }
//        return NO;
//    }
//    else if (location1 != NSNotFound){ //Did not find any newline characters
//        [textField resignFirstResponder];
//        return NO;
//    }
//
//    return YES;
//
//}
-(BOOL)textFieldShouldReturn:(UITextField*)textField;
{
  //  tool.hidden=YES;
    [textField resignFirstResponder];
    return YES;
    //   NSInteger nextTag = textField.tag + 1;
    //   NSLog(@" tag %d",nextTag);
    //   // Try to find next responder
    //   UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    //   NSLog(@"res %@",nextResponder);
    //   if (nextResponder)
    //   {
    //  // Found next responder, so set it.
    //  [nextResponder becomeFirstResponder];
    //   } else
    //   {
    //           // Not found, so remove keyboard.
    //           [textField resignFirstResponder];
    //    }
    //    return NO; // We do not want UITextField to insert line-breaks.
}


- (void) keyboardDidShowOrHide : (id) sender
{
    // create custom button
    doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    doneButton.frame = CGRectMake(0, 514, 106, 54);
    doneButton.adjustsImageWhenHighlighted = NO;
    [doneButton setBackgroundImage:[UIImage imageNamed:@"button.png"] forState:UIControlStateNormal];
    [doneButton setTitle:@"OK" forState:normal];
    //[doneButton setBackgroundImage:[UIImage imageNamed:@"donedown.png"] forState:UIControlStateHighlighted];
    [doneButton addTarget:self action:@selector(doneButton:) forControlEvents:UIControlEventTouchUpInside];
    UIWindow* tempWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:1];
    [tempWindow addSubview:doneButton];
    
    
}
-(void)doneButton:(id)sender
{
    UIButton *btntmp=sender;
    [btntmp removeFromSuperview];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    //[self setViewMovedUp:NO];
    [DOB resignFirstResponder];
}

-(IBAction)donebtn:(id)sender
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
        NSDateFormatter  *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss +HHmm"];
        NSDate  *myDate = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@",DOB.text]];
        NSLog(@"%@", [dateFormatter stringFromDate:myDate]);
        
        NSDateFormatter  *anotherDateFormatter = [[NSDateFormatter alloc] init];
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
    else if(text_tag==16)
    {
     //   NSString *strSelectedValue;
//        if (searching )
//        {
//            if (copyListOfItems.count > 0)
//            {
//                NSLog(@"copy lis %@",copyListOfItems);
//               // NSLog(@"copy lis %@",arrRecords);
//                NSLog(@"copy lis %d",[Pickerview_Nationality selectedRowInComponent:0]);
//                //        NSLog(@"call %@",[pickerView selectRow:0 inComponent:0 animated:YES]);
//                NationId.text = [copyListOfItems objectAtIndex:[Pickerview_Nationality selectedRowInComponent:0]];
//                NSLog(@"index %@",NationId.text);
//                for(int i=0;i<Nationality_View.count;i++)
//                {
//                    
//                    if([[[Nationality_View objectAtIndex:i]valueForKey:@"Nationality"]isEqualToString:[NSString stringWithFormat:@"%@",NationId.text]])
//                    {
//                        
//                        Nationality=[[Nationality_View  objectAtIndex:i]valueForKey:@"NationId"];
//                        NSLog(@"nation id %@",Nationality);
//                        break;
//                        
//                    }
//                }
//
//               // int selectedIndex = [Nationality_ID indexOfObject:strSelectedValue];
//               // NSLog(@"index %d",selectedIndex);
//               // [NationId setText:[NSString stringWithFormat:@"%@",[Nationality_ID objectAtIndex:[Pickerview_Nationality selectedRowInComponent:0]]]];
//        
//                             
////                if (delegate && [delegate respondsToSelector:@selector(selectedRow:withString:)]) {
////                    [delegate selectedRow:selectedIndex withString:strSelectedValue];
////                }
////                
////            }else{
////                
////                if (delegate && [delegate respondsToSelector:@selector(selectedRow:withString:)]) {
////                    [delegate selectedRow:-1 withString:@"NOT FOUND"];
////                }
////            }
//            
//           }
//        }
//        else
//        {
//             NationId.text  = [Nationality_ID objectAtIndex:[Pickerview_Nationality selectedRowInComponent:0]];
//            //int selectedIndex = [Nationality_ID indexOfObject:strSelectedValue];
//              NSLog(@"index %@", NationId.text);
//            Nationality=[NSString stringWithFormat:@"%@",[[Nationality_View  objectAtIndex:[Pickerview_Nationality selectedRowInComponent:0]]valueForKey:@"NationId"]];
//            NSLog(@"nation id %@",Nationality);
//
////            if (delegate && [delegate respondsToSelector:@selector(selectedRow:withString:)]) {
////                [delegate selectedRow:selectedIndex withString:strSelectedValue];
////            }
//        }
        
               //[txtSearch setHidden:YES];
        
         [NationId resignFirstResponder];
        
        NationId.text  = [Nationality_ID objectAtIndex:[Pickerview_Nationality selectedRowInComponent:0]];

        Nationality=[NSString stringWithFormat:@"%@",[[Nationality_View  objectAtIndex:[Pickerview_Nationality selectedRowInComponent:0]]valueForKey:@"NationId"]];

      //  NSLog(@"nation %@",[[Nationality_View objectAtIndex:[Pickerview_Nationality selectedRowInComponent:0]]valueForKey:@"NationId"]);
              // searching=NO;
        
               // [txtSearch resignFirstResponder];
       // self.navigationItem.titleView=nil;
         // self.navigationItem.rightBarButtonItem=nil;
//        CGRect rect=Pickerview_Nationality.frame;
//        rect.origin.y=288;
//        NSLog(@"rect %@",NSStringFromCGRect(rect));
//        
//        Pickerview_Nationality.frame=rect;
//        NSLog(@"rect %@",NSStringFromCGRect(Pickerview_Nationality.frame));
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
    else if (text_tag==20)
    {
        [View_StateID objectAtIndex:[pickerview_state selectedRowInComponent:0]];
     //   NSLog(@"Selected Color: %@. Index of selected color: %i", [State_Detail objectAtIndex:row], row);
        
        state=[NSString stringWithFormat:@"%@",[[State_Detail objectAtIndex:[pickerview_state selectedRowInComponent:0]]valueForKey:@"StateId"]];
        NSLog(@"row %@",state);
        [StateId setText:[[State_Detail objectAtIndex:[pickerview_state selectedRowInComponent:0]]valueForKey:@"Name"]];
        // state=[NSString stringWithFormat:@"%@",[[State_Detail objectAtIndex:row] valueForKey:@"StateId"]];
        //   NSLog(@"stae is %@",state);
        if(![[NSString stringWithFormat:@"%@",[[AreaList objectAtIndex:0] valueForKey:@"StateId"]]isEqualToString:state])
        {
            AreaId.text=@"--select Area--";
            CityId.text=@"--select City--";
            PinCode.text=@"";
            city=@"0";
        }
          [StateId resignFirstResponder];
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
    else if (text_tag==18)
    {
        [View_Area objectAtIndex:[pickerview_city selectedRowInComponent:0]];
       // NSLog(@"Selected Color: %@. Index of selected color: %i", [Area_Detail objectAtIndex:row], row);
        
        area=[NSString stringWithFormat:@"%@",[[Area_Detail objectAtIndex:[pickerview_area selectedRowInComponent:0]]valueForKey:@"AreaId"]];
        NSLog(@"row %@",area);
        Pincode=[NSString stringWithFormat:@"%@",[[Area_Detail objectAtIndex:[pickerview_area selectedRowInComponent:0]]valueForKey:@"PinCode"]];
        NSLog(@"row %@",Pincode);
        // [AreaId setText:area];
        [AreaId setText:[NSString stringWithFormat:@"%@",[View_Area objectAtIndex:[pickerview_area selectedRowInComponent:0]]]];
        NSLog(@"area is %@",self.WebService->Area_Id=[NSString stringWithFormat:@"%@",[[Area_Detail objectAtIndex:[pickerview_area selectedRowInComponent:0]] valueForKey:@"AreaId"]]);
        
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
        [AreaId resignFirstResponder ];
        
        tool.hidden=YES;
        
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
        Pickerview_Religion.tag=0;
        
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
        [Comment resignFirstResponder];
        [UId1 resignFirstResponder];
        [alias resignFirstResponder];
        [Address resignFirstResponder];
        
    }
    
    //    else if (Pickerview_Nationality.hidden==NO)
    //    {
    //        [NationId setText:[NSString stringWithFormat:@"%@",[Nationality_ID objectAtIndex:[Pickerview_Nationality selectedRowInComponent:0]]]];
    //        Pickerview_Nationality.hidden=YES;
    //        // done4.hidden=YES;
    //        NSLog(@"sate %@",NationId);
    //        Pickerview_Nationality.hidden=YES;
    //        tool.hidden=YES;
    //
    //    }
    //    else if (pickerview_area.hidden==NO)
    //    {
    //        [AreaId setText:[NSString stringWithFormat:@"%@",[View_Area objectAtIndex:[pickerview_area selectedRowInComponent:0]]]];
    //        pickerview_area.hidden=YES;
    //        // done4.hidden=YES;
    //        NSLog(@"sate %@",AreaId);
    //        PinCode.text=Pincode;
    //
    //        pickerview_area.hidden=YES;
    //        tool.hidden=YES;
    //
    //    }
    
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    //if ([[UIScreen mainScreen] bounds].size.height >480)
    {

    if (textField.tag>=7)
        {
        NSLog(@"view %f",self.view.frame.origin.y);
            NSLog(@"view %f",self.view.frame.size.height);
        CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y);
            // CGPoint scrollPoint=CGPointMake(0,180);
             NSLog(@"scrol %@",NSStringFromCGPoint(scrollPoint));
        [scrollview setContentOffset:scrollPoint animated:YES];
           
            
        }
    }
//    else
//    {
//        if (textField.tag>=4)
//        {
//            NSLog(@"view %f",self.view.frame.origin.y);
//            CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y);
//            [scrollview setContentOffset:scrollPoint animated:YES];
//        }
//
//    }
   [textField setInputAccessoryView:tool];
    
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
        textField.inputView=pickerview_state;

      //[textField resignFirstResponder];
    }
    if(textField == CityId)
    {
//        if([state integerValue]==0)
//         {
//             [textField resignFirstResponder];
//         }
      //  else
        {
            textField.inputView=pickerview_city;

        }

    }
    if(textField == AreaId)
    {
               if(Area_Detail.count==0)
        {
            [AreaId resignFirstResponder];
            
        }
        else
        {
            textField.inputView=pickerview_area;

        }
       // [textField resignFirstResponder];
        
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
     //[textField resignFirstResponder];
        // self.navigationItem.titleView=txtSearch;
        //[textField setInputAccessoryView:tool];

    textField.inputView=Pickerview_Nationality;

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

-(IBAction)AddButton:(id)sender
{
    
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
    
    NSLog(@"first name is %@",Firstname);
    
    if(Firstname==NULL)
    {
        NSLog(@"first name is %@",Firstname);
    }
    
    if((email.text == NULL)||[email.text isEqual:@""])
    {
        Email=@"";
    }
    else
    {
        Email=email.text;
    }
    //    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    //    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    //    //Valid email address
    //    if ([emailTest evaluateWithObject:email.text] == YES)
    //    {
    //        NSLog(@"email in proper format");
    //
    //    }
    //    else
    //    {
    //        NSLog(@"email not in proper format");
    //
    //    }
    Title=Salutation.text;
    NSLog(@"title is %@",Title);
    //  Title=Salutation.text;
    Firstname=FirstName.text;
    NSLog(@"first is %@",Firstname);
    if((MiddleName.text ==NULL)||[MiddleName.text isEqual:@""])
    {
        Middlename=@"";
    }
    else
    {
        Middlename=MiddleName.text;
    }
    Lastname=LastName.text;
    
    NSLog(@"last is %@",Lastname);
    
    NSDateFormatter  *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    NSDate  *myDate = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@",Dob]];
    NSLog(@"%@", [dateFormatter stringFromDate:myDate]);
    
    NSDateFormatter  *anotherDateFormatter = [[NSDateFormatter alloc] init];
    [anotherDateFormatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    NSLog(@"%@", [anotherDateFormatter stringFromDate:myDate]);
    
    //  DOB.text =[anotherDateFormatter stringFromDate:myDate];
    
    dob=(NSDate*)[anotherDateFormatter stringFromDate:myDate];
    
    NSLog(@"dob is %@",dob);
    
    sex=Sex.text;
    //  Bloodgroup=BloodGroup.text;
    //  NSLog(@"blood is %@",Bloodgroup);
    if(BloodGroup.text==NULL || [BloodGroup.text isEqual:@""])
    {
        Bloodgroup=@"";
    }
    else
    {
        NSLog(@"blood is %@",Bloodgroup);
    }
    
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
    
    Doregistration=(NSDate*)DORegistration.text;
    NSLog(@"date %@",Doregistration);
    
    if((ContactNo.text==NULL)||[ContactNo.text isEqual:@""])
    {
        Contactno=@"";
    }
    else
    {
        Contactno=ContactNo.text;
        
    }
    if((Comment.text==NULL)||[Comment.text isEqual:@""])
    {
        Comments=@"";
    }
    else
    {
        Comments=Comment.text;
        
    }
    
    if((Address.text==NULL)||[Address.text isEqual:@""])
    {
        address=@"";
    }
    else
    {
        address=Address.text;
        
    }
    NSLog(@"add %@",address);
    
    Countryid=country;
    
    Stateid=state;
    Cityid=city;
    
    NSLog(@"%d",[Cityid integerValue]);
    //  religion=Religion.text;
    
    if((Religion.text == NULL)||[Religion.text isEqual:@""])
    {
        religion=@"";
    }
    else
    {
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
    
    Areaid=area;
    
    if(NationId.text==NULL || [NationId.text isEqual:@""])
    {
        Nationid=@"";
    }
    else
    {
        Nationid=Nationality;
    }
    
    NSLog(@"nationid %@",Nationid);
    //optional
    
    EmergencyContactNo=@"";
    EmergencyContactName=@"";
    //Comments=@"";
    EmergencyContactRelation=@"";
    EmergencyContactAddress=@"";
    EmergencyContactCountryId=(NSString*)[NSNull null];
    EmergencyContactStateId=(NSString*)[NSNull null];
    EmergencyContactCityId=(NSString*)[NSNull null];
    Status=@"1";
    UId2=(NSString*)[NSNull null];
    PatientAlert=(NSString*)[NSNull null];
    
    NSString *alphabet  = @"!@#$%=&^*()_+abcdefghijklmnopqrstuvwxyz!@#$%^&ABCDEFGHIJKLMNOPQRSTUVWXZY!@#$%%^&*+0123456789";
    NSMutableString *s = [NSMutableString stringWithCapacity:20];
    for (NSUInteger i = 0U; i < 16; i++)
    {
        u_int32_t r = arc4random() % [alphabet length];
        unichar c = [alphabet characterAtIndex:r];
        [s appendFormat:@"%C", c];
    }
    Password=[NSString stringWithFormat:@"%@",s];
    NSLog(@"random string is %@",Password);
    
    
    if((alias.text == NULL)||[alias.text isEqual:@""])
    {
        Alias=@"";
    }
    else
    {
        Alias=alias.text;
    }
    
    if([Nationid isEqual:@""])
    {
        Nationid=(NSString*)[NSNull null];
    }
    else
    {
        [Nationid integerValue];
    }
    
    [Countryid integerValue];
    [Stateid integerValue];
    [Cityid integerValue];
    NSLog(@"email %@",EmailCheck);
    
    
    PatientRegistration=[[NSDictionary alloc]initWithObjectsAndKeys:Email,@"Email",Title,@"Title",Firstname,@"FirstName",Middlename,@"MiddleName",Lastname,@"LastName",dob,@"DateOfBirth",sex,@"Gender",Bloodgroup,@"BloodGroup",Fathername,@"FatherName",HusbandName,@"HusbandName",theDate,@"DORegistration",Contactno,@"ContactNo",address,@"Address",Countryid,@"CountryId",Stateid,@"StateId",Cityid,@"CityId",EmergencyContactNo,@"EmergencyContactNo",EmergencyContactName,@"EmergencyContactName",Comments,@"Comments",religion,@"Religion",EmergencyContactRelation,@"EmergencyContactRelation",EmergencyContactAddress,@"EmergencyContactAddress",EmergencyContactCountryId,@"EmergencyContactCountryId",EmergencyContactStateId,@"EmergencyContactStateId",EmergencyContactCityId,@"EmergencyContactCityId",Status,@"Status",ud1,@"UId1",UId2,@"UId2",PatientAlert,@"PatientAlert",Password,@"Password",Areaid,@"AreaId",Pincode,@"PinCode",Nationid,@"NationId",Alias,@"Alias", nil];
    
    NSLog(@"name %@",self.WebService->Get_PatientRegistraion=(NSMutableDictionary*)PatientRegistration);
    
    NSLog(@"sex is %@",sex);
    NSLog(@"sex is %d",[Countryid integerValue]);
    
    NSLog(@"sex is %d",[Stateid integerValue]);
    
    NSLog(@"sex is %@",Areaid );
    
    NSLog(@"sex is %d",[Pincode integerValue]);
    NSLog(@"alias %d",[AliasCheck integerValue]);
    
    
    if([Title isEqualToString:NULL]||(Firstname==NULL)||(Lastname ==NULL)||(dob==NULL )||[sex isEqualToString:NULL]||(Doregistration==NULL)||([Countryid integerValue]==0)||([Stateid integerValue]==0)|| ([Cityid integerValue]==0)||(Areaid ==NULL)||([Pincode integerValue]==0)||([AliasCheck integerValue]==1)||([EmailCheck isEqualToString:@"true"]))
    {
        
        alert = [[UIAlertView alloc] initWithTitle:@"Check" message:@"Mandatory(*)Fields Required" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        
        [alert show];
    }
    
    else
    {
        
        [self.WebService CallServicePatientRegistraion:@"http://192.168.1.202:81/PatientModule/PatientService.asmx/RegisterPatient" Object:NULL Handler:NULL];
        
        NSLog(@"webservice is %@",self.WebService.ptr);
        
        
        alert = [[UIAlertView alloc] initWithTitle:@"Patient Register Successfully" message:[NSString stringWithFormat:@"Patient Code:%@ \nPassword:%@", self.WebService.ptr,Password] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        
        [alert show];
        
    }
}
-(IBAction)ResetButton:(id)sender
{
    
    FirstName.text=@"";
    MiddleName.text=@"";
    LastName.text=@"";
    DOB.text=@"";
    BloodGroup.text=@"";
    FatherName.text=@"";
    email.text=@"";
    ContactNo.text=@"";
    Comment.text=@"";
    UId1.text=@"";
    alias.text=@"";
    Address.text=@"";
    AreaId.text=@"";
    CityId.text=@"";
    PinCode.text=@"";
    StateId.text=@"";
    CountryId.text=@"";
    
    
}
//-(IBAction)UpdatePicker:(id)sender
//{
//    
//    //UIDatePicker *picker = (UIDatePicker*)self.DOB.inputView;
//    //[DOB resignFirstResponder];
//    
//    DOB.text = [NSString stringWithFormat:@"%@",DatePicker.date];
//    NSDateFormatter  *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss +HHmm"];
//    NSDate  *myDate = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@",DOB.text]];
//    NSLog(@"%@", [dateFormatter stringFromDate:myDate]);
//    
//    NSDateFormatter  *anotherDateFormatter = [[NSDateFormatter alloc] init];
//    [anotherDateFormatter setDateFormat:@"dd/MM/yyyy"];
//    NSLog(@"%@", [anotherDateFormatter stringFromDate:myDate]);
//    
//    DOB.text =[anotherDateFormatter stringFromDate:myDate];
//    
//    DatePicker.hidden=YES;
//    done.hidden=YES;
//    
//    
//    
//}

//-(IBAction)donebtn:(id)sender
//{
//
//    if (pickerview_sex.hidden==FALSE)
//    {
//        [Sex setText:[NSString stringWithFormat:@"%@",[GenderList objectAtIndex:[pickerview_sex selectedRowInComponent:0]]]];
//        pickerview_sex.hidden=YES;
//        // done1.hidden=YES;
//    }
//
//    else if(pickerview_country.hidden==FALSE)
//    {
//        //[DOB setText:[NSString stringWithFormat:@"%@/%@/%@",[Date objectAtIndex:[pickerview selectedRowInComponent:0]],[Month objectAtIndex:[pickerview selectedRowInComponent:1]],[Year objectAtIndex:[pickerview selectedRowInComponent:2]]]];
//
//        [CountryId setText:[NSString stringWithFormat:@"%@",[Dict123 objectAtIndex:[pickerview_country selectedRowInComponent:0]]]];
//        pickerview_country.hidden=YES;
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
//
//}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
        return 1;
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
	NSString *returnStr = @"";
	
	// note: custom picker doesn't care about titles, it uses custom views
	if(pickerView==pickerview_country)
    {
        
        if(component==0)
        {
           // country=[NSString stringWithFormat:@"%@",[[Dict objectAtIndex:0]valueForKey:@"CountryId"]];
            //NSLog(@" country %@",country);
            returnStr=[Dict123 objectAtIndex:row];
            
        }
    }
    else if (pickerView==Pickerview_BloodGroup)
    {
        
        if(component==0)
        {
           // Bloodgroup=[NSString stringWithFormat:@"%@",[[bloodgroup objectAtIndex:0]valueForKey:@"name"]];
            
            returnStr=[Bloodgroup_view objectAtIndex:row];
            
        }
    }
    else if (pickerView==Pickerview_Religion)
    {
        
        if(component==0)
        {
           // religion=[NSString stringWithFormat:@"%@",[[ReligionDetail objectAtIndex:0]valueForKey:@"name"]];
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
    
//    else if (pickerView==pickerview_state)
//    {
//        if(component==0)
//        {
//            state=[NSString stringWithFormat:@"%@",[[State_Detail objectAtIndex:0]valueForKey:@"StateId"]];
//            returnStr=[View_StateID objectAtIndex:row];
//        }
//    }
    else if (pickerView==pickerview_city)
    {
        if(component==0)
        {
            //city=[NSString stringWithFormat:@"%@",[[City_Detail objectAtIndex:0]valueForKey:@"CityId"]];
            
            returnStr=[View_CityID objectAtIndex:row];
        }
    }
    else if (pickerView==pickerview_state)
    {
        if(component==0)
        {
           // state=[NSString stringWithFormat:@"%@",[[State_Detail objectAtIndex:0]valueForKey:@"StateId"]];
            
            returnStr=[View_StateID objectAtIndex:row];
        }
    }

    else if (pickerView==pickerview_area)
    {
        if(component==0)
        {
           // Pincode=[NSString stringWithFormat:@"%@",[[Area_Detail objectAtIndex:0]valueForKey:@"PinCode"]];
            //area=[NSString stringWithFormat:@"%@",[[Area_Detail objectAtIndex:0]valueForKey:@"AreaId"]];
            returnStr=[View_Area objectAtIndex:row];
        }
    }
    
    else if (pickerView==Pickerview_Nationality)
    {
//        if (searching)
//        {
//            return [copyListOfItems objectAtIndex:row];
//        }else
        {
            return [Nationality_ID objectAtIndex:row];
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
        return [View_CityID count];
        
    }
    else if (pickerView==pickerview_area)
    {
        return [View_Area count];
        
    }
    else if (pickerView==Pickerview_Nationality)
    {
//        if (searching)
//        {
//            return copyListOfItems.count;
//        }
//        else
        {
            return Nationality_ID.count;
        }

        
    }
    else
    {
        return 0;
    }
    
}


- (void)tapInPickerView:(UIGestureRecognizer *)sender
{
    
    if (pickerview_sex.hidden==FALSE)
    {
        [Sex setText:[NSString stringWithFormat:@"%@",[GenderList objectAtIndex:[pickerview_sex selectedRowInComponent:0]]]];
        pickerview_sex.hidden=YES;
        // done1.hidden=YES;
    }
    else if(Pickerview_Salutations.hidden==FALSE)
    {
        [Salutation setText:[NSString stringWithFormat:@"%@",[Title_view objectAtIndex:[Pickerview_Salutations selectedRowInComponent:0]]]];
        Pickerview_Salutations.hidden=YES;
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
            Sex.font = [UIFont systemFontOfSize:10.0];
            
            Sex.text=[NSString stringWithFormat:@"--Select Sex--"];
            
        }
        
        // PinCode.text=Pincode;
        
    }
    else if(Pickerview_BloodGroup.hidden==FALSE)
    {
        [BloodGroup setText:[NSString stringWithFormat:@"%@",[Bloodgroup_view objectAtIndex:[Pickerview_BloodGroup selectedRowInComponent:0]]]];
        Pickerview_BloodGroup.hidden=YES;
        // done4.hidden=YES;
        NSLog(@"sate %@",BloodGroup);
        // PinCode.text=Pincode;
        
    }
    
    else if(Pickerview_Religion.hidden==FALSE)
    {
        [Religion setText:[NSString stringWithFormat:@"%@",[Religion_view objectAtIndex:[Pickerview_Religion selectedRowInComponent:0]]]];
        Pickerview_Religion.hidden=YES;
        // done4.hidden=YES;
        NSLog(@"sate %@",Religion);
        // PinCode.text=Pincode;
        
    }
    
    
    
    else if(Pickerview_Nationality.hidden==FALSE)
    {
        [NationId setText:[NSString stringWithFormat:@"%@",[Nationality_ID objectAtIndex:[Pickerview_Nationality selectedRowInComponent:0]]]];
        Pickerview_Nationality.hidden=YES;
        // done4.hidden=YES;
        NSLog(@"sate %@",NationId);
        // PinCode.text=Pincode;
        
    }
    
    else if(pickerview_country.hidden==FALSE)
    {
        //[DOB setText:[NSString stringWithFormat:@"%@/%@/%@",[Date objectAtIndex:[pickerview selectedRowInComponent:0]],[Month objectAtIndex:[pickerview selectedRowInComponent:1]],[Year objectAtIndex:[pickerview selectedRowInComponent:2]]]];
        
        [CountryId setText:[NSString stringWithFormat:@"%@",[Dict123 objectAtIndex:[pickerview_country selectedRowInComponent:0]]]];
        pickerview_country.hidden=YES;
        
        StateId.text=@"";
        CityId.text=@"";
        AreaId.text=@"";
        PinCode.text=@"";
        
        
        
        // done2.hidden=YES;
    }
    //    else if(pickerview_state.hidden==FALSE)
    //    {
    //        [StateId setText:[NSString stringWithFormat:@"%@",[View_StateID objectAtIndex:[pickerview_state selectedRowInComponent:0]]]];
    //        pickerview_state.hidden=YES;
    //        //done3.hidden=YES;
    //        NSLog(@"sate %@",StateId);
    //
    //    }
    
    else if(pickerview_city.hidden==FALSE)
    {
        [CityId setText:[NSString stringWithFormat:@"%@",[View_StateID objectAtIndex:[pickerview_city selectedRowInComponent:0]]]];
        pickerview_city.hidden=YES;
        // done4.hidden=YES;
        NSLog(@"sate %@",CityId);
        
    }
    else if(pickerview_area.hidden==FALSE)
    {
        [AreaId setText:[NSString stringWithFormat:@"%@",[View_Area objectAtIndex:[pickerview_area selectedRowInComponent:0]]]];
        pickerview_area.hidden=YES;
        // done4.hidden=YES;
        NSLog(@"sate %@",AreaId);
        PinCode.text=Pincode;
        
    }
    
    
}

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
 
   else if (pickerView==pickerview_state)
   {
       
       [View_StateID objectAtIndex:[pickerview_state selectedRowInComponent:0]];
       NSLog(@"Selected Color: %@. Index of selected color: %i", [State_Detail objectAtIndex:row], row);
       
       state=[NSString stringWithFormat:@"%@",[[State_Detail objectAtIndex:row]valueForKey:@"StateId"]];
       NSLog(@"row %@",state);
       [StateId setText:[[State_Detail objectAtIndex:row]valueForKey:@"Name"]];
      // state=[NSString stringWithFormat:@"%@",[[State_Detail objectAtIndex:row] valueForKey:@"StateId"]];
    //   NSLog(@"stae is %@",state);
       if(![[NSString stringWithFormat:@"%@",[[AreaList objectAtIndex:0] valueForKey:@"StateId"]]isEqualToString:state])
       {
           AreaId.text=@"--select Area--";
           CityId.text=@"--select City--";
           PinCode.text=@"";
           city=@"0";
       }

   }
    else if (pickerView==pickerview_city)
    {
        
        [View_CityID objectAtIndex:[pickerview_city selectedRowInComponent:0]];
        NSLog(@"Selected Color: %@. Index of selected color: %i", [State_Detail objectAtIndex:row], row);
        
        city=[NSString stringWithFormat:@"%@",[[City_Detail objectAtIndex:row]valueForKey:@"CityId"]];
        NSLog(@"row %@",city);
        [CityId setText:[[City_Detail objectAtIndex:row]valueForKey:@"Name"]];
        if(![[NSString stringWithFormat:@"%@",[[AreaList objectAtIndex:0]valueForKey:@"CityId"]] isEqualToString:city])
        {
            AreaId.text=@"--Select Area--";
            PinCode.text=@"";
            
        }
//        else
//        {
//            AreaId.text=@"--Select Area--";
//            PinCode.text=@"";
//
//            
//        }

    }
    else if (pickerView==pickerview_area)
    {
        [View_Area objectAtIndex:[pickerview_city selectedRowInComponent:0]];
        NSLog(@"Selected Color: %@. Index of selected color: %i", [Area_Detail objectAtIndex:row], row);
        
        area=[NSString stringWithFormat:@"%@",[[Area_Detail objectAtIndex:row]valueForKey:@"AreaId"]];
        NSLog(@"row %@",area);
        Pincode=[NSString stringWithFormat:@"%@",[[Area_Detail objectAtIndex:row]valueForKey:@"PinCode"]];
        NSLog(@"row %@",Pincode);
       // [AreaId setText:area];
         [AreaId setText:[NSString stringWithFormat:@"%@",[View_Area objectAtIndex:row]]];
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
    else if (pickerView==Pickerview_Nationality)
    {
        [Nationality_ID objectAtIndex:[Pickerview_Nationality selectedRowInComponent:0]];
        NSLog(@"Selected Color: %@. Index of selected color: %i", [Nationality_ID objectAtIndex:row], row);
        Nationality=[NSString stringWithFormat:@"%@",[[Nationality_View objectAtIndex:row]valueForKey:@"NationId"]];
          [NationId setText:[NSString stringWithFormat:@"%@",[Nationality_ID objectAtIndex:row]]];
        NSLog(@"row %@",Nationality);
        
    }
    
}
//#pragma mark -
//#pragma mark UITextViewDelegate Methods
//- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
//{
//    /*--
//     * This method is called just before the textView becomes active
//     * Return YES to let the textView become the First Responder otherwise return NO
//     * Use this method to give the textView a green colored background
//     --*/
//    View_Tag=textView.tag;
//
//    NSLog(@"textViewShouldBeginEditing:");
//    if(textView.tag==13)
//    {
//        tool.hidden=NO;
//        Pickerview_Salutations.hidden=YES;
//        DatePicker.hidden=YES;
//        pickerview_sex.hidden=YES;
//        Pickerview_BloodGroup.hidden=YES;
//        Pickerview_Religion.hidden=YES;
//        Pickerview_Nationality.hidden=YES;
//        pickerview_area.hidden=YES;
//        pickerview_city.hidden=YES;
//        pickerview_state.hidden=YES;
//        pickerview_country.hidden=YES;
//
//    }
//    if(textView.tag==17)
//    {
//        tool.hidden=NO;
//        Pickerview_Salutations.hidden=YES;
//        DatePicker.hidden=YES;
//        pickerview_sex.hidden=YES;
//        Pickerview_BloodGroup.hidden=YES;
//        Pickerview_Religion.hidden=YES;
//        Pickerview_Nationality.hidden=YES;
//        pickerview_area.hidden=YES;
//        pickerview_city.hidden=YES;
//        pickerview_state.hidden=YES;
//        pickerview_country.hidden=YES;
//    }
//
//    return YES;
//}
//
//- (void)textViewDidBeginEditing:(UITextView *)textView
//{
//    /*--
//     * This method is called when the textView becomes active, or is the First Responder
//     --*/
//
//    NSLog(@"textViewDidBeginEditing:");
//    textView.backgroundColor = [UIColor whiteColor];
//}
//
//- (BOOL)textViewShouldEndEditing:(UITextView *)textView
//{
//    /*--
//     * This method is called just before the textView is no longer active
//     * Return YES to let the textView resign first responder status, otherwise return NO
//     * Use this method to turn the background color back to white
//     --*/
//    NSLog(@"textViewShouldEndEditing:");
//    textView.backgroundColor = [UIColor whiteColor];
//    return YES;
//}
//
//- (void)textViewDidEndEditing:(UITextView *)textView
//{
//    /*--
//     * This method is called when the textView is no longer active
//     --*/
//
//    NSLog(@"textViewDidEndEditing:");
//}
//
//- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
//{
//    NSLog(@"textView:shouldChangeTextInRange:replacementText:");
//
//    NSLog(@"textView.text.length -- %i",textView.text.length);
//    NSLog(@"text.length         -- %i",text.length);
//    //NSLog(@"textView.text.length + text.length-- %i",textView.text.length + text.length);
//
//    /*--
//     * This method is called just before text in the textView is displayed
//     * This is a good place to disallow certain characters
//     * Limit textView to 140 characters
//     * Resign keypad if done button pressed comparing the incoming text against the newlineCharacterSet
//     * Return YES to update the textView otherwise return NO
//     --*/
//
////    NSCharacterSet *doneButtonCharacterSet = [NSCharacterSet newlineCharacterSet];
////    NSRange replacementTextRange = [text rangeOfCharacterFromSet:doneButtonCharacterSet];
////    NSUInteger location1 = replacementTextRange.location;
////
////    if (textView.text.length + text.length > 140){//140 characters are in the textView
////        if (location1 != NSNotFound){ //Did not find any newline characters
////            [textView resignFirstResponder];
////        }
////        return NO;
////    }
////    else if (location1 != NSNotFound){ //Did not find any newline characters
////        [textView resignFirstResponder];
////        return NO;
////    }
//
//    return YES;
//
//}
//
//- (void)textViewDidChange:(UITextView *)textView
//{
//    NSLog(@"textViewDidChange:");
//    //This method is called when the user makes a change to the text in the textview
//}
//
//- (void)textViewDidChangeSelection:(UITextView *)textView
//{
//    NSLog(@"textViewDidChangeSelection:------->>");
//    //This method is called when a selection of text is made or changed
//}
//
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

@end
