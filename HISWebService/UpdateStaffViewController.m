//
//  UpdateStaffViewController.m
//  HISWebService
//
//  Created by Rahul Sharma on 14/06/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import "UpdateStaffViewController.h"
#import "StaffRegistrationViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface UpdateStaffViewController ()

@end

@implementation UpdateStaffViewController
@synthesize WebService=_WebService,DOB;

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
     searching = NO;
     searchResultArr =[[NSMutableArray alloc]init];
    GenderList=[NSMutableArray arrayWithObjects:@"Male",@"Female", nil];
    
    // Do any additional setup after loading the view from its nib.
    self.WebService=[[WebService alloc]init];
    UIView *view1=[[UIView alloc]initWithFrame:CGRectMake(0,64,320,50)];
    view1.backgroundColor=[UIColor whiteColor];
    [view1 setIsAccessibilityElement:YES];
    view1.userInteractionEnabled=YES;
    view1.autoresizingMask = UIViewAutoresizingFlexibleWidth ;
    
    view1.layer.borderColor = [UIColor grayColor].CGColor;
    view1.layer.borderWidth = 2.0f;
    [self.view addSubview:view1];

    scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0,124,320,540)];
    
    [scrollview setContentSize:CGSizeMake(320, 1300)];
    
    scrollview.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    scrollview.autoresizesSubviews = YES;
    
    scrollview.scrollEnabled = YES;
    
    scrollview.directionalLockEnabled = YES;
    
    scrollview.showsVerticalScrollIndicator = YES;
    
    scrollview.showsHorizontalScrollIndicator = YES;
    
    scrollview.autoresizesSubviews = YES;
    scrollview.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:scrollview];
    
    
   
    
    UILabel *StaffSearch=[[UILabel alloc]initWithFrame:CGRectMake(20,10,120,30)];
    StaffSearch.font = [UIFont systemFontOfSize:15.0];
    StaffSearch.backgroundColor=[UIColor whiteColor];
    [StaffSearch setText:@"Search Staff:"];
    [view1 addSubview:StaffSearch];
    
    Staffname=[[UITextField alloc]initWithFrame:CGRectMake(130,10,170,30)];
    Staffname.font = [UIFont boldSystemFontOfSize:15.0];
    Staffname.tag=1;
    //the horizontal alignment of the text
    Staffname.textAlignment = NSTextAlignmentLeft;
    Staffname.borderStyle = UITextBorderStyleBezel;
    Staffname.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
    Staffname.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    Staffname.delegate =self;
    [view1 addSubview:Staffname];
    
    [Staffname addTarget:self action:@selector(SearchPatients:)forControlEvents:UIControlEventEditingChanged];
    
    [self.view addSubview:tool];
    
     tool.hidden=YES;
}
//- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar                      // return NO to not become first responder
//{
//    table_SearchStaff=[[UITableView alloc]initWithFrame:CGRectMake(10,44,170,250)style:UITableViewStylePlain];
//    table_SearchStaff.delegate=self;
//    table_SearchStaff.dataSource=self;
//    table_SearchStaff.layer.borderWidth = 2.0;
//    table_SearchStaff.layer.borderColor = [UIColor grayColor].CGColor;
//    [self.view addSubview:table_SearchStaff];
//   
//
//    return YES;
//}
//- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar                     // called when text starts editing
//{
//    //searching = YES;
//    [searchBar setShowsCancelButton:YES animated:YES];
//    searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
//
//}
//- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar                        // return NO to not resign first responder
//{
//     return YES;
//}
//- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
//{
//    
//}
//- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
//    
//    searching = NO;
//    searchBar.text=@"";
//    [searchBar setShowsCancelButton:NO animated:YES];
//    [searchBar resignFirstResponder];
//    [table_SearchStaff reloadData];
//    table_SearchStaff.allowsSelection = YES;
//    table_SearchStaff.scrollEnabled = YES;
//}
//- (void)searchBar:(UISearchBar *)theSearchBar textDidChange:(NSString *)searchText {
//    
//   // myView.hidden = YES;
//    //Remove all objects first.
//    [searchResultArr removeAllObjects];
//    
//    if([searchText length] > 0) {
//        
//        searching = YES;
//        table_SearchStaff.scrollEnabled = YES;
//        [self searchTableView];
//    }
//    else {
//        
//        searching = NO;
//        table_SearchStaff.scrollEnabled = NO;
//    }
//    
//    [table_SearchStaff reloadData];
//}
//- (void) searchTableView
//{
//    
//    NSString *searchText = search.text;
//    for (NSString *TempResult in SearchStaffName)
//    {
//        NSRange titleResultsRange = [TempResult rangeOfString:searchText options:NSCaseInsensitiveSearch];
//        
//        if (titleResultsRange.length > 0)
//            [searchResultArr addObject:TempResult];
//    }
//    //searchResultArr = nil;
//    NSLog(@"result search==%@",searchResultArr);
//}


-(IBAction)SearchPatients:(id)sender
{
    [table_SearchStaff removeFromSuperview];
    
    StaffName  =Staffname.text;
    NSLog(@"patname %@",StaffName);
   // Count=@"0";
    //[Staffname resignFirstResponder];
    NSLog(@"patname %@",self.WebService->patientname=StaffName);
    
  //  NSLog(@"count %@",self.WebService->count=Count);
    
//    [self.WebService CallServiceStaffNames:@"http://192.168.1.202:81/StaffModule/StaffService.asmx/SearchStaffAll" Object:NULL Handler:NULL];
//    
//      NSLog(@"staff is %@",self.WebService->ptr1);
    
    
    [self.WebService CallServiceStaffNames:@"http://192.168.1.202:81/StaffModule/StaffService.asmx/SearchStaffAll" Object:NULL Handler:NULL];
    
    NSLog(@"staff is %@",self.WebService->ptr1);
    
    SearchStaffCode=[[NSMutableArray alloc]init];
    SearchStaffName=[[NSMutableArray alloc]init];
    NSLog(@"arr is %@",self.WebService->ptr1);
    SearchStaffCode=(NSMutableArray*)[self.WebService->ptr1 valueForKey:@"StaffCode"];
    NSLog(@"item is %@",   SearchStaffCode);
    SearchStaffName  =(NSMutableArray *)[self.WebService->ptr1 valueForKey:@"StaffName"];
    NSLog(@"item is %@",SearchStaffName);

    table_SearchStaff=[[UITableView alloc]initWithFrame:CGRectMake(130,105,170,250)style:UITableViewStylePlain];
    table_SearchStaff.delegate=self;
    table_SearchStaff.dataSource=self;
    table_SearchStaff.layer.borderWidth = 2.0;
    table_SearchStaff.layer.borderColor = [UIColor grayColor].CGColor;
    [self.view addSubview:table_SearchStaff];

    
//    UIBarButtonItem *barbutton=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(donebtn:)];
//    barbutton.tintColor=[UIColor blackColor];
//    
//        
//    //  barbutton.autoresizesSubviews = YES;
//    
//    UIBarButtonItem *fixedSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
//    //   UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
//    
//    
//    //    if(orientation == UIInterfaceOrientationPortrait)
//    //    {
//    [fixedSpace setWidth:250];
//    
//    //    }
//    //    else if(orientation == UIInterfaceOrientationLandscapeLeft)
//    //
//    //    {
//    //    [fixedSpace setWidth:400];
//    //    }
//    
//    NSMutableArray* button =[[NSMutableArray alloc]initWithCapacity:2];
//    [button addObject:fixedSpace];
//    [button addObject:barbutton];
//    //tool.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
//    // tool.autoresizesSubviews = YES;
//    
//    
//    if ([[UIScreen mainScreen] bounds].size.height >480)
//    {
//        tool=[[UIToolbar alloc]initWithFrame:CGRectMake(0,288,320,44)];
//        
//        pickerview=[[UIPickerView alloc]initWithFrame:CGRectMake(0,332,320,216)];
//        
//    }
//    else
//    {
//        tool=[[UIToolbar alloc]initWithFrame:CGRectMake(0,225,320,50)];
//        
//        pickerview=[[UIPickerView alloc]initWithFrame:CGRectMake(0,270,320,50)];
//        
//    }
//    tool.autoresizingMask =UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
//    //  tool.autoresizesSubviews = YES;
//    pickerview.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin ;
//    //  pickerview.autoresizesSubviews = YES;
//    
//    pickerview.dataSource=self;
//    pickerview.delegate=self;
//    pickerview.showsSelectionIndicator=YES;
//    [tool setBarStyle:UIBarStyleBlackOpaque];
//    tool.backgroundColor=[UIColor blackColor];
//    tool.userInteractionEnabled=YES;
//    [tool setItems:button animated:NO];
//    
//    [self.view addSubview:tool];
//    
//    [self.view addSubview:pickerview];
//    singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapInPickerView1:)];
//    [singleTap setNumberOfTapsRequired:1];
//    [singleTap setNumberOfTouchesRequired:1];
//    [pickerview addGestureRecognizer:singleTap];
//    
    
//    SearchPatientCode=[[NSMutableArray alloc]init];
//    SearchPatientName=[[NSMutableArray alloc]init];
//    NSLog(@"arr is %@",self.WebService->ptr1);
//    SearchPatientCode=(NSMutableArray*)[self.WebService->ptr1 valueForKey:@"StaffCode"];
//    NSLog(@"item is %@",   SearchPatientCode);
//    SearchPatientName  =(NSMutableArray *)[self.WebService->ptr1 valueForKey:@"StaffName"];
//    NSLog(@"item is %@",SearchPatientName);
//
//    //NSArray *myStrings = [[NSArray alloc] initWithObjects:first, second, third, fourth, fifth, nil];
////    NSString *joinedString = [myStrings componentsJoinedByString:@"|"];
//    // release myStrings if not using ARC.
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
//        
//        
//    }
//    NSLog(@"arr %d",AppendArray.count);
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
    //return YES;
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
   // [patientname resignFirstResponder];
    [NationId resignFirstResponder];
    // pickerview.hidden=YES;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    text_tag=textField.tag;
    tool.hidden=NO;
    
    if (textField.tag==1)
    {
        tool.hidden=YES;
    }
    if (textField.tag==2)
    {
        check=5;
        tool.hidden=YES;
        [email resignFirstResponder];
        [Salutation resignFirstResponder];
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
        if ([[UIScreen mainScreen] bounds].size.height >480)
        {
            objYHCPickerView = [[PickerView alloc] initWithFrame:CGRectMake(0, 100, 320, 480)withNSArray:Medical_name];
        }
        else
        {
            objYHCPickerView = [[PickerView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)withNSArray:Medical_name];
            
            
        }
        NSLog(@"view %f",self.view.frame.origin.y);
        CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y);
        [scrollview setContentOffset:scrollPoint animated:YES];
        objYHCPickerView.delegate = self;
        [self.view addSubview:objYHCPickerView];
        [objYHCPickerView showPicker];
        
        //pickerview_medical.hidden=YES;
    }
    
