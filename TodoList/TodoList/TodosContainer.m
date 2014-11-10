//
//  TodosContainer.m
//  TodoList
//
//  Created by Admin on 10/25/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "TodosContainer.h"

@implementation TodosContainer
- (id)init {
    self = [super init];
    if (self) {
        _allTodos = [NSMutableArray array];
    }
    return self;
}

-(void) addTodo: (Todo *) todo {
    if (todo != nil) {
        [_allTodos addObject:todo];
        NSLog(@" Added todo: %@ ", todo);
    }
}

-(void) addTodoList:(NSArray *)list {
    if (list != nil) {
        [_allTodos addObjectsFromArray:list];
        NSLog(@" Added %lu todos.", (unsigned long)list.count);
    }
}

-(NSArray *) getTodos {
    return _allTodos;
}

@end
