//
//  Note.m
//  ListManagement
//
//  Created by Admin on 11/2/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "Note.h"

@implementation Note

-(instancetype)init {
    return  [self initWithTitle:@"New Note" withDescription:@"No Description" withDate:nil];
}
-(instancetype)initWithTitle:(NSString*)title
             withDescription:(NSString*)description {
    return  [self initWithTitle:title withDescription:description withDate:nil];
}
-(instancetype)initWithTitle:(NSString *)title
             withDescription:(NSString *)description
                    withDate:(NSDate *)date {
    self = [super init];
    if (self) {
        self.noteTitle = title;
        self.noteDescription = description;
        if (date != nil) {
            self.noteDate = date;
        }
    }
    return self;
}

+(instancetype)note {
    return  [[Note alloc] initWithTitle:@"New Note" withDescription:@"No Description" withDate:nil];
}
+(instancetype)noteWithTitle:(NSString*)title
             withDescription:(NSString*)description {
    return  [[Note alloc] initWithTitle:title withDescription:description withDate:nil];
}
+(instancetype)noteWithTitle:(NSString *)title
             withDescription:(NSString *)description
                    withDate:(NSDate *)date {
    return  [[Note alloc] initWithTitle:title withDescription:description withDate:date];
}

- (NSString *)description {
    return [NSString stringWithFormat:@" Title:%@ Description:%@ Date:%@", self.noteTitle, self.noteDescription, self.noteDate];
}
@end
