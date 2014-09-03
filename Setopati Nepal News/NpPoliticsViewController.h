//
//  NpPoliticsViewController.h
//  Setopati Nepal News
//
//  Created by InfoTrade Tech on 9/1/14.
//  Copyright (c) 2014 infotradetech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Setopati.h"
#import "AppDelegate.h"
#import "DetailsViewController.h"
#import <sqlite3.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import "NpSocietyViewController.h"
#import "NpBusinessViewController.h"
#import "NpArtViewController.h"
#import "NpSortsViewController.h"
#import "NpSpecialViewController.h"
#import "NpOpinionViewController.h"
#import "NpBlogViewController.h"
#import "NpLiteratureViewController.h"
#import "AboutUsViewController.h"
@interface NpPoliticsViewController : UIViewController
{
    BOOL flag;
    Setopati *stdObj;
    sqlite3 *database;
    NSArray *arryData;
    NSString *pType;
    IBOutlet UIBarButtonItem *ebtn;
    IBOutlet UIBarButtonItem *btn;
    IBOutlet UITableView *tbl1;
    IBOutlet UITableView *tbl2;
}
@property(strong, nonatomic) Setopati *stdObj;
@property (strong, nonatomic) IBOutlet UITableView *tbl1;
@property (strong, nonatomic) IBOutlet UITableView *tbl2;
- (IBAction)ebtn:(id)sender;
- (IBAction)btn:(id)sender;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end