//    if (textField.tag==2)
//    {
//        NSArray *items=[tool items];
//        UIBarButtonItem *Prev=[items objectAtIndex:0];
//        Prev.enabled=NO;
//        pickerview_addnewstaff=[[UIPickerView alloc]initWithFrame:CGRectMake(0,332,320,216)];
//        
//        pickerview_addnewstaff.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
//        
//        pickerview_addnewstaff.dataSource=self;
//        pickerview_addnewstaff.delegate=self;
//        pickerview_addnewstaff.showsSelectionIndicator=YES;
//        [self.view addSubview:pickerview_addnewstaff];
//        
//    }
//    else
//    {
//        NSArray *items=[tool items];
//        UIBarButtonItem *Prev=[items objectAtIndex:0];
//        Prev.enabled=YES;
//    }
//    
    if (textField.tag==3)
    {
        NSArray *items=[tool items];
        UIBarButtonItem *Prev=[items objectAtIndex:0];
        Prev.enabled=NO;
        [medical resignFirstResponder];
        
        
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

    if (textField.tag==8)
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
    
    if(textField.tag==9)
    {
        tool.hidden=NO;
        pickerview_sex=[[UIPickerView alloc]initWithFrame:CGRectMake(0,332,320,216)];
        //     PickerTag=pickerview_sex.tag=3;
        pickerview_sex.autoresizingMask = UIViewAutoresizingFlexibleWidth ;
        pickerview_sex.dataSource=self;
        pickerview_sex.delegate=self;
        //pickerview_sex.hidden=NO;
        pickerview_sex.showsSelectionIndicator=YES;
        [self.view addSubview:pickerview_sex];
        
    }
    if(textField.tag==10)
    {
       // NSLog(@"des is %@", self.WebService->DesignationId=roleid);
        
        //[self.WebService CallServiceDesgination:@"http://192.168.1.202:81//CommonMasterModule/UIService.asmx/GetDesignation" Object:NULL Handler:NULL];
      //  designation=(NSMutableArray*)self.WebService->ptr1;
      //  designation_view=(NSMutableArray*)[designation valueForKey:@"Name"];
        NSLog(@"med is %@",designation);
        NSLog(@"med is %@",designation_view);
        
        pickerview_designation=[[UIPickerView alloc]initWithFrame:CGRectMake(0,332,320,216)];
        
        
        pickerview_designation.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        
        pickerview_designation.dataSource=self;
        pickerview_designation.delegate=self;
        pickerview_designation.showsSelectionIndicator=YES;
        [self.view addSubview:pickerview_designation];
    }
    if (textField.tag==13)
    {
        Pickerview_BloodGroup=[[UIPickerView alloc]initWithFrame:CGRectMake(0,332,320,216)];
        Pickerview_BloodGroup.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin ;
        
        Pickerview_BloodGroup.dataSource=self;
        Pickerview_BloodGroup.delegate=self;
        Pickerview_BloodGroup.showsSelectionIndicator=YES;
        [self.view addSubview:Pickerview_BloodGroup];
    }
    if (textField.tag==14)
    {
        Pickerview_Religion=[[UIPickerView alloc]initWithFrame:CGRectMake(0,332,320,216)];
        
        Pickerview_Religion.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin ;
        Pickerview_Religion.dataSource=self;
        Pickerview_Religion.delegate=self;
        Pickerview_Religion.showsSelectionIndicator=YES;
        [self.view addSubview:Pickerview_Religion];
    }
    if (textField.tag==19)
    {
        check=4;
        tool.hidden=YES;
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
        
        if ([[UIScreen mainScreen] bounds].size.height >480)
        {
            objYHCPickerView = [[PickerView alloc] initWithFrame:CGRectMake(0, 100, 320, 480)withNSArray:SpecializationName];
        }
        else
        {
            objYHCPickerView = [[PickerView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)withNSArray:SpecializationName];
            
            
        }
        NSLog(@"view %f",self.view.frame.origin.y);
        CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y);
        [scrollview setContentOffset:scrollPoint animated:YES];
        
        objYHCPickerView.delegate = self;
        [self.view addSubview:objYHCPickerView];
        [objYHCPickerView showPicker];
        
        //pickerview_medical.hidden=YES;
    }
    
    if (textField.tag==20)
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
    
    if (textField.tag==22)
    {
        check=2;
        [email resignFirstResponder];
        [FirstName resignFirstResponder];
        [MiddleName resignFirstResponder];
        [LastName resignFirstResponder];
        [DOB resignFirstResponder];
        [FatherName resignFirstResponder];
        [ContactNo resignFirstResponder];
        [comments  resignFirstResponder];
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
    
    if (textField.tag==23)
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
        }
    }
    if (textField.tag==24)
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
    if (textField.tag==25)
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
        
       // pickerview_country.hidden=NO;
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
    
    return YES;
    
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    //  [scrollview setContentOffset:CGPointZero animated:YES];
    
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)aTextField
{
    if (aTextField.tag==8)
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
        if([EmailService isEqualToString:[NSString stringWithFormat:@"%@",email.text]])
        {
            
            
        }

       else if ([emailTest evaluateWithObject:email.text] == YES)
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
        
        if (textField.tag>=7)
        {
            NSLog(@"view %f",self.view.frame.origin.y);
            CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y);
            [scrollview setContentOffset:scrollPoint animated:YES];
        }
    }
    else
    {
        if (textField.tag>=4)
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
    
    if (textField.tag==8)
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
    if(textField == medical)
    {
        [textField resignFirstResponder];
        // NationId.inputView=Pickerview_Nationality;
        
    }
//    if(textField == AddnewStaff)
//    {
//        textField.inputView=pickerview_addnewstaff;
//        
//        
//    }
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
    if(textField == Designation)
    {
        textField.inputView=pickerview_designation;
        
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
    if(textField ==Specialization)
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

//- (void)tapInPickerView1:(UIGestureRecognizer *)sender
//{
//    
// //   [patientname setText:[NSString stringWithFormat:@"%@",[SearchPatientCode objectAtIndex:[pickerview selectedRowInComponent:0]]]];
//    NSLog(@"country id %@",patientname);
//    // pickerview.hidden=YES;
//    //  tool.hidden=YES;
//    [self donebtn:nil];
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
        
        NSLog(@"There are %d days in between the two dates. and month %d and year %d", days,months,year);
        
        DOB.text=[NSString stringWithFormat:@"%d",year];
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
    else if (check==4)
    {
        if(row==-1)
        {
            Specialization.text=text;
        }
        else
        {
            Specialization.text=text;
            SpecializationAlert=[NSString stringWithFormat:@"%@",[[SpecializationArr objectAtIndex:row]valueForKey:@"id"]];
            NSLog(@"nation id %@",SpecializationAlert);
            
            // NSDictionary *specializationval=[[NSDictionary alloc]initWithObjectsAndKeys:SpecializationAlert, nil];
            [specializationarr addObject:SpecializationAlert];
            NSLog(@"spec %@",specializationarr);
            

        }
    }
    else if (check==5)
    {
        if(row==-1)
        {
            medical.text=text;
        }
        else
        {
            medical.text=text;
            MedicalFacility=[NSString stringWithFormat:@"%@",[[Medical_Facility objectAtIndex:row]valueForKey:@"LocationId"]];
            NSLog(@"nation id %@",MedicalFacility);
            
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
//    if(text_tag==2)
//    {
//        //[RoleName objectAtIndex:[pickerview_medical selectedRowInComponent:0]];
//        // NSLog(@"Selected Color: %@. Index of selected color: %i", [RoleName objectAtIndex:[pickerview_addnewstaff selectedRowInComponent:0]], row);
//        roleid=[NSString stringWithFormat:@"%@",[[Add_New_staff objectAtIndex:[pickerview_addnewstaff selectedRowInComponent:0]]valueForKey:@"RoleId"]];
//        rolename=[NSString stringWithFormat:@"%@",[[Add_New_staff objectAtIndex:[pickerview_addnewstaff selectedRowInComponent:0]]valueForKey:@"RoleName"]];
//        AddnewStaff.text=rolename;
//        [AddnewStaff resignFirstResponder];
//        tool.hidden=YES;
//    }
    if(text_tag==3)
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
    else if (text_tag==8)
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
        else if (age_button.selected)
        {
            
            
            
        }
        [DOB resignFirstResponder ];
        //DatePicker.hidden=YES;
        tool.hidden=YES;
    }
    else if(text_tag==9)
    {
        [Sex setText:[NSString stringWithFormat:@"%@",[GenderList objectAtIndex:[pickerview_sex selectedRowInComponent:0]]]];
        //   pickerview_sex.hidden=YES;
        [Sex resignFirstResponder ];
        
        tool.hidden=YES;
    }
    else if (text_tag==10)
    {
        //[designation_view objectAtIndex:[pickerview_designation selectedRowInComponent:0]];
        // NSLog(@"Selected Color: %@. Index of selected color: %i", [designation_view objectAtIndex:row], row);
        designation_name=[NSString stringWithFormat:@"%@",[[designation objectAtIndex:[pickerview_designation selectedRowInComponent:0]]valueForKey:@"DesignationId"]];
        // tag=[NSString stringWithFormat:@"%d",++row];
        //  tag =++row;
        NSLog(@"row %@",designation_name);
        Designation.text=[[designation objectAtIndex:[pickerview_designation selectedRowInComponent:0]]valueForKey:@"Name"];
        [Designation resignFirstResponder];
        tool.hidden=YES;
        // tag=[NSString stringWithFormat:@"%d",++row];
        //  tag =++row;
    //    NSLog(@"row %@",roleid);
        
        
    }
    else if (text_tag==25)
    {
        [CountryId setText:[NSString stringWithFormat:@"%@",[Dict123 objectAtIndex:[pickerview_country selectedRowInComponent:0]]]];
        //pickerview_country.hidden=YES;
        
        StateId.text=@"--Select State--";
        CityId.text=@"--Select City--";
        AreaId.text=@"--Select Area--";
        PinCode.text=@"";
        [CountryId resignFirstResponder];
        
        //pickerview_country.hidden=YES;
        tool.hidden=YES;
        
    }
    else if (text_tag==23)
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
    else if (text_tag==14)
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
    else if (text_tag==13)
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
-(IBAction)donebtn:(id)sender
{
    for (UIView* subView in scrollview.subviews)
    {
        if ([subView isKindOfClass:[UITextField class]])
            [subView removeFromSuperview];
        
    }
    
//    if(pickerview.hidden==FALSE)
//    {
//       // [patientname setText:[NSString stringWithFormat:@"%@",[SearchPatientCode objectAtIndex:[pickerview selectedRowInComponent:0]]]];
//        //NSLog(@"dob %@",DOB);
//    }
//    
//   // pickerview.hidden=YES;
    //tool.hidden=NO;
    //StaffCode=Staffname.text;
    
       
    NSLog(@"patcode=%@",self.WebService->Staff_id=Staffid);
         
    [self.WebService CallServiceStaffDetailsWithRoleID:@"http://192.168.1.202:81/StaffModule/StaffService.asmx/GetUserRoleId" Object:NULL Handler:NULL];
    
    NSString *role_id=[NSString stringWithFormat:@"%@",self.WebService.ptr];
    
    NSLog(@"hello=%@",role_id);
    
    [self.WebService CallServiceStaffDetailsWithDesignation:@"http://192.168.1.202:81/StaffModule/StaffService.asmx/GetUserDesignation" Object:NULL Handler:NULL];
    
    
    NSString *designation_id=[NSString stringWithFormat:@"%@",self.WebService.ptr];
    
    NSLog(@"hello=%@",designation_id);
    
    
    [self.WebService CallServiceStaffDetails:@"http://192.168.1.202:81/StaffModule/StaffService.asmx/GetStaffDetails" Object:NULL Handler:NULL];
    NSLog(@"hello=%@",self.WebService->ptr1);

    
    Patient_detail=(NSMutableArray*)self.WebService->ptr1;
    
    [self CallService:@"LocationId"];
    NSString *Location = [NSString stringWithFormat:@"%@",StaffDetails];
    NSLog(@"Location is %@",Location);
    
    
    NSLog(@"patdet %@",Patient_detail);
    
    
    UILabel *Staffcode=[[UILabel alloc]initWithFrame:CGRectMake(10,10,140,30)];
    Staffcode.font = [UIFont systemFontOfSize:12.0];
    Staffcode.backgroundColor=[UIColor whiteColor];
    [Staffcode setText:@"Staff Code:"];
    [scrollview addSubview:Staffcode];
    
    UILabel *StaffcodeVal=[[UILabel alloc]initWithFrame:CGRectMake(150,10,150,30)];
    StaffcodeVal.font =[UIFont boldSystemFontOfSize:12.0];
    StaffcodeVal.backgroundColor=[UIColor whiteColor];
    [self CallService:@"StaffCode"];
    StaffcodeVal.text = [NSString stringWithFormat:@"%@",StaffDetails];
    
    NSLog(@"item is %@",StaffcodeVal.text);
    //[PatCodeVal setText:arr3];
    [scrollview addSubview:StaffcodeVal];
    
    UILabel *DORegistration_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,50,140,30)];
    [DORegistration_lbl setText:@"DORegistration *"];
    DORegistration_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:DORegistration_lbl];
    
    DORegistration=[[UITextField alloc]initWithFrame:CGRectMake(150,50,150,30)];
    DORegistration.font = [UIFont boldSystemFontOfSize:12.0];
    //DORegistration.placeholder = @"<enter text>";
    
    DORegistration.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    DORegistration.delegate =self;
    [self CallService:@"DORegistration"];
    //DORegistration.text=[NSString stringWithFormat:@"%@",StaffDetails];
    
    
    [scrollview addSubview:DORegistration];
    
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
    myDate = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@",StaffDetails]];
    NSLog(@"%@", [dateFormatter stringFromDate:myDate]);
    
    anotherDateFormatter = [[NSDateFormatter alloc] init];
    [anotherDateFormatter setDateFormat:@"dd/MM/yyyy HH:mm"];
    NSLog(@"%@", [anotherDateFormatter stringFromDate:myDate]);
    DORegistration.text=[anotherDateFormatter stringFromDate:myDate];
    theDate=DORegistration.text;

    
    
    
    UILabel *MedicalFacility_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,90,140,30)];
    [MedicalFacility_lbl setText:@"Medical Facility:"];
    MedicalFacility_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:MedicalFacility_lbl];
    
    medical =[[UITextField alloc]initWithFrame:CGRectMake(150,90,150,30)];
    medical.tag=2;
    medical.borderStyle = UITextBorderStyleLine;
    medical.font = [UIFont boldSystemFontOfSize:12.0];
   // medical.placeholder = @"<enter text>";
    medical.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    medical.delegate =self;
    [scrollview addSubview:medical];
    //[medical addTarget:self action:@selector(btnpress1:)forControlEvents:UIControlEventEditingDidBegin];
    
    [self.WebService CallServiceMedicalFacility:@"http://192.168.1.202:81//CommonMasterModule/UIService.asmx/GetMedicalFacilitiesLocation" Object:NULL Handler:NULL];
    Medical_Facility=(NSMutableArray*)self.WebService->ptr1;
    NSLog(@"med is %@",Medical_Facility);
    for(int i=0;i<Medical_Facility.count;i++)
    {
     MedicalFacility= [NSString stringWithFormat:@"%@",[[Medical_Facility objectAtIndex:i]valueForKey:@"LocationId"]];
     NSLog(@"loc is %@",MedicalFacility);
        if([MedicalFacility isEqualToString:Location])
        {
            
            medical.text=[NSString stringWithFormat:@"%@",[[Medical_Facility objectAtIndex:i]valueForKey:@"Name"]];
            NSLog(@"medical text is %@",medical.text);
            break;
            
        }
        
    }

    Medical_name=(NSMutableArray*)[Medical_Facility valueForKey:@"Name"];
    NSLog(@"med is %@",Medical_name);
    
