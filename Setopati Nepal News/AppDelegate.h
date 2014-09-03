//
//  AppDelegate.h
//  Setopati Nepal News
//
//  Created by InfoTrade Tech on 8/24/14.
//  Copyright (c) 2014 infotradetech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "DetailsViewController.h"
#import "NpPoliticsViewController.h"
#import <sqlite3.h>
#import "MenuViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    sqlite3 *database;
}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic)NSString *strDBPath;

-(NSMutableArray *)getSetopatisList;
-(NSMutableArray *)getSetopatisList1;
-(NSMutableArray *)getSetopatisList2;
-(NSMutableArray *)getSetopatisList3;
-(NSMutableArray *)getSetopatisList4;
-(NSMutableArray *)getSetopatisList5;
-(NSMutableArray *)getSetopatisList6;
-(NSMutableArray *)getSetopatisList7;
-(NSMutableArray *)getSetopatisList8;

-(NSMutableArray *)ngetSetopatisList;
-(NSMutableArray *)ngetSetopatisList1;
-(NSMutableArray *)ngetSetopatisList2;
-(NSMutableArray *)ngetSetopatisList3;
-(NSMutableArray *)ngetSetopatisList4;
-(NSMutableArray *)ngetSetopatisList5;
-(NSMutableArray *)ngetSetopatisList6;
-(NSMutableArray *)ngetSetopatisList7;
-(NSMutableArray *)ngetSetopatisList8;
@end
