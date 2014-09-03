//
//  AboutUsViewController.m
//  Setopati Nepal News
//
//  Created by InfoTrade Tech on 9/2/14.
//  Copyright (c) 2014 infotradetech. All rights reserved.
//

#import "AboutUsViewController.h"

@interface AboutUsViewController ()

@end

@implementation AboutUsViewController

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
    // Do any additional setup after loading the view from its nib.
    _MyTextView.text=@"Hi hello";
    _MyTextView.text=@"Setopati is one of the most popular digital newspapers in Nepal,Setopati is anonline destination foe Nepal news,views,reviews,features,blog and audio video content covering Nepali politics,society,market,arts,entertainment and sports.market,arts,entertaimnet and sports.Setopati offers its websites in both English and Nepali.Contact Setopati at";
    _MyTextView.textColor=[UIColor grayColor];
    _MyTextView.font=[UIFont fontWithName:@"Arial" size:12];
    
    _MyTextView1.text=@"Setopati Android and Ios App is developed and maintained by InfoTradeTech.This App Crawls the Setopati news site and pushes news to your Ios devices for Online News Availability.For technical issues with the app contact InfoTradeTech at";
    _MyTextView1.textColor=[UIColor grayColor];
    _MyTextView1.font=[UIFont fontWithName:@"Arial" size:12];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
