//
//  AdviseInvestigationViewController.h
//  HISWebService
//
//  Created by Rahul Sharma on 21/06/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebService.h"
#import "FPPopoverController.h"

@interface AdviseInvestigationViewController : UIViewController<UITextFieldDelegate,UITextViewDelegate,UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate,UIScrollViewDelegate>
{
    WebService *WebService;
    UIScrollView *scrollview;
    UITextField  *patientname;
    // NSString   *PatientCode;
    NSString   *PatientName;
    NSString   *Count;
    //  UIPickerView *pickerview;
    UIToolbar *tool;
    NSMutableArray *SearchPatientDetail;
    NSMutableArray *SearchPatientName;
    NSString *Result;
    
    NSDateFormatter *formatter;
    NSDate *date;
    NSString *theDate;
    UITextField *AdviseDr;
    //  UIPickerView *pickerview_AdviseDoctor;
    UITableView *table_AdviseDoctor;
    
    NSMutableArray *Advise_Doctor;
    NSMutableArray *Advise_DoctorDetail;
    UITapGestureRecognizer *singleTap;
    UITextField *location;
    //  UIPickerView *pickerview_Location;
    UITableView *table_Location;
    NSMutableArray *Location_detail;
    NSMutableArray *Location_View;
    UITextField *Medicalfacility;
    // UIPickerView *pickerview_MedicalFacility;
    UITableView *table_MedicalFacility;
    NSMutableArray *MedicalFacility_detail;
    NSMutableArray *MedicalFacility_View;
    UITextField *Panel;
    // UIPickerView *pickerview_Panel;
    UITableView *table_Panel;
    NSMutableArray *Panel_detail;
    NSMutableArray *Panel_View;
    NSString *Patientid;
    // UITextView *textview;
    UITextView  *textview_Address;
    // UILabel *ConfimEmail;
    UITextField  *confimEmail;
    UITextField  *Delivery_Staff;
    NSMutableArray *Staff_Names;
    // UIPickerView *pickerview_StaffNames;
    UITableView *table_StaffNames;
    UILabel *Label;
    UITextField *ToCollectedBy;
    //  NSMutableArray *Staff_Names;
    //  UIPickerView *pickerview_StaffNames;
    // UIPickerView *pickerview_CollectionName;
    UITableView *table_CollectionName;
    UIButton *CheckMark;
    CALayer *imageLayer;
    BOOL Check;
    BOOL Check1;
    BOOL TestCheck;
    NSMutableArray *PrimaryCategory;
    NSMutableArray *PrimaryCategoryDetail;
    IBOutlet  UITableView *tabel;
    UITableView *tabel_SecondaryID;
    NSMutableArray *SecondaryCategory;
    NSMutableArray *SecondaryCategoryDetail;
    NSString *PrimaryCategoryID;
    NSString *SecondaryCategoryID;
    NSMutableArray *Tests;
    NSMutableArray *TestsDetail;
    UITableView *tabel_Tests;
    UITableView *tabel_AdviseTest;
    NSMutableArray *AdviseTest;
    UIAlertView *alert;
    UIView *view1;
    UIView *view2;
    UIView *view3;
    //  UIPickerView *pickerview1;
    UITableView *table_SearchTestName;
    UIToolbar *tool1;
    NSMutableArray *SearchTestDetails;
    NSMutableArray *SearchTestNames;
    UITextField *Testname;
    // NSMutableArray *CheckTest;
    UITableView *table_AdviseTestDetails;
    NSString *PanelValue;
    // UILabel *ChargeDetails;
    NSMutableArray *ChargeDetail;
    NSString *str;
    NSMutableArray *ChargeVal;
    UITextField *TotalCharge;
    UITextField *discount;
   // UITextField *discountrupees;
    UITextField *netcharges;
    UITextField *initialamount;
    UITextField *balance;
    UITextField *point;
    UIButton *_button;
    UIButton *_button1;
    UIButton *_CheckMark;
    UITableView *table_SearchPatient;
    UIDatePicker *DatePicker;
    UIButton *done;
    UITextField *DateTime;
    // UIButton *SelectButton;
    UIButton  *SelectButton_Email;
    UIButton  *SelectButton_Hospital;
    UIButton *SelectButton_Courier;
    UIButton *SelectButton_self;
    UIButton *SelectButton_DirectHand;
    UILabel  *Label_Email;
    UITextField   *Email_Val;
    UILabel   *Label_Staff;
    NSString *PointsVal;
    NSMutableArray *Point_Result;
    
