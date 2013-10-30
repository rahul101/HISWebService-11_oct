//
//  InvestigationWorkListReportGenerateViewController.h
//  HISWebService
//
//  Created by Rahul Sharma on 18/07/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebService.h"
#import "FPPopoverController.h"

@interface InvestigationWorkListReportGenerateViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UIWebViewDelegate>
{
       FPPopoverController *popover;

    NSInteger currentPopoverCellIndex;

    WebService *WebService;
    UIScrollView *ScrollView;
    NSString *string;
    UITableView *Table_worklist;
    UIAlertView   *alert ;
    CALayer *imageLayer;
    UITextField  *resultval;
    NSMutableArray *listTestVal;
    NSMutableArray *TestSample;
    UITableView  *Table_Commentlist;
    NSMutableArray *CommentList;
    UIWebView *webView;
    NSMutableArray  *data1;
   // UITableViewCell *cell1 ;
    NSInteger _row;
    NSUInteger _section;
    UIView *view1;
    UIView *view2;
    UITapGestureRecognizer *singleTap;
    NSString *words;
    NSMutableArray *AllDescriptions ;
    NSMutableArray *Description;
    NSMutableArray *copy_array;
    IBOutlet UIView *viewPage;
    int chk_cmmt;
    
}

@property(nonatomic,strong) NSMutableArray  *data1;
@property (nonatomic, strong) FPPopoverController *popover;
@property(strong,nonatomic)WebService *WebService;
@property(nonatomic,strong)NSString *CaseID;
@property(nonatomic,strong)NSString *TestID;
@property(strong,nonatomic)NSMutableArray *Dictionay_Worklist;
-(void)CallServiceDetail:(NSString *)Str;
-(void)CallServiceTestDetail:(NSString *)Str;
-(void)saveresultvalue:(UITextField*)TxtResult;
-(void)allbtn:(id)reconizer;
-(void)GetCommentDetails:(NSString*)indexpath;
-(void)settext:(NSString*)string;
@end
