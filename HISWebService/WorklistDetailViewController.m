//
//  WorklistDetailViewController.m
//  HISWebService
//
//  Created by Rahul Sharma on 18/09/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import "WorklistDetailViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "DemoTable1Controller.h"
#import "InvestigationWorkListViewController.h"
#import "Shared.h"
@interface WorklistDetailViewController ()

@end

@implementation WorklistDetailViewController
@synthesize popover,WebService=_WebService;

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
    
   UIButton *Test=[[UIButton alloc]initWithFrame:CGRectMake(10,80,100,30)];
    [Test setTitle:@"Test" forState:UIControlStateNormal];
    Test.tag=1;
    [Test addTarget:self action:@selector(SelectButton:) forControlEvents:UIControlEventTouchUpInside];
    Test.titleLabel.font=[UIFont boldSystemFontOfSize:15.0];
    Test.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
    Test.titleLabel.textAlignment = NSTextAlignmentCenter;

    imageLayer = Test.layer;
    [imageLayer setCornerRadius:02];
    [imageLayer setBorderWidth:1];
    imageLayer.borderColor=[[UIColor lightGrayColor] CGColor];
    [self.view addSubview:Test];
    
    
     UIButton * Due=[[UIButton alloc]initWithFrame:CGRectMake(10,130,100,30)];
    [Due setTitle:@"Due" forState:UIControlStateNormal];
    Due.titleLabel.font=[UIFont boldSystemFontOfSize:15.0];
    Due.tag=2;
    [Due addTarget:self action:@selector(SelectButton:) forControlEvents:UIControlEventTouchUpInside];
    Due.titleLabel.textAlignment = NSTextAlignmentCenter;
    Due.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
    imageLayer = Due.layer;
    [imageLayer setCornerRadius:02];
    [imageLayer setBorderWidth:1];
    imageLayer.borderColor=[[UIColor lightGrayColor] CGColor];
    [self.view addSubview:Due];

    
     UIButton * Delivery=[[UIButton alloc]initWithFrame:CGRectMake(10,180,100,30)];
    [Delivery setTitle:@"Delivery" forState:UIControlStateNormal];
    Delivery.tag=3;
    [Delivery addTarget:self action:@selector(SelectButton:) forControlEvents:UIControlEventTouchUpInside];

    Delivery.titleLabel.font=[UIFont boldSystemFontOfSize:15.0];
    Delivery.titleLabel.textAlignment = NSTextAlignmentCenter;

    Delivery.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
    imageLayer = Delivery.layer;
    [imageLayer setCornerRadius:02];
    [imageLayer setBorderWidth:1];
    imageLayer.borderColor=[[UIColor lightGrayColor] CGColor];
    [self.view addSubview:Delivery];

    
    
    
     UIButton * Checked=[[UIButton alloc]initWithFrame:CGRectMake(10,230,100,30)];
   [Checked setTitle:@"Checked" forState:UIControlStateNormal];
    Checked.titleLabel.textAlignment = NSTextAlignmentCenter;
    Checked.tag=4;
    [Checked addTarget:self action:@selector(SelectButton:) forControlEvents:UIControlEventTouchUpInside];

    Checked.titleLabel.font=[UIFont boldSystemFontOfSize:15.0];
    Checked.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
    imageLayer = Checked.layer;
    [imageLayer setCornerRadius:02];
    [imageLayer setBorderWidth:1];
    imageLayer.borderColor=[[UIColor lightGrayColor] CGColor];
    [self.view addSubview:Checked];

    
    
    
     UIButton * Printed=[[UIButton alloc]initWithFrame:CGRectMake(10,280,100,30)];
    [Printed setTitle:@"Printed" forState:UIControlStateNormal];
    Printed.tag=5;
    [Printed addTarget:self action:@selector(SelectButton:) forControlEvents:UIControlEventTouchUpInside];

    Printed.titleLabel.font=[UIFont boldSystemFontOfSize:15.0];
   Printed.titleLabel.textAlignment = NSTextAlignmentCenter;
    Printed.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
    imageLayer = Printed.layer;
    [imageLayer setCornerRadius:02];
    [imageLayer setBorderWidth:1];
    imageLayer.borderColor=[[UIColor lightGrayColor] CGColor];
    [self.view addSubview:Printed];

    
    
    
     UIButton * Deliverd=[[UIButton alloc]initWithFrame:CGRectMake(10,330,100,30)];
    [Deliverd setTitle:@"Deliverd" forState:UIControlStateNormal];
    Deliverd.tag=6;
    [Deliverd addTarget:self action:@selector(SelectButton:) forControlEvents:UIControlEventTouchUpInside];
    Deliverd.titleLabel.font=[UIFont boldSystemFontOfSize:15.0];
    Deliverd.titleLabel.textAlignment = NSTextAlignmentCenter;
    Deliverd.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
    imageLayer = Deliverd.layer;
    [imageLayer setCornerRadius:02];
    [imageLayer setBorderWidth:1];
    imageLayer.borderColor=[[UIColor lightGrayColor] CGColor];
    [self.view addSubview:Deliverd];
    
    
    UIButton * Simple=[[UIButton alloc]initWithFrame:CGRectMake(10,380,100,30)];
    [Simple setTitle:@"Simple" forState:UIControlStateNormal];
    Simple.tag=7;
    [Simple addTarget:self action:@selector(SelectButton:) forControlEvents:UIControlEventTouchUpInside];
    Simple.titleLabel.font=[UIFont boldSystemFontOfSize:15.0];
    Simple.titleLabel.textAlignment = NSTextAlignmentCenter;

    Simple.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
    imageLayer = Simple.layer;
    [imageLayer setCornerRadius:02];
    [imageLayer setBorderWidth:1];
    imageLayer.borderColor=[[UIColor lightGrayColor] CGColor];
    [self.view addSubview:Simple];

    
    
    UIButton * Cancelled=[[UIButton alloc]initWithFrame:CGRectMake(10,430,100,30)];
   [Cancelled setTitle:@"Cancelled" forState:UIControlStateNormal];
    Cancelled.tag=8;
    [Cancelled addTarget:self action:@selector(SelectButton:) forControlEvents:UIControlEventTouchUpInside];
      Cancelled.titleLabel.textAlignment = NSTextAlignmentCenter;
    Cancelled.titleLabel.font=[UIFont boldSystemFontOfSize:15.0];
    Cancelled.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
    imageLayer = Cancelled.layer;
    [imageLayer setCornerRadius:02];
    [imageLayer setBorderWidth:1];
    imageLayer.borderColor=[[UIColor lightGrayColor] CGColor];
    [self.view addSubview:Cancelled];

    
    
     UIButton *Branches=[[UIButton alloc]initWithFrame:CGRectMake(10,480,100,30)];
    [Branches setTitle:@"Branches" forState:UIControlStateNormal];
    Branches.tag=9;
    [Branches addTarget:self action:@selector(SelectButton:) forControlEvents:UIControlEventTouchUpInside];

    Branches.titleLabel.textAlignment = NSTextAlignmentCenter;

    Branches.titleLabel.font=[UIFont boldSystemFontOfSize:15.0];
    Branches.backgroundColor=[UIColor colorWithRed:37/256. green:160/256. blue:218/256. alpha:1];
    imageLayer = Branches.layer;
    [imageLayer setCornerRadius:02];
    [imageLayer setBorderWidth:1];
    imageLayer.borderColor=[[UIColor lightGrayColor] CGColor];
    [self.view addSubview:Branches];
    
    
    UIButton *Submit=[[UIButton alloc]initWithFrame:CGRectMake(50,520,100,30)];
    [Submit setTitle:@"Submit" forState:UIControlStateNormal];
    Submit.tag=10;
    [Submit addTarget:self action:@selector(SelectButton:)forControlEvents:UIControlEventTouchUpInside];
    
    Submit.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    Submit.titleLabel.font=[UIFont boldSystemFontOfSize:15.0];
    Submit.backgroundColor=[UIColor grayColor];
    imageLayer = Submit.layer;
    [imageLayer setCornerRadius:02];
    [imageLayer setBorderWidth:1];
    imageLayer.borderColor=[[UIColor lightGrayColor] CGColor];
    [self.view addSubview:Submit];

    
    UIButton *Cancel=[[UIButton alloc]initWithFrame:CGRectMake(170,520,100,30)];
    [Cancel setTitle:@"Cancel" forState:UIControlStateNormal];
    Cancel.tag=11;
    [Cancel addTarget:self action:@selector(SelectButton:) forControlEvents:UIControlEventTouchUpInside];
    
    Cancel.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    Cancel.titleLabel.font=[UIFont boldSystemFontOfSize:15.0];
    Cancel.backgroundColor=[UIColor grayColor];
    imageLayer = Cancel.layer;
    [imageLayer setCornerRadius:02];
    [imageLayer setBorderWidth:1];
    imageLayer.borderColor=[[UIColor lightGrayColor] CGColor];
    [self.view addSubview:Cancel];

    
    // Do any additional setup after loading the view from its nib.
}

