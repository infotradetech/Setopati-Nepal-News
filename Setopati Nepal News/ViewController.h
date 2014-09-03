//
//  ViewController.h
//  Setopati Nepal News
//
//  Created by InfoTrade Tech on 8/24/14.
//  Copyright (c) 2014 infotradetech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Setopati.h"
#import "AppDelegate.h"
#import "DetailsViewController.h"
#import <sqlite3.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import "Reachability.h"
#import "NpPoliticsViewController.h"

@interface ViewController : UIViewController
{
    Setopati *stdObj;
    sqlite3 *database;
    NSTimer *timer;
    IBOutlet UIButton *ebutton;
    IBOutlet UIButton *nbutton;
}

@property(strong, nonatomic) Setopati *stdObj;
@property (strong, nonatomic) IBOutlet UIProgressView *myprogressView;
@property (strong, nonatomic) IBOutlet UIProgressView *myprogressView1;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
- (IBAction)nbutton:(id)sender;
- (IBAction)ebutton:(id)sender;

@end
