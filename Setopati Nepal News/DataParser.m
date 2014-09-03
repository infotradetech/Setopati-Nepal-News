//
//  DataParser.m
//  sampleDataBase
//
//  Created by Connexun on 26/07/14.
//  Copyright (c) 2014 connexun. All rights reserved.
//

#import "DataParser.h"
#import "DataBaseManger.h"

@implementation DataParser


-(NSMutableArray *)getDataFromParserWithPath:(NSString *)strUrl
{
    NSMutableArray *arrReturn = [[NSMutableArray alloc]init];
    
    NSURL *url = [[NSURL alloc]initWithString:[[NSString stringWithFormat:@"%@",strUrl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
       NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    
    NSURLResponse *response;
    NSData *returnData =[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    NSError *localError = nil;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:returnData options:0 error:&localError];
        if(localError == nil)
        {
            NSString *strMessage = [dict objectForKey:@"res"];
           if([strMessage isEqualToString:@"success" ])
           {
               NSArray *arrData = [dict objectForKey:@"data"];
               for (NSDictionary *dictTemp  in arrData)
               {
                   DataBO *objreturn  = [[DataBO alloc]init];
                   objreturn.strRowId = [dictTemp objectForKey:@"row_id"];
                   objreturn.strTitle =  [dictTemp objectForKey:@"title"];
                   objreturn.strplace  =  [dictTemp objectForKey:@"place"];
                   objreturn.strAuthor=  [dictTemp objectForKey:@"author"];
                   objreturn.strnews_date =  [dictTemp objectForKey:@"news_date"];
                   objreturn.strBody =  [dictTemp objectForKey:@"body"];
                   objreturn.strTime =  [dictTemp objectForKey:@"updt_tmstmp"];
                   objreturn.strImage = [dictTemp objectForKey:@"image"];
                   objreturn.strintro =  [dictTemp objectForKey:@"mixed_intro"];
                   objreturn.strlang =  [dictTemp objectForKey:@"lang"];
                   objreturn.strLink_href =  [dictTemp objectForKey:@"link_href"];
                   [arrReturn addObject:objreturn];
                   objreturn = nil;

               }
           }

            else
            {
                //// error
            }

        }

    return arrReturn;
    
}
@end