//    if ([[UIScreen mainScreen] bounds].size.height >480)
//    {
//        pickerview_medical=[[UIPickerView alloc]initWithFrame:CGRectMake(0,400,320,50)];
//    }
//    else
//    {
//        pickerview_medical=[[UIPickerView alloc]initWithFrame:CGRectMake(0,400,320,50)];
//        
//    }
//    pickerview_medical.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
//    pickerview_medical.dataSource=self;
//    pickerview_medical.delegate=self;
//    pickerview_medical.showsSelectionIndicator=YES;
//    
//    [self.view addSubview:pickerview_medical];
//    pickerview_medical.hidden=YES;

    UILabel *Salutation_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,130,140,30)];
    [Salutation_lbl setText:@"Salutation *"];
    Salutation_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:Salutation_lbl];
    self.WebService->StringName=@"Salutations";
    [self.WebService CallServiceStringName:@"http://192.168.1.202:81/CommonMasterModule/UIService.asmx/GetCommonMasterXMLList1" Object:NULL Handler:NULL];
    
    Salutations=(NSMutableArray*)self.WebService->ptr1;
    Title_view=(NSMutableArray*)[Salutations valueForKey:@"name"];
    NSLog(@"sal is %@",Salutations);
    NSLog(@"sal is %@",Title_view);
    
//    if ([[UIScreen mainScreen] bounds].size.height >480)
//    {
//        Pickerview_Salutations=[[UIPickerView alloc]initWithFrame:CGRectMake(0,345,320,50)];
//    }
//    else
//    {
//        Pickerview_Salutations=[[UIPickerView alloc]initWithFrame:CGRectMake(0,270,320,50)];
//        
//    }
//    Pickerview_Salutations.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin ;
//    
//    Pickerview_Salutations.dataSource=self;
//    Pickerview_Salutations.delegate=self;
//    Pickerview_Salutations.showsSelectionIndicator=YES;
//    [self.view addSubview:Pickerview_Salutations];
//    
//    Pickerview_Salutations.hidden=YES;
    
    
    Salutation=[[UITextField alloc]initWithFrame:CGRectMake(150,130,150,30)];
    Salutation.font = [UIFont boldSystemFontOfSize:12.0];
    //Salutation.placeholder = @"<enter text>";
        Salutation.borderStyle = UITextBorderStyleLine;
   // Salutation.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    Salutation.delegate =self;
    Salutation.tag=3;
    [self CallService:@"Salutation"];
    Salutation.text=[NSString stringWithFormat:@"%@",StaffDetails];
    [scrollview addSubview:Salutation];
   // [Salutation addTarget:self action:@selector(btnpress1:)forControlEvents:UIControlEventEditingDidBegin];
    
    
    UILabel *FirstName_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,170,140,30)];
    [FirstName_lbl setText:@"FirstName *"];
    FirstName_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:FirstName_lbl];
    
    FirstName=[[UITextField alloc]initWithFrame:CGRectMake(150,170,150,30)];
    FirstName.font = [UIFont boldSystemFontOfSize:12.0];
  //  FirstName.placeholder = @"<enter text>";
    FirstName.borderStyle = UITextBorderStyleLine;

    FirstName.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    FirstName.delegate =self;
     FirstName.tag=4;
    [self CallService:@"FirstName"];
    FirstName.text=[NSString stringWithFormat:@"%@",StaffDetails];
    [scrollview addSubview:FirstName];
    
    UILabel *MiddleName_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,210,140,30)];
    [MiddleName_lbl setText:@"MiddleName"];
    MiddleName_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:MiddleName_lbl];
    
    MiddleName=[[UITextField alloc]initWithFrame:CGRectMake(150,210,150,30)];
    MiddleName.font = [UIFont boldSystemFontOfSize:12.0];
    MiddleName.tag=5;

    //MiddleName.placeholder = @"<enter text>";
    MiddleName.borderStyle = UITextBorderStyleLine;

    MiddleName.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    MiddleName.delegate =self;
    [self CallService:@"MiddleName"];
    MiddleName.text=[NSString stringWithFormat:@"%@",StaffDetails];
    [scrollview addSubview:MiddleName];
    
    UILabel *LastName_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,250,140,30)];
    [LastName_lbl setText:@"LastName *"];
    LastName_lbl.font=[UIFont systemFontOfSize:12.0];
    
    [scrollview addSubview:LastName_lbl];
    
    LastName=[[UITextField alloc]initWithFrame:CGRectMake(150,250,150,30)];
    LastName.font = [UIFont boldSystemFontOfSize:12.0];
    //LastName.placeholder = @"<enter text>";
    LastName.borderStyle = UITextBorderStyleLine;
       LastName.tag=6;
    LastName.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    LastName.delegate =self;
    [self CallService:@"LastName"];
    LastName.text=[NSString stringWithFormat:@"%@",StaffDetails];
    [scrollview addSubview:LastName];
    
    UILabel *MedicalID_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,290,140,30)];
    [MedicalID_lbl setText:@"MedicalID "];
    MedicalID_lbl.font=[UIFont systemFontOfSize:12.0];
    
    MedicalID=[[UITextField alloc]initWithFrame:CGRectMake(150,290,150,30)];
    MedicalID.font = [UIFont boldSystemFontOfSize:12.0];
   // MedicalID.placeholder = @"<enter text>";
    MedicalID.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    MedicalID.delegate =self;
       MedicalID.tag=7;
    MedicalID.borderStyle = UITextBorderStyleLine;
    [self CallService:@"MedicalId"];
    MedicalID.text=[NSString stringWithFormat:@"%@",StaffDetails];
    NSLog(@"medicalm %@",MedicalID.text);
    
    [scrollview addSubview:MedicalID];
    [scrollview addSubview:MedicalID_lbl];
    
    UILabel *DOB_lbl=[[UILabel alloc]initWithFrame:CGRectMake(25,330,140,30)];
    [DOB_lbl setText:@"Date of Birth"];
    DOB_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:DOB_lbl];
    
    Dob_button=[[UIButton alloc]initWithFrame:CGRectMake(05,330,20,30)];
    // Dob_button.tag=6;
    [Dob_button setImage:[UIImage imageNamed:@"images-20"] forState:UIControlStateNormal];
    [Dob_button setImage:[UIImage imageNamed:@"images-19"] forState:UIControlStateSelected];
    [Dob_button addTarget:self action:@selector(buttonPress)forControlEvents:UIControlEventTouchUpInside];
    
    [scrollview addSubview:Dob_button];
    
    UILabel *Age=[[UILabel alloc]initWithFrame:CGRectMake(115,330,50,30)];
    [Age setText:@"Age"];
    Age.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:Age];
    
    age_button=[[UIButton alloc]initWithFrame:CGRectMake(95,330,20,30)];
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
    
    
    
    DOB=[[UITextField alloc]initWithFrame:CGRectMake(150,330,150,30)];
    DOB.font = [UIFont boldSystemFontOfSize:12.0];
    DOB.tag=8;
    DOB.borderStyle = UITextBorderStyleLine;
    // DOB.placeholder = @"<enter text>";
    DOB.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    DOB.delegate =self;
    [self CallService:@"DOB"];
    dateFormatter = [[NSDateFormatter alloc] init];
    
   // [dateFormatter setAMSymbol:@"AM"];
  //  [dateFormatter setPMSymbol:@"PM"];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
    NSDate *Startdate = [dateFormatter dateFromString:StaffDetails];
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
    
    UILabel *Sex_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,370,140,30)];
    [Sex_lbl setText:@"Sex *"];
    Sex_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:Sex_lbl];
    
    Sex=[[UITextField alloc]initWithFrame:CGRectMake(150,370,150,30)];
    Sex.font = [UIFont boldSystemFontOfSize:12.0];
   // Sex.placeholder = @"<enter text>";
    Sex.borderStyle = UITextBorderStyleLine;
   // Sex.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    Sex.delegate =self;
    Sex.tag=9;
    [self CallService:@"Sex"];
    Sex.text=[NSString stringWithFormat:@"%@",StaffDetails];
    
    [scrollview addSubview:Sex];
    
    //[Sex addTarget:self action:@selector(btnpress1:)forControlEvents:UIControlEventEditingDidBegin];
    
    UILabel *Designation_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,410,140,30)];
    [Designation_lbl setText:@"Designation:"];
    Designation_lbl.font=[UIFont systemFontOfSize:12.0];
    
    Designation=[[UITextField alloc]initWithFrame:CGRectMake(150,410,150,30)];
    Designation.font = [UIFont boldSystemFontOfSize:12.0];
    //Designation.placeholder = @"<enter text>";
    Designation.borderStyle = UITextBorderStyleLine;
   // Designation.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    Designation.delegate =self;

    self.WebService->DesignationId=role_id;
    
    [self.WebService CallServiceDesgination:@"http://192.168.1.202:81//CommonMasterModule/UIService.asmx/GetDesignation" Object:NULL Handler:NULL];
 
    NSLog(@"designation is %@",self.WebService->ptr1);
    designation=(NSMutableArray*)self.WebService->ptr1;
    designation_view=(NSMutableArray*)[designation valueForKey:@"Name"];
    
    
    for (int i=0;i< (self.WebService->ptr1).count; i++)
    {
         designation_name=[NSString stringWithFormat:@"%@",[[designation objectAtIndex:i]valueForKey:@"DesignationId"]];
        if([designation_id isEqualToString:designation_name] )
        {
            Designation.text=[NSString stringWithFormat:@"%@",[[designation objectAtIndex:i]valueForKey:@"Name"]];
            rolename=[NSString stringWithFormat:@"%@",Designation.text];
            break;
        }
        
    }
    
    Designation.tag=10;
    [scrollview addSubview:Designation];
    [scrollview addSubview:Designation_lbl];
    [Designation addTarget:self action:@selector(btnpress1:)forControlEvents:UIControlEventEditingDidBegin];
    
    UILabel *FatherName_lbl=[[UILabel alloc]initWithFrame:CGRectMake(25,450,30,30)];
    [FatherName_lbl setText:@"Father"];
    FatherName_lbl.font=[UIFont systemFontOfSize:10.0];
    UILabel *Husband_lbl=[[UILabel alloc]initWithFrame:CGRectMake(75,450,100,30)];
    [Husband_lbl setText:@"Husband Name"];
    Husband_lbl.font=[UIFont systemFontOfSize:10.0];
    [scrollview addSubview:Husband_lbl];
    
    _Fatherbutton=[[UIButton alloc]initWithFrame:CGRectMake(05,450,20,30)];
    _Fatherbutton.tag=1;
   
    [_Fatherbutton setImage:[UIImage imageNamed:@"images-20"] forState:UIControlStateNormal];
    [_Fatherbutton setImage:[UIImage imageNamed:@"images-19"] forState:UIControlStateSelected];
    
    [_Fatherbutton addTarget:self action:@selector(buttonPress_Check:) forControlEvents:UIControlEventTouchUpInside];
    
    [scrollview addSubview:_Fatherbutton];
    
    
    _Husbutton=[[UIButton alloc]initWithFrame:CGRectMake(55,450,20,30)];
    _Husbutton.tag=2;
    [_Husbutton setImage:[UIImage imageNamed:@"images-20"] forState:UIControlStateNormal];
    [_Husbutton setImage:[UIImage imageNamed:@"images-19"] forState:UIControlStateSelected];
    
    
    [_Husbutton addTarget:self action:@selector(buttonPress_Check:) forControlEvents:UIControlEventTouchUpInside];
    
    [scrollview addSubview:_Husbutton];
    
    FatherName=[[UITextField alloc]initWithFrame:CGRectMake(150,450,150,30)];
    FatherName.font = [UIFont boldSystemFontOfSize:12.0];
    FatherName.borderStyle = UITextBorderStyleLine;
    FatherName.tag=11;
    //   FatherName.placeholder = @"<enter text>";
    FatherName.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    FatherName.delegate =self;
    [scrollview addSubview:FatherName_lbl];
    [self CallService:@"FatherName"];
    if(![StaffDetails isEqualToString:@"<null>"])
    {
        _Fatherbutton.selected=YES;
        FatherName.text=[NSString stringWithFormat:@"%@",StaffDetails];
    }
    else if ([StaffDetails isEqualToString:@""])
    {
        _Fatherbutton.selected=YES;
        FatherName.text=@"";
    }
    else
    {
         [self CallService:@"HusbandName"];
        if(![StaffDetails isEqualToString:@"<null>"])
        {
            _Husbutton.selected=YES;
            FatherName.text=[NSString stringWithFormat:@"%@",StaffDetails];
        }
        else if ([StaffDetails isEqualToString:@""])
        {
                _Husbutton.selected=YES;
                 FatherName.text=@"";
        }

    }
        
    [scrollview addSubview:FatherName];
    

    
    
    
