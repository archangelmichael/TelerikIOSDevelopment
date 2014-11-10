//
//  Bomb.m
//  MortalCombatGame
//
//  Created by Admin on 10/29/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "Bomb.h"

@implementation Bomb

-(instancetype) init {
    self = [super initWithName:@"Bomb" withDamage: 40 withPower: 30];
    return self;
}

+(instancetype) bomb {
    return [[self alloc] init];
}
@end
