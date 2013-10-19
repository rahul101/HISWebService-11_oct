//
//  UpdatePatientDetailsViewController.h
//  HISWebService
//
//  Created by Rahul Sharma on 07/06/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebService.h"
#import "PickerView.h"

@interface UpdatePatientDetailsViewController : UIViewController<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UITableViewDataSource,UITableViewDelegate,YHCPickerViewDelegate>
{
    WebService *WebService;
    UIScrollView *scrollview;
    UITextField *patientname;
    UITextField *count;
    NSString *PatientName;
    NSString *Count;
   // UIPickerView *pickerview;
    NSString *PatientCode;
   IBOutlet UIToolbar *tool;
    NSMutableArray *SearchPatientCode;
    NSMutableArray *SearchPatientName;
    NSMutableArray *AppendArray;
    NSMutableArray *Patient_detail;
    NSString *PatientDetails;
    UITextField *email;
    UITextField *Salutation;
    UITextField *FirstName;
    UITextField *MiddleName;
    UITextField *LastName;
    UITextField *DOB;
    UITextField *Sex;
    UITextField *BloodGroup;
    UITextField *FatherName;
    UITextField *DORegistration;
    UITextField *ContactNo;
    UITextField *Address;
    UITextField *CountryId;
    UITextField *StateId;
    UITextField *CityId;
    UITextField *Religion;
    UITextField *UId1;
    UITextField *AreaId;
    UITextField *PinCode;
    UITextField *NationId;
    UITextField *alias;
     UITextField *comments;
    //required
    NSString *Email;
    NSString *Title;
    NSString *Firstname;
    NSString *Middlename;
    NSString *Lastname;
    NSDate *dob;
    NSString *sex;
    NSString *Bloodgroup;
    NSString *Fathername;
    NSDate *Doregistration;
    NSString *Contactno;
    NSString *address;
    NSString *Countryid;
    NSString *Stateid;
    NSString *Cityid;
    NSString *religion;
    NSString *ud1;
    NSString *Areaid;
    NSString *Pincode;
    NSString *Nationid;
    NSString *Alias;
    NSString *comment;
    //optional
    NSString *HusbandName;
    NSString *EmergencyContactNo;
    NSString *EmergencyContactName;
    NSString *EmergencyContactRelation;
    NSString *EmergencyContactAddress;
    NSString *EmergencyContactCountryId;
    NSString *EmergencyContactStateId;
    NSString *EmergencyContactCityId;
    NSString *Status;
    NSString *UId2;
    NSString *PatientAlert;
    NSString *Password;
    UIButton *done;
    NSDateFormatter  *dateFormatter;
    NSDateFormatter  *anotherDateFormatter;
    NSDate  *myDate;
    NSString *nationId;
    NSString *Patientid;
    
    NSString  *theDate;
    NSString  *Dob;
    NSString *thedob;
    
    UIPickerView *pickerview_country;
    
    UIDatePicker *DatePicker;
    NSMutableArray *Dict;
    NSMutableArray *Dict123;
    NSMutableArray *Dict321;
    NSString *country;
    BOOL selectionState_;
    NSMutableArray *GenderList;
    UIPickerView *pickerview_sex;
    UIPickerView *pickerview_state;
    NSMutableArray *State_Detail;
    NSMutableArray *View_StateID;
    NSString *state;
    UIPickerView *pickerview_city;
    UIPickerView *pickerview_area;
    UITapGestureRecognizer *singleTap ;
    NSMutableArray *Area_Detail;
    NSMutableArray *View_Area;
    NSString *city;
    NSString *selected_property_id;
    UILabel *titleLabel;
    UIImageView *checkmarkImageView;
    NSString *area;
    UIPickerView *Pickerview_Nationality ;
    NSMutableArray *Nationality_ID;
    NSString *Nationality;
    NSMutableArray *Nationality_View;
    UIAlertView * alert;
    NSMutableArray *Area_ID;
    NSMutableArray *Salutations;
    NSMutableArray *Title_view;
    UIPickerView *Pickerview_Salutations;
    
    NSMutableArray *bloodgroup;
    NSMutableArray *Bloodgroup_view;
    UIPickerView *Pickerview_BloodGroup;
    
    NSMutableArray *ReligionDetail;
    NSMutableArray *Religion_view;
    UIPickerView *Pickerview_Religion;
    
    UITableView *table_SearchPatient;
    NSString *emailRegEx;
    NSPredicate *emailTest;
    UIButton  *Dob_button;
    UIButton  *age_button;
    UIButton *_Fatherbutton;
    UIButton *_Husbutton;
    int text_tag;
    int check;
    PickerView *objYHCPickerView;
    NSString  *EmailCheck;
    NSString *AliasCheck;
    NSMutableArray  *AreaList;
    NSString *Enddate;
    NSString *EmailService;
    NSMutableArray *copyListOfItems;
    BOOL searching;
    	BOOL letUserSelectRow;
    NSString *str;
    IBOutlet UISearchBar *search;
    NSString *Aliascheck;
}
@property(strong,nonatomic)UIView *view1;
@property(strong,nonatomic)UITextField *DOB;
@property(nonatomic,strong)WebService *WebService;
//-(IBAction)UpdatePicker:(id)sender;
-(IBAction)UpdateButton:(id)sender;
-(void)SearchPatients:(id)sender;
-(IBAction)donebtn:(id)sender;
-(IBAction)donebutton:(id)sender;
//-(IBAction)btnpress1:(id)sender;
-(void)dismissKeyboard;
-(void)CallService:(NSString*)Str;
-(void)CallService1:(NSString*)Str;
-(void)buttonPress;
-(void)buttonPress1;


@end
