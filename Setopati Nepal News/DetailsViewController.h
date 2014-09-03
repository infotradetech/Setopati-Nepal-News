//
//  DetailsViewController.h
//  Setopati Nepal News
//
//  Created by InfoTrade Tech on 8/24/14.
//  Copyright (c) 2014 infotradetech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSDataAdditions.h"
#import "Setopati.h"
#import "AppDelegate.h"
#import <sqlite3.h>
@interface DetailsViewController : UIViewController
{
    Setopati *stdObj;
    sqlite3 *database;
}@property(strong, nonatomic) Setopati *stdObj;
@property (strong, nonatomic) IBOutlet UILabel *label1;
@property (strong, nonatomic) IBOutlet UILabel *label2;
@property (strong, nonatomic) IBOutlet UITextView *textview;
@property(strong, nonatomic) IBOutlet UIImageView *imageView1;
@end