//    if ([[UIScreen mainScreen] bounds].size.height >480)
//    {
//        pickerview_designation=[[UIPickerView alloc]initWithFrame:CGRectMake(0,350,320,50)];
//    }
//    else
//    {
//        pickerview_designation=[[UIPickerView alloc]initWithFrame:CGRectMake(0,270,320,50)];
//        
//    }
//    pickerview_designation.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
//    
//    pickerview_designation.dataSource=self;
//    pickerview_designation.delegate=self;
//    pickerview_designation.showsSelectionIndicator=YES;
//    [self.view addSubview:pickerview_designation];
//    [singleTap addTarget:self action:@selector(tapInPickerView:)];
//    pickerview_designation.hidden=YES;
    
    UILabel *email_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,490,140,30)];
    [email_lbl setText:@"Email"];
    email_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:email_lbl];
    
    email=[[UITextField alloc]initWithFrame:CGRectMake(150,490,150,30)];
    email.font = [UIFont boldSystemFontOfSize:12.0];
   // email.placeholder = @"<enter text>";
    email.keyboardType=UIKeyboardTypeEmailAddress;
    
    email.borderStyle=UITextBorderStyleLine;
    email.tag=12;
    email.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    email.delegate =self;
    [self CallService:@"PatientId"];
    //Patientid=[NSString stringWithFormat:@"%@",StaffDetails];
    NSLog(@"patient id %@",self.WebService->Staff_id=Staffid);
   //Staffid=[NSString stringWithFormat:@"%@",StaffDetails];
  [self.WebService CallServiceStaffDetailsEmailID:@"http://192.168.1.202:81/StaffModule/StaffService.asmx/GetUserEmail" Object:NULL Handler:NULL];
    
    email.text = [NSString stringWithFormat:@"%@",self.WebService.ptr] ;
    EmailService=email.text;
    
    [scrollview addSubview:email];
    
     
    UILabel *BloodGroup_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,530,140,30)];
    [BloodGroup_lbl setText:@"BloodGroup"];
    BloodGroup_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:BloodGroup_lbl];
    self.WebService->StringName=@"BloodGroup";
    [self.WebService CallServiceStringName:@"http://192.168.1.202:81/CommonMasterModule/UIService.asmx/GetCommonMasterXMLList1" Object:NULL Handler:NULL];
    
    bloodgroup=(NSMutableArray*)self.WebService->ptr1;
    Bloodgroup_view=(NSMutableArray*)[bloodgroup valueForKey:@"name"];
    NSLog(@"sal is %@",bloodgroup);
    NSLog(@"sal is %@",Bloodgroup_view);
    
//    if ([[UIScreen mainScreen] bounds].size.height >480)
//    {
//        Pickerview_BloodGroup=[[UIPickerView alloc]initWithFrame:CGRectMake(0,345,320,50)];
//    }
//    else
//    {
//        Pickerview_BloodGroup=[[UIPickerView alloc]initWithFrame:CGRectMake(0,270,320,50)];
//        
//    }
//    Pickerview_BloodGroup.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin ;
//    
//    Pickerview_BloodGroup.dataSource=self;
//    Pickerview_BloodGroup.delegate=self;
//    Pickerview_BloodGroup.showsSelectionIndicator=YES;
//    [self.view addSubview:Pickerview_BloodGroup];
//    
//    Pickerview_BloodGroup.hidden=YES;
    
      
    BloodGroup=[[UITextField alloc]initWithFrame:CGRectMake(150,530,150,30)];
    BloodGroup.font = [UIFont boldSystemFontOfSize:12.0];
   // BloodGroup.placeholder = @"<enter text>";
    BloodGroup.borderStyle=UITextBorderStyleLine;

   // BloodGroup.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    BloodGroup.delegate =self;
    BloodGroup.tag=13;
    [self CallService:@"BloodGroup"];
    if([StaffDetails isEqualToString:@"<null>"])
    {
        BloodGroup.text=@"";
    }
    else
    {
        BloodGroup.text=[NSString stringWithFormat:@"%@",StaffDetails];
    }
    [scrollview addSubview:BloodGroup];
    [BloodGroup addTarget:self action:@selector(btnpress1:)forControlEvents:UIControlEventEditingChanged];
    
    
    UILabel *Religion_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,570,140,30)];
    [Religion_lbl setText:@"Religion"];
    Religion_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:Religion_lbl];
    self.WebService->StringName=@"Religion";
    [self.WebService CallServiceStringName:@"http://192.168.1.202:81/CommonMasterModule/UIService.asmx/GetCommonMasterXMLList1" Object:NULL Handler:NULL];
    
    ReligionDetail=(NSMutableArray*)self.WebService->ptr1;
    Religion_view=(NSMutableArray*)[ReligionDetail valueForKey:@"name"];
    NSLog(@"sal is %@",ReligionDetail);
    NSLog(@"sal is %@",Religion_view);
   
    
