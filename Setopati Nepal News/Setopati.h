//
//  Setopati.h
//  Setopati News App
//
//  Created by InfoTrade Tech on 7/21/14.
//  Copyright (c) 2014 infotradetech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Setopati : NSObject
{
    NSInteger row_id;
    NSString *title,*place,*body,*data;
}
@property(strong, nonatomic) NSString *title, *place, *body,*data,*mixed_intro,*image;
@property(nonatomic) NSInteger row_id;
@end


