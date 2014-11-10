//
//  main.m
//  TodoList
//
//  Created by Admin on 10/25/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Todo.h"
#import "TodosContainer.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *todos = @[
                           [Todo initWithText: @"First thing to do: kiss" andDate: [NSDate date] ],
                           [Todo initWithText: @"Second thing to do: hug" andDate: [NSDate date] ],
                           [Todo initWithText: @"Third thing to do: slap" andDate: [NSDate date] ]
                           ];
        TodosContainer *container = [[TodosContainer alloc] init];
        
        [container addTodoList:todos];
        NSLog(@" %@", [container getTodos]);

        [container addTodo:[Todo initWithText: @"Addtional thing to do: apologize" andDate: [NSDate date]]];
        NSLog(@" %@", [container getTodos]);
    }
    return 0;
}