//    if ([[UIScreen mainScreen] bounds].size.height >480)
//    {
//        Pickerview_Religion=[[UIPickerView alloc]initWithFrame:CGRectMake(0,345,320,50)];
//    }
//    else
//    {
//        Pickerview_Religion=[[UIPickerView alloc]initWithFrame:CGRectMake(0,270,320,50)];
//        
//    }
//    Pickerview_Religion.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
//    
//    Pickerview_Religion.dataSource=self;
//    Pickerview_Religion.delegate=self;
//    Pickerview_Religion.showsSelectionIndicator=YES;
//    [self.view addSubview:Pickerview_Religion];
//    
//    Pickerview_Religion.hidden=YES;
//    
    
    Religion=[[UITextField alloc]initWithFrame:CGRectMake(150,570,150,30)];
    Religion.font = [UIFont boldSystemFontOfSize:12.0];
   // Religion.placeholder = @"<enter text>";
    Religion.borderStyle=UITextBorderStyleLine;
   // Religion.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    Religion.delegate =self;
    Religion.tag=14;
    [self CallService:@"Religion"];
    Religion.text=[NSString stringWithFormat:@"%@",StaffDetails];
    [scrollview addSubview:Religion];
  // [Religion addTarget:self action:@selector(btnpress1:)forControlEvents:UIControlEventEditingDidBegin];
    
    
    UILabel *ContactNo_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,610,140,30)];
    [ContactNo_lbl setText:@"ContactNo"];
    ContactNo_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:ContactNo_lbl];
    
    ContactNo=[[UITextField alloc]initWithFrame:CGRectMake(150,610,150,30)];
    ContactNo.font = [UIFont boldSystemFontOfSize:12.0];
    ContactNo.borderStyle=UITextBorderStyleLine;
    ContactNo.tag=15;
    ContactNo.keyboardType=UIKeyboardTypeNumberPad;
   // ContactNo.placeholder = @"<enter text>";
    ContactNo.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    ContactNo.delegate =self;
    [self CallService:@"ContactNo"];
    if([StaffDetails isEqualToString:@"<null>"])
    {
        ContactNo.text=[NSString stringWithFormat:@""];
    }
    else
    {
        ContactNo.text=[NSString stringWithFormat:@"%@",StaffDetails];
    }
    
    [scrollview addSubview:ContactNo];
    
    UILabel *Comments_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,650,140,30)];
    [Comments_lbl setText:@"Comments"];
    Comments_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:Comments_lbl];
    comments=[[UITextField alloc]initWithFrame:CGRectMake(150,650,150,30)];
    comments.font = [UIFont boldSystemFontOfSize:12.0];
    // comments.placeholder = @"<enter text>";
    comments.borderStyle=UITextBorderStyleLine;
     comments.tag=16;
    comments.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    comments.delegate =self;
    [self CallService:@"Comments"];
    comments.text=[NSString stringWithFormat:@"%@",StaffDetails];
    
    [scrollview addSubview:comments];
    
    UILabel *Alias_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,690,140,30)];
    [Alias_lbl setText:@"Alias"];
    Alias_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:Alias_lbl];
    
    alias=[[UITextField alloc]initWithFrame:CGRectMake(150,690,150,30)];
    alias.font = [UIFont boldSystemFontOfSize:12.0];
   // alias.placeholder = @"<enter text>";
    alias.borderStyle=UITextBorderStyleLine;
    alias.tag=17;
    alias.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    alias.delegate =self;
    NSLog(@"staff %@",Staffid);
    
     NSLog(@"area is %@",self.WebService->Staff_id=Staffid);
    
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
    
    [scrollview addSubview:alias];
    [scrollview addSubview:Alias_lbl];

    
    UILabel *UId1_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,730,140,30)];
    [UId1_lbl setText:@"UId1"];
    UId1_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:UId1_lbl];
    
    UId1=[[UITextField alloc]initWithFrame:CGRectMake(150,730,150,30)];
    UId1.font = [UIFont boldSystemFontOfSize:12.0];
  //  UId1.placeholder = @"<enter text>";
    UId1.borderStyle=UITextBorderStyleLine;
    UId1.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    UId1.delegate =self;
    UId1.tag=18;

    [self CallService:@"UId1"];
    UId1.text=[NSString stringWithFormat:@"%@",StaffDetails];
    
    [scrollview addSubview:UId1];
    

    UILabel *Specialization_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,770,140,30)];
    [Specialization_lbl setText:@"Specialization:"];
    Specialization_lbl.font=[UIFont systemFontOfSize:12.0];
    Specialization =[[UITextField alloc]initWithFrame:CGRectMake(150,770,150,30)];
    Specialization.font = [UIFont boldSystemFontOfSize:12.0];
    Specialization.borderStyle = UITextBorderStyleLine;
    Specialization.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    Specialization.delegate =self;
    Specialization.tag=19;
    [scrollview addSubview:Specialization];
    [scrollview addSubview:Specialization_lbl];
    specializationarr=[[NSMutableArray alloc]init];

    self.WebService->Staff_id=Staffid;
    
    [self.WebService CallServiceStaffDetailsWithRoleID:@"http://192.168.1.202:81/StaffModule/StaffService.asmx/GetUserSpecialization" Object:NULL Handler:NULL];
   
    NSLog(@"sel %@",self.WebService->ptr1);
    Specialization.text=[[self.WebService->ptr1 objectAtIndex:0]valueForKey:@"Specialization"];
    [specializationarr addObject:[[self.WebService->ptr1 objectAtIndex:0]valueForKey:@"SpecializationId"]];
    
    NSLog(@"spe %@",specializationarr);
    
    
    
    
    //[Specialization addTarget:self action:@selector(SpecalizationDetail)forControlEvents:UIControlEventEditingChanged];
    
    self.WebService->SpecializationAlert1=@"";
    
    [self.WebService CallServiceGetSpecializationTokenInput:@"http://192.168.1.202:81//CommonMasterModule/UIService.asmx/GetSpecializationTokenInput" Object:NULL Handler:NULL];
    
    NSLog(@"speclization %@",self.WebService->data1);
    SpecializationArr=(NSMutableArray*)self.WebService->data1;
    NSLog(@"speclization %@",SpecializationArr);
    SpecializationName=(NSMutableArray*)[SpecializationArr valueForKey:@"name"];
    NSLog(@"speclization %@",SpecializationName);

    
    UILabel *NationId_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,810,140,30)];
    [NationId_lbl setText:@"Nationality"];
    NationId_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:NationId_lbl];
    
    NationId=[[UITextField alloc]initWithFrame:CGRectMake(150,810,150,30)];
    NationId.font = [UIFont boldSystemFontOfSize:12.0];
    //NationId.placeholder = @"<enter text>";
    NationId.borderStyle=UITextBorderStyleLine;
    NationId.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    NationId.delegate =self;
    NationId.tag=20;
    
    [self CallService:@"Nationality"];
    if([StaffDetails isEqualToString:@"<null>"])
    {
         NationId.text=@"";
        
    }
    else
    {
    nationId=[NSString stringWithFormat:@"%@",StaffDetails];
    NSLog(@"nation is %@",nationId);
    
    
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
   // [NationId addTarget:self action:@selector(btnpress1:)forControlEvents:UIControlEventEditingChanged];
    //[patientname addTarget:self action:@selector(SearchPatients:)forControlEvents:UIControlEventEditingChanged];
    
    
    UILabel *Address_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,850,140,30)];
    [Address_lbl setText:@"Address"];
    Address_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:Address_lbl];
    Address=[[UITextField alloc]initWithFrame:CGRectMake(150,850,150,30)];
    Address.font = [UIFont boldSystemFontOfSize:12.0];
    //Address.placeholder = @"<enter text>";
    Address.borderStyle=UITextBorderStyleLine;
    Address.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    Address.delegate =self;
      Address.tag=21;
    [self CallService:@"Address"];
    Address.text=[NSString stringWithFormat:@"%@",StaffDetails];
    [scrollview addSubview:Address];
    
    
    
    UILabel *AreaId_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,890,140,30)];
    [AreaId_lbl setText:@"Area *"];
    AreaId_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:AreaId_lbl];
    AreaId=[[UITextField alloc]initWithFrame:CGRectMake(150,890,150,30)];
    AreaId.font = [UIFont boldSystemFontOfSize:12.0];
  //  AreaId.placeholder = @"<enter text>";
     AreaId.borderStyle=UITextBorderStyleLine;
    // AreaId.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    AreaId.delegate =self;
    AreaId.tag=22;
    [self CallService:@"AreaId"];
    NSLog(@"area is %@",self.WebService->Area_Id=StaffDetails);
    
    [self.WebService CallServicePatientDetailsAreaID:@"http://192.168.1.202:81/CommonMasterModule/UIService.asmx/GetOthersFromArea" Object:NULL Handler:NULL];
    
    // Area_ID=[[NSMutableArray alloc]init];
    
    Area_ID=(NSMutableArray*)self.WebService->ptr1;
    NSLog(@"areaid is %@",Area_ID);
    
    
    NSLog(@"web service is %@",self.WebService->ptr1);
    
    [self CallService1:@"AreaName"];
    AreaId.text=[NSString stringWithFormat:@"%@",StaffDetails];
    
    
    [scrollview addSubview:AreaId];
   // [AreaId addTarget:self action:@selector(btnpress1:)forControlEvents:UIControlEventEditingDidBegin];
    
    
    UILabel *CityId_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,930,140,30)];
    [CityId_lbl setText:@"City *"];
    CityId_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:CityId_lbl];
    
    CityId=[[UITextField alloc]initWithFrame:CGRectMake(150,930,150,30)];
    CityId.font = [UIFont boldSystemFontOfSize:12.0];
   // CityId.placeholder = @"<enter text>";
     CityId.borderStyle=UITextBorderStyleLine;
    CityId.delegate =self;
    CityId.tag=23;
    [self CallService1:@"Name"];
    CityId.text=[NSString stringWithFormat:@"%@",StaffDetails];
    
    [scrollview addSubview:CityId];
    
  //  [CityId addTarget:self action:@selector(btnpress1:)forControlEvents:UIControlEventEditingDidBegin];
    
    UILabel *StateId_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,970,140,30)];
    [StateId_lbl setText:@"State *"];
    StateId_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:StateId_lbl];
    
    StateId=[[UITextField alloc]initWithFrame:CGRectMake(150,970,150,30)];
    StateId.font = [UIFont boldSystemFontOfSize:12.0];
    //StateId.placeholder = @"<enter text>";
    StateId.borderStyle=UITextBorderStyleLine;
    StateId.delegate =self;
    StateId.tag=24;
    [self CallService1:@"Name1"];
    StateId.text=[NSString stringWithFormat:@"%@",StaffDetails];
    [scrollview addSubview:StateId];
    //[StateId addTarget:self action:@selector(btnpress1:)forControlEvents:UIControlEventEditingDidBegin];
    

    
    UILabel *CountryId_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,1010,140,30)];
    [CountryId_lbl setText:@"Country *"];
    CountryId_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:CountryId_lbl];
    
    CountryId=[[UITextField alloc]initWithFrame:CGRectMake(150,1010,150,30)];
    CountryId.font = [UIFont boldSystemFontOfSize:12.0];
    //CountryId.placeholder = @"<enter text>";
    CountryId.borderStyle=UITextBorderStyleLine;
    CountryId.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    CountryId.delegate =self;
    CountryId.tag=25;
    [self CallService1:@"Name2"];
    CountryId.text=[NSString stringWithFormat:@"%@",StaffDetails];
    
    [scrollview addSubview:CountryId];
    
    //[CountryId addTarget:self action:@selector(btnpress1:)forControlEvents:UIControlEventEditingDidBegin];
    
    [self.WebService CallServiceCountryList:@"http://192.168.1.202:81/CommonMasterModule/UIService.asmx/GetCountryList" Object:NULL Handler:NULL];
    
    [CountryId resignFirstResponder];
    NSLog(@"dictonary is %@",self.WebService->ptr1);
    Dict=[[NSMutableArray alloc]init];
    Dict123=[[NSMutableArray alloc]init];
    
    Dict=(NSMutableArray*)self.WebService->ptr1;
    NSLog(@"dict is %@",Dict);
    Dict123=[Dict valueForKey:@"Name"];
    
    NSLog(@"dict is %@",Dict123);

    
    UILabel *PinCode_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,1050,140,30)];
    [PinCode_lbl setText:@"PinCode *"];
    PinCode_lbl.font=[UIFont systemFontOfSize:12.0];
    [scrollview addSubview:PinCode_lbl];
    PinCode=[[UITextField alloc]initWithFrame:CGRectMake(150,1050,150,30)];
    PinCode.font = [UIFont boldSystemFontOfSize:12.0];
   // PinCode.placeholder = @"<enter text>";
    PinCode.borderStyle=UITextBorderStyleLine;
    //  PinCode.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    PinCode.delegate =self;
      PinCode.tag=26;
    [self CallService1:@"PinCode"];
    PinCode.text=[NSString stringWithFormat:@"%@",StaffDetails];
  
    [scrollview addSubview:PinCode];
    
    
    UIButton *Update=[[UIButton alloc]initWithFrame:CGRectMake(50,1100,100,30)];
    Update.backgroundColor=[UIColor blueColor];
    [Update setTitle:@"Update" forState:UIControlStateNormal];
    [Update addTarget:self action:@selector(UpdateButton:) forControlEvents:UIControlEventTouchUpInside];
    [scrollview addSubview:Update];
    
    UIButton *cancle=[[UIButton alloc]initWithFrame:CGRectMake(170,1100,100,30)];
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
//    
    
}


