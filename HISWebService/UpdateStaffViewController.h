//
//  UpdateStaffViewController.h
//  HISWebService
//
//  Created by Rahul Sharma on 14/06/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebService.h"
#import "PickerView.h"

@interface UpdateStaffViewController : UIViewController<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UITableViewDataSource,UITableViewDelegate,YHCPickerViewDelegate>

{
    WebService *WebService;
    UIScrollView *scrollview;
    UITextField *Staffname;
    UITextField *count;
    NSString *StaffName;
    NSString *Count;
    UIPickerView *pickerview;
    NSString *StaffCode;
    IBOutlet UIToolbar *tool;
    NSMutableArray *SearchStaffCode;
    NSMutableArray *SearchStaffName;
    NSMutableArray *AppendArray;
    NSMutableArray *Patient_detail;
    NSString *StaffDetails;
    
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
    NSString *StaffAlert;
    NSString *Password;
    UIButton *done;
    NSDateFormatter  *dateFormatter;
    NSDateFormatter  *anotherDateFormatter;
    NSDate  *myDate;
    NSString *nationId;
    NSString *Staffid;
    
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
    UITextField *medical;
    NSMutableArray *Medical_Facility;
    NSMutableArray *Medical_name;
    UIPickerView *pickerview_medical;
    NSString *MedicalFacility;
    NSMutableArray *designation;
    NSMutableArray *designation_view;
    UIPickerView *pickerview_designation;
    NSString *designation_name;
    UITextField *Designation;
    UITextField  *MedicalID;
    NSString *SpecializationAlert;
    NSString *DepartmentAlert;
    NSString *rolename;
    NSString *MedicalId;
    NSString *emailRegEx;
    NSPredicate *emailTest;
    IBOutlet UISearchBar *search;
    BOOL searching;
    UITableView *table_SearchStaff;
    NSMutableArray *searchResultArr;
    UIButton  *Dob_button;
    UIButton  *age_button;
    NSString  *Enddate;
    UIButton *_Fatherbutton;
    UIButton   *_Husbutton;
    UITextField *Specialization;
    NSMutableArray *SpecializationArr;
    NSMutableArray *SpecializationName;
    int text_tag;
    int check;
    PickerView *objYHCPickerView;
    NSString  *EmailCheck;
    NSString  *AliasCheck;
    NSMutableArray *AreaList;
    NSString *Aliascheck;
    NSString  *EmailService;
    NSMutableArray *specializationarr;
}
@property(strong,nonatomic)UITextField *DOB;
@property(nonatomic,strong)WebService *WebService;
-(IBAction)UpdatePicker:(id)sender;
-(IBAction)UpdateButton:(id)sender;
-(IBAction)SearchPatients:(id)sender;
-(IBAction)donebtn:(id)sender;
-(IBAction)btnpress1:(id)sender;
-(void)CallService:(NSString*)Str;
-(void)CallService1:(NSString*)Str;
//-(void)searchTableView;
-(void)buttonPress;
-(void)buttonPress1;
-(IBAction)previous:(id)sender;
-(void)selectedRow:(int)row withString:(NSString *)text;
-(IBAction)next:(id)sender;
-(IBAction)donebutton:(id)sender;
@end
