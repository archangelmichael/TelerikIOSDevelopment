//
//  Event.m
//  EventLibrary
//
//  Created by Admin on 10/26/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "Event.h"
#define trimAll(object)[object stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]
@implementation Event

- (id)initWithTitle:(NSString *)title
           category:(NSString *)category
        description:(NSString *)info
               date:(NSDate *)date {
    self = [super init];
    if (self) {
        if ([title isEqual:[NSNull null]] || [trimAll(title) length] == 0) {
            [NSException raise:@"No title added!" format:@"Invalid title"];
        }
        if ([category isEqual:[NSNull null]] || [trimAll(category) length] == 0) {
            [NSException raise:@"No category added!" format:@"Invalid category"];
        }
        if ([info isEqual:[NSNull null]] || [trimAll(info) length] == 0) {
            [NSException raise:@"No info added!" format:@"Invalid info"];
        }
        _title = [title copy];
        _category = [category copy];
        _info = [info copy];
        _date = [date copy];
    }
    return self;
}


-(void) addGuest: (NSString *) name {
    if (![name isEqual:[NSNull null]] && [trimAll(name) length] > 0) {
        [self.guests addObject:name];
    }
    else{
        [NSException raise:@"No guest name added!" format:@"Invalid guest name "];
    }
}

-(void) addGuests:(NSArray *)guestnames {
    if (![guestnames isEqual:[NSNull null]]) {
        [self.guests addObjectsFromArray:guestnames];
    }
}

- (NSString *)description {
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"MMM dd, yyyy HH:mm:ss"];
    return [NSString stringWithFormat:@"%@, [%@], %@ %@", self.title, self.category, [format stringFromDate:self.date] ,self.info ];
}

@end
