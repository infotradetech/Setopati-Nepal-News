//
//  AppDelegate.m
//  Setopati Nepal News
//
//  Created by InfoTrade Tech on 8/24/14.
//  Copyright (c) 2014 infotradetech. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize strDBPath;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self createEditableCopyOfDatabaseIfNeeded];
    [self initializeDataStructures];
    //[self.window makeKeyAndVisible];
    return YES;
}

-(void)createEditableCopyOfDatabaseIfNeeded
{
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    printf("\n *********paths %lu",(unsigned long)[paths count]);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    printf("\n ********documentsDirectory***** %s",[documentsDirectory UTF8String]);
    
    
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"Setopati.sqlite"];
    
    printf("\n ****writableDBPath*** %s",[writableDBPath UTF8String]);
    
    success = [fileManager fileExistsAtPath:writableDBPath];
    
    if (success)
    {
        return;
    }
    else
    {
        NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Setopati.sqlite"];
        printf("\n defaultDBPath %s",[defaultDBPath UTF8String]);
        success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
    }
    
    if (!success)
    {
        NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
    }
    else
    {
        printf("\n Database Successfully Copied");
    }
}

-(void)initializeDataStructures
{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"Setopati.sqlite"];
    
    if (sqlite3_open([path UTF8String], &database) == SQLITE_OK)
    {
        printf("\n Database Successfully Created");
    }
    else
    {
        sqlite3_close(database);
        NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
    }
}

