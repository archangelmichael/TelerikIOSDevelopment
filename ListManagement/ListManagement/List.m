//
//  List.m
//  ListManagement
//
//  Created by Admin on 11/2/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "List.h"

@implementation List

-(instancetype)init {
    return [self initWithTitle:@"No Title" withCategory:@"No Category" withNotes:nil];
}
-(instancetype)initWithTitle:(NSString*)title
                withCategory:(NSString*)category {
    return [self initWithTitle:title withCategory:category withNotes:nil];
}
-(instancetype)initWithTitle:(NSString*)title
                withCategory:(NSString*)category
                   withNotes:(NSArray*)notes {
    self = [super init];
    if (self) {
        self.listTitle = title;
        self.listCategory = category;
        self.listNotes = [[NSMutableArray alloc] init];
        if (notes != nil) {
            [self.listNotes addObjectsFromArray:notes];
        }
    }
    
    return self;
}

+(instancetype)list {
    return [[List alloc] initWithTitle:@"No Title" withCategory:@"No Category" withNotes:nil];
}
+(instancetype)listWithTitle:(NSString*)title
                withCategory:(NSString*)category {
    return [[List alloc] initWithTitle:title withCategory:category withNotes:nil];
}
+(instancetype)listWithTitle:(NSString*)title
                withCategory:(NSString*)category
                   withNotes:(NSArray*)notes {
    return [[List alloc] initWithTitle:title withCategory:category withNotes:notes];
}

-(Note*)getNoteByIndex:(NSInteger)index{
    if (index < 0 || index >= self.listNotes.count) {
        return nil;
    }
    return self.listNotes[index];
}

-(void) addNotes:(NSArray *)notes {
    if (self.listNotes == nil) {
        self.listNotes = [[NSMutableArray alloc] initWithArray:notes];
    } else {
        [self.listNotes addObjectsFromArray:notes];
    }
}

-(void) addNote:(Note *)note {
    if (self.listNotes == nil) {
        self.listNotes = [[NSMutableArray alloc] initWithObjects:note, nil];
    } else {
        [self.listNotes insertObject:note atIndex:0];
    }
}

-(void) removeNote:(Note *)note {
    if ([self.listNotes containsObject:note]) {
        [self.listNotes removeObject:note];
    }
}

- (NSString *)description {
    return [NSString stringWithFormat:@" List : %@ Category: %@", self.listTitle, self.listCategory];
}
@end
