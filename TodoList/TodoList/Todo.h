//
//  Todo.h
//  TodoList
//
//  Created by Admin on 10/25/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

+(id) initWithText: (NSString *) info
           andDate: (NSDate *) date;


@property NSString* text;
@property NSDate* date;

- (NSString *)description;
@end
