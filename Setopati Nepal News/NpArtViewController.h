//
//  NpArtViewController.h
//  Setopati Nepal News
//
//  Created by InfoTrade Tech on 8/31/14.
//  Copyright (c) 2014 infotradetech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Setopati.h"
#import "AppDelegate.h"
#import "DetailsViewController.h"
#import <sqlite3.h>
#import "NpSocietyViewController.h"
#import "NpBusinessViewController.h"
#import "NpSortsViewController.h"
#import "NpSpecialViewController.h"
#import "NpOpinionViewController.h"
#import "NpBlogViewController.h"
#import "NpLiteratureViewController.h"
#import "AboutUsViewController.h"
@interface NpArtViewController : UIViewController
{
    Setopati *stdObj;
    sqlite3 *database;
    
    BOOL buttonClicked;
    
    BOOL flag;
    NSArray *arryData;
    NSString *pType;
    IBOutlet UIBarButtonItem *mbutton;
    IBOutlet UIBarButtonItem *ebutton;
    
    IBOutlet UIBarButtonItem *ebtn;
    IBOutlet UIBarButtonItem *btn;
    IBOutlet UITableView *tbl1;
    IBOutlet UITableView *tbl2;
}
@property(strong, nonatomic) Setopati *stdObj;
@property (strong, nonatomic) IBOutlet UITableView *tbl1;
@property (strong, nonatomic) IBOutlet UITableView *tbl2;
- (IBAction)btn:(id)sender;
//- (IBAction)btnE:(id)sender;
- (IBAction)ebtn:(id)sender;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end
