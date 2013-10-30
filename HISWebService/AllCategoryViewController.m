//
//  AllCategoryViewController.m
//  HISWebService
//
//  Created by Rahul Sharma on 06/05/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import "AllCategoryViewController.h"
#import "PatientLabDetailsViewController.h"
#import "PatientRegistraionViewController.h"
#import "UpdatePatientDetailsViewController.h"
#import "StaffRegistrationViewController.h"
#import "UpdateStaffViewController.h"
#import "AdviseInvestigationViewController.h"
#import "InvestigationWorkListViewController.h"

@interface AllCategoryViewController ()

@end

@implementation AllCategoryViewController
@synthesize loc;

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
    scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0,30,320,540)];
    
    [scrollview setContentSize:CGSizeMake(320, 800)];
    
    scrollview.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    scrollview.autoresizesSubviews = YES;
    
    scrollview.scrollEnabled = YES;
    
    scrollview.directionalLockEnabled = YES;
    
    scrollview.showsVerticalScrollIndicator = YES;
    
    scrollview.showsHorizontalScrollIndicator = NO;
    
    scrollview.autoresizesSubviews = YES;
    scrollview.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:scrollview];

    
//    PatientData=[[NSArray alloc]initWithObjects:@"Patient Registration",@"Update Patient Details",@"Patient Lab Details", nil];
//    UIButton *Patient=[[UIButton alloc]initWithFrame:CGRectMake(10,20,100,20)];
//    Patient.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
//   
//    [Patient setTitle:@"Patient" forState:UIControlStateNormal];
//    [Patient addTarget:self action:@selector(PatientRegistration) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:Patient];
//    
//    UIButton *staff=[[UIButton alloc]initWithFrame:CGRectMake(130,20,100,20)];
//    staff.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
//    [staff setTitle:@"Patient" forState:UIControlStateNormal];
//    [staff addTarget:self action:@selector(PatientRegistration) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:staff];

    
//    
//    UITableView *tabel=[[UITableView alloc]initWithFrame:CGRectMake(10, 30,100,50) style:UITableViewStylePlain];
//    tabel.delegate=self;
//    tabel.dataSource=self;
//    [self.view addSubview:tabel];
    
    
    NSLog(@"location %@",loc);
   UIButton *PatientRegistraion=[[UIButton alloc]initWithFrame:CGRectMake(10,20,200,50)];
   PatientRegistraion.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
   [PatientRegistraion setTitle:@"Patient Registraion" forState:UIControlStateNormal];
   [PatientRegistraion addTarget:self action:@selector(PatientRegistration) forControlEvents:UIControlEventTouchUpInside];
    [scrollview addSubview:PatientRegistraion];
   
   UIButton *UpdatePatientDetails=[[UIButton alloc]initWithFrame:CGRectMake(10,80,200,50)];
   UpdatePatientDetails.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
   [UpdatePatientDetails setTitle:@"Update Patient Details" forState:UIControlStateNormal];
   [UpdatePatientDetails addTarget:self action:@selector(UpdatePatientDetails) forControlEvents:UIControlEventTouchUpInside];
   [scrollview addSubview:UpdatePatientDetails];
   
   
   UIButton *PatientLabDetails=[[UIButton alloc]initWithFrame:CGRectMake(10,140,200,50)];
   PatientLabDetails.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
   [PatientLabDetails setTitle:@"Patient Lab Details" forState:UIControlStateNormal];
   [PatientLabDetails addTarget:self action:@selector(PatientLabDetails) forControlEvents:UIControlEventTouchUpInside];
   [scrollview addSubview:PatientLabDetails];

    UIButton *StaffRegistration=[[UIButton alloc]initWithFrame:CGRectMake(10,200,200,50)];
    StaffRegistration.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
    [StaffRegistration setTitle:@"Staff Registration" forState:UIControlStateNormal];
    [StaffRegistration addTarget:self action:@selector(StaffRegistration) forControlEvents:UIControlEventTouchUpInside];
    [scrollview addSubview:StaffRegistration];
    
    UIButton *UpdateStaff=[[UIButton alloc]initWithFrame:CGRectMake(10,260,200,50)];
    UpdateStaff.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
    [UpdateStaff setTitle:@"Update Staff" forState:UIControlStateNormal];
    [UpdateStaff addTarget:self action:@selector(UpdateStaff) forControlEvents:UIControlEventTouchUpInside];
    [scrollview addSubview:UpdateStaff];


    UIButton *Laboratory=[[UIButton alloc]initWithFrame:CGRectMake(10,320,200,50)];
    Laboratory.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
    [Laboratory setTitle:@"Advise Investigation" forState:UIControlStateNormal];
    [Laboratory addTarget:self action:@selector(Laboratory) forControlEvents:UIControlEventTouchUpInside];
    [scrollview addSubview:Laboratory];
    
    Investigation=[[UIButton alloc]initWithFrame:CGRectMake(10,380,200,50)];
    Investigation.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
    [Investigation setTitle:@"Investigation Work List" forState:UIControlStateNormal];
    [Investigation addTarget:self action:@selector(InvestigationWorkList) forControlEvents:UIControlEventTouchUpInside];
    [scrollview addSubview:Investigation];


    
    // Do any additional setup after loading the view from its nib.
}
//- (void)scrollViewDidScroll:(UIScrollView *)sender {
//    
//    CGFloat pageWidth = sender.frame.size.width;
//    
//    page = floor((sender.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
//    
//    NSLog(@"page %d",page);
//}

