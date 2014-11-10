//
//  Calculator.m
//  Calculator
//
//  Created by Admin on 10/25/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator
- (id)init {
    self = [super init];
    if (self) {
        [self clear];
    }
    
    return self;
}

-(void) save:(double)value {
    _result = value;
}

- (void)clear {
    _result = 0;
}

- (void)add:(double)value {
    _result += value;
}

- (void)substract:(double)value {
    _result -= value;
}

- (void)divide:(double)value {
    _result /= value;
}

- (void)multiply:(double)value {
    _result *= value;
}

- (void)printResult {
    NSLog(@"%f", _result);
}
@end
