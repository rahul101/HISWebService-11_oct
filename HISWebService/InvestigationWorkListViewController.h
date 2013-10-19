//
//  InvestigationWorkListViewController.h
//  HISWebService
//
//  Created by Rahul Sharma on 16/07/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebService.h"

@interface InvestigationWorkListViewController : UIViewController<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
   IBOutlet UITextField *SearchText;
    WebService *WebService;
    NSArray *WorkList;
   IBOutlet UIScrollView *scrollview;
   IBOutlet UIView *view1;
   IBOutlet UITableView *Table_WorkList;
    NSString *str;
    NSCharacterSet *doNotWant;
    UITapGestureRecognizer *tap;
    NSString *TodayDate;
    NSDateComponents* components1;
    int count;
    NSInteger day;
    IBOutlet UIDatePicker *Clender;
    IBOutlet UITextField *FromDate;
    IBOutlet UITextField *ToDate;
    BOOL select;
    NSString *start;
    NSString *End;
    int date_flag;
        int Clender_flag;

    int text_tag;
    UIDatePicker *DatePicker;
   IBOutlet UIToolbar *tool;
    int totalValues;
    //int row;
    NSMutableArray *smallArray1;
    NSInteger _pageNumber;
   NSUInteger _maxPageNumber;
    NSString *SearchPatient;
    
       CGFloat _progress;
   NSUInteger _numberOfVisibleRows;
    NSString *orderby;
    NSString *orderdirection;
    IBOutlet UIBarButtonItem *left;
    IBOutlet UIBarButtonItem *next;
}
@property (nonatomic, strong) NSArray *mainArray;
@property (nonatomic, strong) NSArray *subArray;
@property(strong,nonatomic)WebService *WebService;
@property(strong,nonatomic)UITextField *SearchText;
- (void)onCustomAccessoryTapped:(UIButton *)sender;
-(IBAction)btnpress:(UITapGestureRecognizer *)reconizer;
-(IBAction)SearchPatients:(id)sender;
-(IBAction)SelectButton:(id)sender;
-(IBAction)SelectClender:(id)sender;
-(IBAction)ClenderTextEvent:(id)sender;
-(IBAction)ClenderTextEvent1:(id)sender;
-(NSString*)Next:(id)sender;
-(NSString*)NextButton:(id)sender;
-(void)WorklistSetting;
-(IBAction)SelectButtonsort:(id)sender;
- (IBAction)prevNextAction:(id)sender;
-(void)select;


@end