    NSString *AdviseBy;
    NSString *SerialNumberName;
    NSString *LocationID;
    NSString *AreaID;
    NSString *ReportStatus;
    NSString *DeliveryStaffID;
    NSString *CollectionStaffID;
    NSMutableArray *StaffName_Details;
    NSString *InvistigationID;
    NSString *LoyalityId;
    NSString *DiscountINPerc;
    NSString *DiscountBreakUP;
    NSString *RewardPoints;
    NSString *Remarks;
    NSString *Urgenttime;
    NSString *Isurgent;
    NSString *email;
    NSString *discountstr;
    NSString *totalCharge;
    NSString *netcharge;
    NSString *initialAmount;
    UITextView  *textview_Remark;
    NSString *InvDiscount;
    NSString *InvNetCharge;
    NSString *Charges;
    NSString *reminderDate;
    NSMutableArray *Investigatio_ID;
    NSMutableArray *Details;
    NSString *PatientCode;
    NSMutableDictionary  *SetAdviseInvestigation;
    UIButton *Check_Test;
    NSMutableArray *WorkListData;
    UITextField   *Refund ;
    UIButton *Freebtn;
    NSMutableArray *arrdata;
    UITableView *table_adviseInvestiondetail;
    UITextField *resultval;
    int text_tag;
    NSMutableArray *copyListOfItems;
        BOOL searching;
    UIScrollView *tble_scroll,*discount_scroll;
    UIButton *pre;
    UIButton *next;
    UILabel *DiscountRuppes;
    UILabel *DiscountPer;
    NSInteger ResultValue;
    NSMutableArray *LabelArr;
    NSMutableArray *buttonarr;
    NSMutableArray *Labeltxt;
    NSMutableArray *Cellarr;
    float r;
    NSString *hexStr;
    NSMutableArray *Test_ID;
    NSMutableArray *repotstatus;
    NSMutableArray *Freetest;
    NSMutableArray *ISFreeTest;
  //  NSMutableArray *freetest;
    NSMutableArray *Cancelarr;
    NSMutableArray *CancelTest;
    BOOL canceltest;
    //NSString *PreUrgenttime;
  //  NSString *BillingID;
    UIDatePicker *DatePicker1;
   IBOutlet UIToolbar *toolbar;
    UITextField *DORegistration;
    NSMutableArray *LabelTag;
    int range;
    NSDate *urgentdate;
    UIButton *advise;
    UILabel *PatientCodeVal;
    BOOL CheckAdvise;
    NSMutableArray *save_indexpath;
    float z1;
    NSMutableArray *ChargeArr;
    int swipe;
    UIButton *ReportDelivery;
    UILabel *TestCount;
}
@property(nonatomic,strong)FPPopoverController *popover;
@property(nonatomic,strong)NSString *CaseID;
@property(nonatomic,strong)NSString *LocationID;
@property(nonatomic,strong) NSMutableArray *IndexPopOver;
@property(strong,nonatomic)UITextField *DateTime;
//@property(strong,nonatomic)UIView *view1;
@property(strong,nonatomic)UITextField *Testname;
@property(strong,nonatomic)WebService *WebService;
-(IBAction)donebtn:(id)sender;
//-(IBAction)CallServiceWithIndex:(NSString*)Str;
//-(IBAction)btnpress1:(id)sender;
-(IBAction)SearchPatients:(id)sender;
-(IBAction)SearchPatients1:(id)sender;
-(IBAction)buttonPress_Check:(id)reconizer;
-(IBAction)btnpress:(id)reconizer;
-(IBAction)FreeTest:(id)reconizer;
- (void)onCustomAccessoryTapped:(UIButton *)sender;
- (void)pop:(NSIndexPath *)sender;
-(void)discountvalue;
//-(void)previous;
//-(void)next;
-(IBAction)discountvalueIndividuals:(id)sender;
//-(void)CheckButton;
-(void)InitialAmount;
//-(void)DiccountBreakUp;
-(void)SelecteButton:(int)index and:(NSString*)string;
//-(IBAction)ShowTable:(id)sender;
//-(IBAction)FreeTest:(UITapGestureRecognizer *)reconizer;
//-(void)buttonPress_Check;
//-(void)buttonPress_Check1;
-(void)buttonselect:(id)sender;

//-(IBAction)UpdatePicker:(id)sender;
@end