//
//  PatientReportPdfViewController.m
//  HISWebService
//
//  Created by Rahul Sharma on 17/07/13.
//  Copyright (c) 2013 Rahul Sharma. All rights reserved.
//

#import "PatientReportPdfViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface PatientReportPdfViewController ()

@end

@implementation PatientReportPdfViewController
@synthesize CaseID,TestID,InvestigationID;
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
    
    UIButton *btnstar=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    [btnstar setImage:[UIImage imageNamed:@"images-19.jpeg"] forState:UIControlStateNormal];
    [btnstar addTarget:self action:@selector(sharebtn) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *starbutton = [[UIBarButtonItem alloc]initWithCustomView:btnstar];
    self.navigationItem.rightBarButtonItem=starbutton;
    
    
    self.view.autoresizesSubviews= UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    self.view.autoresizesSubviews = YES;
    
    //    ScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0,0,320,540)];
    //    ScrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    //    ScrollView.autoresizesSubviews = YES;
    //
    //    [ScrollView setContentSize:CGSizeMake(800, 1000)];
    //
    //    ScrollView.scrollEnabled = YES;
    //
    //    ScrollView.directionalLockEnabled = YES;
    //
    //    ScrollView.showsVerticalScrollIndicator = YES;
    //
    //    ScrollView.showsHorizontalScrollIndicator = YES;
    //
    //    ScrollView.autoresizesSubviews = YES;
    //    ScrollView.backgroundColor=[UIColor whiteColor];
    //    [self.view addSubview:ScrollView];
    
    //    activity=[[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(10,20,100,30)];
    //    activity.backgroundColor=[UIColor blackColor];
    //    [ScrollView addSubview:activity];
    //  //  activity.hidden=NO;
    //    if([activity isAnimating])
    //        [activity stopAnimating];
    //    else
    //        [activity startAnimating];
    
    
    self.WebService->case_id=CaseID;
    self.WebService->investigation_id=InvestigationID;
    self.WebService->test_id=TestID;
    [self.WebService CallServiceGetpatienttestReport:@"http://192.168.1.202:81/LaboratoryModule/LISService.asmx/GetpatienttestReport" Object:NULL Handler:NULL];

    NSLog(@"data is %@",self.WebService->byteArray);
    
    NSMutableData *data2 = [[NSMutableData alloc] initWithCapacity:self.WebService->byteArray.count];
    for (NSNumber *byteVal in self.WebService->byteArray)
    {
        Byte b = (Byte)(byteVal.intValue);
        [data2 appendBytes:&b length:1];
        
        
        // NSLog(@"data %@",data2);
    }
//    NSData *myFile = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"your_url"]];
//    [myFile writeToFile:[NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath], @"abcd.pdf"] atomically:YES];

    
   // NSData *pdfData = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:tempString]];
    NSString *resourceToPath = [[NSString alloc]initWithString:[[[[NSBundle mainBundle]resourcePath]stringByDeletingLastPathComponent]stringByAppendingPathComponent:@"Documents"]];
      fileName = [resourceToPath stringByAppendingPathComponent:@"myPDF.pdf"];
    NSLog(@"file %@",fileName);
    [data2 writeToFile:fileName atomically:YES];
    
    // to populate the WebView
//    NSURL *url2 = [NSURL fileURLWithPath:filePAth];
//    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url2];
//    [my_web_view setUserInteractionEnabled:YES];
//    //[editoriale_view setDelegate:self];
//    [my_web_view loadRequest:requestObj];
//    
//    //    
//    NSLog(@"data %@",data2);
////    NSArray *docDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
// //   NSString *docDirectory = [docDirectories objectAtIndex:0];
//    
//    NSArray* cachesPaths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
//    NSString* cachesDir = (NSString*)[cachesPaths objectAtIndex:0];
//        
//    fileName = [cachesDir stringByAppendingPathComponent:@"abcd.pdf"];
//    
//    [data2 writeToFile:fileName atomically:YES];
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//      if(![fileManager fileExistsAtPath:[fileName stringByAppendingPathComponent:@"abcd.pdf"]])
//       {
//          //[[NSFileManager defaultManager] createFileAtPath:fileName contents:nil attributes:nil];
//        //create it, copy it from app bundle, download it etc.
//    }
//    NSLog(@"file %@",fileName);
    
//    NSURL *targetURL = [NSURL fileURLWithPath:fileName];
//    NSURLRequest *requestFile = [NSURLRequest requestWithURL:targetURL];
//    
//    UIWebView *webView1=[[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
//  //  [[webView1 scrollView] setContentOffset:CGPointMake(0,500) animated:YES];
//    webView1.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight) ;
//   // [webView1 stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"window.scrollTo(0.0, 50.0)"]];
//    webView1.scalesPageToFit = YES;
//    webView1.scrollView.scrollEnabled =NO;
//    [webView1 loadRequest:requestFile];
//    [self.view addSubview:webView1];
    
 //NewBadal
    
    
    NSArray  *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    NSString *pdfFilePath =[documentsDir stringByAppendingPathComponent:@"myPDF.pdf"];// your yourPdfFile file here
    NSLog(@"pdf file %@",pdfFilePath);
    NSURL *url = [NSURL fileURLWithPath:pdfFilePath];
    //    UIDocumentInteractionController *docController = [UIDocumentInteractionController interactionControllerWithURL:url];
    //
    //    docController.delegate = self;
    //  [docController retain];
    // docController is released when dismissed (autorelease in the delegate method)
    
    NSArray *paths1 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths1 count] > 0) ? [paths1 objectAtIndex:0] : nil;
    
    NSLog(@"base path %@",basePath);
    
    
    
    
    if (url)
    {
        
        // Initialize Document Interaction Controller
        UIDocumentInteractionController    * documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:url];
        
        // Configure Document Interaction Controller
        [documentInteractionController setDelegate:self];
        
        // Preview PDF
        [documentInteractionController presentPreviewAnimated:YES];
        
    }
    

    
    
    
    //[self createPDFfromUIView:webView1 saveToDocumentsWithFileName:filePAth];
    
    // Do any additional setup after loading the view from its nib.
}
-(void)show_Button
{
//   NSString *resourceToPath = [[NSString alloc]
//                               initWithString:[[[[NSBundle mainBundle] resourcePath]
//                                                stringByDeletingLastPathComponent]
//                                               stringByAppendingPathComponent:@"Documents"]];
  // NSArray *docDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
   // NSString *docDirectory = [docDirectories objectAtIndex:0];

 //  NSString *filePAth = [docDirectory stringByAppendingPathComponent:@"myPDF.pdf"];
   
//   NSLog(@"filePath = %@", fileName);
//   NSURL *url2 = [NSURL fileURLWithPath:fileName];
//   NSLog(@"url2 = %@", url2);
//   
//   UIDocumentInteractionController *docContr = [UIDocumentInteractionController
//                                                interactionControllerWithURL:url2];
//   docContr.delegate=self;
//   [docContr presentOpenInMenuFromRect:CGRectZero inView:self.view animated:YES];
   
    
    
    NSArray  *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    NSString *pdfFilePath =[documentsDir stringByAppendingPathComponent:@"myPDF.pdf"];// your yourPdfFile file here
    NSLog(@"pdf file %@",pdfFilePath);
    NSURL *url = [NSURL fileURLWithPath:pdfFilePath];
    UIDocumentInteractionController *docController = [UIDocumentInteractionController interactionControllerWithURL:url];
    
    docController.delegate = self;
 //  [docController retain];
    // docController is released when dismissed (autorelease in the delegate method)
    UIButton *yourReadPdfButton=[[UIButton alloc]init];
    NSArray *paths1 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths1 count] > 0) ? [paths1 objectAtIndex:0] : nil;
    
    NSLog(@"base path %@",basePath);
    
    
  BOOL isValid = [docController presentOpenInMenuFromRect:yourReadPdfButton.frame inView:self.view  animated:YES]; // Provide where u want to read pdf from yourReadPdfButton
    
    if (!isValid)
    {
        NSString * messageString = [NSString stringWithFormat:@"No PDF reader was found on your device. In order to consult the  please download a PDF reader (eg. iBooks)."];
        
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:messageString delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
      
//    NSError *error=nil;
//    
// //   Getting the pdf from the NSDocument Directory
//    
//    NSString *stringPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
//    NSLog(@"parth %@",stringPath);
//    
//    NSArray *filePathsArray = [[NSFileManager defaultManager]subpathsOfDirectoryAtPath:stringPath  error:&error];
//    
//    NSLog(@"parth %@",filePathsArray);
//
//    for(int i=0;i<[filePathsArray count];i++)
//    {
//        NSString *strFilePath = [filePathsArray objectAtIndex:i];
//        if ([[strFilePath pathExtension] isEqualToString:@"pdf"])
//        {
//            NSString *pdfPath = [[stringPath stringByAppendingFormat:@"/"] stringByAppendingPathComponent:strFilePath];
//             NSLog(@"parth %@",pdfPath);
//            NSData *data = [NSData dataWithContentsOfFile:pdfPath];
//            if(data)
//            {
//                NSString  *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//                NSLog(@"STR %@",str);
//                
//            }
//        }
//        
//    }
    
    
}

