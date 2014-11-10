//
//  EventManager.m
//  EventLibrary
//
//  Created by Admin on 10/26/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "EventManager.h"

@implementation EventManager {
    NSMutableArray *_events;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _events = [[NSMutableArray alloc] init];
        [self addEvents:createEvents()];
    }
    return self;
}

- (void)addEventWithTitle:(NSString *) title
                 category:(NSString *) category
                     date:(NSDate *) date
              description:(NSString *) info {
    Event *event = [[Event alloc] initWithTitle:title category:category description:info date:date];
    [self addEvent:event];
}

- (void)addEvent:(Event *)event {
    if ([event isEqual:[NSNull null]]) {
        [NSException raise:@"Event cannot be null!" format:@"Invalid event" ];
    }
    
    [_events addObject:event];
}

- (void)addEvents:(NSArray *)events {
    [_events addObjectsFromArray:events];
}

- (NSArray *)getAllEvents {
    return [_events copy];
}

- (NSArray *)sortEventsByDate {
    return [self sortEventsByProperty:@"date"];
}

- (NSArray *)sortEventsByTitle {
    return [self sortEventsByProperty:@"title"];
}

- (NSArray *)getEventsByCategory:(NSString *)category {
    NSPredicate *byCategory = [NSPredicate predicateWithFormat:@"category = %@", category];
    return [_events filteredArrayUsingPredicate:byCategory];
}

- (NSArray *)sortEventsByProperty:(NSString *)property {
    NSSortDescriptor *description = [NSSortDescriptor sortDescriptorWithKey:property ascending:YES];
    return [_events sortedArrayUsingDescriptors:@[description]];
}

NSArray* createEvents() {
    NSTimeInterval day = 24 * 3600;
    NSDate *tomorrow = [NSDate dateWithTimeIntervalSinceNow:day];
    NSDate *friday = [NSDate dateWithTimeIntervalSinceNow:day * 2];
    
    return @[ [[Event alloc] initWithTitle:@"finish project" category:@"work" description:@"create tests" date:tomorrow],
              [[Event alloc] initWithTitle:@"get up earlier" category:@"work" description:@"go to work earlier" date:tomorrow],
              [[Event alloc] initWithTitle:@"enjoy" category:@"relax" description:@"enjoy the evening" date:friday]
              ];
}
@end