-(void)PatientRegistration
{
//    UITableView *tabel=[[UITableView alloc]initWithFrame:CGRectMake(10, 40,200,200) style:UITableViewStylePlain];
//    tabel.delegate=self;
//    tabel.dataSource=self;
//    [self.view addSubview:tabel];
   PatientRegistraionViewController *PatientRegistraionController=[[PatientRegistraionViewController alloc]init];
  [self.navigationController pushViewController:PatientRegistraionController animated:YES];
   
}
-(void)UpdatePatientDetails
{
    UpdatePatientDetailsViewController *UpdatePatientDetails=[[UpdatePatientDetailsViewController alloc]init];
    [self.navigationController pushViewController:UpdatePatientDetails animated:YES];
    
}
-(void)PatientLabDetails
{
    PatientLabDetailsViewController *PatientLabDetailsController=[[PatientLabDetailsViewController alloc]init];
    [self.navigationController pushViewController:PatientLabDetailsController animated:YES];
}

-(void)StaffRegistration
{
    
    
    StaffRegistrationViewController *StaffRegistration=[[StaffRegistrationViewController alloc]init];
    [self.navigationController pushViewController:StaffRegistration animated:YES];
    
    
}
-(void)UpdateStaff
{
    
    UpdateStaffViewController *UpdateStaff=[[UpdateStaffViewController alloc]init];
    [self.navigationController pushViewController:UpdateStaff animated:YES];
    
    
    
}
-(void)Laboratory
{
 
//    NSString *dateString = @"01-02-2010";
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//      [dateFormatter setDateFormat:@"dd/MM/yyyy"];
// //   NSDate *dateFromString = [[NSDate alloc] init];
//    // voila!
//   NSDate *  dateFromString = [dateFormatter dateFromString:dateString];
//    NSLog(@"date %@",dateFromString);
    
    
    
    AdviseInvestigationViewController *AdviseInv=[[AdviseInvestigationViewController alloc]init];
    //AdviseInv.LocationID=[NSString stringWithFormat:@"%@",loc];
 //   NSLog(@"adv is %@",AdviseInv.LocationID);
    [self.navigationController pushViewController:AdviseInv animated:YES];
    
}
-(void)InvestigationWorkList
{
    InvestigationWorkListViewController *InvestigationList=[[InvestigationWorkListViewController alloc]init];
    
    UIActivityIndicatorView *myIndicator = [[UIActivityIndicatorView alloc]
                                            initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    // Position the spinner
    [myIndicator setCenter:CGPointMake(90.0, 30.0)];
    
    // Add to button
    [Investigation addSubview:myIndicator];
    
    
    if([myIndicator isAnimating])
        [myIndicator stopAnimating];
    else
        [myIndicator startAnimating];
   
    [self.navigationController pushViewController:InvestigationList animated:YES];
    
    if([myIndicator isAnimating])
    {
        [myIndicator stopAnimating];
        myIndicator.hidden=YES;
        
    }

    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [PatientData count];    //count number of row from counting array hear cataGorry is An Array
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
    {
         cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:MyIdentifier] ;
     //     cell.textLabel.text = [PatientData objectAtIndex:indexPath.row];
        
    }
    NSLog(@"patie is %d",PatientData.count);
    
     cell.textLabel.text = [PatientData objectAtIndex:indexPath.row];
    
    
    // Here we use the provided setImageWithURL: method to load the web image
    // Ensure you use a placeholder image otherwise cells will be initialized with no image
     return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    array = [self.navigationController viewControllers];
    [self.navigationController popToViewController:[array objectAtIndex:indexPath.row] animated:YES];
  //  [self.navigationController pushViewController:[array objectAtIndex:indexPath.row+1] animated:YES];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
