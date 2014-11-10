//
//  EventManager.h
//  EventLibrary
//
//  Created by Admin on 10/26/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"

@interface EventManager : NSObject
- (void)addEventWithTitle:(NSString *) title
                 category:(NSString *) category
                     date:(NSDate *) date
              description:(NSString *) info;
- (void)addEvent:(Event *)event;
- (void)addEvents:(NSArray *)events;
- (NSArray *)getAllEvents;
- (NSArray *)sortEventsByDate;
- (NSArray *)sortEventsByTitle;
- (NSArray *)getEventsByCategory:(NSString *)category;
@end
