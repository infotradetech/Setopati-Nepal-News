//
//  ViewController.m
//  Setopati Nepal News
//
//  Created by InfoTrade Tech on 8/24/14.
//  Copyright (c) 2014 infotradetech. All rights reserved.
//

#import "ViewController.h"
#import "DataBO.h"
#import "DataBaseManger.h"
#import "DataParser.h"
#import "AppDelegate.h"
#import "NpPoliticsViewController.h"
#import <SystemConfiguration/SystemConfiguration.h>
#import "Reachability.h"
#import "HUD.h"
@interface ViewController ()
{
    NSMutableArray *setopatisDataArr;
    NSDictionary *jsonDictionary, *jsonDict;
    NSArray *jsonArray;
    NSMutableArray *setopatiList;
}
@end
@implementation ViewController
@synthesize stdObj;
@synthesize myprogressView;
@synthesize myprogressView1;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)moreProgress
{
    myprogressView.progress +=0.5;
     myprogressView1.progress +=0.5;
    /*if(myprogressView.progress==1)
    {
        [timer invalidate];
    }*/
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
   Reachability * reach = [Reachability reachabilityWithHostname:@"www.google.com"];
    
    reach.reachableBlock = ^(Reachability * reachability)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            timer=[NSTimer
                   scheduledTimerWithTimeInterval:1 target:self selector:@selector(moreProgress) userInfo:nil repeats:YES];
            timer=[NSTimer
                   scheduledTimerWithTimeInterval:1 target:self selector:@selector(moreProgress) userInfo:nil repeats:YES];
            
            NSString *urlString = @"http://www.infotradetechapp.com/Setopati/setopatiapi.php?action=politics_np";
            NSURL *url = [NSURL URLWithString:urlString];
            NSData *data = [NSData dataWithContentsOfURL:url];
            jsonDictionary=[NSJSONSerialization JSONObjectWithData:
                            data options:NSJSONReadingMutableLeaves error:nil];
            jsonArray=[jsonDictionary objectForKey:@"data"];
            NSLog(@"jsonDictionary data is %@",jsonDictionary);
           
            NSString *nurlString = @"http://www.infotradetechapp.com/Setopati/setopatiapi.php?action=politics_en";
            NSURL *nurl = [NSURL URLWithString:nurlString];
            NSData *ndata = [NSData dataWithContentsOfURL:nurl];
            jsonDictionary=[NSJSONSerialization JSONObjectWithData:
                            ndata options:NSJSONReadingMutableLeaves error:nil];
            jsonArray=[jsonDictionary objectForKey:@"data"];
            NSLog(@"jsonDictionary data is %@",jsonDictionary);
            
            DataParser *objParser = [[DataParser alloc]init];
            NSMutableArray *arrData = [objParser getDataFromParserWithPath:urlString];
            NSMutableArray *objService;
            DataBaseManger *dbMng = [[DataBaseManger alloc]init];
            
            DataParser *nobjParser = [[DataParser alloc]init];
            NSMutableArray *narrData = [nobjParser getDataFromParserWithPath:nurlString];
            NSMutableArray *nobjService;
            DataBaseManger *ndbMng = [[DataBaseManger alloc]init];
            
            if(arrData.count>0)
            {
                BOOL isDone=[dbMng deleteSelectedService :(DataBO *)objService];
                
                if(isDone)
                {
                    NSLog(@"Data deleted in database Sucessfully");
                }
                else
                {
                    NSLog(@"No Data hasbeen deleted in database");
                }
            }
            
            if(arrData.count>0)
            {
                BOOL isDone=[dbMng addServiceToDataBase:arrData];
                if(isDone)
                {
                    NSLog(@"Data saved in database Sucessfully");
                }
                else
                {
                    NSLog(@"No Data hasbeen saved in database");
                }
            }
            
            if(narrData.count>0)
            {
                BOOL isDone=[ndbMng ndeleteSelectedService :(DataBO *)nobjService];
                
                if(isDone)
                {
                    NSLog(@"Data deleted in database Sucessfully");
                }
                else
                {
                    NSLog(@"No Data hasbeen deleted in database");
                }
            }
            
            if(narrData.count>0)
            {
                BOOL isDone=[ndbMng naddServiceToDataBase:narrData];
                if(isDone)
                {
                    NSLog(@"Data saved in database Sucessfully");
                }
                else
                {
                    NSLog(@"No Data hasbeen saved in database");
                }
            }
           NSLog(@"Internet connected and Data Successfully.");
        });
    };
    
    reach.unreachableBlock = ^(Reachability * reachability)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            // blockLabel.text = @"Block Says Unreachable";
            NSLog(@"Sorry Old data is coming from DB.");
        });
    };
    
    [reach startNotifier];
}
/*-(void)reachabilityChanged:(NSNotification*)note
{
    Reachability * reach = [note object];
    
    if([reach isReachable])
    {
        NSLog(@"Internet is Connected");
    }
    else
    {
        NSLog(@"Internet Not Connected");
    }
}*/
- (void)viewDidUnload
{
    [super viewDidUnload]; 
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nbutton:(id)sender {
    NpPoliticsViewController *dvc = [[NpPoliticsViewController alloc]init];
    [self.navigationController pushViewController:dvc animated:YES];
}

- (IBAction)ebutton:(id)sender {
    EnPoliticsViewController *dvc = [[EnPoliticsViewController alloc]init];
    [self.navigationController pushViewController:dvc animated:YES];
}
@end
