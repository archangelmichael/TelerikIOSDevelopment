//
//  Todo.m
//  TodoList
//
//  Created by Admin on 10/25/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "Todo.h"

@implementation Todo
+(id) initWithText:(NSString *)info andDate:(NSDate *)date {
    Todo *todo = [[Todo alloc] init];
    if (todo != nil) {
        if ( info != nil || ![info isEqualToString:@""]) {
            todo.text = info;
        } else {
            todo.text = @"No Info";
        }
        
        if (date != nil) {
            todo.date = date;
        } else {
            NSLocale* currentLocale = [NSLocale currentLocale];
            [todo.date descriptionWithLocale:currentLocale];
        }
        
        return todo;
    }
    else {
        return nil;
    }
}

- (NSString *)description {
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"MMM dd, yyyy HH:mm:ss"];
    return [NSString stringWithFormat:@"Date: %@ Todo: %@ ", [format stringFromDate:self.date], self.text];
}
@end
