//
//  TodosContainer.h
//  TodoList
//
//  Created by Admin on 10/25/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Todo.h"

@interface TodosContainer : NSObject  {
    NSMutableArray *_allTodos;
}

-(void) addTodo: (Todo *) todo;
-(void) addTodoList: (NSArray *) list;
-(NSArray *) getTodos;

@end
