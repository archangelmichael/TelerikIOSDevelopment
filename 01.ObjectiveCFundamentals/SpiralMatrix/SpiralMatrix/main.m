//
//  main.m
//  SpiralMatrix
//
//  Created by Admin on 10/24/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

void printMatrix( NSArray *matrix) {
    NSMutableString *result = [[NSMutableString alloc] init];
    [result appendString:@" \n "];
    for (NSArray *row in matrix) {
        for (NSNumber *col in row) {
            [result appendFormat: @" %@ ", col];
        }
        
        [result appendString:@" \n "];
    }
    
    NSLog(@" %@ ", result);
}

NSArray* fillSpiralMatrix( int size)
{
    NSMutableArray *spiral = [[NSMutableArray alloc] initWithCapacity:size];
    for (int i = 0; i < size; i++) {
        spiral[i] = [[NSMutableArray alloc] initWithCapacity:size];
        for (int j = 0; j < size; j++) {
            spiral[i][j] = @0;
        }
    }
    
    NSString *direction = @"right";
    int currentrow = 0;
    int currentcol = 0;
    for (int i = 1; i <= size * size; i++)
    {
        if ([direction isEqualToString:(@"right")]  && (currentcol >= size || [spiral[currentrow][currentcol] isNotEqualTo:@0] ))
        {
            currentrow++;
            currentcol--;
            direction = @"down";
        }
        if ([direction isEqualToString:(@"down")] && (currentrow >= size || [spiral[currentrow][currentcol] isNotEqualTo:@0] ))
        {
            currentrow--;
            currentcol--;
            direction = @"left";
        }
        if ([direction isEqualToString:( @"left")] && (currentcol < 0 || [spiral[currentrow][currentcol] isNotEqualTo:@0] ))
        {
            currentrow--;
            currentcol++;
            direction = @"up";
        }
        if ([direction isEqualToString:( @"up")] && (currentrow < 0 || [spiral[currentrow][currentcol] isNotEqualTo:@0] ))
        {
            currentrow++;
            currentcol++;
            direction = @"right";
        }
        
        spiral[currentrow][currentcol] = [NSNumber numberWithInt: i];
        if ([direction isEqualToString:( @"right")])
        {
            currentcol++;
        }
        else if ([direction isEqualToString:( @"down")])
        {
            currentrow++;
        }
        else if ([direction isEqualToString:( @"left")])
        {
            currentcol--;
        }
        else if ([direction isEqualToString:( @"up")])
        {
            currentrow--;
        }
    }
    
    return spiral;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *hardcodedMatrix = @[
                            @[@1, @2, @3],
                            @[@8, @9, @4],
                            @[@7, @6, @5]
                            ];
        NSLog(@" \n HARDCODED MATRIX \n");
        printMatrix(hardcodedMatrix);
        
        NSArray *createdMatrix = fillSpiralMatrix(3);
        NSLog(@" \n CODE-CREATED MATRIX \n");
        printMatrix(createdMatrix);
    }
    return 0;
}

