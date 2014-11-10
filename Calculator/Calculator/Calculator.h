//
//  Calculator.h
//  Calculator
//
//  Created by Admin on 10/25/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject {
double _result;
}

-(void) save: (double) value;
-(void) clear;
-(void) add: (double) value;
-(void) divide: (double) value;
-(void) substract: (double) value;
-(void) multiply: (double) value;
-(void) printResult;


@end
