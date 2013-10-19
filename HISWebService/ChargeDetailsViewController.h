//
//  ChargeDetailsViewController.h
//  HISWebService
//
//  Created by Rahul Sharma on 20/05/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebService.h"

@interface ChargeDetailsViewController : UIViewController
{
    
     NSMutableDictionary *ChargeDetail_dictionary;
      NSString *str;
      NSString *Charge;
    NSString *Netamount;
    NSString *AmountReceive;
    UIImageView *ruppe;
    UIImage *rup_symbol;
}
@property(nonatomic,strong)WebService *WebService;
@property(nonatomic,strong)NSMutableDictionary *ChargeDetail_dictionary;
-(void)CallServiceChargeDetails:(NSString*)Str;
-(void)CallServiceChargeDetailsRewardPoins:(NSString*)Str;
@end
