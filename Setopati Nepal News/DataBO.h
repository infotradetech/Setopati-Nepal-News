//
//  DataBO.h
//  sampleDataBase
//
//  Created by Connexun on 26/07/14.
//  Copyright (c) 2014 connexun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataBO : NSObject

@property (strong, nonatomic) NSString *strLink_href;
@property (strong, nonatomic) NSString *strRowId;
@property (strong, nonatomic) NSString *strAuthor;
@property (strong, nonatomic) NSString *strTitle;
@property (strong, nonatomic) NSString *strplace;
@property (strong, nonatomic) NSString *strnews_date;
@property (strong, nonatomic) NSString *strBody;
@property (strong, nonatomic) NSString *strTime;
@property (strong, nonatomic) NSString *strlang;
@property (strong, nonatomic) NSString *strintro;
@property (assign, nonatomic) NSString *HasImage;
@property (strong, nonatomic) NSString *strImage;



@end
