//
//  MenuViewController.m
//  Setopati Nepal News
//
//  Created by InfoTrade Tech on 8/31/14.
//  Copyright (c) 2014 infotradetech. All rights reserved.
//

#import "MenuViewController.h"
#import "DataBO.h"
#import "DataBaseManger.h"
#import "DataParser.h"
#import "AppDelegate.h"
#import "EnPoliticsViewController.h"
#import <SystemConfiguration/SystemConfiguration.h>
#import "Reachability.h"
@interface MenuViewController ()
{
    // NSData *data;
    NSMutableArray *setopatisDataArr;
    NSDictionary *jsonDictionary, *jsonDict;
    NSArray *jsonArray;
    NSMutableArray *setopatiList;
    //UIBackgroundFetchResult *bgTask;
    // UIBackgroundTaskIdentifier *bgTask;
}
@end

@implementation MenuViewController
@synthesize tbl1;
@synthesize stdObj;
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
    // Do any additional setup after loading the view.
    arryData = [[NSArray alloc] initWithObjects:@"POLITICS",@"SOCIETY",@"BUSINESS",@"ART",@"SPORTS",
                @"SPECIAL",@"OPINION",@"BLOG",@"AUDIO/VIDEO",@"ABOUT US",nil];
    flag=1;
    tbl1.hidden=YES;
    // btn.layer.cornerRadius=20;
    tbl1.layer.cornerRadius=9;
    
    stdObj=[[Setopati alloc]init];
    AppDelegate *app=[[UIApplication sharedApplication]delegate];
    setopatiList=[app getSetopatisList];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//return [arryData count];
{
    if (tableView == self.tbl1)
    {
        return [arryData count];
    }
    return [arryData count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    
    static NSString *CellIdentifier = @"first";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"first"];
    }
    if (tableView == self.tbl1)
    {
        cell.textLabel.text = [arryData objectAtIndex:indexPath.row];
        cell.textLabel.textColor=[UIColor whiteColor];
        cell.backgroundColor=[UIColor colorWithRed:22/100.0f green:124/205.0f blue:105/105.0f alpha:1.0f];
        cell.textLabel.font=[UIFont fontWithName:@"Arial" size:15];
        
    }

return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Changing button label
    flag=1;
    tbl1.hidden=YES;
    
    if (tableView == self.tbl1)
    {
        if(indexPath.row==0)
        {
            
        }
        if(indexPath.row==1)
        {
             EnPoliticsViewController *dvc = [[EnPoliticsViewController alloc]init];
             //dvc.jsonDictionary=[jsonArray objectAtIndex:indexPath.row];
             [self.navigationController pushViewController:dvc animated:YES];
            
        }
        if(indexPath.row==2)
        {
            EnSocietyViewController *dvc = [[EnSocietyViewController alloc]init];
            //dvc.jsonDictionary=[jsonArray objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:dvc animated:YES];
            
        }
        if(indexPath.row==3)
        {
            EnArtViewController *dvc = [[EnArtViewController alloc]init];
            //dvc.jsonDictionary=[jsonArray objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:dvc animated:YES];
            
        }
        if(indexPath.row==4)
        {
            EnSportsViewController *dvc = [[EnSportsViewController alloc]init];
            //dvc.jsonDictionary=[jsonArray objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:dvc animated:YES];
            
        }
        /* if(indexPath.row==5)
         {
         SportsViewController *dvc = [[SportsViewController alloc]init];
         //dvc.jsonDictionary=[jsonArray objectAtIndex:indexPath.row];
         [self.navigationController pushViewController:dvc animated:YES];
         
         }
         if(indexPath.row==6)
         {
         SpecialViewController *dvc = [[SpecialViewController alloc]init];
         //dvc.jsonDictionary=[jsonArray objectAtIndex:indexPath.row];
         [self.navigationController pushViewController:dvc animated:YES];
         
         }
         if(indexPath.row==7)
         {
         OpinionViewController *dvc = [[OpinionViewController alloc]init];
         //dvc.jsonDictionary=[jsonArray objectAtIndex:indexPath.row];
         [self.navigationController pushViewController:dvc animated:YES];
         
         }if(indexPath.row==8)
         {
         BlogViewController *dvc = [[BlogViewController alloc]init];
         //dvc.jsonDictionary=[jsonArray objectAtIndex:indexPath.row];
         [self.navigationController pushViewController:dvc animated:YES];
         
         }
         if(indexPath.row==9)
         {
         AdvdViewController *dvc = [[AdvdViewController alloc]init];
         //dvc.jsonDictionary=[jsonArray objectAtIndex:indexPath.row];
         [self.navigationController pushViewController:dvc animated:YES];
         
         }*/
        
    }
}
- (IBAction)btn:(id)sender {
    if (flag==1) {
        flag=0;
        tbl1.hidden=NO;
        //i.hidden=YES;
    }
    else{
        flag=1;
        tbl1.hidden=YES;
        //i.hidden=NO;
    }
}
- (IBAction)btne:(id)sender {
    exit(0);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)politics:(id)sender {
    [[NSNotificationCenter defaultCenter ]addObserver:self
                                             selector:@selector(reachabilityChanged:)
                                                 name:kReachabilityChangedNotification
                                               object:nil];
    
    Reachability * reach = [Reachability reachabilityWithHostname:@"www.google.com"];
    
    reach.reachableBlock = ^(Reachability * reachability)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSString *urlString = @"http://www.infotradetechapp.com/Setopati/setopatiapi.php?action=politics_en";
            NSURL *url = [NSURL URLWithString:urlString];
            NSData *data = [NSData dataWithContentsOfURL:url];
            jsonDictionary=[NSJSONSerialization JSONObjectWithData:
                            data options:NSJSONReadingMutableLeaves error:nil];
            jsonArray=[jsonDictionary objectForKey:@"data"];
            NSLog(@"jsonDictionary data is %@",jsonDictionary);
            DataParser *objParser = [[DataParser alloc]init];
            NSMutableArray *arrData = [objParser getDataFromParserWithPath:urlString];
            NSMutableArray *objService;
            DataBaseManger *dbMng = [[DataBaseManger alloc]init];
            
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
                BOOL isDone=[dbMng addServiceToDataBase1:arrData];
                if(isDone)
                {
                    NSLog(@"Data saved in database Sucessfully");
                }
                else
                {
                    NSLog(@"No Data hasbeen saved in database");
                }
            }
            NSLog(@"Internet connected and Loading Data.");
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

- (IBAction)art:(id)sender {
}

- (IBAction)society:(id)sender {
}

- (IBAction)sports:(id)sender {
}

- (IBAction)special:(id)sender {
}


- (IBAction)business:(id)sender {
}

- (IBAction)opinion:(id)sender {
}

- (IBAction)blog:(id)sender {
}

- (IBAction)literature:(id)sender {
}
-(void)reachabilityChanged:(NSNotification*)note
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
}
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




@end
