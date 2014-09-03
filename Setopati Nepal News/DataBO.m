//
//  DataBO.m
//  sampleDataBase
//
//  Created by Connexun on 26/07/14.
//  Copyright (c) 2014 connexun. All rights reserved.
//

#import "DataBO.h"

@implementation DataBO

@synthesize strTitle,strAuthor,strBody,strImage,strintro,strlang,strLink_href,strnews_date,strplace,strRowId,strTime,HasImage;


-(id)init
{
    
    strTitle  = @"";
    strBody=@"";
    strImage=@"";
    strintro=@"";
    
    return self;
}

-(void)dealloc
{
    strTitle = nil;
    strBody=nil;
    strImage=nil;
    strintro=nil;
}

@end

