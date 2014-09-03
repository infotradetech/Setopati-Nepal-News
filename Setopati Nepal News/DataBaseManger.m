//
//  DataBaseManger.m
//  sampleDataBase
//
//  Created by Connexun on 26/07/14.
//  Copyright (c) 2014 connexun. All rights reserved.
//

#import "DataBaseManger.h"

@implementation DataBaseManger

@synthesize strDBPath;

- (id) init
{
	self = [super init];
	if (self != nil)
	{
        strDBPath = [self getDBPath];
    }
	return self;
}

-(NSString *)getDBPath

{
    
    NSArray *arrPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
    
    NSString *documentsDir = [arrPaths objectAtIndex:0];
    
    NSString *str = [documentsDir stringByAppendingPathComponent:@"Setopati.sqlite"];
    
    return str;
    
}


-(BOOL)addServiceToDataBase:(NSMutableArray *)arrData
{
    
    BOOL returnValue = YES;
    sqlite3_stmt *addStmt = nil;
    sqlite3 *dataBase = nil;
    
    if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
    {
        printf("\n Database Successfully Opened");
    }
    // Open the database. The database was prepared outside the application.
    if (sqlite3_open([strDBPath UTF8String], &dataBase) == SQLITE_OK)
    {
        
        for (int i=0 ; i< arrData.count-1; i++)
        {
            DataBO *objDetails = [arrData objectAtIndex:i ];
            NSInteger rowidentifier = -1;
      if(addStmt == nil)
            {
        NSString *strValue = [NSString stringWithFormat:@"INSERT INTO politics(row_id,title,mixed_intro,body,image,news_date,updt_tmstmp) Values (?,?,?,?,?,?,?)"];
                const char *sql = [strValue UTF8String];
                if(sqlite3_prepare_v2(dataBase, sql, -1, &addStmt, NULL) != SQLITE_OK)
                {
                    NSLog(@"Error while creating INSERT INTO politics statement. '%s'", sqlite3_errmsg(dataBase));
                }
            }
            if(rowidentifier == -1)
            {
                if(sqlite3_bind_text(addStmt, 1, [objDetails.strRowId UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 2, [objDetails.strTitle UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 3, [objDetails.strintro UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 4, [objDetails.strBody UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 5, [objDetails.strImage UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 6, [objDetails.strnews_date UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(sqlite3_bind_text(addStmt, 7, [objDetails.strTime UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(SQLITE_DONE != sqlite3_step(addStmt))
                {
                    returnValue = NO;
                }
                
                sqlite3_reset(addStmt);
            }
            
            objDetails = nil;
        }
    }
    
    if (addStmt)
    {
        sqlite3_finalize(addStmt);
        addStmt = nil;
    }
    sqlite3_close(dataBase);
    dataBase = nil;
    
    return returnValue;
}

-(BOOL)addServiceToDataBase1:(NSMutableArray *)arrData1
{
    
    BOOL returnValue = YES;
    sqlite3_stmt *addStmt = nil;
    sqlite3 *dataBase = nil;
    
    if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
    {
        printf("\n Database Successfully Opened");
    }
    // Open the database. The database was prepared outside the application.
    if (sqlite3_open([strDBPath UTF8String], &dataBase) == SQLITE_OK)
    {
        for (int i =0 ; i< arrData1.count-1; i++)
        {
            DataBO *objDetails = [arrData1 objectAtIndex:i ];
            NSInteger rowidentifier = -1;
            if(addStmt == nil)
            {
    NSString *strValue = [NSString stringWithFormat:@"INSERT INTO  society(row_id,title,mixed_intro,body,image,news_date,updt_tmstmp) Values (?,?,?,?,?,?,?)"];
                const char *sql = [strValue UTF8String];
                if(sqlite3_prepare_v2(dataBase, sql, -1, &addStmt, NULL) != SQLITE_OK)
                {
                    NSLog(@"Error while creating INSERT INTO society statement. '%s'", sqlite3_errmsg(dataBase));
                }
            }
            
            if(rowidentifier == -1)
            {
                if(sqlite3_bind_text(addStmt, 1, [objDetails.strRowId UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 2, [objDetails.strTitle UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 3, [objDetails.strintro UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 4, [objDetails.strBody UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 5, [objDetails.strImage UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 6, [objDetails.strnews_date UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(sqlite3_bind_text(addStmt, 7, [objDetails.strTime UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(SQLITE_DONE != sqlite3_step(addStmt))
                {
                    returnValue = NO;
                }
                
                sqlite3_reset(addStmt);
            }
            
            objDetails = nil;
        }
    }
    
    if (addStmt)
    {
        sqlite3_finalize(addStmt);
        addStmt = nil;
    }
    sqlite3_close(dataBase);
    dataBase = nil;
    
    return returnValue;
}

-(BOOL)addServiceToDataBase2:(NSMutableArray *)arrData2
{
    
    BOOL returnValue = YES;
    sqlite3_stmt *addStmt = nil;
    sqlite3 *dataBase = nil;
    
    if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
    {
        printf("\n Database Successfully Opened");
    }
    // Open the database. The database was prepared outside the application.
    if (sqlite3_open([strDBPath UTF8String], &dataBase) == SQLITE_OK)
    {
        for (int i =0 ; i< arrData2.count-1; i++)
        {
            DataBO *objDetails = [arrData2 objectAtIndex:i ];
            NSInteger rowidentifier = -1;
            if(addStmt == nil)
            {
                NSString *strValue = [NSString stringWithFormat:@"INSERT INTO  business(row_id,title,mixed_intro,body,image,news_date,updt_tmstmp) Values (?,?,?,?,?,?,?)"];
                const char *sql = [strValue UTF8String];
                if(sqlite3_prepare_v2(dataBase, sql, -1, &addStmt, NULL) != SQLITE_OK)
                {
                    NSLog(@"Error while creating INSERT INTO business statement. '%s'", sqlite3_errmsg(dataBase));
                }
            }
            
            if(rowidentifier == -1)
            {
                if(sqlite3_bind_text(addStmt, 1, [objDetails.strRowId UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 2, [objDetails.strTitle UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 3, [objDetails.strintro UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 4, [objDetails.strBody UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 5, [objDetails.strImage UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 6, [objDetails.strnews_date UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(sqlite3_bind_text(addStmt, 7, [objDetails.strTime UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(SQLITE_DONE != sqlite3_step(addStmt))
                {
                    returnValue = NO;
                }
                
                sqlite3_reset(addStmt);
            }
            
            objDetails = nil;
        }
    }
    
    if (addStmt)
    {
        sqlite3_finalize(addStmt);
        addStmt = nil;
    }
    sqlite3_close(dataBase);
    dataBase = nil;
    
    return returnValue;
}


-(BOOL)addServiceToDataBase3:(NSMutableArray *)arrData3
{
    
    BOOL returnValue = YES;
    sqlite3_stmt *addStmt = nil;
    sqlite3 *dataBase = nil;
    
    if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
    {
        printf("\n Database Successfully Opened");
    }
    // Open the database. The database was prepared outside the application.
    if (sqlite3_open([strDBPath UTF8String], &dataBase) == SQLITE_OK)
    {
        for (int i =0 ; i< arrData3.count-1; i++)
        {
            DataBO *objDetails = [arrData3 objectAtIndex:i ];
            NSInteger rowidentifier = -1;
            if(addStmt == nil)
            {
                NSString *strValue = [NSString stringWithFormat:@"INSERT INTO  art(row_id,title,mixed_intro,body,image,news_date,updt_tmstmp) Values (?,?,?,?,?,?,?)"];
                const char *sql = [strValue UTF8String];
                if(sqlite3_prepare_v2(dataBase, sql, -1, &addStmt, NULL) != SQLITE_OK)
                {
                    NSLog(@"Error while creating INSERT INTO art statement. '%s'", sqlite3_errmsg(dataBase));
                }
            }
            
            if(rowidentifier == -1)
            {
                if(sqlite3_bind_text(addStmt, 1, [objDetails.strRowId UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 2, [objDetails.strTitle UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 3, [objDetails.strintro UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 4, [objDetails.strBody UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 5, [objDetails.strImage UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 6, [objDetails.strnews_date UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(sqlite3_bind_text(addStmt, 7, [objDetails.strTime UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(SQLITE_DONE != sqlite3_step(addStmt))
                {
                    returnValue = NO;
                }
                
                sqlite3_reset(addStmt);
            }
            
            objDetails = nil;
        }
    }
    
    if (addStmt)
    {
        sqlite3_finalize(addStmt);
        addStmt = nil;
    }
    sqlite3_close(dataBase);
    dataBase = nil;
    
    return returnValue;
}

-(BOOL)addServiceToDataBase4:(NSMutableArray *)arrData4
{
    
    BOOL returnValue = YES;
    sqlite3_stmt *addStmt = nil;
    sqlite3 *dataBase = nil;
    
    if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
    {
        printf("\n Database Successfully Opened");
    }
    // Open the database. The database was prepared outside the application.
    if (sqlite3_open([strDBPath UTF8String], &dataBase) == SQLITE_OK)
    {
        for (int i =0 ; i< arrData4.count-1; i++)
        {
            DataBO *objDetails = [arrData4 objectAtIndex:i ];
            NSInteger rowidentifier = -1;
            if(addStmt == nil)
            {
                NSString *strValue = [NSString stringWithFormat:@"INSERT INTO  sports(row_id,title,mixed_intro,body,image,news_date,updt_tmstmp) Values (?,?,?,?,?,?,?)"];
                const char *sql = [strValue UTF8String];
                if(sqlite3_prepare_v2(dataBase, sql, -1, &addStmt, NULL) != SQLITE_OK)
                {
                    NSLog(@"Error while creating INSERT INTO sports statement. '%s'", sqlite3_errmsg(dataBase));
                }
            }
            
            if(rowidentifier == -1)
            {
                if(sqlite3_bind_text(addStmt, 1, [objDetails.strRowId UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 2, [objDetails.strTitle UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 3, [objDetails.strintro UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 4, [objDetails.strBody UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 5, [objDetails.strImage UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 6, [objDetails.strnews_date UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(sqlite3_bind_text(addStmt, 7, [objDetails.strTime UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(SQLITE_DONE != sqlite3_step(addStmt))
                {
                    returnValue = NO;
                }
                
                sqlite3_reset(addStmt);
            }
            
            objDetails = nil;
        }
    }
    
    if (addStmt)
    {
        sqlite3_finalize(addStmt);
        addStmt = nil;
    }
    sqlite3_close(dataBase);
    dataBase = nil;
    
    return returnValue;
}
-(BOOL)addServiceToDataBase5:(NSMutableArray *)arrData5
{
    
    BOOL returnValue = YES;
    sqlite3_stmt *addStmt = nil;
    sqlite3 *dataBase = nil;
    
    if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
    {
        printf("\n Database Successfully Opened");
    }
    // Open the database. The database was prepared outside the application.
    if (sqlite3_open([strDBPath UTF8String], &dataBase) == SQLITE_OK)
    {
        for (int i =0 ; i< arrData5.count-1; i++)
        {
            DataBO *objDetails = [arrData5 objectAtIndex:i ];
            NSInteger rowidentifier = -1;
            if(addStmt == nil)
            {
                NSString *strValue = [NSString stringWithFormat:@"INSERT INTO  special(row_id,title,mixed_intro,body,image,news_date,updt_tmstmp) Values (?,?,?,?,?,?,?)"];
                const char *sql = [strValue UTF8String];
                if(sqlite3_prepare_v2(dataBase, sql, -1, &addStmt, NULL) != SQLITE_OK)
                {
                    NSLog(@"Error while creating INSERT INTO special statement. '%s'", sqlite3_errmsg(dataBase));
                }
            }
            
            if(rowidentifier == -1)
            {
                if(sqlite3_bind_text(addStmt, 1, [objDetails.strRowId UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 2, [objDetails.strTitle UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 3, [objDetails.strintro UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 4, [objDetails.strBody UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 5, [objDetails.strImage UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 6, [objDetails.strnews_date UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(sqlite3_bind_text(addStmt, 7, [objDetails.strTime UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(SQLITE_DONE != sqlite3_step(addStmt))
                {
                    returnValue = NO;
                }
                
                sqlite3_reset(addStmt);
            }
            
            objDetails = nil;
        }
    }
    
    if (addStmt)
    {
        sqlite3_finalize(addStmt);
        addStmt = nil;
    }
    sqlite3_close(dataBase);
    dataBase = nil;
    
    return returnValue;
}

-(BOOL)addServiceToDataBase6:(NSMutableArray *)arrData6
{
    
    BOOL returnValue = YES;
    sqlite3_stmt *addStmt = nil;
    sqlite3 *dataBase = nil;
    
    if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
    {
        printf("\n Database Successfully Opened");
    }
    // Open the database. The database was prepared outside the application.
    if (sqlite3_open([strDBPath UTF8String], &dataBase) == SQLITE_OK)
    {
        for (int i =0 ; i< arrData6.count-1; i++)
        {
            DataBO *objDetails = [arrData6 objectAtIndex:i ];
            NSInteger rowidentifier = -1;
            if(addStmt == nil)
            {
                NSString *strValue = [NSString stringWithFormat:@"INSERT INTO  opinion(row_id,title,mixed_intro,body,image,news_date,updt_tmstmp) Values (?,?,?,?,?,?,?)"];
                const char *sql = [strValue UTF8String];
                if(sqlite3_prepare_v2(dataBase, sql, -1, &addStmt, NULL) != SQLITE_OK)
                {
                    NSLog(@"Error while creating INSERT INTO opinion statement. '%s'", sqlite3_errmsg(dataBase));
                }
            }
            
            if(rowidentifier == -1)
            {
                if(sqlite3_bind_text(addStmt, 1, [objDetails.strRowId UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 2, [objDetails.strTitle UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 3, [objDetails.strintro UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 4, [objDetails.strBody UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 5, [objDetails.strImage UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 6, [objDetails.strnews_date UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(sqlite3_bind_text(addStmt, 7, [objDetails.strTime UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(SQLITE_DONE != sqlite3_step(addStmt))
                {
                    returnValue = NO;
                }
                
                sqlite3_reset(addStmt);
            }
            
            objDetails = nil;
        }
    }
    
    if (addStmt)
    {
        sqlite3_finalize(addStmt);
        addStmt = nil;
    }
    sqlite3_close(dataBase);
    dataBase = nil;
    
    return returnValue;
}

-(BOOL)addServiceToDataBase7:(NSMutableArray *)arrData7
{
    
    BOOL returnValue = YES;
    sqlite3_stmt *addStmt = nil;
    sqlite3 *dataBase = nil;
    
    if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
    {
        printf("\n Database Successfully Opened");
    }
    // Open the database. The database was prepared outside the application.
    if (sqlite3_open([strDBPath UTF8String], &dataBase) == SQLITE_OK)
    {
        for (int i =0 ; i< arrData7.count-1; i++)
        {
            DataBO *objDetails = [arrData7 objectAtIndex:i ];
            NSInteger rowidentifier = -1;
            if(addStmt == nil)
            {
                NSString *strValue = [NSString stringWithFormat:@"INSERT INTO  blog(row_id,title,mixed_intro,body,image,news_date,updt_tmstmp) Values (?,?,?,?,?,?,?)"];
                const char *sql = [strValue UTF8String];
                if(sqlite3_prepare_v2(dataBase, sql, -1, &addStmt, NULL) != SQLITE_OK)
                {
                    NSLog(@"Error while creating INSERT INTO blog statement. '%s'", sqlite3_errmsg(dataBase));
                }
            }
            
            if(rowidentifier == -1)
            {
                if(sqlite3_bind_text(addStmt, 1, [objDetails.strRowId UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 2, [objDetails.strTitle UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 3, [objDetails.strintro UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 4, [objDetails.strBody UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 5, [objDetails.strImage UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 6, [objDetails.strnews_date UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(sqlite3_bind_text(addStmt, 7, [objDetails.strTime UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(SQLITE_DONE != sqlite3_step(addStmt))
                {
                    returnValue = NO;
                }
                
                sqlite3_reset(addStmt);
            }
            
            objDetails = nil;
        }
    }
    
    if (addStmt)
    {
        sqlite3_finalize(addStmt);
        addStmt = nil;
    }
    sqlite3_close(dataBase);
    dataBase = nil;
    
    return returnValue;
}

-(BOOL)addServiceToDataBase8:(NSMutableArray *)arrData8
{
    
    BOOL returnValue = YES;
    sqlite3_stmt *addStmt = nil;
    sqlite3 *dataBase = nil;
    
    if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
    {
        printf("\n Database Successfully Opened");
    }
    // Open the database. The database was prepared outside the application.
    if (sqlite3_open([strDBPath UTF8String], &dataBase) == SQLITE_OK)
    {
        for (int i =0 ; i< arrData8.count-1; i++)
        {
            DataBO *objDetails = [arrData8 objectAtIndex:i ];
            NSInteger rowidentifier = -1;
            if(addStmt == nil)
            {
                NSString *strValue = [NSString stringWithFormat:@"INSERT INTO  literature(row_id,title,mixed_intro,body,image,news_date,updt_tmstmp) Values (?,?,?,?,?,?,?)"];
                const char *sql = [strValue UTF8String];
                if(sqlite3_prepare_v2(dataBase, sql, -1, &addStmt, NULL) != SQLITE_OK)
                {
                    NSLog(@"Error while creating INSERT INTO literature statement. '%s'", sqlite3_errmsg(dataBase));
                }
            }
            
            if(rowidentifier == -1)
            {
                if(sqlite3_bind_text(addStmt, 1, [objDetails.strRowId UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 2, [objDetails.strTitle UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 3, [objDetails.strintro UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 4, [objDetails.strBody UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 5, [objDetails.strImage UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 6, [objDetails.strnews_date UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(sqlite3_bind_text(addStmt, 7, [objDetails.strTime UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(SQLITE_DONE != sqlite3_step(addStmt))
                {
                    returnValue = NO;
                }
                
                sqlite3_reset(addStmt);
            }
            
            objDetails = nil;
        }
    }
    
    if (addStmt)
    {
        sqlite3_finalize(addStmt);
        addStmt = nil;
    }
    sqlite3_close(dataBase);
    dataBase = nil;
    
    return returnValue;
}
-(BOOL)naddServiceToDataBase:(NSMutableArray *)narrData
{
    
    BOOL returnValue = YES;
    sqlite3_stmt *addStmt = nil;
    sqlite3 *dataBase = nil;
    
    if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
    {
        printf("\n Database Successfully Opened");
    }
    // Open the database. The database was prepared outside the application.
    if (sqlite3_open([strDBPath UTF8String], &dataBase) == SQLITE_OK)
    {
        for (int i =0 ; i< narrData.count-1; i++)
        {
            DataBO *objDetails = [narrData objectAtIndex:i ];
            NSInteger rowidentifier = -1;
            if(addStmt == nil)
            {
                NSString *strValue = [NSString stringWithFormat:@"INSERT INTO  npolitics(row_id,title,mixed_intro,body,image,news_date,updt_tmstmp) Values (?,?,?,?,?,?,?)"];
                const char *sql = [strValue UTF8String];
                if(sqlite3_prepare_v2(dataBase, sql, -1, &addStmt, NULL) != SQLITE_OK)
                {
                    NSLog(@"Error while creating INSERT INTO literature statement. '%s'", sqlite3_errmsg(dataBase));
                }
            }
            
            if(rowidentifier == -1)
            {
                if(sqlite3_bind_text(addStmt, 1, [objDetails.strRowId UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 2, [objDetails.strTitle UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 3, [objDetails.strintro UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 4, [objDetails.strBody UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 5, [objDetails.strImage UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 6, [objDetails.strnews_date UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(sqlite3_bind_text(addStmt, 7, [objDetails.strTime UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(SQLITE_DONE != sqlite3_step(addStmt))
                {
                    returnValue = NO;
                }
                
                sqlite3_reset(addStmt);
            }
            
            objDetails = nil;
        }
    }
    
    if (addStmt)
    {
        sqlite3_finalize(addStmt);
        addStmt = nil;
    }
    sqlite3_close(dataBase);
    dataBase = nil;
    
    return returnValue;
}
-(BOOL)naddServiceToDataBase1:(NSMutableArray *)narrData1
{
    
    BOOL returnValue = YES;
    sqlite3_stmt *addStmt = nil;
    sqlite3 *dataBase = nil;
    
    if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
    {
        printf("\n Database Successfully Opened");
    }
    // Open the database. The database was prepared outside the application.
    if (sqlite3_open([strDBPath UTF8String], &dataBase) == SQLITE_OK)
    {
        for (int i =0 ; i< narrData1.count-1; i++)
        {
            DataBO *objDetails = [narrData1 objectAtIndex:i ];
            NSInteger rowidentifier = -1;
            if(addStmt == nil)
            {
                NSString *strValue = [NSString stringWithFormat:@"INSERT INTO  nsociety(row_id,title,mixed_intro,body,image,news_date,updt_tmstmp) Values (?,?,?,?,?,?,?)"];
                const char *sql = [strValue UTF8String];
                if(sqlite3_prepare_v2(dataBase, sql, -1, &addStmt, NULL) != SQLITE_OK)
                {
                    NSLog(@"Error while creating INSERT INTO literature statement. '%s'", sqlite3_errmsg(dataBase));
                }
            }
            
            if(rowidentifier == -1)
            {
                if(sqlite3_bind_text(addStmt, 1, [objDetails.strRowId UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 2, [objDetails.strTitle UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 3, [objDetails.strintro UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 4, [objDetails.strBody UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 5, [objDetails.strImage UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 6, [objDetails.strnews_date UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(sqlite3_bind_text(addStmt, 7, [objDetails.strTime UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(SQLITE_DONE != sqlite3_step(addStmt))
                {
                    returnValue = NO;
                }
                
                sqlite3_reset(addStmt);
            }
            
            objDetails = nil;
        }
    }
    
    if (addStmt)
    {
        sqlite3_finalize(addStmt);
        addStmt = nil;
    }
    sqlite3_close(dataBase);
    dataBase = nil;
    
    return returnValue;
}
-(BOOL)naddServiceToDataBase2:(NSMutableArray *)narrData2
{
    
    BOOL returnValue = YES;
    sqlite3_stmt *addStmt = nil;
    sqlite3 *dataBase = nil;
    
    if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
    {
        printf("\n Database Successfully Opened");
    }
    // Open the database. The database was prepared outside the application.
    if (sqlite3_open([strDBPath UTF8String], &dataBase) == SQLITE_OK)
    {
        for (int i =0 ; i< narrData2.count-1; i++)
        {
            DataBO *objDetails = [narrData2 objectAtIndex:i ];
            NSInteger rowidentifier = -1;
            if(addStmt == nil)
            {
                NSString *strValue = [NSString stringWithFormat:@"INSERT INTO  nbusiness(row_id,title,mixed_intro,body,image,news_date,updt_tmstmp) Values (?,?,?,?,?,?,?)"];
                const char *sql = [strValue UTF8String];
                if(sqlite3_prepare_v2(dataBase, sql, -1, &addStmt, NULL) != SQLITE_OK)
                {
                    NSLog(@"Error while creating INSERT INTO literature statement. '%s'", sqlite3_errmsg(dataBase));
                }
            }
            
            if(rowidentifier == -1)
            {
                if(sqlite3_bind_text(addStmt, 1, [objDetails.strRowId UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 2, [objDetails.strTitle UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 3, [objDetails.strintro UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 4, [objDetails.strBody UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 5, [objDetails.strImage UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 6, [objDetails.strnews_date UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(sqlite3_bind_text(addStmt, 7, [objDetails.strTime UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(SQLITE_DONE != sqlite3_step(addStmt))
                {
                    returnValue = NO;
                }
                
                sqlite3_reset(addStmt);
            }
            
            objDetails = nil;
        }
    }
    
    if (addStmt)
    {
        sqlite3_finalize(addStmt);
        addStmt = nil;
    }
    sqlite3_close(dataBase);
    dataBase = nil;
    
    return returnValue;
}
-(BOOL)naddServiceToDataBase3:(NSMutableArray *)narrData3
{
    
    BOOL returnValue = YES;
    sqlite3_stmt *addStmt = nil;
    sqlite3 *dataBase = nil;
    
    if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
    {
        printf("\n Database Successfully Opened");
    }
    // Open the database. The database was prepared outside the application.
    if (sqlite3_open([strDBPath UTF8String], &dataBase) == SQLITE_OK)
    {
        for (int i =0 ; i< narrData3.count-1; i++)
        {
            DataBO *objDetails = [narrData3 objectAtIndex:i ];
            NSInteger rowidentifier = -1;
            if(addStmt == nil)
            {
                NSString *strValue = [NSString stringWithFormat:@"INSERT INTO  nart(row_id,title,mixed_intro,body,image,news_date,updt_tmstmp) Values (?,?,?,?,?,?,?)"];
                const char *sql = [strValue UTF8String];
                if(sqlite3_prepare_v2(dataBase, sql, -1, &addStmt, NULL) != SQLITE_OK)
                {
                    NSLog(@"Error while creating INSERT INTO literature statement. '%s'", sqlite3_errmsg(dataBase));
                }
            }
            
            if(rowidentifier == -1)
            {
                if(sqlite3_bind_text(addStmt, 1, [objDetails.strRowId UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 2, [objDetails.strTitle UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 3, [objDetails.strintro UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 4, [objDetails.strBody UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 5, [objDetails.strImage UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 6, [objDetails.strnews_date UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(sqlite3_bind_text(addStmt, 7, [objDetails.strTime UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(SQLITE_DONE != sqlite3_step(addStmt))
                {
                    returnValue = NO;
                }
                
                sqlite3_reset(addStmt);
            }
            
            objDetails = nil;
        }
    }
    
    if (addStmt)
    {
        sqlite3_finalize(addStmt);
        addStmt = nil;
    }
    sqlite3_close(dataBase);
    dataBase = nil;
    
    return returnValue;
}
-(BOOL)naddServiceToDataBase4:(NSMutableArray *)narrData4
{
    
    BOOL returnValue = YES;
    sqlite3_stmt *addStmt = nil;
    sqlite3 *dataBase = nil;
    
    if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
    {
        printf("\n Database Successfully Opened");
    }
    // Open the database. The database was prepared outside the application.
    if (sqlite3_open([strDBPath UTF8String], &dataBase) == SQLITE_OK)
    {
        for (int i =0 ; i< narrData4.count-1; i++)
        {
            DataBO *objDetails = [narrData4 objectAtIndex:i ];
            NSInteger rowidentifier = -1;
            if(addStmt == nil)
            {
                NSString *strValue = [NSString stringWithFormat:@"INSERT INTO  nsports(row_id,title,mixed_intro,body,image,news_date,updt_tmstmp) Values (?,?,?,?,?,?,?)"];
                const char *sql = [strValue UTF8String];
                if(sqlite3_prepare_v2(dataBase, sql, -1, &addStmt, NULL) != SQLITE_OK)
                {
                    NSLog(@"Error while creating INSERT INTO literature statement. '%s'", sqlite3_errmsg(dataBase));
                }
            }
            
            if(rowidentifier == -1)
            {
                if(sqlite3_bind_text(addStmt, 1, [objDetails.strRowId UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 2, [objDetails.strTitle UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 3, [objDetails.strintro UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 4, [objDetails.strBody UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 5, [objDetails.strImage UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 6, [objDetails.strnews_date UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(sqlite3_bind_text(addStmt, 7, [objDetails.strTime UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(SQLITE_DONE != sqlite3_step(addStmt))
                {
                    returnValue = NO;
                }
                
                sqlite3_reset(addStmt);
            }
            
            objDetails = nil;
        }
    }
    
    if (addStmt)
    {
        sqlite3_finalize(addStmt);
        addStmt = nil;
    }
    sqlite3_close(dataBase);
    dataBase = nil;
    
    return returnValue;
}
-(BOOL)naddServiceToDataBase5:(NSMutableArray *)narrData5
{
    
    BOOL returnValue = YES;
    sqlite3_stmt *addStmt = nil;
    sqlite3 *dataBase = nil;
    
    if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
    {
        printf("\n Database Successfully Opened");
    }
    // Open the database. The database was prepared outside the application.
    if (sqlite3_open([strDBPath UTF8String], &dataBase) == SQLITE_OK)
    {
        for (int i =0 ; i< narrData5.count-1; i++)
        {
            DataBO *objDetails = [narrData5 objectAtIndex:i ];
            NSInteger rowidentifier = -1;
            if(addStmt == nil)
            {
                NSString *strValue = [NSString stringWithFormat:@"INSERT INTO  nspecial(row_id,title,mixed_intro,body,image,news_date,updt_tmstmp) Values (?,?,?,?,?,?,?)"];
                const char *sql = [strValue UTF8String];
                if(sqlite3_prepare_v2(dataBase, sql, -1, &addStmt, NULL) != SQLITE_OK)
                {
                    NSLog(@"Error while creating INSERT INTO literature statement. '%s'", sqlite3_errmsg(dataBase));
                }
            }
            
            if(rowidentifier == -1)
            {
                if(sqlite3_bind_text(addStmt, 1, [objDetails.strRowId UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 2, [objDetails.strTitle UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 3, [objDetails.strintro UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 4, [objDetails.strBody UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 5, [objDetails.strImage UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 6, [objDetails.strnews_date UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(sqlite3_bind_text(addStmt, 7, [objDetails.strTime UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(SQLITE_DONE != sqlite3_step(addStmt))
                {
                    returnValue = NO;
                }
                
                sqlite3_reset(addStmt);
            }
            
            objDetails = nil;
        }
    }
    
    if (addStmt)
    {
        sqlite3_finalize(addStmt);
        addStmt = nil;
    }
    sqlite3_close(dataBase);
    dataBase = nil;
    
    return returnValue;
}
-(BOOL)naddServiceToDataBase6:(NSMutableArray *)narrData6
{
    
    BOOL returnValue = YES;
    sqlite3_stmt *addStmt = nil;
    sqlite3 *dataBase = nil;
    
    if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
    {
        printf("\n Database Successfully Opened");
    }
    // Open the database. The database was prepared outside the application.
    if (sqlite3_open([strDBPath UTF8String], &dataBase) == SQLITE_OK)
    {
        for (int i =0 ; i< narrData6.count-1; i++)
        {
            DataBO *objDetails = [narrData6 objectAtIndex:i ];
            NSInteger rowidentifier = -1;
            if(addStmt == nil)
            {
                NSString *strValue = [NSString stringWithFormat:@"INSERT INTO  nopinion(row_id,title,mixed_intro,body,image,news_date,updt_tmstmp) Values (?,?,?,?,?,?,?)"];
                const char *sql = [strValue UTF8String];
                if(sqlite3_prepare_v2(dataBase, sql, -1, &addStmt, NULL) != SQLITE_OK)
                {
                    NSLog(@"Error while creating INSERT INTO literature statement. '%s'", sqlite3_errmsg(dataBase));
                }
            }
            
            if(rowidentifier == -1)
            {
                if(sqlite3_bind_text(addStmt, 1, [objDetails.strRowId UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 2, [objDetails.strTitle UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 3, [objDetails.strintro UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 4, [objDetails.strBody UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 5, [objDetails.strImage UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 6, [objDetails.strnews_date UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(sqlite3_bind_text(addStmt, 7, [objDetails.strTime UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(SQLITE_DONE != sqlite3_step(addStmt))
                {
                    returnValue = NO;
                }
                
                sqlite3_reset(addStmt);
            }
            
            objDetails = nil;
        }
    }
    
    if (addStmt)
    {
        sqlite3_finalize(addStmt);
        addStmt = nil;
    }
    sqlite3_close(dataBase);
    dataBase = nil;
    
    return returnValue;
}
-(BOOL)naddServiceToDataBase7:(NSMutableArray *)narrData7
{
    
    BOOL returnValue = YES;
    sqlite3_stmt *addStmt = nil;
    sqlite3 *dataBase = nil;
    
    if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
    {
        printf("\n Database Successfully Opened");
    }
    // Open the database. The database was prepared outside the application.
    if (sqlite3_open([strDBPath UTF8String], &dataBase) == SQLITE_OK)
    {
        for (int i =0 ; i< narrData7.count-1; i++)
        {
            DataBO *objDetails = [narrData7 objectAtIndex:i ];
            NSInteger rowidentifier = -1;
            if(addStmt == nil)
            {
                NSString *strValue = [NSString stringWithFormat:@"INSERT INTO  nblog(row_id,title,mixed_intro,body,image,news_date,updt_tmstmp) Values (?,?,?,?,?,?,?)"];
                const char *sql = [strValue UTF8String];
                if(sqlite3_prepare_v2(dataBase, sql, -1, &addStmt, NULL) != SQLITE_OK)
                {
                    NSLog(@"Error while creating INSERT INTO literature statement. '%s'", sqlite3_errmsg(dataBase));
                }
            }
            
            if(rowidentifier == -1)
            {
                if(sqlite3_bind_text(addStmt, 1, [objDetails.strRowId UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 2, [objDetails.strTitle UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 3, [objDetails.strintro UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 4, [objDetails.strBody UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 5, [objDetails.strImage UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 6, [objDetails.strnews_date UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(sqlite3_bind_text(addStmt, 7, [objDetails.strTime UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(SQLITE_DONE != sqlite3_step(addStmt))
                {
                    returnValue = NO;
                }
                
                sqlite3_reset(addStmt);
            }
            
            objDetails = nil;
        }
    }
    
    if (addStmt)
    {
        sqlite3_finalize(addStmt);
        addStmt = nil;
    }
    sqlite3_close(dataBase);
    dataBase = nil;
    
    return returnValue;
}
-(BOOL)naddServiceToDataBase8:(NSMutableArray *)narrData8
{
    
    BOOL returnValue = YES;
    sqlite3_stmt *addStmt = nil;
    sqlite3 *dataBase = nil;
    
    if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
    {
        printf("\n Database Successfully Opened");
    }
    // Open the database. The database was prepared outside the application.
    if (sqlite3_open([strDBPath UTF8String], &dataBase) == SQLITE_OK)
    {
        for (int i =0 ; i< narrData8.count-1; i++)
        {
            DataBO *objDetails = [narrData8 objectAtIndex:i ];
            NSInteger rowidentifier = -1;
            if(addStmt == nil)
            {
                NSString *strValue = [NSString stringWithFormat:@"INSERT INTO  nliterature(row_id,title,mixed_intro,body,image,news_date,updt_tmstmp) Values (?,?,?,?,?,?,?)"];
                const char *sql = [strValue UTF8String];
                if(sqlite3_prepare_v2(dataBase, sql, -1, &addStmt, NULL) != SQLITE_OK)
                {
                    NSLog(@"Error while creating INSERT INTO literature statement. '%s'", sqlite3_errmsg(dataBase));
                }
            }
            
            if(rowidentifier == -1)
            {
                if(sqlite3_bind_text(addStmt, 1, [objDetails.strRowId UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 2, [objDetails.strTitle UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 3, [objDetails.strintro UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 4, [objDetails.strBody UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 5, [objDetails.strImage UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 6, [objDetails.strnews_date UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(sqlite3_bind_text(addStmt, 7, [objDetails.strTime UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(SQLITE_DONE != sqlite3_step(addStmt))
                {
                    returnValue = NO;
                }
                
                sqlite3_reset(addStmt);
            }
            
            objDetails = nil;
        }
    }
    
    if (addStmt)
    {
        sqlite3_finalize(addStmt);
        addStmt = nil;
    }
    sqlite3_close(dataBase);
    dataBase = nil;
    
    return returnValue;
}
/*-(BOOL)deleteSelectedService:(DataBO *)objService
{
	sqlite3_stmt *deleteStmt = nil;
	sqlite3 *selectDatabase = nil;
*/

-(BOOL)deleteSelectedService:(DataBO *)objService
{
	sqlite3_stmt *deleteStmt = nil;
	sqlite3 *selectDatabase = nil;
	
	
	if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
	{
 	}
	// Open the database. The database was prepared outside the application.
	
	
	if (sqlite3_open([strDBPath UTF8String], &selectDatabase) == SQLITE_OK)
	{
        
        NSString *strDeleteStmt= [NSString stringWithFormat:@"DELETE FROM politics"];
        const char *DELETEsql = [strDeleteStmt UTF8String];
        
        if(sqlite3_prepare_v2(selectDatabase, DELETEsql, -1, &deleteStmt, NULL) != SQLITE_OK)
        {
            NSLog(@"Error while delete row preparing statement in politics. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        if(SQLITE_DONE != sqlite3_step(deleteStmt))
        {
            NSLog(@"Error while deleting into politics Row. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        sqlite3_reset(deleteStmt);
		
		sqlite3_finalize(deleteStmt);
		deleteStmt = nil;
		sqlite3_close(selectDatabase);
	}
	return YES;
}
-(BOOL)deleteSelectedService1:(DataBO *)objService
{
	sqlite3_stmt *deleteStmt = nil;
	sqlite3 *selectDatabase = nil;
	
	
	if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
	{
 	}
	// Open the database. The database was prepared outside the application.
	
	
	if (sqlite3_open([strDBPath UTF8String], &selectDatabase) == SQLITE_OK)
	{
        
        NSString *strDeleteStmt= [NSString stringWithFormat:@"DELETE FROM society"];
        const char *DELETEsql = [strDeleteStmt UTF8String];
        
        if(sqlite3_prepare_v2(selectDatabase, DELETEsql, -1, &deleteStmt, NULL) != SQLITE_OK)
        {
            NSLog(@"Error while delete row preparing statement in tblBookedService. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        if(SQLITE_DONE != sqlite3_step(deleteStmt))
        {
            NSLog(@"Error while deleting into tblBookedService Row. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        sqlite3_reset(deleteStmt);
		
		sqlite3_finalize(deleteStmt);
		deleteStmt = nil;
		sqlite3_close(selectDatabase);
	}
	return YES;
}
-(BOOL)deleteSelectedService2:(DataBO *)objService
{
	sqlite3_stmt *deleteStmt = nil;
	sqlite3 *selectDatabase = nil;
	
	
	if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
	{
 	}
	// Open the database. The database was prepared outside the application.
	
	
	if (sqlite3_open([strDBPath UTF8String], &selectDatabase) == SQLITE_OK)
	{
        
        NSString *strDeleteStmt= [NSString stringWithFormat:@"DELETE FROM business"];
        const char *DELETEsql = [strDeleteStmt UTF8String];
        
        if(sqlite3_prepare_v2(selectDatabase, DELETEsql, -1, &deleteStmt, NULL) != SQLITE_OK)
        {
            NSLog(@"Error while delete row preparing statement in tblBookedService. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        if(SQLITE_DONE != sqlite3_step(deleteStmt))
        {
            NSLog(@"Error while deleting into tblBookedService Row. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        sqlite3_reset(deleteStmt);
		
		sqlite3_finalize(deleteStmt);
		deleteStmt = nil;
		sqlite3_close(selectDatabase);
	}
	return YES;
}
-(BOOL)deleteSelectedService3:(DataBO *)objService
{
	sqlite3_stmt *deleteStmt = nil;
	sqlite3 *selectDatabase = nil;
	
	
	if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
	{
 	}
	// Open the database. The database was prepared outside the application.
	
	
	if (sqlite3_open([strDBPath UTF8String], &selectDatabase) == SQLITE_OK)
	{
        
        NSString *strDeleteStmt= [NSString stringWithFormat:@"DELETE FROM art"];
        const char *DELETEsql = [strDeleteStmt UTF8String];
        
        if(sqlite3_prepare_v2(selectDatabase, DELETEsql, -1, &deleteStmt, NULL) != SQLITE_OK)
        {
            NSLog(@"Error while delete row preparing statement in tblBookedService. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        if(SQLITE_DONE != sqlite3_step(deleteStmt))
        {
            NSLog(@"Error while deleting into tblBookedService Row. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        sqlite3_reset(deleteStmt);
		
		sqlite3_finalize(deleteStmt);
		deleteStmt = nil;
		sqlite3_close(selectDatabase);
	}
	return YES;
}
-(BOOL)deleteSelectedService4:(DataBO *)objService
{
	sqlite3_stmt *deleteStmt = nil;
	sqlite3 *selectDatabase = nil;
	
	
	if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
	{
 	}
	// Open the database. The database was prepared outside the application.
	
	
	if (sqlite3_open([strDBPath UTF8String], &selectDatabase) == SQLITE_OK)
	{
        
        NSString *strDeleteStmt= [NSString stringWithFormat:@"DELETE FROM sports"];
        const char *DELETEsql = [strDeleteStmt UTF8String];
        
        if(sqlite3_prepare_v2(selectDatabase, DELETEsql, -1, &deleteStmt, NULL) != SQLITE_OK)
        {
            NSLog(@"Error while delete row preparing statement in tblBookedService. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        if(SQLITE_DONE != sqlite3_step(deleteStmt))
        {
            NSLog(@"Error while deleting into tblBookedService Row. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        sqlite3_reset(deleteStmt);
		
		sqlite3_finalize(deleteStmt);
		deleteStmt = nil;
		sqlite3_close(selectDatabase);
	}
	return YES;
}
-(BOOL)deleteSelectedService5:(DataBO *)objService
{
	sqlite3_stmt *deleteStmt = nil;
	sqlite3 *selectDatabase = nil;
	
	
	if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
	{
 	}
	// Open the database. The database was prepared outside the application.
	
	
	if (sqlite3_open([strDBPath UTF8String], &selectDatabase) == SQLITE_OK)
	{
        
        NSString *strDeleteStmt= [NSString stringWithFormat:@"DELETE FROM special"];
        const char *DELETEsql = [strDeleteStmt UTF8String];
        
        if(sqlite3_prepare_v2(selectDatabase, DELETEsql, -1, &deleteStmt, NULL) != SQLITE_OK)
        {
            NSLog(@"Error while delete row preparing statement in tblBookedService. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        if(SQLITE_DONE != sqlite3_step(deleteStmt))
        {
            NSLog(@"Error while deleting into tblBookedService Row. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        sqlite3_reset(deleteStmt);
		
		sqlite3_finalize(deleteStmt);
		deleteStmt = nil;
		sqlite3_close(selectDatabase);
	}
	return YES;
}
-(BOOL)deleteSelectedService6:(DataBO *)objService
{
	sqlite3_stmt *deleteStmt = nil;
	sqlite3 *selectDatabase = nil;
	
	
	if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
	{
 	}
	// Open the database. The database was prepared outside the application.
	
	
	if (sqlite3_open([strDBPath UTF8String], &selectDatabase) == SQLITE_OK)
	{
        
        NSString *strDeleteStmt= [NSString stringWithFormat:@"DELETE FROM opinion"];
        const char *DELETEsql = [strDeleteStmt UTF8String];
        
        if(sqlite3_prepare_v2(selectDatabase, DELETEsql, -1, &deleteStmt, NULL) != SQLITE_OK)
        {
            NSLog(@"Error while delete row preparing statement in tblBookedService. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        if(SQLITE_DONE != sqlite3_step(deleteStmt))
        {
            NSLog(@"Error while deleting into tblBookedService Row. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        sqlite3_reset(deleteStmt);
		
		sqlite3_finalize(deleteStmt);
		deleteStmt = nil;
		sqlite3_close(selectDatabase);
	}
	return YES;
}
-(BOOL)deleteSelectedService7:(DataBO *)objService
{
	sqlite3_stmt *deleteStmt = nil;
	sqlite3 *selectDatabase = nil;
	
	
	if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
	{
 	}
	// Open the database. The database was prepared outside the application.
	
	
	if (sqlite3_open([strDBPath UTF8String], &selectDatabase) == SQLITE_OK)
	{
        
        NSString *strDeleteStmt= [NSString stringWithFormat:@"DELETE FROM blog"];
        const char *DELETEsql = [strDeleteStmt UTF8String];
        
        if(sqlite3_prepare_v2(selectDatabase, DELETEsql, -1, &deleteStmt, NULL) != SQLITE_OK)
        {
            NSLog(@"Error while delete row preparing statement in tblBookedService. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        if(SQLITE_DONE != sqlite3_step(deleteStmt))
        {
            NSLog(@"Error while deleting into tblBookedService Row. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        sqlite3_reset(deleteStmt);
		
		sqlite3_finalize(deleteStmt);
		deleteStmt = nil;
		sqlite3_close(selectDatabase);
	}
	return YES;
}
-(BOOL)deleteSelectedService8:(DataBO *)objService
{
	sqlite3_stmt *deleteStmt = nil;
	sqlite3 *selectDatabase = nil;
	
	
	if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
	{
 	}
	// Open the database. The database was prepared outside the application.
	
	
	if (sqlite3_open([strDBPath UTF8String], &selectDatabase) == SQLITE_OK)
	{
        
        NSString *strDeleteStmt= [NSString stringWithFormat:@"DELETE FROM literature"];
        const char *DELETEsql = [strDeleteStmt UTF8String];
        
        if(sqlite3_prepare_v2(selectDatabase, DELETEsql, -1, &deleteStmt, NULL) != SQLITE_OK)
        {
            NSLog(@"Error while delete row preparing statement in tblBookedService. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        if(SQLITE_DONE != sqlite3_step(deleteStmt))
        {
            NSLog(@"Error while deleting into tblBookedService Row. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        sqlite3_reset(deleteStmt);
		
		sqlite3_finalize(deleteStmt);
		deleteStmt = nil;
		sqlite3_close(selectDatabase);
	}
	return YES;
}
-(BOOL)ndeleteSelectedService:(DataBO *)nobjService
{
	sqlite3_stmt *deleteStmt = nil;
	sqlite3 *selectDatabase = nil;
	
	
	if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
	{
 	}
	// Open the database. The database was prepared outside the application.
	
	
	if (sqlite3_open([strDBPath UTF8String], &selectDatabase) == SQLITE_OK)
	{
        
        NSString *strDeleteStmt= [NSString stringWithFormat:@"DELETE FROM npolitics"];
        const char *DELETEsql = [strDeleteStmt UTF8String];
        
        if(sqlite3_prepare_v2(selectDatabase, DELETEsql, -1, &deleteStmt, NULL) != SQLITE_OK)
        {
            NSLog(@"Error while delete row preparing statement in tblBookedService. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        if(SQLITE_DONE != sqlite3_step(deleteStmt))
        {
            NSLog(@"Error while deleting into tblBookedService Row. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        sqlite3_reset(deleteStmt);
		
		sqlite3_finalize(deleteStmt);
		deleteStmt = nil;
		sqlite3_close(selectDatabase);
	}
	return YES;
}
-(BOOL)ndeleteSelectedService1:(DataBO *)nobjService1
{
	sqlite3_stmt *deleteStmt = nil;
	sqlite3 *selectDatabase = nil;
	
	
	if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
	{
 	}
	// Open the database. The database was prepared outside the application.
	
	
	if (sqlite3_open([strDBPath UTF8String], &selectDatabase) == SQLITE_OK)
	{
        
        NSString *strDeleteStmt= [NSString stringWithFormat:@"DELETE FROM nsociety"];
        const char *DELETEsql = [strDeleteStmt UTF8String];
        
        if(sqlite3_prepare_v2(selectDatabase, DELETEsql, -1, &deleteStmt, NULL) != SQLITE_OK)
        {
            NSLog(@"Error while delete row preparing statement in tblBookedService. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        if(SQLITE_DONE != sqlite3_step(deleteStmt))
        {
            NSLog(@"Error while deleting into tblBookedService Row. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        sqlite3_reset(deleteStmt);
		
		sqlite3_finalize(deleteStmt);
		deleteStmt = nil;
		sqlite3_close(selectDatabase);
	}
	return YES;
}
-(BOOL)ndeleteSelectedService2:(DataBO *)nobjService2
{
	sqlite3_stmt *deleteStmt = nil;
	sqlite3 *selectDatabase = nil;
	
	
	if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
	{
 	}
	// Open the database. The database was prepared outside the application.
	
	
	if (sqlite3_open([strDBPath UTF8String], &selectDatabase) == SQLITE_OK)
	{
        
        NSString *strDeleteStmt= [NSString stringWithFormat:@"DELETE FROM nbusiness"];
        const char *DELETEsql = [strDeleteStmt UTF8String];
        
        if(sqlite3_prepare_v2(selectDatabase, DELETEsql, -1, &deleteStmt, NULL) != SQLITE_OK)
        {
            NSLog(@"Error while delete row preparing statement in tblBookedService. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        if(SQLITE_DONE != sqlite3_step(deleteStmt))
        {
            NSLog(@"Error while deleting into tblBookedService Row. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        sqlite3_reset(deleteStmt);
		
		sqlite3_finalize(deleteStmt);
		deleteStmt = nil;
		sqlite3_close(selectDatabase);
	}
	return YES;
}
-(BOOL)ndeleteSelectedService3:(DataBO *)nobjService3
{
	sqlite3_stmt *deleteStmt = nil;
	sqlite3 *selectDatabase = nil;
	
	
	if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
	{
 	}
	// Open the database. The database was prepared outside the application.
	
	
	if (sqlite3_open([strDBPath UTF8String], &selectDatabase) == SQLITE_OK)
	{
        
        NSString *strDeleteStmt= [NSString stringWithFormat:@"DELETE FROM nart"];
        const char *DELETEsql = [strDeleteStmt UTF8String];
        
        if(sqlite3_prepare_v2(selectDatabase, DELETEsql, -1, &deleteStmt, NULL) != SQLITE_OK)
        {
            NSLog(@"Error while delete row preparing statement in tblBookedService. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        if(SQLITE_DONE != sqlite3_step(deleteStmt))
        {
            NSLog(@"Error while deleting into tblBookedService Row. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        sqlite3_reset(deleteStmt);
		
		sqlite3_finalize(deleteStmt);
		deleteStmt = nil;
		sqlite3_close(selectDatabase);
	}
	return YES;
}
-(BOOL)ndeleteSelectedService4:(DataBO *)nobjService4
{
	sqlite3_stmt *deleteStmt = nil;
	sqlite3 *selectDatabase = nil;
	
	
	if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
	{
 	}
	// Open the database. The database was prepared outside the application.
	
	
	if (sqlite3_open([strDBPath UTF8String], &selectDatabase) == SQLITE_OK)
	{
        
        NSString *strDeleteStmt= [NSString stringWithFormat:@"DELETE FROM nsports"];
        const char *DELETEsql = [strDeleteStmt UTF8String];
        
        if(sqlite3_prepare_v2(selectDatabase, DELETEsql, -1, &deleteStmt, NULL) != SQLITE_OK)
        {
            NSLog(@"Error while delete row preparing statement in tblBookedService. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        if(SQLITE_DONE != sqlite3_step(deleteStmt))
        {
            NSLog(@"Error while deleting into tblBookedService Row. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        sqlite3_reset(deleteStmt);
		
		sqlite3_finalize(deleteStmt);
		deleteStmt = nil;
		sqlite3_close(selectDatabase);
	}
	return YES;
}
-(BOOL)ndeleteSelectedService5:(DataBO *)nobjService5
{
	sqlite3_stmt *deleteStmt = nil;
	sqlite3 *selectDatabase = nil;
	
	
	if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
	{
 	}
	// Open the database. The database was prepared outside the application.
	
	
	if (sqlite3_open([strDBPath UTF8String], &selectDatabase) == SQLITE_OK)
	{
        
        NSString *strDeleteStmt= [NSString stringWithFormat:@"DELETE FROM nspecial"];
        const char *DELETEsql = [strDeleteStmt UTF8String];
        
        if(sqlite3_prepare_v2(selectDatabase, DELETEsql, -1, &deleteStmt, NULL) != SQLITE_OK)
        {
            NSLog(@"Error while delete row preparing statement in tblBookedService. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        if(SQLITE_DONE != sqlite3_step(deleteStmt))
        {
            NSLog(@"Error while deleting into tblBookedService Row. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        sqlite3_reset(deleteStmt);
		
		sqlite3_finalize(deleteStmt);
		deleteStmt = nil;
		sqlite3_close(selectDatabase);
	}
	return YES;
}
-(BOOL)ndeleteSelectedService6:(DataBO *)nobjService6
{
	sqlite3_stmt *deleteStmt = nil;
	sqlite3 *selectDatabase = nil;
	
	
	if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
	{
 	}
	// Open the database. The database was prepared outside the application.
	
	
	if (sqlite3_open([strDBPath UTF8String], &selectDatabase) == SQLITE_OK)
	{
        
        NSString *strDeleteStmt= [NSString stringWithFormat:@"DELETE FROM nopinion"];
        const char *DELETEsql = [strDeleteStmt UTF8String];
        
        if(sqlite3_prepare_v2(selectDatabase, DELETEsql, -1, &deleteStmt, NULL) != SQLITE_OK)
        {
            NSLog(@"Error while delete row preparing statement in tblBookedService. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        if(SQLITE_DONE != sqlite3_step(deleteStmt))
        {
            NSLog(@"Error while deleting into tblBookedService Row. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        sqlite3_reset(deleteStmt);
		
		sqlite3_finalize(deleteStmt);
		deleteStmt = nil;
		sqlite3_close(selectDatabase);
	}
	return YES;
}
-(BOOL)ndeleteSelectedService7:(DataBO *)nobjService7
{
	sqlite3_stmt *deleteStmt = nil;
	sqlite3 *selectDatabase = nil;
	
	
	if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
	{
 	}
	// Open the database. The database was prepared outside the application.
	
	
	if (sqlite3_open([strDBPath UTF8String], &selectDatabase) == SQLITE_OK)
	{
        
        NSString *strDeleteStmt= [NSString stringWithFormat:@"DELETE FROM nblog"];
        const char *DELETEsql = [strDeleteStmt UTF8String];
        
        if(sqlite3_prepare_v2(selectDatabase, DELETEsql, -1, &deleteStmt, NULL) != SQLITE_OK)
        {
            NSLog(@"Error while delete row preparing statement in tblBookedService. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        if(SQLITE_DONE != sqlite3_step(deleteStmt))
        {
            NSLog(@"Error while deleting into tblBookedService Row. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        sqlite3_reset(deleteStmt);
		
		sqlite3_finalize(deleteStmt);
		deleteStmt = nil;
		sqlite3_close(selectDatabase);
	}
	return YES;
}
-(BOOL)ndeleteSelectedService8:(DataBO *)nobjService8
{
	sqlite3_stmt *deleteStmt = nil;
	sqlite3 *selectDatabase = nil;
	
	
	if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
	{
 	}
	// Open the database. The database was prepared outside the application.
	
	
	if (sqlite3_open([strDBPath UTF8String], &selectDatabase) == SQLITE_OK)
	{
        
        NSString *strDeleteStmt= [NSString stringWithFormat:@"DELETE FROM nliterature"];
        const char *DELETEsql = [strDeleteStmt UTF8String];
        
        if(sqlite3_prepare_v2(selectDatabase, DELETEsql, -1, &deleteStmt, NULL) != SQLITE_OK)
        {
            NSLog(@"Error while delete row preparing statement in tblBookedService. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        if(SQLITE_DONE != sqlite3_step(deleteStmt))
        {
            NSLog(@"Error while deleting into tblBookedService Row. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        sqlite3_reset(deleteStmt);
		
		sqlite3_finalize(deleteStmt);
		deleteStmt = nil;
		sqlite3_close(selectDatabase);
	}
	return YES;
}








@end
