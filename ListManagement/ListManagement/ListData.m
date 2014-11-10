//
//  ListData.m
//  ListManagement
//
//  Created by Admin on 11/2/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "ListData.h"

@implementation ListData {
    NSMutableArray *listsData;
}

-(instancetype)init {
    return [self initWithLists:nil];
}
-(instancetype)initWithLists: (NSArray *)lists {
    self = [super init];
    if (self != nil) {
        listsData = [[NSMutableArray alloc] init];
        if (lists != nil) {
            [listsData addObjectsFromArray:listsData];
        }
    }
    
    return self;
}

+(instancetype)listData {
    return [[ListData alloc] initWithLists:nil];
}
+(instancetype)listDataWithLists: (NSArray *)lists {
    return [[ListData alloc] initWithLists:lists];
}

-(NSInteger)getListsCount{
    return listsData.count;
}

-(List*)getListByIndex:(NSInteger)index{
    if (index < 0 || index >= listsData.count) {
        return nil;
    }
    return listsData[index];
}

-(void)addList:(List*)list{
    [listsData addObject:list];
    //[listsData insertObject:list atIndex:0];
}

-(void)removeList:(List*)list{
    [listsData removeObject:list];
}

-(void)removeListByIndex:(NSInteger)index{
    [listsData removeObjectAtIndex:index];
}

-(NSArray*)getAllLists{
    return [listsData mutableCopy];
}

@end
