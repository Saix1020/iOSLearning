//
//  MockData.h
//  MyWorxTasks
//
//  Created by saix on 16/1/14.
//  Copyright © 2016年 citrix. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MockData : NSObject

+(NSArray*)MockDataForAllTasks;

+(NSDictionary*)MockDataForCompletedTasks;

+(NSDictionary*)MockDataForDeletedTasks;

@end
