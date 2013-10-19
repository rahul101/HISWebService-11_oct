//
//  AllCategoryViewController.h
//  HISWebService
//
//  Created by Rahul Sharma on 06/05/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebService.h"


@interface AllCategoryViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{

      NSArray *array ;
 NSArray *PatientData;
    UIScrollView *scrollview;
    UIButton *Investigation;

}

@property(strong,nonatomic)NSString *loc;
-(void)PatientRegistration;
-(void)UpdatePatientDetails;
-(void)PatientLabDetails;
-(void)StaffRegistration;
-(void)UpdateStaff;
-(void)Laboratory;
-(void)InvestigationWorkList;
//-(IBAction)patientdetails:(id)sender;
@end
