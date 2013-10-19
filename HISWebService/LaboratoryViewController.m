//
//  LaboratoryViewController.m
//  HISWebService
//
//  Created by Rahul Sharma on 21/06/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import "LaboratoryViewController.h"

@interface LaboratoryViewController ()

@end

@implementation LaboratoryViewController
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
    self.WebService=[[WebService alloc]init];
    
    scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0,30,320,540)];
    
    [scrollview setContentSize:CGSizeMake(320, 800)];
    
    scrollview.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    scrollview.autoresizesSubviews = YES;
    
    scrollview.scrollEnabled = YES;
    
    scrollview.directionalLockEnabled = YES;
    
    scrollview.showsVerticalScrollIndicator = YES;
    
    scrollview.showsHorizontalScrollIndicator = NO;
    
    scrollview.autoresizesSubviews = YES;
    scrollview.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:scrollview];
    
    patientname=[[UITextField alloc]initWithFrame:CGRectMake(120,10,150,20)];
    patientname.font = [UIFont systemFontOfSize:12.0];
    patientname.placeholder = @"<Search>";
    patientname.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
    patientname.delegate =self;
    [self.view addSubview:patientname];
    
    
    
    [patientname addTarget:self action:@selector(SearchPatients:)forControlEvents:UIControlEventEditingChanged];
}
-(IBAction)SearchPatients:(id)sender
{
        //  [PTH.table reloadData];
      //  self.PTH=[[PatientTestHistoryViewController alloc]init];
        PatientName=patientname.text;
        NSLog(@"patname %@",PatientName);
        Count=@"0";
        [patientname resignFirstResponder];
        NSLog(@"patname %@",self.WebService->patientname=PatientName);
        NSLog(@"count %@",self.WebService->count=Count);
        
        [self.WebService CallServicePatientNames:@"http://192.168.1.202:81/PatientModule/PatientService.asmx/SearchPatientjquery" Object:NULL Handler:NULL];
        
        
        UIBarButtonItem *barbutton=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(donebtn:)];
        barbutton.tintColor=[UIColor blackColor];
        
        
        
        //  barbutton.autoresizesSubviews = YES;
        
        UIBarButtonItem *fixedSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        //   UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
        
        
        //    if(orientation == UIInterfaceOrientationPortrait)
        //    {
        [fixedSpace setWidth:250];
        
        //    }
        //    else if(orientation == UIInterfaceOrientationLandscapeLeft)
        //
        //    {
        //    [fixedSpace setWidth:400];
        //    }
        
        NSMutableArray* button = [[NSMutableArray alloc] initWithCapacity:2];
        [button addObject:fixedSpace];
        [button addObject:barbutton];
        //tool.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
        // tool.autoresizesSubviews = YES;
        
        
        if ([[UIScreen mainScreen] bounds].size.height >480)
        {
            tool=[[UIToolbar alloc]initWithFrame:CGRectMake(0,288,320,44)];
            
            pickerview=[[UIPickerView alloc]initWithFrame:CGRectMake(0,332,320,216)];
            
        }
        else
        {
            tool=[[UIToolbar alloc]initWithFrame:CGRectMake(0,225,320,50)];
            
            pickerview=[[UIPickerView alloc]initWithFrame:CGRectMake(0,270,320,50)];
            
        }
        tool.autoresizingMask =UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        //  tool.autoresizesSubviews = YES;
        pickerview.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin |UIViewContentModeLeft|UIViewContentModeRight;
        //  pickerview.autoresizesSubviews = YES;
        
        pickerview.dataSource=self;
        pickerview.delegate=self;
        pickerview.showsSelectionIndicator=YES;
        [tool setBarStyle:UIBarStyleBlackOpaque];
        tool.backgroundColor=[UIColor blackColor];
        tool.userInteractionEnabled=YES;
        [tool setItems:button animated:NO];
        
        [self.view addSubview:tool];
        
        [self.view addSubview:pickerview];
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapInPickerView:)];
        [singleTap setNumberOfTapsRequired:1];
        [singleTap setNumberOfTouchesRequired:1];
        [pickerview addGestureRecognizer:singleTap];
        
        SearchPatientDetail=[[NSMutableArray alloc]init];
        SearchPatientName=[[NSMutableArray alloc]init];
        NSLog(@"arr is %@",self.WebService->ptr1);
       // SearchPatientDetail=(NSMutableArray*)[self.WebService->ptr1 valueForKey:@"PatientCode"];
       // NSLog(@"item is %@",   SearchPatientDetail);
        SearchPatientName  =(NSMutableArray *)[self.WebService->ptr1 valueForKey:@"Name"];
       NSLog(@"item is %@",SearchPatientName);
        

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
