//
//  PatientTestHistoryViewController.h
//  HISWebService
//
//  Created by Rahul Sharma on 11/05/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebService.h"
//#import "PatientLabDetailsViewController.h"

@interface PatientTestHistoryViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
  //  WebService *WebService;
   NSMutableArray *History;
   IBOutlet UITableView *table;
  //  NSInteger *row;
    NSMutableArray *HistoryData;
    NSUInteger row1;
    NSString  *s5 ;
    NSIndexPath *selectedCellIndexPath;
 //  UITableViewCell *selectedCell;
   // BOOL indexPath1;
   //  int selectedCell;

   // PatientLabDetailsViewController *PVC;
}
//@property(nonatomic,strong)WebService *WebService;
//@property(nonatomic,strong) PatientLabDetailsViewController *PVC;
//@property(nonatomic,strong)IBOutlet UITableView *table;
@property(nonatomic,strong)NSMutableArray *History;
@property(nonatomic,strong)NSMutableArray *HistoryData;
//@property(nonatomic)NSInteger row1;
@property(nonatomic,strong)NSString *s5;
@property(nonatomic,strong)NSIndexPath *selectedCellIndexPath;
//@property(nonatomic,readwrite)int selectedCell;

//-(void)CallServiceHistory:(NSString*)Str;
@end
