//
//  main.m
//  TestStaticClass
//
//  Created by Admin on 11/4/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddEntry.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *array = [AddEntry createEntries];
        AddEntry *entry = [AddEntry getEntryAtIndex:4];
        entry.entryDate = [NSDate dateWithTimeIntervalSince1970:10000000000];
        NSLog(@" %@", entry.entryDate);
        NSLog(@" %@", [AddEntry getRecentEntriesWithCount:3]);
        
        NSLog(@"Hello, World!");
    }
    return 0;
}
