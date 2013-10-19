//
//  PatientLabDetailsViewController.h
//  HISWebService
//
//  Created by Rahul Sharma on 06/05/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebService.h"
#import "PatientLabTestDesc1ViewController.h"
#import "PatientTestHistoryViewController.h"


@interface PatientLabDetailsViewController : UIViewController<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    PatientTestHistoryViewController *PTH;
    WebService *WebService;
    UIScrollView *scrollview;
    UITextField *patientname;
    UITextField *count;
    NSString *PatientName;
    NSString *Count;
    IBOutlet UITableView *table;
    UIPickerView *pickerview;
    NSString *PatientCode;
    UIToolbar *tool;
    NSMutableArray *arr2;
    NSMutableArray *array1;
    NSString *s;
    NSString *AdviseDate ;
    UIButton *Test1;
    NSMutableArray *viewhistory;
    NSMutableArray *TestID;
    NSMutableArray *Sample;
    NSMutableArray *TestCom;
    NSMutableArray *SampleRec;
    NSMutableArray *Labno;
    NSMutableArray *HistroyReport;
    UILabel *PatientAdvisedDrVal;
   IBOutlet UINavigationBar *TabBar;
    NSMutableArray *AppendArray;
    NSMutableDictionary  *Patient_detail;
    UIView *view1;
    UITableView *table_SearchPatient;
    
    IBOutlet UITabBarItem *item1;
    IBOutlet UITabBarItem *item2;
    
    NSString * Patientid;
       
}

@property(nonatomic,strong)UILabel *PatientAdvisedDrVal;
@property(nonatomic,strong)WebService *WebService;
@property(nonatomic,strong)NSString *PatientName;
@property(nonatomic,strong)  NSString * Patientid;
@property(nonatomic,strong)NSString *PatientCode;
@property(nonatomic,strong)UITextField *patientname;
@property(nonatomic,strong)UIScrollView *scrollview;
@property(nonatomic,strong)PatientTestHistoryViewController *PTH;

-(IBAction)SearchPatients:(id)sender;
-(IBAction)donebtn:(id)sender;
-(void)CallService:(NSString*)Str;
-(IBAction)TestDescription1:(UITapGestureRecognizer *)reconizer;
-(IBAction)TestDescription2:(id)sender;
-(IBAction)CallServiceWithIndex:(NSString*)Str;
-(IBAction)ChargeDetails;
-(IBAction)ViewContactDetails;
-(void)GetAdvisedInvestigationDetail;
//-(void)CallServiceHistory:(NSString *)Str;
@end