-(void)CallService:(NSString*)Str
{
    StaffDetails =[NSString stringWithFormat:@"%@",[[Patient_detail objectAtIndex:0] valueForKey:Str]];
    NSLog(@"%@", StaffDetails);
}

-(void)CallService1:(NSString*)Str
{
    StaffDetails =[NSString stringWithFormat:@"%@",[[Area_ID objectAtIndex:0] valueForKey:Str]];
    NSLog(@"%@", StaffDetails);
}


-(IBAction)UpdatePicker:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)self.DOB.inputView;
    
    self.DOB.text = [NSString stringWithFormat:@"%@",picker.date];
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss +HHmm"];
    myDate = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@",DOB.text]];
    NSLog(@"%@", [dateFormatter stringFromDate:myDate]);
    
    anotherDateFormatter = [[NSDateFormatter alloc] init];
    [anotherDateFormatter setDateFormat:@"dd/MM/yyyy"];
    NSLog(@"%@", [anotherDateFormatter stringFromDate:myDate]);
    
    DOB.text =[anotherDateFormatter stringFromDate:myDate];
    
    DatePicker.hidden=YES;
    done.hidden=YES;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	// There is only one section.
	return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    if (searching)
//    {
//       NSLog(@"copy %d",searchResultArr.count);
//      
//       return searchResultArr.count;
//    }
//    else
    {
        return [SearchStaffCode count];
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
   
        
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier] ;
            
        }
        
//       if (searching)
//       {
//           cell.textLabel.numberOfLines=2;
//           cell.textLabel.text =[NSString stringWithFormat:@"%@  %@",[SearchStaffCode objectAtIndex:indexPath.row],[searchResultArr objectAtIndex:indexPath.row]];
//           cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12.0f];
//           
//           
//       }
//        else
        {
            cell.textLabel.numberOfLines=2;
            cell.textLabel.text =[NSString stringWithFormat:@"%@  %@",[SearchStaffCode objectAtIndex:indexPath.row],[SearchStaffName objectAtIndex:indexPath.row]];
            cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12.0f];
        }
    
   
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [Staffname resignFirstResponder];
    
    [Staffname setText:[NSString stringWithFormat:@"%@",[SearchStaffName objectAtIndex:indexPath.row]]];
  //  NSLog(@"patient name %@",patientname.text);
    
    
    StaffCode=[NSString stringWithFormat:@"%@",[SearchStaffCode objectAtIndex:indexPath.row]];
//    NSLog(@"patient code %@",PatientCode);
    
       Staffid=[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:indexPath.row]valueForKey:@"StaffId"]];
    
    NSLog(@"patient code %@",Staffid);
    // [table_SearchPatient reloadData];
    table_SearchStaff.hidden=YES;
    [self donebtn:nil];
    
}

