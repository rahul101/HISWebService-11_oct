//
//  PatientTestHistoryViewController.m
//  HISWebService
//
//  Created by Rahul Sharma on 11/05/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import "PatientTestHistoryViewController.h"
#import "PatientLabDetailsViewController.h"
#import "Shared.h"
@interface PatientTestHistoryViewController ()

@end

@implementation PatientTestHistoryViewController
@synthesize History,HistoryData,s5,selectedCellIndexPath;
//@synthesize WebService=_WebService;

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
   //  PatientLabDetailsViewController *PVC=[[PatientLabDetailsViewController alloc]init];
  //  [table reloadData];

    //  self.WebService=[[WebService alloc]init];
    NSLog(@"hiostory %@",History);
    
    //indexPath1=TRUE;
  //  UITableViewCell *cell1 = [table cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
   // [cell1 setAccessoryType:UITableViewCellAccessoryCheckmark];
    [table selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:0];
    
  
    /* table=[[UITableView alloc]initWithFrame:CGRectMake(0,0,320,800) style:UITableViewStylePlain];
     table.scrollEnabled=YES;
     table.bounces=YES;
     table.bouncesZoom=YES;
     table.userInteractionEnabled=YES;
     table.delaysContentTouches=YES;
     [table setDelegate:self];
     [table setDataSource:self];
     [self.view addSubview:table];*/
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    if (indexPath1)
//    {
//        UITableViewCell *cell1 = [table cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
//        [cell1 setAccessoryType: UITableViewCellAccessoryDetailDisclosureButton];
//    }
    // [table reloadData];
}
#pragma mark Table Delegates

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    //NSLog(@"serv %d",[self.WebService->arr count]);
    return [History count];
   // NSLog(@"histroy count is %d",[History count]);
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
//        if(indexPath.row==0)
//        {
//            cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
//        }
    }
    
     cell.textLabel.text = [History objectAtIndex:indexPath.row];
    
    if([self.selectedCellIndexPath isEqual:indexPath])
    {
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    //indexPath1=FALSE;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *msg=[NSString stringWithFormat:@"%@",[History objectAtIndex:indexPath.row]];
    NSLog(@"msg is %@",msg);
    
    UIAlertView *messageAlert = [[UIAlertView alloc]initWithTitle:@"Row Selected" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    // Display Alert Message
    [messageAlert show];
    NSLog(@"selected index is %@",self.selectedCellIndexPath);
    
    if(self.selectedCellIndexPath)
    {
        UITableViewCell* uncheckCell = [tableView cellForRowAtIndexPath:self.selectedCellIndexPath];
        uncheckCell.accessoryType = UITableViewCellAccessoryNone;
    }
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    self.selectedCellIndexPath = indexPath;
         
    PatientLabDetailsViewController *PVC=[[PatientLabDetailsViewController alloc]init];
    NSString *s = [[[tableView cellForRowAtIndexPath:indexPath] textLabel] text];
    NSLog(@"String is: %@", s);
    row1 = [indexPath row];
    NSLog(@"String is: %d", row1);
    
    NSLog(@"history data %@",HistoryData);
    
  // [self CallServiceHistory:@"CaseId"];
    Shared *shared=[Shared sharedUser];
    shared.Case_ID =[NSString stringWithFormat:@"%@",[[HistoryData objectAtIndex:row1]valueForKey:@"CaseId"]];
    NSLog(@"%@", shared.Case_ID);

    PVC.PTH = self;
    
    //  [PVC GetAdvisedInvestigationDetail];
    
    // [self.navigationController pushViewController:PVC animated:YES];
    
    
    NSLog(@"advise dr %@",PVC.PatientAdvisedDrVal.text);
    
    //[self dismissViewControllerAnimated:YES completion: nil];
    
   NSArray *array = [self.navigationController viewControllers];
    NSLog(@"controller %@",array);
    
    
    for (int i= 0 ; i < [[self.navigationController viewControllers]count] ; i++)
    {
        if ( [[[self.navigationController viewControllers] objectAtIndex:i] isKindOfClass:[PatientLabDetailsViewController class]])
        {
            [self.navigationController popToViewController:[array objectAtIndex:i] animated:YES];
        }
    }
//    NSMutableArray *controllers = [NSMutableArray
//                                   arrayWithArray:self.navigationController.viewControllers];
//    NSLog(@"controller %@",controllers);
//    [controllers removeLastObject];
//    [controllers addObject:pv];
//    NSLog(@"controller %@",controllers);

 //   [self.navigationController popToViewController:[array objectAtIndex:2] animated:YES];
    
    // [self.navigationController pushViewController:PVC animated:YES];
    s5=NULL;
    NSLog(@"s5 is %@",s5);
    
    
}
//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    if (buttonIndex == 0)
//    {
//        //cancel clicked ...do your action
//        [self.navigationController popToViewController:[array objectAtIndex:4] animated:YES];
//        
//    }
//    else if (buttonIndex == 1)
//    {
//       
//    }
//}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
