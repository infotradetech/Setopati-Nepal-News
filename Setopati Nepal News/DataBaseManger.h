//
//  DataBaseManger.h
//  sampleDataBase
//
//  Created by Connexun on 26/07/14.
//  Copyright (c) 2014 connexun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataBO.h"
#import <sqlite3.h>



@interface DataBaseManger : NSObject

@property (strong, nonatomic)NSString *strDBPath;

-(BOOL)addServiceToDataBase:(NSMutableArray *)arrData;
-(BOOL)addServiceToDataBase1:(NSMutableArray *)arrData1;
-(BOOL)addServiceToDataBase2:(NSMutableArray *)arrData2;
-(BOOL)addServiceToDataBase3:(NSMutableArray *)arrData3;
-(BOOL)addServiceToDataBase4:(NSMutableArray *)arrData4;
-(BOOL)addServiceToDataBase5:(NSMutableArray *)arrData5;
-(BOOL)addServiceToDataBase6:(NSMutableArray *)arrData6;
-(BOOL)addServiceToDataBase7:(NSMutableArray *)arrData7;
-(BOOL)addServiceToDataBase8:(NSMutableArray *)arrData8;
//-(NSMutableArray *)getAllBookedServices;
-(BOOL)naddServiceToDataBase:(NSMutableArray *)narrData;
-(BOOL)naddServiceToDataBase1:(NSMutableArray *)narrData1;
-(BOOL)naddServiceToDataBase2:(NSMutableArray *)narrData2;
-(BOOL)naddServiceToDataBase3:(NSMutableArray *)narrData3;
-(BOOL)naddServiceToDataBase4:(NSMutableArray *)narrData4;
-(BOOL)naddServiceToDataBase5:(NSMutableArray *)narrData5;
-(BOOL)naddServiceToDataBase6:(NSMutableArray *)narrData6;
-(BOOL)naddServiceToDataBase7:(NSMutableArray *)narrData7;
-(BOOL)naddServiceToDataBase8:(NSMutableArray *)narrData8;

//-(BOOL)SelectedService:(NSMutableArray *)getAllBookedServices;
-(BOOL)deleteSelectedService:(DataBO *)objService;
-(BOOL)deleteSelectedService1:(DataBO *)objService;
-(BOOL)deleteSelectedService2:(DataBO *)objService;
-(BOOL)deleteSelectedService3:(DataBO *)objService;
-(BOOL)deleteSelectedService4:(DataBO *)objService;
-(BOOL)deleteSelectedService5:(DataBO *)objService;
-(BOOL)deleteSelectedService6:(DataBO *)objService;
-(BOOL)deleteSelectedService7:(DataBO *)objService;
-(BOOL)deleteSelectedService8:(DataBO *)objService;

//-(BOOL)ndeleteSelectedService:(DataBO *)nobjService;
-(BOOL)ndeleteSelectedService:(DataBO *)nobjService;
-(BOOL)ndeleteSelectedService1:(DataBO *)nobjService1;
-(BOOL)ndeleteSelectedService2:(DataBO *)nobjService2;
-(BOOL)ndeleteSelectedService3:(DataBO *)nobjService3;
-(BOOL)ndeleteSelectedService4:(DataBO *)nobjService4;
-(BOOL)ndeleteSelectedService5:(DataBO *)nobjService5;
-(BOOL)ndeleteSelectedService6:(DataBO *)nobjService6;
-(BOOL)ndeleteSelectedService7:(DataBO *)nobjService7;
-(BOOL)ndeleteSelectedService8:(DataBO *)nobjService8;
@end