-(IBAction)btnpress1:(id)sender
{
    singleTap = [[UITapGestureRecognizer alloc]init];
    
    switch(((UITextField*)sender).tag)
    {
        case 0:
        {
            [medical resignFirstResponder];
            pickerview_medical.hidden=NO;
            
            //        [self.WebService CallServiceMedicalFacility:@"http://192.168.1.202:81//CommonMasterModule/UIService.asmx/GetMedicalFacilitiesLocation" Object:NULL Handler:NULL];
            //            Medical_Facility=(NSMutableArray*)self.WebService->ptr1;
            //            NSLog(@"med is %@",Medical_Facility);
            //            Medical_name=(NSMutableArray*)[Medical_Facility valueForKey:@"Name"];
            //            NSLog(@"med is %@",Medical_name);
            //
            //
            //            if ([[UIScreen mainScreen] bounds].size.height >480)
            //            {
            //               pickerview_medical=[[UIPickerView alloc]initWithFrame:CGRectMake(0,350,320,50)];
            //            }
            //            else
            //            {
            //                pickerview_medical=[[UIPickerView alloc]initWithFrame:CGRectMake(0,270,320,50)];
            //
            //            }
            //            pickerview_medical.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
            //            pickerview_medical.dataSource=self;
            //            pickerview_medical.delegate=self;
            //            pickerview_medical.showsSelectionIndicator=YES;
            //
            //            [self.view addSubview:pickerview_medical];
            
            pickerview_sex.hidden=YES;
            pickerview_state.hidden=YES;
            pickerview_city.hidden=YES;
            pickerview_area.hidden=YES;
            Pickerview_Nationality.hidden=YES;
            [singleTap addTarget:self action:@selector(tapInPickerView:)];
            [singleTap setNumberOfTapsRequired:1];
            [singleTap setNumberOfTouchesRequired:1];
            [pickerview_medical addGestureRecognizer:singleTap];
            
            break;
            
        }
            

            
        case 1:
        {
            if ([[UIScreen mainScreen] bounds].size.height >480)
            {
                DatePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0,350,320,50)];
            }
            else
            {
                DatePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0,270,320,50)];
            }
            DatePicker.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
            DatePicker.datePickerMode = UIDatePickerModeDate;
            
            DatePicker.date = [NSDate date];
            [self.DOB setInputView:DatePicker];
            done.hidden=NO;
            [DOB resignFirstResponder];
            DatePicker.userInteractionEnabled=YES;
            [self.view addSubview:DatePicker];
            
            break;
            
            
        }
        case 2:
        {
            
            
            [Sex resignFirstResponder];
            
            pickerview_country.hidden=YES;
            pickerview_state.hidden=YES;
            pickerview_sex.hidden=NO;
            pickerview_city.hidden=YES;
            pickerview_area.hidden=YES;
            Pickerview_Nationality.hidden=YES;
            
            [singleTap addTarget:self action:@selector(tapInPickerView:)];
            [singleTap setNumberOfTapsRequired:1];
            [singleTap setNumberOfTouchesRequired:1];
            [pickerview_sex addGestureRecognizer:singleTap];
            
            break;
            
            
        }
        case 3:
        {
            [self.WebService CallServiceCountryList:@"http://192.168.1.202:81/CommonMasterModule/UIService.asmx/GetCountryList" Object:NULL Handler:NULL];
            
            [CountryId resignFirstResponder];
            NSLog(@"dictonary is %@",self.WebService->ptr1);
            Dict=[[NSMutableArray alloc]init];
            Dict123=[[NSMutableArray alloc]init];
            
            Dict=(NSMutableArray*)self.WebService->ptr1;
            NSLog(@"dict is %@",Dict);
            Dict123=[Dict valueForKey:@"Name"];
            
            NSLog(@"dict is %@",Dict123);
            if ([[UIScreen mainScreen] bounds].size.height >480)
            {
                pickerview_country=[[UIPickerView alloc]initWithFrame:CGRectMake(0,350,320,50)];
            }
            else
            {
                pickerview_country=[[UIPickerView alloc]initWithFrame:CGRectMake(0,270,320,50)];
                
            }
            pickerview_country.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
            pickerview_country.dataSource=self;
            pickerview_country.delegate=self;
            pickerview_country.showsSelectionIndicator=YES;
            
            [self.view addSubview:pickerview_country];
            
            pickerview_sex.hidden=YES;
            pickerview_state.hidden=YES;
            pickerview_city.hidden=YES;
            pickerview_area.hidden=YES;
            Pickerview_Nationality.hidden=YES;
            [singleTap addTarget:self action:@selector(tapInPickerView:)];
            
            [singleTap setNumberOfTapsRequired:1];
            [singleTap setNumberOfTouchesRequired:1];
            [pickerview_country addGestureRecognizer:singleTap];
            
            break;
            
        }
        case 4:
        {
            
            NSLog(@"country id is %@",self.WebService->country_id=country);
            
            [self.WebService CallServiceStateList:@"http://192.168.1.202:81/CommonMasterModule/UIService.asmx/GetStateList" Object:NULL Handler:NULL];
            
            [StateId resignFirstResponder];
            State_Detail=[[NSMutableArray alloc]init];
            View_StateID=[[NSMutableArray alloc]init];
            
            State_Detail=(NSMutableArray*)self.WebService->ptr1;
            NSLog(@"dict is %@",State_Detail);
            View_StateID=[State_Detail valueForKey:@"Name"];
            
            NSLog(@"dict is %@",View_StateID);
            if ([[UIScreen mainScreen] bounds].size.height >480)
            {
                pickerview_state=[[UIPickerView alloc]initWithFrame:CGRectMake(0,350,320,50)];
            }
            else
            {
                pickerview_state=[[UIPickerView alloc]initWithFrame:CGRectMake(0,270,320,50)];
                
            }
            pickerview_state.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
            pickerview_state.dataSource=self;
            pickerview_state.delegate=self;
            pickerview_state.showsSelectionIndicator=YES;
            [self.view addSubview:pickerview_state];
            
            //pickerview.hidden=NO;
            pickerview_sex.hidden=YES;
            pickerview_country.hidden=YES;
            pickerview_city.hidden=YES;
            pickerview_area.hidden=YES;
            Pickerview_Nationality.hidden=YES;
            // UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapInPickerView:)];
            [singleTap addTarget:self action:@selector(tapInPickerView:)];
            
            [singleTap setNumberOfTapsRequired:1];
            [singleTap setNumberOfTouchesRequired:1];
            [pickerview_state addGestureRecognizer:singleTap];
            
            // done3.hidden=NO;
            break;
            
            
        }
        case 5:
        {
            
            NSLog(@"state id is %@",self.WebService->state_id=state);
            
            [self.WebService CallServiceCityList:@"http://192.168.1.202:81/CommonMasterModule/UIService.asmx/GetCityList" Object:NULL Handler:NULL];
            
            [CityId resignFirstResponder];
            
            State_Detail=[[NSMutableArray alloc]init];
            View_StateID=[[NSMutableArray alloc]init];
            
            State_Detail=(NSMutableArray*)self.WebService->ptr1;
            NSLog(@"dict is %@",State_Detail);
            View_StateID=[State_Detail valueForKey:@"Name"];
            
            NSLog(@"dict is %@",View_StateID);
            
            // NSLog(@"dict is %@",View_City);
            if ([[UIScreen mainScreen] bounds].size.height >480)
            {
                pickerview_city=[[UIPickerView alloc]initWithFrame:CGRectMake(0,350,320,50)];
            }
            else
            {
                pickerview_city=[[UIPickerView alloc]initWithFrame:CGRectMake(0,270,320,50)];
                
            }
            pickerview_city.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
            
            pickerview_city.dataSource=self;
            pickerview_city.delegate=self;
            pickerview_city.showsSelectionIndicator=YES;
            [self.view addSubview:pickerview_city];
            
            //pickerview.hidden=NO;
            pickerview_sex.hidden=YES;
            pickerview_country.hidden=YES;
            pickerview_state.hidden=YES;
            pickerview_area.hidden=YES;
            Pickerview_Nationality.hidden=YES;
            // UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapInPickerView:)];
            [singleTap addTarget:self action:@selector(tapInPickerView:)];
            
            [singleTap setNumberOfTapsRequired:1];
            [singleTap setNumberOfTouchesRequired:1];
            [pickerview_city addGestureRecognizer:singleTap];
            
            // done4.hidden=NO;
            break;
            
            
        }
        case 6:
        {
            
            NSLog(@"state id is %@",self.WebService->city_id=city);
            
            [self.WebService CallServiceAreaList:@"http://192.168.1.202:81/CommonMasterModule/UIService.asmx/GetAreaList" Object:NULL Handler:NULL];
            
            
            [AreaId resignFirstResponder];
            Area_Detail=[[NSMutableArray alloc]init];
            View_Area=[[NSMutableArray alloc]init];
            
            Area_Detail=(NSMutableArray*)self.WebService->ptr1;
            NSLog(@"dict is %@",Area_Detail);
            View_Area=[Area_Detail valueForKey:@"AreaName"];
            
            NSLog(@"dict is %@",View_Area);
            if ([[UIScreen mainScreen] bounds].size.height >480)
            {
                pickerview_area=[[UIPickerView alloc]initWithFrame:CGRectMake(0,350,320,50)];
            }
            else
            {
                pickerview_area=[[UIPickerView alloc]initWithFrame:CGRectMake(0,270,320,50)];
                
            }
            pickerview_area.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
            
            pickerview_area.dataSource=self;
            pickerview_area.delegate=self;
            pickerview_area.showsSelectionIndicator=YES;
            [self.view addSubview:pickerview_area];
            
            //pickerview.hidden=NO;
            pickerview_city.hidden=YES;
            pickerview_sex.hidden=YES;
            pickerview_country.hidden=YES;
            pickerview_state.hidden=YES;
            Pickerview_Nationality.hidden=YES;
            // UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapInPickerView:)];
            [singleTap addTarget:self action:@selector(tapInPickerView:)];
            
            [singleTap setNumberOfTapsRequired:1];
            [singleTap setNumberOfTouchesRequired:1];
            [pickerview_area addGestureRecognizer:singleTap];
            
            // done4.hidden=NO;
            break;
            
            
        }
            
        case 7:
        {
            
            [NationId resignFirstResponder];
            Pickerview_Nationality.hidden=NO;
            
            pickerview_city.hidden=YES;
            pickerview_sex.hidden=YES;
            pickerview_country.hidden=YES;
            pickerview_state.hidden=YES;
            pickerview_area.hidden=YES;
            [singleTap addTarget:self action:@selector(tapInPickerView:)];
            
            [singleTap setNumberOfTapsRequired:1];
            [singleTap setNumberOfTouchesRequired:1];
            [Pickerview_Nationality addGestureRecognizer:singleTap];
            
            // done4.hidden=NO;
            break;
            
        }
        case 8:
        {
            [Salutation resignFirstResponder];
            
            Pickerview_Salutations.hidden=NO;
            
            // Pickerview_Nationality.hidden=NO;
            
            pickerview_city.hidden=YES;
            pickerview_sex.hidden=YES;
            pickerview_country.hidden=YES;
            pickerview_state.hidden=YES;
            pickerview_area.hidden=YES;
            // UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapInPickerView:)];
            [singleTap addTarget:self action:@selector(tapInPickerView:)];
            
            [singleTap setNumberOfTapsRequired:1];
            [singleTap setNumberOfTouchesRequired:1];
            [Pickerview_Salutations addGestureRecognizer:singleTap];
            
            // done4.hidden=NO;
            break;
            
        }
        case 9:
        {
            [BloodGroup resignFirstResponder];
            
            Pickerview_BloodGroup.hidden=NO;
            
            // Pickerview_Nationality.hidden=NO;
            
            pickerview_city.hidden=YES;
            pickerview_sex.hidden=YES;
            pickerview_country.hidden=YES;
            pickerview_state.hidden=YES;
            pickerview_area.hidden=YES;
            // UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapInPickerView:)];
            [singleTap addTarget:self action:@selector(tapInPickerView:)];
            
            [singleTap setNumberOfTapsRequired:1];
            [singleTap setNumberOfTouchesRequired:1];
            [Pickerview_BloodGroup addGestureRecognizer:singleTap];
            
            // done4.hidden=NO;
            break;
            
        }
            
        case 10:
        {
            [Religion resignFirstResponder];
            
            Pickerview_Religion.hidden=NO;
            
            // Pickerview_Nationality.hidden=NO;
            
            pickerview_city.hidden=YES;
            pickerview_sex.hidden=YES;
            pickerview_country.hidden=YES;
            pickerview_state.hidden=YES;
            pickerview_area.hidden=YES;
            // UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapInPickerView:)];
            [singleTap addTarget:self action:@selector(tapInPickerView:)];
            
            [singleTap setNumberOfTapsRequired:1];
            [singleTap setNumberOfTouchesRequired:1];
            [Pickerview_Religion addGestureRecognizer:singleTap];
            
            // done4.hidden=NO;
            break;
            
        }
        case 11:
        {
            [Designation resignFirstResponder];
            
//            NSLog(@"des is %@", self.WebService->DesignationId=roleid);
//            
//            [self.WebService CallServiceDesgination:@"http://192.168.1.202:81//CommonMasterModule/UIService.asmx/GetDesignation" Object:NULL Handler:NULL];
//            designation=(NSMutableArray*)self.WebService->ptr1;
//            designation_view=(NSMutableArray*)[designation valueForKey:@"Name"];
//            NSLog(@"med is %@",designation);
//            NSLog(@"med is %@",designation_view);
//            
//            if ([[UIScreen mainScreen] bounds].size.height >480)
//            {
//                pickerview_designation=[[UIPickerView alloc]initWithFrame:CGRectMake(0,350,320,50)];
//            }
//            else
//            {
//                pickerview_designation=[[UIPickerView alloc]initWithFrame:CGRectMake(0,270,320,50)];
//                
//            }
//            pickerview_designation.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
//            
//            pickerview_designation.dataSource=self;
//            pickerview_designation.delegate=self;
//            pickerview_designation.showsSelectionIndicator=YES;
//            [self.view addSubview:pickerview_designation];
//
            pickerview_designation.hidden=NO;
            //pickerview.hidden=NO;
            pickerview_city.hidden=YES;
            pickerview_sex.hidden=YES;
            pickerview_country.hidden=YES;
            pickerview_state.hidden=YES;
            Pickerview_Nationality.hidden=YES;
            // UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapInPickerView:)];
            [singleTap addTarget:self action:@selector(tapInPickerView:)];
            
            [singleTap setNumberOfTapsRequired:1];
            [singleTap setNumberOfTouchesRequired:1];
            [pickerview_designation addGestureRecognizer:singleTap];
            
            // done4.hidden=NO;
            break;
            
        }
            
        default:
            
            break;
            
    }
    
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
        return 1;
   
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
	NSString *returnStr = @"";
	
	// note: custom picker doesn't care about titles, it uses custom views
    if(pickerView==pickerview_medical)
    {
        
        if(component==0)
        {
            MedicalFacility=[NSString stringWithFormat:@"%@",[[Medical_Facility objectAtIndex:0]valueForKey:@"LocationId"]];
            NSLog(@" country %@",MedicalFacility);
            returnStr=[Medical_name objectAtIndex:row];
            
        }
    }
    else if(pickerView==pickerview_designation)
    {
        
        if(component==0)
        {
            designation_name=[NSString stringWithFormat:@"%@",[[designation objectAtIndex:0]valueForKey:@"DesignationId"]];
            NSLog(@" country %@",designation_name);
            returnStr=[designation_view objectAtIndex:row];
            
        }
    }

   else if(pickerView==pickerview_country)
    {
        
        if(component==0)
        {
            country=[NSString stringWithFormat:@"%@",[[Dict objectAtIndex:0]valueForKey:@"CountryId"]];
            //NSLog(@" country %@",country);
            returnStr=[Dict123 objectAtIndex:row];
            
        }
    }
    else if (pickerView==pickerview)
    {
        
        if(component==0)
        {
            
            returnStr=[AppendArray objectAtIndex:row];
            
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
    if(pickerView==pickerview_medical)
    {
        
        // NSLog(@"arr is= %d",self.WebService->arr.count);
        return [Medical_name count];
        //[pickerview selectRow:0 inComponent:0 animated:YES];
        
    }

    else if(pickerView==pickerview_country)
    {
        
        // NSLog(@"arr is= %d",self.WebService->arr.count);
        return [Dict123 count];
        //[pickerview selectRow:0 inComponent:0 animated:YES];
        
    }
    else if (pickerView==pickerview_sex)
    {
        return [GenderList count];
        
    }
    else if (pickerView==pickerview)
    {
        return [AppendArray count];
        
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
    else if(pickerView==pickerview_designation)
    {
        
        // NSLog(@"arr is= %d",self.WebService->arr.count);
        return [designation_view count];
        //[pickerview selectRow:0 inComponent:0 animated:YES];
        
    }
    
//    else if (pickerView==pickerview_state)
//    {
//        return [View_StateID count];
//        
//    }
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
//    if (pickerview_medical.hidden==FALSE)
//    {
//        [medical setText:[NSString stringWithFormat:@"%@",[Medical_name objectAtIndex:[pickerview_medical selectedRowInComponent:0]]]];
//        NSLog(@"medical is %@",medical.text);
//        pickerview_medical.hidden=YES;
//        // done1.hidden=YES;
//    }
//
//   else if (pickerview_sex.hidden==FALSE)
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
//    else if (pickerview_designation.hidden==FALSE)
//    {
//        [Designation setText:[NSString stringWithFormat:@"%@",[designation_view objectAtIndex:[pickerview_designation selectedRowInComponent:0]]]];
//        pickerview_designation.hidden=YES;
//        // done1.hidden=YES;
//    }
//
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
//    
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
//        
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
    
    //    else if (pickerView==pickerview_state)
    //    {
    //
    //        [View_StateID objectAtIndex:[pickerview_state selectedRowInComponent:0]];
    //        NSLog(@"Selected Color: %@. Index of selected color: %i", [State_Detail objectAtIndex:row], row);
    //
    //        state=[NSString stringWithFormat:@"%@",[[State_Detail objectAtIndex:row]valueForKey:@"StateId"]];
    //        NSLog(@"row %@",state);
    //        [StateId setText:[[State_Detail objectAtIndex:row]valueForKey:@"Name"]];
    //
    //    }
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
        [AreaId setText:area];
        
    }
    
    
    
    //     else if(pickerView==pickerview_medical)
    //    {
    //        [Medical_name objectAtIndex:[pickerview_medical selectedRowInComponent:0]];
    //        NSLog(@"Selected Color: %@. Index of selected color: %i", [Medical_name objectAtIndex:row], row);
    //        MedicalFacility=[NSString stringWithFormat:@"%@",[[Medical_Facility objectAtIndex:row]valueForKey:@"LocationId"]];
    //        //medical.text=[Medical_Facility objectAtIndex:row]valueForKey:@"<#string#>"
    //        // tag=[NSString stringWithFormat:@"%d",++row];
    //        //  tag =++row;
    //        NSLog(@"row %@",MedicalFacility);
    //    }
    
//    else if(pickerView==pickerview_addnewstaff)
//    {
//        [RoleName objectAtIndex:[pickerview_medical selectedRowInComponent:0]];
//        NSLog(@"Selected Color: %@. Index of selected color: %i", [RoleName objectAtIndex:row], row);
//        roleid=[NSString stringWithFormat:@"%@",[[Add_New_staff objectAtIndex:row]valueForKey:@"RoleId"]];
//        rolename=[NSString stringWithFormat:@"%@",[[Add_New_staff objectAtIndex:row]valueForKey:@"RoleName"]];
//        AddnewStaff.text=rolename;
//        
//        // tag=[NSString stringWithFormat:@"%d",++row];
//        //  tag =++row;
//        NSLog(@"row %@",roleid);
//    }
    
    else if(pickerView==pickerview_designation)
    {
        [designation_view objectAtIndex:[pickerview_designation selectedRowInComponent:0]];
        NSLog(@"Selected Color: %@. Index of selected color: %i", [designation_view objectAtIndex:row], row);
        designation_name=[NSString stringWithFormat:@"%@",[[designation objectAtIndex:row]valueForKey:@"DesignationId"]];
        // tag=[NSString stringWithFormat:@"%d",++row];
        //  tag =++row;
        NSLog(@"row %@",designation_name);
        Designation.text=[[designation objectAtIndex:row]valueForKey:@"Name"];
        
    }
    
        
}


-(IBAction)UpdateButton:(id)sender
{
  //  public void UpdateStaff(String StaffCode, String Email, String Salutation, String FirstName, String MiddleName, String LastName, DateTime DOB, String Sex, String BloodGroup, String FatherName, String HusbandName, DateTime DORegistration, String ContactNo, String Address, int CountryId, int StateId, int CityId, String EmergencyContactNo, String EmergencyContactName, String Comments, String Religion, String EmergencyContactRelation, String EmergencyContactAddress, int? EmergencyContactCountryId, int? EmergencyContactStateId, int? EmergencyContactCityId, String MedicalId, String UId1, String UId2, List<Guid> StaffAlert, List<Guid> SpecializationAlert, List<Guid> DepartmentAlert, string RoleName, Guid DesignationId, Guid? HospitalId, Guid AreaId, String PinCode, int ?Nationality,String Alias)
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

    NSLog(@"hospital %@",MedicalFacility);
    NSLog(@"hospital %@",rolename);
    NSLog(@"hospital %@",designation_name);
    
    
    if((email.text == NULL)||[email.text isEqual:@""])
    {
        Email=@"";
    }
    else
    {
        Email=email.text;
    }

    Title=Salutation.text;
     
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
    
    if([MedicalID.text isEqualToString:NULL]||(MedicalID.text==NULL))
    {
        MedicalId=@"";
    }
    else
    {
        MedicalId=MedicalID.text;
    }

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
    
    NSLog(@"the date is %@",theDate);
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
    //HusbandName=(NSString*)[NSNull null];
    EmergencyContactNo=@"";
    EmergencyContactName=@"";
    EmergencyContactRelation=@"";
    EmergencyContactAddress=@"";
    EmergencyContactCountryId=(NSString*)[NSNull null];
    EmergencyContactStateId=(NSString*)[NSNull null];
    EmergencyContactCityId=(NSString*)[NSNull null];
    Status=@"1";
    UId2=(NSString*)[NSNull null];
   StaffAlert=(NSString*)[NSNull null];
    //Alias=alias.text;
    SpecializationAlert=(NSString*)[NSNull null];
    DepartmentAlert=(NSString*)[NSNull null];


//    NSLog(@"patcode=%@",self.WebService->patientcode=StaffCode);
//    NSLog(@"name %@",self.WebService->Email1=Email);
//    
//    self.WebService->Title1=Title;
//    self.WebService->Firstname1=Firstname;
//    self.WebService->Middlename1=Middlename;
//    self.WebService->Lastname1=Lastname;
//    self.WebService->MedicalId1=MedicalId;
//    self.WebService->MedicalFacility1=MedicalFacility;
//    self.WebService->dob1=dob;
//    self.WebService->sex1=sex;
//    self.WebService->Bloodgroup1=Bloodgroup;
//    self.WebService->Fathername1=Fathername;
//    self.WebService->HusbandName1=HusbandName;
//    self.WebService->Doregistration1=theDate;
//    self.WebService->Contactno1=Contactno;
//    self.WebService->address1=address;
//    self.WebService->Countryid1=Countryid;
//    self.WebService->Stateid1=Stateid;
//    self.WebService->Cityid1=Cityid;
//    self.WebService->EmergencyContactNo1=EmergencyContactNo;
//    self.WebService->EmergencyContactName1=EmergencyContactName;
//    self.WebService->Comments1=comment;
//    self.WebService->religion1=religion;
//    self.WebService->EmergencyContactRelation1=EmergencyContactRelation;
//    self.WebService->EmergencyContactAddress1=EmergencyContactAddress;
//    self.WebService->EmergencyContactCountryId1=EmergencyContactCountryId;
//    self.WebService->EmergencyContactStateId1=EmergencyContactStateId;
//    self.WebService->EmergencyContactCityId1=EmergencyContactCityId;
//    self.WebService->Status1=Status;
//    self.WebService->ud11=ud1;
//    self.WebService->UId22=UId2;
////    self.WebService->PatientAlert1=PatientAlert;
//    self.WebService->rolename1=rolename;
//    self.WebService->designation_name1=designation_name;
//    self.WebService->DepartmentAlert1=DepartmentAlert;
//    self.WebService->SpecializationAlert1=SpecializationAlert;
//    // self.WebService->Password1=Password;
//    self.WebService->Areaid1=Areaid;
//    self.WebService->Pincode1=Pincode;
//    self.WebService->Nationid1=Nationid;
//    NSLog(@"nation id is %@",Nationid);
//    NSLog(@"nation id is %@",self.WebService->Nationid1);
//    
//    self.WebService->Alias1=Alias;
//    
//    
    
    NSLog(@"nation is is %@",Nationid);
    
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
    
    [Status integerValue];
    
    NSLog(@"email %@ ,sal %@, fir name %@, mid %@, las na %@, mesid %@, dob %@ ,sex %@ ,blood goup %@, fath %@",Email,Title,Firstname,Middlename, Lastname,MedicalId,dob,sex,Bloodgroup,Fathername);
    
    NSLog(@"hus %@ ,dore %@,contno %@, add %@, couid %@,staid %@,cityid %@, speal %@,comm %@,reli %@, des_name %@,medi %@,role name %@,are %@,pincode %@,nation %@,alias %@ ",HusbandName,theDate,Contactno,address,Countryid,Stateid,Cityid,SpecializationAlert,comments,religion,designation_name,MedicalFacility,rolename,Areaid,Pincode,Nationid,Alias);
    
    
    NSMutableDictionary *PatientRegistration=[[NSMutableDictionary alloc]initWithObjectsAndKeys:StaffCode,@"StaffCode",Email,@"Email",Title,@"Salutation",Firstname,@"FirstName",Middlename,@"MiddleName",Lastname,@"LastName",MedicalId,@"MedicalId",dob,@"DOB",sex,@"Sex",Bloodgroup,@"BloodGroup",Fathername,@"FatherName",HusbandName,@"HusbandName",theDate,@"DORegistration",Contactno,@"ContactNo",address,@"Address",Countryid,@"CountryId",Stateid,@"StateId",Cityid,@"CityId",EmergencyContactNo,@"EmergencyContactNo",EmergencyContactName,@"EmergencyContactName",comment,@"Comments",religion,@"Religion",EmergencyContactRelation,@"EmergencyContactRelation",EmergencyContactAddress,@"EmergencyContactAddress",EmergencyContactCountryId,@"EmergencyContactCountryId",EmergencyContactStateId,@"EmergencyContactStateId",EmergencyContactCityId,@"EmergencyContactCityId",Status,@"Status",ud1,@"UId1",UId2,@"UId2",StaffAlert,@"StaffAlert",Areaid,@"AreaId",Pincode,@"PinCode",Nationid,@"Nationality",Alias,@"Alias",specializationarr,@"SpecializationAlert",DepartmentAlert,@"DepartmentAlert",rolename,@"RoleName",designation_name,@"DesignationId",MedicalFacility,@"HospitalId",nil];
    
    NSLog(@"arr %@",PatientRegistration);
    
    
    NSLog(@"name %@",self.WebService->Get_PatientRegistraion=PatientRegistration);
    

    
    
    if([Title isEqualToString:NULL]||[Firstname isEqualToString:NULL]||[Lastname isEqualToString:NULL]||(dob==NULL )||[sex isEqualToString:NULL]||[theDate isEqualToString:NULL]||[Countryid isEqualToString:NULL]||[Stateid isEqualToString:NULL]||[Cityid isEqualToString:NULL]||[Areaid isEqualToString:NULL]||[Pincode isEqualToString:NULL])
    {
        
        alert = [[UIAlertView alloc] initWithTitle:@"Check" message:@"Mandatory(*)Fields Required" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        
        
        [alert show];
    }
    
    else
    {
        
        [self.WebService CallServiceStaffUpdate:@"http://192.168.1.202:81/StaffModule/StaffService.asmx/UpdateStaff" Object:NULL Handler:NULL];
        
        NSLog(@"webservice is %@",self.WebService.ptr);
        
        alert = [[UIAlertView alloc] initWithTitle:self.WebService.ptr message:StaffCode delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        
        [alert show];
        
    }
    
}

//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    if (buttonIndex == 0)
//    {
//        patientname.text=@"";
//        
//        //cancel clicked ...do your action
//        for (UIView* subView in scrollview.subviews)
//        {
//            if ([subView isKindOfClass:[UIButton class]])
//                [subView removeFromSuperview];
//            
//            if ([subView isKindOfClass:[UILabel class]])
//                [subView removeFromSuperview];
//            if ([subView isKindOfClass:[UITextField class]])
//                [subView removeFromSuperview];
//        }
//    }
//    else if (buttonIndex == 1)
//    {
////        for (UIView* subView in scrollview.subviews)
////        {
////            if ([subView isKindOfClass:[UIButton class]])
////                [subView removeFromSuperview];
////            
////                  if ([subView isKindOfClass:[UILabel class]])
////                    [subView removeFromSuperview];
////            if ([subView isKindOfClass:[UITextField class]])
////                [subView removeFromSuperview];
////        }
//
//        
//    }
//}
//

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