-(IBAction)SelectButton:(id)sender
{
    
    UIButton *btn=(UIButton*)sender;
     btntag=btn.tag;
    
    NSLog(@"btn %d",btn.tag);
    
    switch (btn.tag)
    {
        case 1:
        {
            DemoTable1Controller  *contentViewController = [[DemoTable1Controller alloc]initWithStyle:UITableViewStylePlain];
            //self.popoverController = [[WEPopoverController alloc] initWithContentViewController:contentViewController];
            
            popover=[[FPPopoverController alloc]initWithViewController:contentViewController];
            popover.contentSize=CGSizeMake(200, 200);
                       contentViewController.Flag=2;
            // self.contentSizeForViewInPopover = CGSizeMake(200, 200);
            NSMutableArray *data=[[NSMutableArray alloc]initWithObjects:@"All",@"Partial",@"Complete",@"Incomlete",@"Outsource",nil];
            NSLog(@"data %@",data);
            popover.border=YES;
            popover.arrowDirection=FPPopoverArrowDirectionLeft;
            popover.tint=FPPopoverBlackTint;
            
            contentViewController.category=(NSMutableArray*)data;
            contentViewController.wdc=self;

            [popover presentPopoverFromView:btn];

            break;
            
        }
        case 2:
        {
            DemoTable1Controller  *contentViewController = [[DemoTable1Controller alloc]initWithStyle:UITableViewStylePlain];
            //self.popoverController = [[WEPopoverController alloc] initWithContentViewController:contentViewController];
            
            popover=[[FPPopoverController alloc]initWithViewController:contentViewController];
            popover.contentSize=CGSizeMake(200, 200);
            contentViewController.Flag=2;
            // self.contentSizeForViewInPopover = CGSizeMake(200, 200);
            NSMutableArray *data=[[NSMutableArray alloc]initWithObjects:@"All",@"Fully Paid",@"Due",@"Refund",nil];
            NSLog(@"data %@",data);
            popover.border=YES;
            popover.arrowDirection=FPPopoverArrowDirectionLeft;
            popover.tint=FPPopoverBlackTint;
            
            contentViewController.category=(NSMutableArray*)data;
            contentViewController.wdc=self;
            
            [popover presentPopoverFromView:btn];
            
            break;
            
        }
        case 3:
        {
            DemoTable1Controller  *contentViewController = [[DemoTable1Controller alloc]initWithStyle:UITableViewStylePlain];
            //self.popoverController = [[WEPopoverController alloc] initWithContentViewController:contentViewController];
            
            popover=[[FPPopoverController alloc]initWithViewController:contentViewController];
            popover.contentSize=CGSizeMake(200, 200);
            contentViewController.Flag=2;
            // self.contentSizeForViewInPopover = CGSizeMake(200, 200);
            NSMutableArray *data=[[NSMutableArray alloc]initWithObjects:@"All",@"Delivery Boy",@"Email",@"Hospital",@"Courier",@"Self",nil];
            NSLog(@"data %@",data);
            popover.border=YES;
            popover.arrowDirection=FPPopoverArrowDirectionLeft;
            popover.tint=FPPopoverBlackTint;
            
            contentViewController.category=(NSMutableArray*)data;
            contentViewController.wdc=self;
            
            [popover presentPopoverFromView:btn];
            
            break;
            
        }

        case 4:
        {
            DemoTable1Controller  *contentViewController = [[DemoTable1Controller alloc]initWithStyle:UITableViewStylePlain];
            //self.popoverController = [[WEPopoverController alloc] initWithContentViewController:contentViewController];
            
            popover=[[FPPopoverController alloc]initWithViewController:contentViewController];
            popover.contentSize=CGSizeMake(200, 200);
            contentViewController.Flag=2;
            // self.contentSizeForViewInPopover = CGSizeMake(200, 200);
            NSMutableArray *data=[[NSMutableArray alloc]initWithObjects:@"All",@"Yes",@"No",nil];
            NSLog(@"data %@",data);
            popover.border=YES;
            popover.arrowDirection=FPPopoverArrowDirectionLeft;
            popover.tint=FPPopoverBlackTint;
            
            contentViewController.category=(NSMutableArray*)data;
            contentViewController.wdc=self;
            
            [popover presentPopoverFromView:btn];
            
            break;
            
        }

        case 5:
        {
            DemoTable1Controller  *contentViewController = [[DemoTable1Controller alloc]initWithStyle:UITableViewStylePlain];
            //self.popoverController = [[WEPopoverController alloc] initWithContentViewController:contentViewController];
            
            popover=[[FPPopoverController alloc]initWithViewController:contentViewController];
            popover.contentSize=CGSizeMake(200, 200);
            contentViewController.Flag=2;
            // self.contentSizeForViewInPopover = CGSizeMake(200, 200);
            NSMutableArray *data=[[NSMutableArray alloc]initWithObjects:@"All",@"Yes",@"No",nil];
            NSLog(@"data %@",data);
            popover.border=YES;
            popover.arrowDirection=FPPopoverArrowDirectionLeft;
            popover.tint=FPPopoverBlackTint;
            
            contentViewController.category=(NSMutableArray*)data;
            contentViewController.wdc=self;
            
            [popover presentPopoverFromView:btn];
            
            break;
            
        }

        case 6:
        {
            DemoTable1Controller  *contentViewController = [[DemoTable1Controller alloc]initWithStyle:UITableViewStylePlain];
            //self.popoverController = [[WEPopoverController alloc] initWithContentViewController:contentViewController];
            
            popover=[[FPPopoverController alloc]initWithViewController:contentViewController];
            popover.contentSize=CGSizeMake(200, 200);
            contentViewController.Flag=2;
            // self.contentSizeForViewInPopover = CGSizeMake(200, 200);
            NSMutableArray *data=[[NSMutableArray alloc]initWithObjects:@"All",@"Yes",@"No",nil];
            NSLog(@"data %@",data);
            popover.border=YES;
            popover.arrowDirection=FPPopoverArrowDirectionLeft;
            popover.tint=FPPopoverBlackTint;
            
            contentViewController.category=(NSMutableArray*)data;
            contentViewController.wdc=self;
            
            [popover presentPopoverFromView:btn];
            
            break;
            
        }
        case 7:
        {
            DemoTable1Controller  *contentViewController = [[DemoTable1Controller alloc]initWithStyle:UITableViewStylePlain];
            //self.popoverController = [[WEPopoverController alloc] initWithContentViewController:contentViewController];
            
            popover=[[FPPopoverController alloc]initWithViewController:contentViewController];
            popover.contentSize=CGSizeMake(200, 200);
            contentViewController.Flag=2;
            // self.contentSizeForViewInPopover = CGSizeMake(200, 200);
            NSMutableArray *data=[[NSMutableArray alloc]initWithObjects:@"All",@"Yes",@"No",nil];
            NSLog(@"data %@",data);
            popover.border=YES;
            popover.arrowDirection=FPPopoverArrowDirectionLeft;
            popover.tint=FPPopoverBlackTint;
            
            contentViewController.category=(NSMutableArray*)data;
            contentViewController.wdc=self;
            
            [popover presentPopoverFromView:btn];
            
            break;
            
        }

        case 8:
        {
            DemoTable1Controller  *contentViewController = [[DemoTable1Controller alloc]initWithStyle:UITableViewStylePlain];
            //self.popoverController = [[WEPopoverController alloc] initWithContentViewController:contentViewController];
            
            popover=[[FPPopoverController alloc]initWithViewController:contentViewController];
            popover.contentSize=CGSizeMake(200, 200);
            contentViewController.Flag=2;
            // self.contentSizeForViewInPopover = CGSizeMake(200, 200);
            NSMutableArray *data=[[NSMutableArray alloc]initWithObjects:@"All",@"Yes",@"No",nil];
            NSLog(@"data %@",data);
            popover.border=YES;
            popover.arrowDirection=FPPopoverArrowDirectionLeft;
            popover.tint=FPPopoverBlackTint;
            
            contentViewController.category=(NSMutableArray*)data;
            contentViewController.wdc=self;
            
            [popover presentPopoverFromView:btn];
            
            break;
            
        }
    
        case 9:
        {
            
            DemoTable1Controller  *contentViewController = [[DemoTable1Controller alloc]initWithStyle:UITableViewStylePlain];
            //self.popoverController = [[WEPopoverController alloc] initWithContentViewController:contentViewController];
            
            popover=[[FPPopoverController alloc]initWithViewController:contentViewController];
            popover.contentSize=CGSizeMake(200, 200);
            contentViewController.Flag=2;
            // self.contentSizeForViewInPopover = CGSizeMake(200, 200);
            NSMutableArray *data=[[NSMutableArray alloc]init];
         
            
            [self.WebService CallServiceMedicalFacilityGetAllBranches:@"http://192.168.1.202:81//LocationModule/LocationService.asmx/GetAllBranches" Object:NULL Handler:NULL];
            
            Branchesarr=(NSMutableArray*)self.WebService->ptr1;
            
             data=(NSMutableArray*)[Branchesarr valueForKey:@"Name"];;
            
            popover.border=YES;
            popover.arrowDirection=FPPopoverArrowDirectionLeft;
            popover.tint=FPPopoverBlackTint;
            
            contentViewController.category=(NSMutableArray*)data;
            contentViewController.wdc=self;
            
            [popover presentPopoverFromView:btn];
            
            break;
            
        }
       case 10:
        {
            Shared *shared=[Shared sharedUser];

            if(shared.testValue==NULL )
            {
                shared.testValue=@"0";
                
            }
            if(shared.DueValue==NULL )
            {
                shared.DueValue=@"0";
                
            }

            if(shared.DeliveryValue==NULL )
            {
                shared.DeliveryValue=@"0";
                
            }

            if(shared.Checkalue==NULL )
            {
                shared.Checkalue=@"0";
                
            }
            
            if(shared.PrintValue==NULL )
            {
                shared.PrintValue=@"0";
                
            }

            if(shared.DeliverdValue==NULL )
            {
                shared.DeliverdValue=@"0";
                
            }

            if(shared.SimpleValue==NULL )
            {
                shared.SimpleValue=@"0";
                
            }

            if(shared.CancelledValue==NULL )
            {
                shared.CancelledValue=@"0";
                
            }

            if(shared.branches==NULL )
            {
                shared.branches=@"";
                
            }

            shared.checkback=1;
            
            
            
            NSArray *array = [self.navigationController viewControllers];
            NSLog(@"controller %@",array);
            
            
            for (int i= 0 ; i < [[self.navigationController viewControllers]count] ; i++)
            {
                if ( [[[self.navigationController viewControllers] objectAtIndex:i] isKindOfClass:[InvestigationWorkListViewController class]])
                {
                    [self.navigationController popToViewController:[array objectAtIndex:i] animated:YES];
                }
            }

            break;
        }
          
        case 11:
        {
            NSArray *array = [self.navigationController viewControllers];
            NSLog(@"controller %@",array);
            
            
            for (int i= 0 ; i < [[self.navigationController viewControllers]count] ; i++)
            {
                if ( [[[self.navigationController viewControllers] objectAtIndex:i] isKindOfClass:[InvestigationWorkListViewController class]])
                {
                    [self.navigationController popToViewController:[array objectAtIndex:i] animated:YES];
                }
            }
            
        }
            

        default:
            break;
    }
    
}
-(void)settext:(NSString*)string
{
    
    
}
-(void)GetCommentDetails:(NSString*)indexpath
{
    
    
  NSLog(@"btn %d",btntag);
     NSLog(@"details %@",indexpath);
    
    Shared *shared=[Shared sharedUser];
    if(btntag==1)
    {
       shared.testValue=indexpath;
        NSLog(@"test %@", shared.testValue);
    
    }
   else if(btntag==2)
    {
       shared.DueValue=indexpath;
        NSLog(@"test %@", shared.DueValue);
        
    }
   else if(btntag==3)
   {
    shared.DeliveryValue=indexpath;
       NSLog(@"test %@",  shared.DeliveryValue);
       
   }
    
   else if(btntag==4)
   {
    shared.Checkalue=indexpath;
       NSLog(@"test %@",  shared.Checkalue);
       
   }
    
   else if(btntag==5)
   {
      shared.PrintValue=indexpath;
       NSLog(@"test %@",shared.PrintValue);
       
   }
    
   else if(btntag==6)
   {
       shared.DeliverdValue=indexpath;
       NSLog(@"test %@",   shared.DeliverdValue);
       
   }
    
   else if(btntag==7)
   {
       shared.SimpleValue=indexpath;
       NSLog(@"test %@",shared.SimpleValue);
       
   }
    
   else if(btntag==8)
   {
      shared.CancelledValue=indexpath;
       NSLog(@"test %@", shared.CancelledValue);
       
   }
    
     else if(btntag==9)
   {
       shared.branches=[[Branchesarr objectAtIndex:[indexpath integerValue]]valueForKey:@"LocationId"];
       NSLog(@"test %@",shared.branches);
       
   }
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
