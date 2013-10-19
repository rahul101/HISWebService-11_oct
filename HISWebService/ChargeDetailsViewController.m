//
//  ChargeDetailsViewController.m
//  HISWebService
//
//  Created by Rahul Sharma on 20/05/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import "ChargeDetailsViewController.h"

@interface ChargeDetailsViewController ()

@end

@implementation ChargeDetailsViewController
@synthesize ChargeDetail_dictionary;
@synthesize WebService=_WebService;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.WebService=[[WebService alloc]init];
    
    //self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth ;
  //  self.view.autoresizesSubviews = YES;

    NSLog(@"charge detail %@",ChargeDetail_dictionary);
    
    
    UILabel *Date_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,70,100,20)];
    Date_lbl.font = [UIFont systemFontOfSize:12.0];
    Date_lbl.backgroundColor=[UIColor whiteColor];
    [Date_lbl setText:@"Date :"];
    [self.view addSubview:Date_lbl];
    
    UILabel *DateVal=[[UILabel alloc]initWithFrame:CGRectMake(130,70,170,20)];
    DateVal.font =[UIFont boldSystemFontOfSize:15.0];
    DateVal.backgroundColor=[UIColor whiteColor];
   // [self CallServiceChargeDetails:@"AdviseDate"];
   // Charge=[NSString stringWithFormat:@"%@",str];
    
    
    NSDateFormatter  *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setAMSymbol:@"AM"];
    [dateFormatter setPMSymbol:@"PM"];
    [dateFormatter setDateFormat:@"dd-MM-yyyy hh:mm:ss a"];
    NSDate  *myDate = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@",[ChargeDetail_dictionary valueForKey:@"AdviseDate"]]];
    NSLog(@"%@", [dateFormatter stringFromDate:myDate]);
    
    NSDateFormatter  *anotherDateFormatter = [[NSDateFormatter alloc] init];
    [anotherDateFormatter setDateFormat:@"dd/MM/yyyy HH:mm:ss"];
    NSLog(@"%@", [anotherDateFormatter stringFromDate:myDate]);
    
    DateVal.text =[anotherDateFormatter stringFromDate:myDate];
    NSLog(@"item is %@",DateVal.text);
    //[PatCodeVal setText:arr3];
    [self.view addSubview:DateVal];

    
    UILabel *Casecode_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,100,100,20)];
    Casecode_lbl.font = [UIFont systemFontOfSize:12.0];
    Casecode_lbl.backgroundColor=[UIColor whiteColor];
    [Casecode_lbl setText:@"Case Code :"];
    [self.view addSubview:Casecode_lbl];
    
    UILabel *CasecodeVal=[[UILabel alloc]initWithFrame:CGRectMake(130,100,170,20)];
    CasecodeVal.font =[UIFont boldSystemFontOfSize:15.0];
    CasecodeVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceChargeDetails:@"CaseCode"];
   // Charge=[NSString stringWithFormat:@"%@",str];
    
    CasecodeVal.text = [NSString stringWithFormat:@"%@",str];
    NSLog(@"item is %@",CasecodeVal.text);
    //[PatCodeVal setText:arr3];
    [self.view addSubview:CasecodeVal];

      
    UILabel *Receipt_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,130,100,20)];
    Receipt_lbl.font = [UIFont systemFontOfSize:12.0];
    Receipt_lbl.backgroundColor=[UIColor whiteColor];
    [Receipt_lbl setText:@"Receipt No. :"];
    [self.view addSubview:Receipt_lbl];
    
    UILabel *ReceiptVal=[[UILabel alloc]initWithFrame:CGRectMake(130,130,170,20)];
    ReceiptVal.font =[UIFont boldSystemFontOfSize:15.0];
    ReceiptVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceChargeDetails:@"ReceiptPrefix"];
    Charge=[NSString stringWithFormat:@"%@",str];
    
    ReceiptVal.text = [NSString stringWithFormat:@"%@",str] ;
    NSLog(@"item is %@",ReceiptVal.text);
    //[PatCodeVal setText:arr3];
    [self.view addSubview:ReceiptVal];

    
    
    UILabel *Charge_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,160,100,20)];
    Charge_lbl.font = [UIFont systemFontOfSize:12.0];
    Charge_lbl.backgroundColor=[UIColor whiteColor];
    [Charge_lbl setText:@"Charge :"];
    [self.view addSubview:Charge_lbl];
    
    ruppe=[[UIImageView alloc]initWithFrame:CGRectMake(130,160,20,20)];
    rup_symbol=[UIImage imageNamed:@"img1.jpeg"];
    ruppe.image=rup_symbol;
    [self.view addSubview:ruppe];
    
    
    UILabel *ChargeVal=[[UILabel alloc]initWithFrame:CGRectMake(150,160,170,20)];
    ChargeVal.font =[UIFont boldSystemFontOfSize:15.0];
    ChargeVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceChargeDetails:@"TotalActualAmount"];
    Charge=[NSString stringWithFormat:@"%@",str];
    
    ChargeVal.text = [NSString stringWithFormat:@"%.2f",[str floatValue]];
      NSLog(@"item is %@",ChargeVal.text);
    //[PatCodeVal setText:arr3];
    [self.view addSubview:ChargeVal];
    
    
    UILabel *NetAmount_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,220,100,20)];
    NetAmount_lbl.font = [UIFont systemFontOfSize:12.0];
    NetAmount_lbl.backgroundColor=[UIColor whiteColor];
    [NetAmount_lbl setText:@"Net Amount:"];
    [self.view addSubview:NetAmount_lbl];
    
    ruppe=[[UIImageView alloc]initWithFrame:CGRectMake(130,220,20,20)];
    rup_symbol=[UIImage imageNamed:@"img1.jpeg"];
    ruppe.image=rup_symbol;
    [self.view addSubview:ruppe];

    UILabel *NetAmountVal=[[UILabel alloc]initWithFrame:CGRectMake(150,220,170,20)];
    NetAmountVal.font =[UIFont boldSystemFontOfSize:15.0];
    NetAmountVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceChargeDetails:@"TotalPaidAmount"];
    Netamount=[NSString stringWithFormat:@"%.2f",[str floatValue]];
    NetAmountVal.text = [NSString stringWithFormat:@"%.2f",[str floatValue]];
    NSLog(@"item is %@",NetAmountVal.text);
    //[PatCodeVal setText:arr3];
    [self.view addSubview:NetAmountVal];
    
    UILabel *Discount_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,190,100,20)];
    Discount_lbl.font = [UIFont systemFontOfSize:12.0];
    Discount_lbl.backgroundColor=[UIColor whiteColor];
    [Discount_lbl setText:@"Discount :"];
    [self.view addSubview:Discount_lbl];
    
    ruppe=[[UIImageView alloc]initWithFrame:CGRectMake(130,190,20,20)];
    rup_symbol=[UIImage imageNamed:@"img1.jpeg"];
    ruppe.image=rup_symbol;
    [self.view addSubview:ruppe];

    UILabel *DiscountVal=[[UILabel alloc]initWithFrame:CGRectMake(150,190,170,20)];
    DiscountVal.font =[UIFont boldSystemFontOfSize:15.0];
    DiscountVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceChargeDetails:@"TotalPaidAmount"];
   // Netamount=[str floatValue];
    DiscountVal.text = [NSString stringWithFormat:@"%.2f",([Charge floatValue]-[Netamount floatValue])];
    NSLog(@"item is %@",DiscountVal.text);
    //[PatCodeVal setText:arr3];
    [self.view addSubview:DiscountVal];


    UILabel *AmountReceived_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,250,100,20)];
    AmountReceived_lbl.font = [UIFont systemFontOfSize:12.0];
    AmountReceived_lbl.backgroundColor=[UIColor whiteColor];
    [AmountReceived_lbl setText:@"Amount Received:"];
    [self.view addSubview:AmountReceived_lbl];
    
    ruppe=[[UIImageView alloc]initWithFrame:CGRectMake(130,250,20,20)];
    rup_symbol=[UIImage imageNamed:@"img1.jpeg"];
    ruppe.image=rup_symbol;
    [self.view addSubview:ruppe];

    UILabel *AmountReceivedVal=[[UILabel alloc]initWithFrame:CGRectMake(150,250,170,20)];
    AmountReceivedVal.font =[UIFont boldSystemFontOfSize:15.0];
    AmountReceivedVal.backgroundColor=[UIColor whiteColor];
    [self CallServiceChargeDetails:@"InitialAmount"];
    AmountReceive=[NSString stringWithFormat:@"%.2f",[str floatValue]];
    AmountReceivedVal.text = [NSString stringWithFormat:@"%.2f",[str floatValue]];
    NSLog(@"item is %@",AmountReceivedVal.text);
    [self.view addSubview:AmountReceivedVal];
    
    
    UILabel *AmountBalance_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,280,100,20)];
    AmountBalance_lbl.font = [UIFont systemFontOfSize:12.0];
    AmountBalance_lbl.backgroundColor=[UIColor whiteColor];
    [AmountBalance_lbl setText:@"Amount Balance:"];
    [self.view addSubview:AmountBalance_lbl];
    
    ruppe=[[UIImageView alloc]initWithFrame:CGRectMake(130,280,20,20)];
    rup_symbol=[UIImage imageNamed:@"img1.jpeg"];
    ruppe.image=rup_symbol;
    [self.view addSubview:ruppe];

    UILabel *AmountBalanceVal=[[UILabel alloc]initWithFrame:CGRectMake(150,280,170,20)];
    AmountBalanceVal.font =[UIFont boldSystemFontOfSize:15.0];
    AmountBalanceVal.backgroundColor=[UIColor whiteColor];
  // [self CallServiceChargeDetails:@"InitialAmount"];
   // AmountReceive=[NSString stringWithFormat:@"%.2f",[str floatValue]];
    AmountBalanceVal.text =[NSString stringWithFormat:@"%.2f",([Netamount floatValue]-[AmountReceive floatValue])];

    NSLog(@"item is %@",AmountBalanceVal.text);
    [self.view addSubview:AmountBalanceVal];
    
    UILabel *PatientReward_lbl=[[UILabel alloc]initWithFrame:CGRectMake(10,310,140,20)];
    PatientReward_lbl.font = [UIFont systemFontOfSize:12.0];
    PatientReward_lbl.backgroundColor=[UIColor whiteColor];
    [PatientReward_lbl setText:@"Patient Reward Points:"];
    [self.view addSubview:PatientReward_lbl];
   
   // [self CallServiceChargeDetails:@"CaseId"];
    NSLog(@"area is %@",self.WebService->patientCaseID=[ChargeDetail_dictionary valueForKey:@"CaseId"]);
    
    [self.WebService CallServicePatientGetPointsforCaseId:@"http://192.168.1.202:81/PatientModule/PatientService.asmx/getPointsforCaseId" Object:NULL Handler:NULL];
    
    
    UILabel *PatientRewardVal=[[UILabel alloc]initWithFrame:CGRectMake(150,310,170,20)];
    PatientRewardVal.font =[UIFont boldSystemFontOfSize:15.0];
    PatientRewardVal.backgroundColor=[UIColor whiteColor];
     [self CallServiceChargeDetailsRewardPoins:@"PaidAmount"];
    NSString *PaidAmount=[NSString stringWithFormat:@"%@",str];
    
    [self CallServiceChargeDetailsRewardPoins:@"Value"];
    NSString *Value=[NSString stringWithFormat:@"%@",str];
    
    [self CallServiceChargeDetailsRewardPoins:@"Points"];
    NSString *Points=[NSString stringWithFormat:@"%@",str];
    

    
    // AmountReceive=[NSString stringWithFormat:@"%.2f",[str floatValue]];
    PatientRewardVal.text =[NSString stringWithFormat:@"%.2f",((floor([PaidAmount floatValue]/[Value floatValue]))*[Points floatValue])];
    
    NSLog(@"item is %@",PatientRewardVal.text);
    [self.view addSubview:PatientRewardVal];

    
       
    
    // Do any additional setup after loading the view from its nib.
}


-(void)CallServiceChargeDetails:(NSString*)Str
{
    //  for(int i=0;i<(self.WebService->ptr1).count;i++)
    // {
    str =[NSString stringWithFormat:@"%@",[ChargeDetail_dictionary valueForKey:Str]];
    NSLog(@"%@", str);

    NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"-"];
    str = [[str componentsSeparatedByCharactersInSet:doNotWant]componentsJoinedByString:@""];
    NSLog(@"%@", str); // => foobarbazfoo

        // }
    // NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"()\""];
    // s = [[s componentsSeparatedByCharactersInSet:doNotWant]componentsJoinedByString:@""];
    //   NSLog(@"%@", s); // => foobarbazfoo
    //PatintCodeVal.text = [NSString stringWithFormat:@"%@",s];
}

-(void)CallServiceChargeDetailsRewardPoins:(NSString*)Str
{
        
    str =[NSString stringWithFormat:@"%@",[[self.WebService->ptr1 objectAtIndex:0]valueForKey:Str]];
    NSLog(@"%@", str);
    NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"-"];
    str = [[str componentsSeparatedByCharactersInSet:doNotWant]componentsJoinedByString:@""];
    NSLog(@"%@", str); // => foobarbazfoo

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
