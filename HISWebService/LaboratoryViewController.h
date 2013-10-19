//
//  LaboratoryViewController.h
//  HISWebService
//
//  Created by Rahul Sharma on 21/06/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebService.h"

@interface LaboratoryViewController : UIViewController<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
{
    WebService *WebService;
    UIScrollView *scrollview;
    UITextField  *patientname;
    NSString   *PatientName;
    NSString   *Count;
    UIPickerView *pickerview;
    UIToolbar *tool;
    NSMutableArray *SearchPatientDetail;
    NSMutableArray *SearchPatientName;

    
}
@property(strong,nonatomic)WebService *WebService;
@end
