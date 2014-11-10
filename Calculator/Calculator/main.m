//
//  main.m
//  Calculator
//
//  Created by Admin on 10/25/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Calculator.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Calculator *calculator = [[Calculator alloc] init];
        [calculator add: 2.34];
        [calculator printResult];
        
        [calculator substract: 3.34];
        [calculator printResult];
        
        [calculator multiply: 2.34];
        [calculator printResult];
        
        [calculator divide: 2.21];
        [calculator printResult];
        
        [calculator clear];
        [calculator printResult];
        
    }
    return 0;
}