-(NSMutableArray *)getSetopatisList;
{
	NSMutableArray *setopatiList = [[NSMutableArray alloc]init];
    sqlite3_stmt* getStatement;
	
    const char* sql = "select * from politics order by rowid asc limit 9";
	if (sqlite3_prepare_v2(database, sql, -1, &getStatement, NULL) != SQLITE_OK)
    {
        NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
    }
	if (sqlite3_step(getStatement) == SQLITE_ERROR)
    {
        NSAssert1(0, @"Error: failed to insert into the database with message '%s'.", sqlite3_errmsg(database));
		//return NO;
    }
    else{
        
        do {
            
            Setopati *stdObj = [[Setopati alloc]init];
            
            stdObj.row_id=sqlite3_column_int(getStatement, 0);
            printf("Setopati row_id is %d",sqlite3_column_int(getStatement, 0));
            
            stdObj.title = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 1)];
            printf("\nSetopati Title is %s",[stdObj.title
                                             UTF8String]);
            
            stdObj.mixed_intro = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 2)];
            printf("\nSetopati mixed_intro is %s",[stdObj.mixed_intro UTF8String]);
            
            stdObj.body = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 3)];
            printf("\nSetopati Body is %s",[stdObj.body UTF8String]);
            stdObj.image = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 4)];
            printf("\nSetopati image is %s",[stdObj.place UTF8String]);
            stdObj.place = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 5)];
            printf("\nSetopati Place is %s",[stdObj.place UTF8String]);
            
            [setopatiList addObject:stdObj];
            
            //  [stdObj release];
            
        }
        while (sqlite3_step(getStatement) == SQLITE_ROW);
        printf("Successfully retrieved data from database");
    }
	
    sqlite3_finalize(getStatement);
    
    return setopatiList;
}
-(NSMutableArray *)getSetopatisList1;
{
	NSMutableArray *setopatiList1 = [[NSMutableArray alloc]init];
    sqlite3_stmt* getStatement;
	
    const char* sql = "select * from society order by rowid asc limit 9";
	if (sqlite3_prepare_v2(database, sql, -1, &getStatement, NULL) != SQLITE_OK)
    {
        NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
    }
	if (sqlite3_step(getStatement) == SQLITE_ERROR)
    {
        NSAssert1(0, @"Error: failed to insert into the database with message '%s'.", sqlite3_errmsg(database));
		//return NO;
    }
    else{
        
        do {
            
            Setopati *stdObj = [[Setopati alloc]init];
            
            stdObj.row_id=sqlite3_column_int(getStatement, 0);
            printf("Setopati row_id is %d",sqlite3_column_int(getStatement, 0));
            
            stdObj.title = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 1)];
            printf("\nSetopati Title is %s",[stdObj.title
                                             UTF8String]);
            
            stdObj.mixed_intro = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 2)];
            printf("\nSetopati mixed_intro is %s",[stdObj.mixed_intro UTF8String]);
            
            stdObj.body = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 3)];
            printf("\nSetopati Body is %s",[stdObj.body UTF8String]);
            stdObj.image = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 4)];
            printf("\nSetopati image is %s",[stdObj.place UTF8String]);
            stdObj.place = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 5)];
            printf("\nSetopati Place is %s",[stdObj.place UTF8String]);            [setopatiList1 addObject:stdObj];
            
            //  [stdObj release];
            
        }
        while (sqlite3_step(getStatement) == SQLITE_ROW);
        printf("Successfully retrieved data from database");
    }
	
    sqlite3_finalize(getStatement);
    
    return setopatiList1;
}
-(NSMutableArray *)getSetopatisList2;
{
	NSMutableArray *setopatiList2 = [[NSMutableArray alloc]init];
    sqlite3_stmt* getStatement;
	
    const char* sql = "select * from business order by rowid asc limit 9";
	if (sqlite3_prepare_v2(database, sql, -1, &getStatement, NULL) != SQLITE_OK)
    {
        NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
    }
	if (sqlite3_step(getStatement) == SQLITE_ERROR)
    {
        NSAssert1(0, @"Error: failed to insert into the database with message '%s'.", sqlite3_errmsg(database));
		//return NO;
    }
    else{
        
        do {
            
            Setopati *stdObj = [[Setopati alloc]init];
            
            stdObj.row_id=sqlite3_column_int(getStatement, 0);
            printf("Setopati row_id is %d",sqlite3_column_int(getStatement, 0));
            
            stdObj.title = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 1)];
            printf("\nSetopati Title is %s",[stdObj.title
                                             UTF8String]);
            
            stdObj.mixed_intro = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 2)];
            printf("\nSetopati mixed_intro is %s",[stdObj.mixed_intro UTF8String]);
            
            stdObj.body = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 3)];
            printf("\nSetopati Body is %s",[stdObj.body UTF8String]);
            stdObj.image = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 4)];
            printf("\nSetopati image is %s",[stdObj.place UTF8String]);
            stdObj.place = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 5)];
            printf("\nSetopati Place is %s",[stdObj.place UTF8String]);
            
            [setopatiList2 addObject:stdObj];
            
            //  [stdObj release];
            
        }
        while (sqlite3_step(getStatement) == SQLITE_ROW);
        printf("Successfully retrieved data from database");
    }
	
    sqlite3_finalize(getStatement);
    
    return setopatiList2;
}
-(NSMutableArray *)getSetopatisList3;
{
	NSMutableArray *setopatiList3 = [[NSMutableArray alloc]init];
    sqlite3_stmt* getStatement;
	
    const char* sql = "select * from art order by rowid asc limit 9";
	if (sqlite3_prepare_v2(database, sql, -1, &getStatement, NULL) != SQLITE_OK)
    {
        NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
    }
	if (sqlite3_step(getStatement) == SQLITE_ERROR)
    {
        NSAssert1(0, @"Error: failed to insert into the database with message '%s'.", sqlite3_errmsg(database));
		//return NO;
    }
    else{
        
        do {
            
            Setopati *stdObj = [[Setopati alloc]init];
            
            stdObj.row_id=sqlite3_column_int(getStatement, 0);
            printf("Setopati row_id is %d",sqlite3_column_int(getStatement, 0));
            
            stdObj.title = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 1)];
            printf("\nSetopati Title is %s",[stdObj.title
                                             UTF8String]);
            
            stdObj.mixed_intro = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 2)];
            printf("\nSetopati mixed_intro is %s",[stdObj.mixed_intro UTF8String]);
            
            stdObj.body = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 3)];
            printf("\nSetopati Body is %s",[stdObj.body UTF8String]);
            stdObj.image = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 4)];
            printf("\nSetopati image is %s",[stdObj.place UTF8String]);
            stdObj.place = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 5)];
            printf("\nSetopati Place is %s",[stdObj.place UTF8String]);
            
            [setopatiList3 addObject:stdObj];
            
            //  [stdObj release];
            
        }
        while (sqlite3_step(getStatement) == SQLITE_ROW);
        printf("Successfully retrieved data from database");
    }
	
    sqlite3_finalize(getStatement);
    
    return setopatiList3;
}
-(NSMutableArray *)getSetopatisList4;
{
	NSMutableArray *setopatiList4 = [[NSMutableArray alloc]init];
    sqlite3_stmt* getStatement;
	
    const char* sql = "select * from sports order by rowid asc limit 9";
	if (sqlite3_prepare_v2(database, sql, -1, &getStatement, NULL) != SQLITE_OK)
    {
        NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
    }
	if (sqlite3_step(getStatement) == SQLITE_ERROR)
    {
        NSAssert1(0, @"Error: failed to insert into the database with message '%s'.", sqlite3_errmsg(database));
		//return NO;
    }
    else{
        
        do {
            
            Setopati *stdObj = [[Setopati alloc]init];
            
            stdObj.row_id=sqlite3_column_int(getStatement, 0);
            printf("Setopati row_id is %d",sqlite3_column_int(getStatement, 0));
            
            stdObj.title = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 1)];
            printf("\nSetopati Title is %s",[stdObj.title
                                             UTF8String]);
            
            stdObj.mixed_intro = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 2)];
            printf("\nSetopati mixed_intro is %s",[stdObj.mixed_intro UTF8String]);
            
            stdObj.body = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 3)];
            printf("\nSetopati Body is %s",[stdObj.body UTF8String]);
            stdObj.image = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 4)];
            printf("\nSetopati image is %s",[stdObj.place UTF8String]);
            stdObj.place = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 5)];
            printf("\nSetopati Place is %s",[stdObj.place UTF8String]);
            
            [setopatiList4 addObject:stdObj];
            
            //  [stdObj release];
            
        }
        while (sqlite3_step(getStatement) == SQLITE_ROW);
        printf("Successfully retrieved data from database");
    }
	
    sqlite3_finalize(getStatement);
    
    return setopatiList4;
}
-(NSMutableArray *)getSetopatisList5;
{
	NSMutableArray *setopatiList5 = [[NSMutableArray alloc]init];
    sqlite3_stmt* getStatement;
	
    const char* sql = "select * from special order by rowid asc limit 9";
	if (sqlite3_prepare_v2(database, sql, -1, &getStatement, NULL) != SQLITE_OK)
    {
        NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
    }
	if (sqlite3_step(getStatement) == SQLITE_ERROR)
    {
        NSAssert1(0, @"Error: failed to insert into the database with message '%s'.", sqlite3_errmsg(database));
		//return NO;
    }
    else{
        
        do {
            
            Setopati *stdObj = [[Setopati alloc]init];
            
            stdObj.row_id=sqlite3_column_int(getStatement, 0);
            printf("Setopati row_id is %d",sqlite3_column_int(getStatement, 0));
            
            stdObj.title = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 1)];
            printf("\nSetopati Title is %s",[stdObj.title
                                             UTF8String]);
            
            stdObj.mixed_intro = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 2)];
            printf("\nSetopati mixed_intro is %s",[stdObj.mixed_intro UTF8String]);
            
            stdObj.body = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 3)];
            printf("\nSetopati Body is %s",[stdObj.body UTF8String]);
            stdObj.image = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 4)];
            printf("\nSetopati image is %s",[stdObj.place UTF8String]);
            stdObj.place = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 5)];
            printf("\nSetopati Place is %s",[stdObj.place UTF8String]);
            
            [setopatiList5 addObject:stdObj];
            
            //  [stdObj release];
            
        }
        while (sqlite3_step(getStatement) == SQLITE_ROW);
        printf("Successfully retrieved data from database");
    }
	
    sqlite3_finalize(getStatement);
    
    return setopatiList5;
}
-(NSMutableArray *)getSetopatisList6;
{
	NSMutableArray *setopatiList6 = [[NSMutableArray alloc]init];
    sqlite3_stmt* getStatement;
	
    const char* sql = "select * from opinion order by rowid asc limit 9";
	if (sqlite3_prepare_v2(database, sql, -1, &getStatement, NULL) != SQLITE_OK)
    {
        NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
    }
	if (sqlite3_step(getStatement) == SQLITE_ERROR)
    {
        NSAssert1(0, @"Error: failed to insert into the database with message '%s'.", sqlite3_errmsg(database));
		//return NO;
    }
    else{
        
        do {
            
            Setopati *stdObj = [[Setopati alloc]init];
            
            stdObj.row_id=sqlite3_column_int(getStatement, 0);
            printf("Setopati row_id is %d",sqlite3_column_int(getStatement, 0));
            
            stdObj.title = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 1)];
            printf("\nSetopati Title is %s",[stdObj.title
                                             UTF8String]);
            
            stdObj.mixed_intro = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 2)];
            printf("\nSetopati mixed_intro is %s",[stdObj.mixed_intro UTF8String]);
            
            stdObj.body = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 3)];
            printf("\nSetopati Body is %s",[stdObj.body UTF8String]);
            stdObj.image = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 4)];
            printf("\nSetopati image is %s",[stdObj.place UTF8String]);
            stdObj.place = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 5)];
            printf("\nSetopati Place is %s",[stdObj.place UTF8String]);
            
            [setopatiList6 addObject:stdObj];
            
            //  [stdObj release];
            
        }
        while (sqlite3_step(getStatement) == SQLITE_ROW);
        printf("Successfully retrieved data from database");
    }
	
    sqlite3_finalize(getStatement);
    
    return setopatiList6;
}
-(NSMutableArray *)getSetopatisList7;
{
	NSMutableArray *setopatiList7 = [[NSMutableArray alloc]init];
    sqlite3_stmt* getStatement;
	
    const char* sql = "select * from blog order by rowid asc limit 9";
	if (sqlite3_prepare_v2(database, sql, -1, &getStatement, NULL) != SQLITE_OK)
    {
        NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
    }
	if (sqlite3_step(getStatement) == SQLITE_ERROR)
    {
        NSAssert1(0, @"Error: failed to insert into the database with message '%s'.", sqlite3_errmsg(database));
		//return NO;
    }
    else{
        
        do {
            
            Setopati *stdObj = [[Setopati alloc]init];
            
            stdObj.row_id=sqlite3_column_int(getStatement, 0);
            printf("Setopati row_id is %d",sqlite3_column_int(getStatement, 0));
            
            stdObj.title = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 1)];
            printf("\nSetopati Title is %s",[stdObj.title
                                             UTF8String]);
            
            stdObj.mixed_intro = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 2)];
            printf("\nSetopati mixed_intro is %s",[stdObj.mixed_intro UTF8String]);
            
            stdObj.body = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 3)];
            printf("\nSetopati Body is %s",[stdObj.body UTF8String]);
            stdObj.image = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 4)];
            printf("\nSetopati image is %s",[stdObj.place UTF8String]);
            stdObj.place = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 5)];
            printf("\nSetopati Place is %s",[stdObj.place UTF8String]);
            
            [setopatiList7 addObject:stdObj];
            
            //  [stdObj release];
            
        }
        while (sqlite3_step(getStatement) == SQLITE_ROW);
        printf("Successfully retrieved data from database");
    }
	
    sqlite3_finalize(getStatement);
    
    return setopatiList7;
}
-(NSMutableArray *)getSetopatisList8;
{
	NSMutableArray *setopatiList8 = [[NSMutableArray alloc]init];
    sqlite3_stmt* getStatement;
	
    const char* sql = "select * from literature order by rowid asc limit 9";
	if (sqlite3_prepare_v2(database, sql, -1, &getStatement, NULL) != SQLITE_OK)
    {
        NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
    }
	if (sqlite3_step(getStatement) == SQLITE_ERROR)
    {
        NSAssert1(0, @"Error: failed to insert into the database with message '%s'.", sqlite3_errmsg(database));
		//return NO;
    }
    else{
        
        do {
            
            Setopati *stdObj = [[Setopati alloc]init];
            
            stdObj.row_id=sqlite3_column_int(getStatement, 0);
            printf("Setopati row_id is %d",sqlite3_column_int(getStatement, 0));
            
            stdObj.title = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 1)];
            printf("\nSetopati Title is %s",[stdObj.title
                                             UTF8String]);
            
            stdObj.mixed_intro = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 2)];
            printf("\nSetopati mixed_intro is %s",[stdObj.mixed_intro UTF8String]);
            
            stdObj.body = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 3)];
            printf("\nSetopati Body is %s",[stdObj.body UTF8String]);
            stdObj.image = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 4)];
            printf("\nSetopati image is %s",[stdObj.place UTF8String]);
            stdObj.place = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 5)];
            printf("\nSetopati Place is %s",[stdObj.place UTF8String]);
            
            [setopatiList8 addObject:stdObj];
            
            //  [stdObj release];
            
        }
        while (sqlite3_step(getStatement) == SQLITE_ROW);
        printf("Successfully retrieved data from database");
    }
	
    sqlite3_finalize(getStatement);
    
    return setopatiList8;
}

