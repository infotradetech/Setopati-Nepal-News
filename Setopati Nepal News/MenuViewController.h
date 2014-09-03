//
//  MenuViewController.h
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
#import <SystemConfiguration/SystemConfiguration.h>
#import "Reachability.h"

#import "EnPoliticsViewController.h"
#import "EnSocietyViewController.h"
#import "EnArtViewController.h"
#import "EnSportsViewController.h"
@interface MenuViewController : UIViewController
{
       Setopati *stdObj;
        sqlite3 *database;
    BOOL flag;
    NSArray *arryData;
    NSString *pType;
   IBOutlet UITableView *tbl1;
    IBOutlet UIButton *literature;
    IBOutlet UIButton *blog;
    IBOutlet UIButton *opinion;
    IBOutlet UIButton *special;
    IBOutlet UIButton *sports;
    IBOutlet UIButton *art;
    IBOutlet UIButton *business;
    IBOutlet UIButton *society;
    IBOutlet UIButton *politics;
}
@property(strong, nonatomic) Setopati *stdObj;
@property (strong, nonatomic) IBOutlet UITableView *tbl1;
- (IBAction)politics:(id)sender;
- (IBAction)art:(id)sender;
- (IBAction)society:(id)sender;
- (IBAction)sports:(id)sender;
- (IBAction)special:(id)sender;
- (IBAction)business:(id)sender;
- (IBAction)opinion:(id)sender;
- (IBAction)blog:(id)sender;
- (IBAction)literature:(id)sender;

- (IBAction)btn:(id)sender;
- (IBAction)btne:(id)sender;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end
