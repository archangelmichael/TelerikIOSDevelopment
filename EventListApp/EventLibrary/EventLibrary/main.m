//
//  main.m
//  EventLibrary
//
//  Created by Admin on 10/26/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"
#import "EventManager.h"

NSArray* createEvents() {
    NSTimeInterval day = 24 * 3600;
    NSDate *tomorrow = [NSDate dateWithTimeIntervalSinceNow:day];
    NSDate *friday = [NSDate dateWithTimeIntervalSinceNow:day * 2];
    
    return @[ [[Event alloc] initWithTitle:@"finish project" category:@"work" description:@"create tests" date:tomorrow],
              [[Event alloc] initWithTitle:@"get up earlier" category:@"work" description:@"go to work earlier" date:tomorrow],
              [[Event alloc] initWithTitle:@"enjoy" category:@"relax" description:@"enjoy the evening" date:friday]
             ];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        EventManager *eventManager = [[EventManager alloc] init];
        [eventManager addEventWithTitle:@"testing" category:@"testing" date: [NSDate date] description:@"Event created from manager"];
        [eventManager addEvents:createEvents()];
        
        NSLog(@"all events: %@", [eventManager getAllEvents]);
        NSLog(@"events sorted by title: %@", [eventManager sortEventsByTitle]);
        NSLog(@"events sorted by date: %@", [eventManager sortEventsByDate]);
        NSLog(@"events by category \"work\": %@", [eventManager getEventsByCategory:@"work"]);
    }
    return 0;
}
