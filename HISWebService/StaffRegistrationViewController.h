//
//  StaffRegistrationViewController.h
//  HISWebService
//
//  Created by Rahul Sharma on 10/06/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebService.h"
#import "PickerView.h"

@interface StaffRegistrationViewController : UIViewController<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UITextViewDelegate,YHCPickerViewDelegate>
{
      WebService  *WebService;
    UIScrollView *scrollview;
    UITextField *medical;
    UITextField *email;
    UITextField *Salutation;
    UITextField *FirstName;
    UITextField *MiddleName;
    UITextField *LastName;
    UITextField *MedicalID;
    UITextField *DOB;
    UITextField *Sex;
    UITextField *AddnewStaff;
    UITextField *Designation;
    UITextField *BloodGroup;
    UITextField *FatherName;
    UITextField *DORegistration;
    UITextField *ContactNo;
    UITextField *Address;
    UITextField *CountryId;
    UITextField *StateId;
    UITextField *CityId;
    UITextField *Comment;
    UITextField *Specialization;
    CALayer *imageLayer;
    UITextField *Religion;
    UITextField *UId1;
    UITextField *AreaId;
    UITextField *PinCode;
    UITextField *NationId;
    UITextField *alias;
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
    
    
    NSMutableArray *Salutations;
    NSMutableArray *Title_view;
    UIPickerView *Pickerview_Salutations;
    
    NSMutableArray *bloodgroup;
    NSMutableArray *Bloodgroup_view;
    UIPickerView *Pickerview_BloodGroup;
    
    NSMutableArray *ReligionDetail;
    NSMutableArray *Religion_view;
    UIPickerView *Pickerview_Religion;
    //optional
    
    NSString *HusbandName;
    NSString *EmergencyContactNo;
    NSString *EmergencyContactName;
    NSString *Comments;
    NSString *EmergencyContactRelation;
    NSString *EmergencyContactAddress;
    NSString *EmergencyContactCountryId;
    NSString *EmergencyContactStateId;
    NSString *EmergencyContactCityId;
    NSString *Status;
    NSString *UId2;
    NSString *StaffAlert;
    NSString *MedicalId;
    NSString *SpecializationAlert;
    NSString *DepartmentAlert;
     NSString *rolename;
    NSString *Password;
    NSString *PrivilegeId;
//    NSString *speclization;
    
    NSDateFormatter *formatter;
    NSDate *date;
    NSTimer *timer;
   // IBOutlet UIButton *btn1;
    
   // UIButton *done;
    NSString  *theDate;
    NSString  *Dob;
   // NSString *thedob;
    
    UIPickerView *pickerview_country;
    
    UIDatePicker *DatePicker;
    NSMutableArray *Dict;
    NSMutableArray *Dict123;
    NSMutableArray *Dict321;
    NSString *country;
   // BOOL selectionState_;
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
   // NSString *selected_property_id;
    UILabel *titleLabel;
    //UIImageView *checkmarkImageView;
    NSString *area;
    UIPickerView *Pickerview_Nationality ;
    NSMutableArray *Nationality_ID;
    NSString *Nationality;
    NSMutableArray *Nationality_View;
    UIAlertView * alert;
    NSMutableArray *Medical_Facility;
    NSMutableArray *Medical_name;
    UIPickerView *pickerview_medical;
    NSString *MedicalFacility;
    NSMutableArray *Add_New_staff;
    NSMutableArray *RoleName;
    UIPickerView *pickerview_addnewstaff;
    NSString *roleid;
    NSMutableArray *designation;
    NSMutableArray *designation_view;
    UIPickerView *pickerview_designation;
    NSString *designation_name;
  
    NSString *emailRegEx;
    NSPredicate *emailTest;
    UIButton *Dob_button;
    UIButton  *age_button;
    UIButton  *_Fatherbutton;
    UIButton  *_Husbutton;
    int text_tag;
    IBOutlet UIToolbar *tool;
    int check;
    PickerView *objYHCPickerView;
    NSString *EmailCheck;
    NSString  *AliasCheck;
    NSMutableArray *SpecializationArr;
    
     NSMutableArray *SpecializationName;
    NSMutableArray  *AreaList;
    NSMutableArray *specializationarr;
    
}
@property(nonatomic,strong)WebService  *WebService;
@property(strong,nonatomic)UITextField *DOB;
@property(strong,nonatomic)UIButton *add;


//-(IBAction)UpdatePicker:(id)sender;
-(IBAction)AddButton:(id)sender;
//-(IBAction)btnpress1:(id)sender;
-(IBAction)donebtn:(id)sender;
-(IBAction)ResetButton:(id)sender;
//-(void)SpecalizationDetail;
-(void)buttonPress;
-(void)buttonPress1;
-(IBAction)buttonPress_Check:(id)sender;
@end