-(NSMutableArray *)ngetSetopatisList;
{
	NSMutableArray *nsetopatiList = [[NSMutableArray alloc]init];
    sqlite3_stmt* getStatement;
	
    const char* sql = "select * from npolitics order by rowid asc limit 9";
	if (sqlite3_prepare_v2(database, sql, -1, &getStatement, NULL) != SQLITE_OK)
    {
        NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
    }
	if (sqlite3_step(getStatement) == SQLITE_ERROR)
    {
        NSAssert1(0, @"Error: failed to insert into the database with message '%s'.", sqlite3_errmsg(database));
		//return NO;
    }
    else{
        
        do {
            
            Setopati *stdObj = [[Setopati alloc]init];
            
            stdObj.row_id=sqlite3_column_int(getStatement, 0);
            printf("Setopati row_id is %d",sqlite3_column_int(getStatement, 0));
            
            stdObj.title = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 1)];
            printf("\nSetopati Title is %s",[stdObj.title
                                             UTF8String]);
            
            stdObj.mixed_intro = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 2)];
            printf("\nSetopati mixed_intro is %s",[stdObj.mixed_intro UTF8String]);
            
            stdObj.body = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 3)];
            printf("\nSetopati Body is %s",[stdObj.body UTF8String]);
            stdObj.image = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 4)];
            printf("\nSetopati image is %s",[stdObj.place UTF8String]);
            stdObj.place = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 5)];
            printf("\nSetopati Place is %s",[stdObj.place UTF8String]);
            
            [nsetopatiList addObject:stdObj];
            
            //  [stdObj release];
            
        }
        while (sqlite3_step(getStatement) == SQLITE_ROW);
        printf("Successfully retrieved data from database");
    }
	
    sqlite3_finalize(getStatement);
    
    return nsetopatiList;
}
-(NSMutableArray *)ngetSetopatisList1;
{
	NSMutableArray *nsetopatiList1 = [[NSMutableArray alloc]init];
    sqlite3_stmt* getStatement;
	
    const char* sql = "select * from nsociety order by rowid asc limit 9";
	if (sqlite3_prepare_v2(database, sql, -1, &getStatement, NULL) != SQLITE_OK)
    {
        NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
    }
	if (sqlite3_step(getStatement) == SQLITE_ERROR)
    {
        NSAssert1(0, @"Error: failed to insert into the database with message '%s'.", sqlite3_errmsg(database));
		//return NO;
    }
    else{
        
        do {
            
            Setopati *stdObj = [[Setopati alloc]init];
            
            stdObj.row_id=sqlite3_column_int(getStatement, 0);
            printf("Setopati row_id is %d",sqlite3_column_int(getStatement, 0));
            
            stdObj.title = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 1)];
            printf("\nSetopati Title is %s",[stdObj.title
                                             UTF8String]);
            
            stdObj.mixed_intro = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 2)];
            printf("\nSetopati mixed_intro is %s",[stdObj.mixed_intro UTF8String]);
            
            stdObj.body = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 3)];
            printf("\nSetopati Body is %s",[stdObj.body UTF8String]);
            stdObj.image = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 4)];
            printf("\nSetopati image is %s",[stdObj.place UTF8String]);
            stdObj.place = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 5)];
            printf("\nSetopati Place is %s",[stdObj.place UTF8String]);
            
            [nsetopatiList1 addObject:stdObj];
            
            //  [stdObj release];
            
        }
        while (sqlite3_step(getStatement) == SQLITE_ROW);
        printf("Successfully retrieved data from database");
    }
	
    sqlite3_finalize(getStatement);
    
    return nsetopatiList1;
}
-(NSMutableArray *)ngetSetopatisList2;
{
	NSMutableArray *nsetopatiList2 = [[NSMutableArray alloc]init];
    sqlite3_stmt* getStatement;
	
    const char* sql = "select * from nbusiness order by rowid asc limit 9";
	if (sqlite3_prepare_v2(database, sql, -1, &getStatement, NULL) != SQLITE_OK)
    {
        NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
    }
	if (sqlite3_step(getStatement) == SQLITE_ERROR)
    {
        NSAssert1(0, @"Error: failed to insert into the database with message '%s'.", sqlite3_errmsg(database));
		//return NO;
    }
    else{
        
        do {
            
            Setopati *stdObj = [[Setopati alloc]init];
            
            stdObj.row_id=sqlite3_column_int(getStatement, 0);
            printf("Setopati row_id is %d",sqlite3_column_int(getStatement, 0));
            
            stdObj.title = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 1)];
            printf("\nSetopati Title is %s",[stdObj.title
                                             UTF8String]);
            
            stdObj.mixed_intro = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 2)];
            printf("\nSetopati mixed_intro is %s",[stdObj.mixed_intro UTF8String]);
            
            stdObj.body = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 3)];
            printf("\nSetopati Body is %s",[stdObj.body UTF8String]);
            stdObj.image = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 4)];
            printf("\nSetopati image is %s",[stdObj.place UTF8String]);
            stdObj.place = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 5)];
            printf("\nSetopati Place is %s",[stdObj.place UTF8String]);
            
            [nsetopatiList2 addObject:stdObj];
            
            //  [stdObj release];
            
        }
        while (sqlite3_step(getStatement) == SQLITE_ROW);
        printf("Successfully retrieved data from database");
    }
	
    sqlite3_finalize(getStatement);
    
    return nsetopatiList2;
}
-(NSMutableArray *)ngetSetopatisList3;
{
	NSMutableArray *nsetopatiList3 = [[NSMutableArray alloc]init];
    sqlite3_stmt* getStatement;
	
    const char* sql = "select * from nart order by rowid asc limit 9";
	if (sqlite3_prepare_v2(database, sql, -1, &getStatement, NULL) != SQLITE_OK)
    {
        NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
    }
	if (sqlite3_step(getStatement) == SQLITE_ERROR)
    {
        NSAssert1(0, @"Error: failed to insert into the database with message '%s'.", sqlite3_errmsg(database));
		//return NO;
    }
    else{
        
        do {
            
            Setopati *stdObj = [[Setopati alloc]init];
            
            stdObj.row_id=sqlite3_column_int(getStatement, 0);
            printf("Setopati row_id is %d",sqlite3_column_int(getStatement, 0));
            
            stdObj.title = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 1)];
            printf("\nSetopati Title is %s",[stdObj.title
                                             UTF8String]);
            
            stdObj.mixed_intro = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 2)];
            printf("\nSetopati mixed_intro is %s",[stdObj.mixed_intro UTF8String]);
            
            stdObj.body = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 3)];
            printf("\nSetopati Body is %s",[stdObj.body UTF8String]);
            stdObj.image = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 4)];
            printf("\nSetopati image is %s",[stdObj.place UTF8String]);
            stdObj.place = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 5)];
            printf("\nSetopati Place is %s",[stdObj.place UTF8String]);
            [nsetopatiList3 addObject:stdObj];
            
            //  [stdObj release];
            
        }
        while (sqlite3_step(getStatement) == SQLITE_ROW);
        printf("Successfully retrieved data from database");
    }
	
    sqlite3_finalize(getStatement);
    
    return nsetopatiList3;
}
-(NSMutableArray *)ngetSetopatisList4;
{
	NSMutableArray *nsetopatiList4 = [[NSMutableArray alloc]init];
    sqlite3_stmt* getStatement;
	
    const char* sql = "select * from nsports order by rowid asc limit 9";
	if (sqlite3_prepare_v2(database, sql, -1, &getStatement, NULL) != SQLITE_OK)
    {
        NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
    }
	if (sqlite3_step(getStatement) == SQLITE_ERROR)
    {
        NSAssert1(0, @"Error: failed to insert into the database with message '%s'.", sqlite3_errmsg(database));
		//return NO;
    }
    else{
        
        do {
            
            Setopati *stdObj = [[Setopati alloc]init];
            
            stdObj.row_id=sqlite3_column_int(getStatement, 0);
            printf("Setopati row_id is %d",sqlite3_column_int(getStatement, 0));
            
            stdObj.title = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 1)];
            printf("\nSetopati Title is %s",[stdObj.title
                                             UTF8String]);
            
            stdObj.mixed_intro = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 2)];
            printf("\nSetopati mixed_intro is %s",[stdObj.mixed_intro UTF8String]);
            
            stdObj.body = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 3)];
            printf("\nSetopati Body is %s",[stdObj.body UTF8String]);
            stdObj.image = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 4)];
            printf("\nSetopati image is %s",[stdObj.place UTF8String]);
            stdObj.place = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 5)];
            printf("\nSetopati Place is %s",[stdObj.place UTF8String]);
            
            [nsetopatiList4 addObject:stdObj];
            
            //  [stdObj release];
            
        }
        while (sqlite3_step(getStatement) == SQLITE_ROW);
        printf("Successfully retrieved data from database");
    }
	
    sqlite3_finalize(getStatement);
    
    return nsetopatiList4;
}
-(NSMutableArray *)ngetSetopatisList5;
{
	NSMutableArray *nsetopatiList5 = [[NSMutableArray alloc]init];
    sqlite3_stmt* getStatement;
	
    const char* sql = "select * from nspecial order by rowid asc limit 9";
	if (sqlite3_prepare_v2(database, sql, -1, &getStatement, NULL) != SQLITE_OK)
    {
        NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
    }
	if (sqlite3_step(getStatement) == SQLITE_ERROR)
    {
        NSAssert1(0, @"Error: failed to insert into the database with message '%s'.", sqlite3_errmsg(database));
		//return NO;
    }
    else{
        
        do {
            
            Setopati *stdObj = [[Setopati alloc]init];
            
            stdObj.row_id=sqlite3_column_int(getStatement, 0);
            printf("Setopati row_id is %d",sqlite3_column_int(getStatement, 0));
            
            stdObj.title = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 1)];
            printf("\nSetopati Title is %s",[stdObj.title
                                             UTF8String]);
            
            stdObj.mixed_intro = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 2)];
            printf("\nSetopati mixed_intro is %s",[stdObj.mixed_intro UTF8String]);
            
            stdObj.body = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 3)];
            printf("\nSetopati Body is %s",[stdObj.body UTF8String]);
            stdObj.image = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 4)];
            printf("\nSetopati image is %s",[stdObj.place UTF8String]);
            stdObj.place = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 5)];
            printf("\nSetopati Place is %s",[stdObj.place UTF8String]);
            [nsetopatiList5 addObject:stdObj];
            
            //  [stdObj release];
            
        }
        while (sqlite3_step(getStatement) == SQLITE_ROW);
        printf("Successfully retrieved data from database");
    }
	
    sqlite3_finalize(getStatement);
    
    return nsetopatiList5;
}
-(NSMutableArray *)ngetSetopatisList6;
{
	NSMutableArray *nsetopatiList6 = [[NSMutableArray alloc]init];
    sqlite3_stmt* getStatement;
	
    const char* sql = "select * from nopinion order by rowid asc limit 9";
	if (sqlite3_prepare_v2(database, sql, -1, &getStatement, NULL) != SQLITE_OK)
    {
        NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
    }
	if (sqlite3_step(getStatement) == SQLITE_ERROR)
    {
        NSAssert1(0, @"Error: failed to insert into the database with message '%s'.", sqlite3_errmsg(database));
		//return NO;
    }
    else{
        
        do {
            
            Setopati *stdObj = [[Setopati alloc]init];
            
            stdObj.row_id=sqlite3_column_int(getStatement, 0);
            printf("Setopati row_id is %d",sqlite3_column_int(getStatement, 0));
            
            stdObj.title = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 1)];
            printf("\nSetopati Title is %s",[stdObj.title
                                             UTF8String]);
            
            stdObj.mixed_intro = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 2)];
            printf("\nSetopati mixed_intro is %s",[stdObj.mixed_intro UTF8String]);
            
            stdObj.body = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 3)];
            printf("\nSetopati Body is %s",[stdObj.body UTF8String]);
            stdObj.image = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 4)];
            printf("\nSetopati image is %s",[stdObj.place UTF8String]);
            stdObj.place = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 5)];
            printf("\nSetopati Place is %s",[stdObj.place UTF8String]);
            
            [nsetopatiList6 addObject:stdObj];
            
            //  [stdObj release];
            
        }
        while (sqlite3_step(getStatement) == SQLITE_ROW);
        printf("Successfully retrieved data from database");
    }
	
    sqlite3_finalize(getStatement);
    
    return nsetopatiList6;
}
-(NSMutableArray *)ngetSetopatisList7;
{
	NSMutableArray *nsetopatiList7 = [[NSMutableArray alloc]init];
    sqlite3_stmt* getStatement;
	
    const char* sql = "select * from nblog order by rowid asc limit 9";
	if (sqlite3_prepare_v2(database, sql, -1, &getStatement, NULL) != SQLITE_OK)
    {
        NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
    }
	if (sqlite3_step(getStatement) == SQLITE_ERROR)
    {
        NSAssert1(0, @"Error: failed to insert into the database with message '%s'.", sqlite3_errmsg(database));
		//return NO;
    }
    else{
        
        do {
            
            Setopati *stdObj = [[Setopati alloc]init];
            
            stdObj.row_id=sqlite3_column_int(getStatement, 0);
            printf("Setopati row_id is %d",sqlite3_column_int(getStatement, 0));
            
            stdObj.title = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 1)];
            printf("\nSetopati Title is %s",[stdObj.title
                                             UTF8String]);
            
            stdObj.mixed_intro = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 2)];
            printf("\nSetopati mixed_intro is %s",[stdObj.mixed_intro UTF8String]);
            
            stdObj.body = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 3)];
            printf("\nSetopati Body is %s",[stdObj.body UTF8String]);
            stdObj.image = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 4)];
            printf("\nSetopati image is %s",[stdObj.place UTF8String]);
            stdObj.place = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 5)];
            printf("\nSetopati Place is %s",[stdObj.place UTF8String]);
            [nsetopatiList7 addObject:stdObj];
            
            //  [stdObj release];
            
        }
        while (sqlite3_step(getStatement) == SQLITE_ROW);
        printf("Successfully retrieved data from database");
    }
	
    sqlite3_finalize(getStatement);
    
    return nsetopatiList7;
}
-(NSMutableArray *)ngetSetopatisList8;
{
	NSMutableArray *nsetopatiList8 = [[NSMutableArray alloc]init];
    sqlite3_stmt* getStatement;
	
    const char* sql = "select * from nliterature order by rowid asc limit 9";
	if (sqlite3_prepare_v2(database, sql, -1, &getStatement, NULL) != SQLITE_OK)
    {
        NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
    }
	if (sqlite3_step(getStatement) == SQLITE_ERROR)
    {
        NSAssert1(0, @"Error: failed to insert into the database with message '%s'.", sqlite3_errmsg(database));
		//return NO;
    }
    else{
        
        do {
            
            Setopati *stdObj = [[Setopati alloc]init];
            
            stdObj.row_id=sqlite3_column_int(getStatement, 0);
            printf("Setopati row_id is %d",sqlite3_column_int(getStatement, 0));
            
            stdObj.title = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 1)];
            printf("\nSetopati Title is %s",[stdObj.title
                                             UTF8String]);
            
            stdObj.mixed_intro = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 2)];
            printf("\nSetopati mixed_intro is %s",[stdObj.mixed_intro UTF8String]);
            
            stdObj.body = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 3)];
            printf("\nSetopati Body is %s",[stdObj.body UTF8String]);
            stdObj.image = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 4)];
            printf("\nSetopati image is %s",[stdObj.place UTF8String]);
            stdObj.place = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 5)];
            printf("\nSetopati Place is %s",[stdObj.place UTF8String]);
            [nsetopatiList8 addObject:stdObj];
            
            //  [stdObj release];
            
        }
        while (sqlite3_step(getStatement) == SQLITE_ROW);
        printf("Successfully retrieved data from database");
    }
	
    sqlite3_finalize(getStatement);
    
    return nsetopatiList8;
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
