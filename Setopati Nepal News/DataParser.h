//
//  DataParser.h
//  sampleDataBase
//
//  Created by Connexun on 26/07/14.
//  Copyright (c) 2014 connexun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataBO.h"


@interface DataParser : NSObject


-(NSMutableArray *)getDataFromParserWithPath:(NSString *)strUrl;
@end
