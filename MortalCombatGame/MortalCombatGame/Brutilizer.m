//
//  Brutilizer.m
//  MortalCombatGame
//
//  Created by Admin on 10/29/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "Brutilizer.h"

@implementation Brutilizer

-(instancetype) init {
    self = [super initWithName:@"Brutilizer" withDamage: 100 withPower: 100];
    return self;
}

+(instancetype) brutalizer {
    return [[self alloc] init];
}

@end