-(void)sharebtn
{
    
    UIActionSheet *actionsheet=[[UIActionSheet alloc]initWithTitle:@"" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Download",@"E-mail",@"Facebook", nil];
    
    [actionsheet showInView:self.view];
    actionsheet.tag=100;
    
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (buttonIndex)
    {
     case 0:
     {
         [self show_Button];
            break;
            
        }
            
        case 1:
        {
            [self openMail:actionSheet];
            
            break;
        }
        case 2:
            
        {
            
            /*  [self check];
             if (actionSheet.tag==100) {
             // then upload
             NSString *str=[all objectAtIndex:page];
             NSLog(@"url str=====%@",str);
             NSURL *url=[NSURL URLWithString:str];
             
             NSData *data=[NSData dataWithContentsOfURL:url];
             UIImage *img=[[UIImage alloc]initWithData:data];
             // Here is where the UPLOADING HAPPENS!
             [FBRequestConnection startForUploadPhoto:img
             completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
             if (!error) {
             UIAlertView *tmp = [[UIAlertView alloc]
             initWithTitle:@"Success"
             message:@"Photo Uploaded"
             delegate:self
             cancelButtonTitle:nil
             otherButtonTitles:@"Ok", nil];
             
             [tmp show];
             
             } else {
             UIAlertView *tmp = [[UIAlertView alloc]
             initWithTitle:@"Error"
             message:@"Some error happened"
             delegate:self
             cancelButtonTitle:nil
             otherButtonTitles:@"Ok", nil];
             
             [tmp show];
             
             }
             
             }];*/
            
            
            
            break;
        }
        default:
            
        {
            
            break;
        }
            
            
    }
    
}
-(void)createPDFfromUIView:(UIWebView*)aView saveToDocumentsWithFileName:(NSString*)aFilename
{
    // Creates a mutable data object for updating with binary data, like a byte array
  //  UIWebView *webView = (UIWebView*)aView;
    NSString *heightStr = [aView stringByEvaluatingJavaScriptFromString:@"document.body.scrollHeight;"];
    NSLog(@"height %@",heightStr);
    int height = [heightStr intValue];
    //  CGRect screenRect = [[UIScreen mainScreen] bounds];
    //  CGFloat screenHeight = (self.contentWebView.hidden)?screenRect.size.width:screenRect.size.height;
    CGFloat screenHeight = aView.bounds.size.height;
    int pages = ceil(height / screenHeight);
    NSLog(@"page %d",pages);
    
    NSMutableData *pdfData = [NSMutableData data];
    UIGraphicsBeginPDFContextToData(pdfData, aView.bounds, nil);
    CGRect frame = [aView frame];
    for (int i = 0; i < pages; i++)
    {
        // Check to screenHeight if page draws more than the height of the UIWebView
        if ((i+1) * screenHeight  > height)
        {
            CGRect f = [aView frame];
            f.size.height -= (((i+1) * screenHeight) - height);
            [aView setFrame: f];
        }
        
        UIGraphicsBeginPDFPage();
        CGContextRef currentContext = UIGraphicsGetCurrentContext();
        //      CGContextTranslateCTM(currentContext, 72, 72); // Translate for 1" margins
        
        [[[aView subviews] lastObject] setContentOffset:CGPointMake(0, screenHeight * i) animated:NO];
        [aView.layer renderInContext:currentContext];
    }
    
    UIGraphicsEndPDFContext();
    // Retrieves the document directories from the iOS device
    NSArray* documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    
    NSString* documentDirectory = [documentDirectories objectAtIndex:0];
    NSString* documentDirectoryFilename = [documentDirectory stringByAppendingPathComponent:aFilename];
    NSLog(@"file %@",documentDirectoryFilename);
    // instructs the mutable data object to write its context to a file on disk
    [pdfData writeToFile:documentDirectoryFilename atomically:YES];
    [aView setFrame:frame];
}

-(IBAction)openMail:(id)sender
{
   if ([MFMailComposeViewController canSendMail])
    {
        
//        NSMutableData *pdfData = [NSMutableData data];
//        CGRect bounds = CGRectMake(0, 0, 612, 792);
//        UIGraphicsBeginPDFContextToData(pdfData, bounds, nil);
//        CGContextRef pdfContext = UIGraphicsGetCurrentContext();
//        UIGraphicsBeginPDFPage();
//        [self.view.layer renderInContext:pdfContext];
//       
//        CGContextRef pdfContext1 = UIGraphicsGetCurrentContext();
//      //  UIGraphicsBeginPDFPage();
//        [self.view.layer renderInContext:pdfContext1];
//        
//        NSLog(@"pdf %@ %@",pdfContext,pdfContext1);
//        
//        UIGraphicsEndPDFContext();
//        
        
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        
        mailer.mailComposeDelegate = self;
        
        [mailer setSubject:@"A Message from CloudChowk"];
        
     //   NSArray *toRecipients = [NSArray arrayWithObjects:@"fisrtMail@example.com", @"secondMail@example.com", nil];
        
    //    [mailer setToRecipients:toRecipients];
        
      //  NSString *imgurl=[all objectAtIndex:page];
        
//        NSURL *url=[NSURL URLWithString:fileName];
//        
//        NSLog(@" url %@",url);
//
        NSLog(@"file name %@",fileName);
        NSData *data=[NSData dataWithContentsOfFile:fileName];
      //  NSLog(@"data %@",data);
        [mailer addAttachmentData:data mimeType:@"pdf" fileName:@"myPDF.pdf"];
        
        NSLog(@"mailer %@",mailer);
        
        NSString *emailBody = @"Patient Report";
        
        [mailer setMessageBody:emailBody isHTML:NO];
        
        [self presentViewController:mailer animated:YES completion:nil];
        
    }
    
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure"message:@"Your device doesn't support the composer sheet"delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [alert show];
        
    }
    
}
-(void)documentInteractionController:(UIDocumentInteractionController *)controller
       willBeginSendingToApplication:(NSString *)application
{
    NSLog(@"here1");
}

-(void)documentInteractionController:(UIDocumentInteractionController *)controller
          didEndSendingToApplication:(NSString *)application
{
    NSLog(@"here2");
    
}
-(void)documentInteractionControllerDidDismissOpenInMenu:
(UIDocumentInteractionController *)controller
{
    NSLog(@"here3");
}
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
        {
            NSLog(@"Mail cancelled: you cancelled the operation and no email message was queued.");
            break;
        }
        case MFMailComposeResultSaved:
        {
            NSLog(@"Mail saved: you saved the email message in the drafts folder.");
            break;
        }
        case MFMailComposeResultSent:
        {
            NSLog(@"Mail send: the email message is queued in the outbox. It is ready to send.");
            break;
        }
        case MFMailComposeResultFailed:
        {
            NSLog(@"Mail failed: the email message was not saved or queued, possibly due to an error.");
            break;
        }
        default:
            NSLog(@"Mail not sent.");
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
