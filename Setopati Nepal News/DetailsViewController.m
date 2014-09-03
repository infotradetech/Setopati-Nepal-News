//
//  DetailsViewController.m
//  Setopati Nepal News
//
//  Created by InfoTrade Tech on 8/24/14.
//  Copyright (c) 2014 infotradetech. All rights reserved.
//

#import "DetailsViewController.h"
#import "DataBO.h"
#import "DataBaseManger.h"
#import "DataParser.h"
#import "AppDelegate.h"

@interface DetailsViewController ()
{
    NSMutableArray *setopatiList;
}
@end

@implementation DetailsViewController
@synthesize stdObj;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"News Details";
        stdObj=[[Setopati alloc]init];
        AppDelegate *app=[[UIApplication sharedApplication]delegate];
        setopatiList=[app ngetSetopatisList];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _label1.text=stdObj.title;
    _label2.text=stdObj.mixed_intro;
    
    NSString *imageString =stdObj.image;
    NSData * data = [NSData dataWithBase64EncodedString:imageString];
    UIImage *image1 = [UIImage imageWithData:data];
    _imageView1.image =image1;
    
    _textview.text=stdObj.body;
    NSString *body = stdObj.body;
    body=[body stringByReplacingOccurrencesOfString:@"<br/>" withString:@""];
    body=[body stringByReplacingOccurrencesOfString:@"<p>" withString:@""];
    body=[body stringByReplacingOccurrencesOfString:@"<div>" withString:@""];
    body=[body stringByReplacingOccurrencesOfString:@"</div>" withString:@""];
    body=[body stringByReplacingOccurrencesOfString:@"<em>" withString:@""];
    body=[body stringByReplacingOccurrencesOfString:@"</em>" withString:@""];
    body=[body stringByReplacingOccurrencesOfString:@"</p>" withString:@""];
    body=[body stringByReplacingOccurrencesOfString:@"</&nbsp;>" withString:@""];
    body=[body stringByReplacingOccurrencesOfString:@"&nbsp;"withString:@""];
    body=[body stringByReplacingOccurrencesOfString:@"&Idquo;"withString:@""];
    body=[body stringByReplacingOccurrencesOfString:@"&Isquo;"withString:@""];
    body=[body stringByReplacingOccurrencesOfString:@"&Zwj;"withString:@""];
    body=[body stringByReplacingOccurrencesOfString:@"&#39;"withString:@""];
    body=[body stringByReplacingOccurrencesOfString:@"&rdquo;"withString:@""];
    body=[body stringByReplacingOccurrencesOfString:@"<span>"withString:@""];
    body=[body stringByReplacingOccurrencesOfString:@"</span>"withString:@""];
    body=[body stringByReplacingOccurrencesOfString:@"<strong>"withString:@""];
    body=[body stringByReplacingOccurrencesOfString:@"</strong>"withString:@""];
    body=[body stringByReplacingOccurrencesOfString:@"<sup>;"withString:@""];
    body=[body stringByReplacingOccurrencesOfString:@"</sup>"withString:@""];
    body=[body stringByReplacingOccurrencesOfString:@"<style>"withString:@""];
    body=[body stringByReplacingOccurrencesOfString:@"&ndash"withString:@""];
    body=[body stringByReplacingOccurrencesOfString:@"&zwj;"withString:@""];
    body=[body stringByReplacingOccurrencesOfString:@"&lsquo;"withString:@""];
    body=[body stringByReplacingOccurrencesOfString:@"&rsquo"withString:@""];
    body=[body stringByReplacingOccurrencesOfString:@"&ldquo;"withString:@""];
    body=[body stringByReplacingOccurrencesOfString:@"&quot;"withString:@""];
    body=[body stringByReplacingOccurrencesOfString:@"RSS"withString:@""];
    body=[body stringByReplacingOccurrencesOfString:@"&amp;"withString:@""];
    body=[body stringByReplacingOccurrencesOfString:@"&laquo;"withString:@""];
    body=[body stringByReplacingOccurrencesOfString:@"&divide;"withString:@""];
    body=[body stringByReplacingOccurrencesOfString:@"&THORN;"withString:@""];
    body=[body stringByReplacingOccurrencesOfString:@"&mdash;"withString:@""];
    _textview.text = body;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
