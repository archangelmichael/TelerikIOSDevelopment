//
//  FlyKick.m
//  MortalCombatGame
//
//  Created by Admin on 10/29/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "FlyKick.h"

@implementation FlyKick

-(instancetype) init {
    self = [super initWithName:@"FlyKick" withDamage: 60 withPower: 40];
    return self;
}

+(instancetype) flykick {
    return [[self alloc] init];
}

@end
