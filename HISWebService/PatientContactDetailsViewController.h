//
//  PatientContactDetailsViewController.h
//  HISWebService
//
//  Created by Rahul Sharma on 29/05/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebService.h"

@interface PatientContactDetailsViewController : UIViewController
{
    WebService *WebService;
    NSString *PatientDetail;
    NSMutableArray *PatientDetails;
    NSString *area_id;
  }
@property(nonatomic,strong)NSString *PatientID1;
@property(nonatomic,strong) WebService *WebService;
@property(nonatomic,strong)NSMutableArray *PatientDetails;
-(void)CallServicePatientDetails:(NSString*)Str;
-(void)CallServicePatientDetailsAddress:(NSString*)Str;
@end
