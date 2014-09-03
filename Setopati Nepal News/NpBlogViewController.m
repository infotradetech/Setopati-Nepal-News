//
//  NpBlogViewController.m
//  Setopati Nepal News
//
//  Created by InfoTrade Tech on 9/1/14.
//  Copyright (c) 2014 infotradetech. All rights reserved.
//

#import "NpBlogViewController.h"
#import "DataBO.h"
#import "DataBaseManger.h"
#import "DataParser.h"
#import "AppDelegate.h"
#import "NpPoliticsViewController.h"
#import <SystemConfiguration/SystemConfiguration.h>
#import "Reachability.h"
#import "HUD.h"
@interface NpBlogViewController ()
{
    // NSMutableArray *setopatiList;
    NSMutableArray *setopatisDataArr;
    NSDictionary *jsonDictionary, *jsonDict;
    NSArray *jsonArray;
    NSMutableArray *setopatiList;
}
@end

@implementation NpBlogViewController
@synthesize tbl1;
@synthesize tbl2;
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
    [HUD showUIBlockingIndicatorWithText:@"Loading"];
    [self performSelector:@selector(closed) withObject:nil afterDelay:0.0];
    
    // Do any additional setup after loading the view.
    arryData = [[NSArray alloc] initWithObjects:@"राजनीति",@"समाज",@"बजार",@"कला",@"खेल",@"विशेष",@"बिचार",@"ब्लग",@"साहित्यपाटी",@"हाम्रो बारेमा",nil];    flag=1;
    tbl1.hidden=YES;
    // btn.layer.cornerRadius=20;
    tbl1.layer.cornerRadius=9;
    
    stdObj=[[Setopati alloc]init];
    AppDelegate *app=[[UIApplication sharedApplication]delegate];
    setopatiList=[app getSetopatisList7];
   /* [[NSNotificationCenter defaultCenter ]addObserver:self
                                             selector:@selector(reachabilityChanged:)
                                                 name:kReachabilityChangedNotification
                                               object:nil];*/
    
    Reachability * reach = [Reachability reachabilityWithHostname:@"www.google.com"];
    
    reach.reachableBlock = ^(Reachability * reachability)
    {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSString *urlString8 = @"http://www.infotradetechapp.com/Setopati/setopatiapi.php?action=literature_np";
            NSURL *url8 = [NSURL URLWithString:urlString8];
            NSData *data8 = [NSData dataWithContentsOfURL:url8];
            jsonDictionary=[NSJSONSerialization JSONObjectWithData:
                            data8 options:NSJSONReadingMutableLeaves error:nil];
            jsonArray=[jsonDictionary objectForKey:@"data"];
            NSLog(@"jsonDictionary data is %@",jsonDictionary);
            DataParser *objParser8 = [[DataParser alloc]init];
            NSMutableArray *arrData8 = [objParser8 getDataFromParserWithPath:urlString8];
            NSMutableArray *objService8;
            DataBaseManger *dbMng8 = [[DataBaseManger alloc]init];
            
            if(arrData8.count>0)
            {
                BOOL isDone=[dbMng8 deleteSelectedService8 :(DataBO *)objService8];
                
                if(isDone)
                {
                    NSLog(@"Data deleted in database Sucessfully");
                }
                else
                {
                    NSLog(@"No Data hasbeen deleted in database");
                }
            }
            
            if(arrData8.count>0)
            {
                BOOL isDone=[dbMng8 addServiceToDataBase8:arrData8];
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
-(void)closed
{
    [HUD hideUIBlockingIndicator];
    //[HUD showUIBlockingIndicatorWithText:@"News Loaded" withTimeout:0.0];
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
    if (tableView == self.tbl2)
    {
        return [setopatiList count];
    }
    
    return [arryData count];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
    
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
        cell.backgroundColor=[UIColor colorWithRed:22/50.0f green:120/220.0f blue:105/50.0f alpha:1.0f];
        cell.textLabel.font=[UIFont fontWithName:@"Arial" size:15];
        
    }
    static NSString *CellIdentifier2 = @"second";
    UITableViewCell *cell2 =[tableView dequeueReusableCellWithIdentifier:CellIdentifier2];
    
    
    if (cell2==nil)
    {
        cell2 = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"second"];
    }
    if (tableView == self.tbl2)
    {
        if(indexPath.row==0)
        {
            stdObj=[setopatiList objectAtIndex:indexPath.row];
            cell.textLabel.text = stdObj.title;
            cell.detailTextLabel.text=stdObj.mixed_intro;
            cell.imageView.image=[UIImage imageNamed:@"icon"];
            cell.detailTextLabel.textColor=[UIColor orangeColor];
            cell.textLabel.numberOfLines=2;
            cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
            cell.textLabel.font=[UIFont fontWithName:@"Arial" size:15];
            cell.detailTextLabel.font=[UIFont fontWithName:@"Arial" size:12];
            
        }
        if(indexPath.row==1)
        {
            stdObj=[setopatiList objectAtIndex:indexPath.row];
            cell.textLabel.text = stdObj.title;
            cell.detailTextLabel.text=stdObj.mixed_intro;
            cell.imageView.image=[UIImage imageNamed:@"icon"];
            cell.detailTextLabel.textColor=[UIColor orangeColor];
            cell.textLabel.numberOfLines=2;
            cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
            cell.textLabel.font=[UIFont fontWithName:@"Arial" size:15];
            cell.detailTextLabel.font=[UIFont fontWithName:@"Arial" size:12];
        }
        if(indexPath.row==2)
        {
            stdObj=[setopatiList objectAtIndex:indexPath.row];
            cell.textLabel.text = stdObj.title;
            cell.detailTextLabel.text=stdObj.mixed_intro;
            cell.imageView.image=[UIImage imageNamed:@"icon"];
            cell.detailTextLabel.textColor=[UIColor orangeColor];
            cell.textLabel.numberOfLines=2;
            cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
            cell.textLabel.font=[UIFont fontWithName:@"Arial" size:15];
            cell.detailTextLabel.font=[UIFont fontWithName:@"Arial" size:12];
        }
        if(indexPath.row==3)
        {
            stdObj=[setopatiList objectAtIndex:indexPath.row];
            cell.textLabel.text = stdObj.title;
            cell.detailTextLabel.text=stdObj.mixed_intro;
            cell.imageView.image=[UIImage imageNamed:@"icon"];
            cell.detailTextLabel.textColor=[UIColor orangeColor];
            cell.textLabel.numberOfLines=2;
            cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
            cell.textLabel.font=[UIFont fontWithName:@"Arial" size:15];
            cell.detailTextLabel.font=[UIFont fontWithName:@"Arial" size:12];
        }
        if(indexPath.row==4)
        {
            stdObj=[setopatiList objectAtIndex:indexPath.row];
            cell.textLabel.text = stdObj.title;
            cell.detailTextLabel.text=stdObj.mixed_intro;
            cell.imageView.image=[UIImage imageNamed:@"icon"];
            cell.detailTextLabel.textColor=[UIColor orangeColor];
            cell.textLabel.numberOfLines=2;
            cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
            cell.textLabel.font=[UIFont fontWithName:@"Arial" size:15];
            cell.detailTextLabel.font=[UIFont fontWithName:@"Arial" size:12];
        }
        if(indexPath.row==5)
        {
            stdObj=[setopatiList objectAtIndex:indexPath.row];
            cell.textLabel.text = stdObj.title;
            cell.detailTextLabel.text=stdObj.mixed_intro;
            cell.imageView.image=[UIImage imageNamed:@"icon"];
            cell.detailTextLabel.textColor=[UIColor orangeColor];
            cell.textLabel.numberOfLines=2;
            cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
            cell.textLabel.font=[UIFont fontWithName:@"Arial" size:15];
            cell.detailTextLabel.font=[UIFont fontWithName:@"Arial" size:12];
        }
        if(indexPath.row==6)
        {
            stdObj=[setopatiList objectAtIndex:indexPath.row];
            cell.textLabel.text = stdObj.title;
            cell.detailTextLabel.text=stdObj.mixed_intro;
            cell.imageView.image=[UIImage imageNamed:@"icon"];
            cell.detailTextLabel.textColor=[UIColor orangeColor];
            cell.textLabel.numberOfLines=2;
            cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
            cell.textLabel.font=[UIFont fontWithName:@"Arial" size:15];
            cell.detailTextLabel.font=[UIFont fontWithName:@"Arial" size:12];
        }
        if(indexPath.row==7)
        {
            stdObj=[setopatiList objectAtIndex:indexPath.row];
            cell.textLabel.text = stdObj.title;
            cell.detailTextLabel.text=stdObj.mixed_intro;
            cell.imageView.image=[UIImage imageNamed:@"icon"];
            cell.detailTextLabel.textColor=[UIColor orangeColor];
            cell.textLabel.numberOfLines=2;
            cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
            cell.textLabel.font=[UIFont fontWithName:@"Arial" size:15];
            cell.detailTextLabel.font=[UIFont fontWithName:@"Arial" size:12];
        }
        if(indexPath.row==8)
        {
            stdObj=[setopatiList objectAtIndex:indexPath.row];
            cell.textLabel.text = stdObj.title;
            cell.detailTextLabel.text=stdObj.mixed_intro;
            cell.imageView.image=[UIImage imageNamed:@"icon"];
            cell.detailTextLabel.textColor=[UIColor orangeColor];
            cell.textLabel.numberOfLines=2;
            cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
            cell.textLabel.font=[UIFont fontWithName:@"Arial" size:15];
            cell.detailTextLabel.font=[UIFont fontWithName:@"Arial" size:12];
        }
        
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
            NpPoliticsViewController *dvc = [[NpPoliticsViewController alloc]init];
            [self.navigationController pushViewController:dvc animated:YES];
        }
        if(indexPath.row==1)
        {
            NpSocietyViewController *dvc = [[NpSocietyViewController alloc]init];
            [self.navigationController pushViewController:dvc animated:YES];
        }
        if(indexPath.row==2)
        {
            NpBusinessViewController *dvc = [[NpBusinessViewController alloc]init];
            [self.navigationController pushViewController:dvc animated:YES];
        }
        if(indexPath.row==3)
        {
            NpArtViewController *dvc = [[NpArtViewController alloc]init];
            [self.navigationController pushViewController:dvc animated:YES];
        }
        if(indexPath.row==4)
        {
            NpSortsViewController *dvc = [[NpSortsViewController alloc]init];
            [self.navigationController pushViewController:dvc animated:YES];
        }
        if(indexPath.row==5)
        {
            NpSpecialViewController *dvc = [[NpSpecialViewController alloc]init];
            [self.navigationController pushViewController:dvc animated:YES];
        }
        if(indexPath.row==6)
        {
            NpOpinionViewController *dvc = [[NpOpinionViewController alloc]init];
            [self.navigationController pushViewController:dvc animated:YES];
        }if(indexPath.row==7)
        {
            NpBlogViewController *dvc = [[NpBlogViewController alloc]init];
            [self.navigationController pushViewController:dvc animated:YES];
        }
        if(indexPath.row==8)
        {
            NpLiteratureViewController *dvc = [[NpLiteratureViewController alloc]init];
            [self.navigationController pushViewController:dvc animated:YES];
        }
        if(indexPath.row==9)
        {
            AboutUsViewController *dvc = [[AboutUsViewController alloc]init];
            [self.navigationController pushViewController:dvc animated:YES];
        }
        
    }
    if (tableView == self.tbl2)
    {
        if(indexPath.row==0)
        {
            DetailsViewController *fvc = [[DetailsViewController alloc]init];
            fvc.stdObj=[setopatiList objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:fvc animated:YES];
            
        }
        if(indexPath.row==1)
        {
            DetailsViewController *fvc = [[DetailsViewController alloc]init];
            fvc.stdObj=[setopatiList objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:fvc animated:YES];
        }
        
        if(indexPath.row==2)
        {
            DetailsViewController *fvc = [[DetailsViewController alloc]init];
            fvc.stdObj=[setopatiList objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:fvc animated:YES];
            
        }
        if(indexPath.row==3)
        {
            DetailsViewController *fvc = [[DetailsViewController alloc]init];
            fvc.stdObj=[setopatiList objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:fvc animated:YES];
        }
        
        if(indexPath.row==4)
        {
            DetailsViewController *fvc = [[DetailsViewController alloc]init];
            fvc.stdObj=[setopatiList objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:fvc animated:YES];
            
        }
        if(indexPath.row==5)
        {
            DetailsViewController *fvc = [[DetailsViewController alloc]init];
            fvc.stdObj=[setopatiList objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:fvc animated:YES];
            
        }
        if(indexPath.row==6)
        {
            DetailsViewController *fvc = [[DetailsViewController alloc]init];
            fvc.stdObj=[setopatiList objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:fvc animated:YES];
        }
        if(indexPath.row==7)
        {
            DetailsViewController *fvc = [[DetailsViewController alloc]init];
            fvc.stdObj=[setopatiList objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:fvc animated:YES];
        }
        if(indexPath.row==8)
        {
            DetailsViewController *fvc = [[DetailsViewController alloc]init];
            fvc.stdObj=[setopatiList objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:fvc animated:YES];
        }
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

- (IBAction)ebtn:(id)sender {
    EnBlogViewController *dvc = [[EnBlogViewController alloc]init];
    [self.navigationController pushViewController:dvc animated:YES];
}
@end
