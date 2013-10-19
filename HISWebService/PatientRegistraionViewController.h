//
//  PatientRegistraionViewController.h
//  HISWebService
//
//  Created by Rahul Sharma on 06/06/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebService.h"
#import "RadioButton.h"

#import "PickerView.h"
@interface PatientRegistraionViewController : UIViewController<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UITextViewDelegate,YHCPickerViewDelegate,UISearchBarDelegate>
{
    int PickerTag;
    WebService  *WebService;
    IBOutlet UIScrollView *scrollview;
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
    UITextField *Comment;
    UITextField *UId1;
    UITextField *AreaId;
    UITextField *PinCode;
    UITextField *NationId;
    UITextField *alias;
    UIButton *doneButton;
    int chk;
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
    NSString *PatientAlert;
    NSString *Password;
    
    NSDateFormatter *formatter;
    NSDate *date;
    NSTimer *timer;
    IBOutlet UIButton *btn1;
    
    UIButton *done;
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
    NSMutableArray *City_Detail;
    NSMutableArray *View_CityID;
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
    NSMutableArray *Salutations;
    NSMutableArray *Title_view;
    UIPickerView *Pickerview_Salutations;
    
    NSMutableArray *bloodgroup;
    NSMutableArray *Bloodgroup_view;
    UIPickerView *Pickerview_BloodGroup;

    NSMutableArray *ReligionDetail;
    NSMutableArray *Religion_view;
    UIPickerView *Pickerview_Religion;
    NSString *emailRegEx;
    NSPredicate *emailTest;
    UIButton *Dob_button;
    UIButton *age_button;
    UIButton *_Fatherbutton;
    UIButton *_Husbutton;
    NSDictionary *PatientRegistration;
  IBOutlet  UIToolbar *tool;
    CALayer *imageLayer;
    int check;
    PickerView *objYHCPickerView;
    NSMutableArray *AreaList;
    int text_tag;
    int View_Tag;
    NSString *AliasCheck;
    NSString *EmailCheck;
    BOOL searching;
   IBOutlet UISearchBar  *txtSearch ;
    IBOutlet UIToolbar *ToolSearch;
    NSMutableArray *copyListOfItems;
    
}
//@property(strong,nonatomic)UITextField *DOB;
@property(strong,nonatomic)WebService  *WebService;



@property (nonatomic, strong) UIImageView *checkMarkView;
@property (nonatomic, strong) UILabel *label;


-(IBAction)next:(id)sender;
-(IBAction)previous:(id)sender;
//-(IBAction)UpdatePicker:(id)sender;
-(IBAction)AddButton:(id)sender;
-(IBAction)ResetButton:(id)sender;
//-(IBAction)btnpress1:(id)sender;
-(IBAction)donebtn:(id)sender;
-(void)buttonPress;
-(void)buttonPress1;
-(IBAction)buttonPress_Check:(id)sender;

@end
