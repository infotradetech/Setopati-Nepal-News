//
//  EnBusinessViewController.h
//  Setopati Nepal News
//
//  Created by InfoTrade Tech on 9/2/14.
//  Copyright (c) 2014 infotradetech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Setopati.h"
#import "AppDelegate.h"
#import "DetailsViewController.h"
#import <sqlite3.h>
#import "EnSocietyViewController.h"
#import "EnBusinessViewController.h"
#import "EnArtViewController.h"
#import "EnSportsViewController.h"
#import "EnSpecialViewController.h"
#import "EnOpinionViewController.h"
#import "EnBlogViewController.h"
#import "ENAudioViewController.h"
#import "AboutUsViewController.h"
@interface EnBusinessViewController : UIViewController
{
    BOOL flag;
    Setopati *stdObj;
    sqlite3 *database;
    NSArray *arryData;
    NSString *pType;
    IBOutlet UIBarButtonItem *nbtn;
    IBOutlet UIBarButtonItem *btn;
    IBOutlet UITableView *tbl1;
    IBOutlet UITableView *tbl2;
}
@property(strong, nonatomic) Setopati *stdObj;
@property (strong, nonatomic) IBOutlet UITableView *tbl1;
@property (strong, nonatomic) IBOutlet UITableView *tbl2;
- (IBAction)nbtn:(id)sender;
- (IBAction)btn:(id)sender;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@end