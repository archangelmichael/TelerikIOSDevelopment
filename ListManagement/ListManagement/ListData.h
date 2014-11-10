//
//  ListData.h
//  ListManagement
//
//  Created by Admin on 11/2/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "List.h"
#import "Note.h"

@interface ListData : NSObject

-(instancetype)init;
-(instancetype)initWithLists:(NSArray *)lists;

+(instancetype)listData;
+(instancetype)listDataWithLists:(NSArray *)lists;

-(NSInteger)getListsCount;

-(void)addList:(List*)list;

-(List*)getListByIndex:(NSInteger)index;

-(void)removeList:(List*)list;

-(void)removeListByIndex:(NSInteger)index;

-(NSArray*)getAllLists;

@end
